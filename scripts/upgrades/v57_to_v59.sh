#!/bin/bash

# SURFnet internal: see https://wiki.surfnet.nl/pages/viewpage.action?pageId=34996862 which is the official grouper-upgrade-manual for production.

echo "Upgrading Grouper..."
echo "Stopping Tomcat..."
service tomcat6 stop
echo "Downloading Grouper components from Internet2 to perform data migration..."

curl -O http://www.internet2.edu/grouper/release/1.6.3/grouper.apiBinary-1.6.3.tar.gz
curl -O http://www.internet2.edu/grouper/release/2.1.5/grouper.apiBinary-2.1.5.tar.gz
tar -zxf grouper.apiBinary-1.6.3.tar.gz
tar -zxf grouper.apiBinary-2.1.5.tar.gz

sed -i grouper.apiBinary-1.6.3/conf/grouper.hibernate.properties \
  -e "s~^hibernate.dialect.*~hibernate.dialect=org.hibernate.dialect.MySQL5Dialect~" \
  -e "s~^hibernate.connection.url.*~hibernate.connection.url=jdbc:mysql://db.$OC_DOMAIN/teams~" \
  -e "s~^hibernate.connection.username.*~hibernate.connection.username=root~" \
  -e "s~^hibernate.connection.password.*~hibernate.connection.password=c0n3xt~" \
  -e "s~^hibernate.connection.driver_class.*~hibernate.connection.driver_class=com.mysql.jdbc.Driver~"

sed -i grouper.apiBinary-2.1.5/conf/grouper.hibernate.properties \
  -e "s~^hibernate.connection.url.*~hibernate.connection.url=jdbc:mysql://db.$OC_DOMAIN/teams~" \
  -e "s~^hibernate.connection.username.*~hibernate.connection.username=root~" \
  -e "s~^hibernate.connection.password.*~hibernate.connection.password=c0n3xt~"

# Test run of GSH
echo "Running GSH just to test..."
cd grouper.apiBinary-1.6.3
if bin/gsh.sh -runarg quit 2>&1 | grep -qE "Grouper error|Exception"
then
  echo "Error while running GSH. Cannot fix this. Will run again with full output, please analyze yourself. Will stop script afterwards."
  echo "--- Grouper GSH output: ---"
  bin/gsh.sh -runarg quit
  echo "--- End of Grouper GSH output ---"
  cd -
  echo exit 1
fi
cd -

BACKUPFILE=teams-backup-`date +%Y%m%d.%s`
echo "Creating database backup of Teams database, in file $BACKUPFILE"
mysqldump -uroot -pc0n3xt teams > $BACKUPFILE

cd grouper.apiBinary-1.6.3
bin/gsh.sh -runarg 'loaderRunOneJob("CHANGE_LOG_changeLogTempToChangeLog")'
cd -

# Run DDL upgrade
cd grouper.apiBinary-2.1.5 && bin/gsh -registry -check -noprompt -runscript && cd -
# Run GSH 2.1.5 to get attributes created
cd grouper.apiBinary-2.1.5 && bin/gsh -runarg quit && cd -

cd grouper.apiBinary-2.1.5 && bin/gsh -usdu -all && cd -

GROUPER_SCRIPT=`mktemp`
cat << EOS > $GROUPER_SCRIPT

GrouperSession.startRootSession();
for (String g : HibernateSession.byHqlStatic().createQuery("select uuid from Group").listSet(String.class)) { subj = SubjectFinder.findByIdAndSource(g, "g:gsa", true);      GrouperDAOFactory.getFactory().getMember().findBySubject(subj).updateMemberAttributes(subj, true); }

EOS
echo
echo The following command might emit a few messages like these, but you can ignore them safely:
echo ==\> Error: unable to evaluate command....
echo ==\> caused by: edu.internet2.middleware.grouper.exception.MemberNotFoundException:
cd grouper.apiBinary-2.1.5 && bin/gsh $GROUPER_SCRIPT

echo Running MySQLcheck...
mysqlcheck -a teams -uroot -pc0n3xt

# actually deploy wars and fix property files
source $OC_SCRIPTDIR/components/grouper.sh

setOpenConextVersion v59