#!/bin/sh
#######################
# Install EngineBlock #
#######################
if [ ! -h /opt/www/engineblock ];
then
    mkdir -p /opt/www/ &&
    cd /opt/www/ &&
    git clone git://github.com/OpenConext/OpenConext-engineblock.git
    ln -sf OpenConext-engineblock engineblock &&
    cd -

    # Create database
    echo "create database engineblock default charset utf8 default collate utf8_unicode_ci;" | mysql -u root --password=c0n3xt
fi

#############################################
# Modify the EngineBlock configuration file #
#############################################

if [ ! -f /etc/surfconext/engineblock.ini ];
then
    cd /opt/www/engineblock &&
    cp docs/example.engineblock.ini /etc/surfconext/engineblock.ini
    sed -i 's/^\[ENV : base\]/\[production : base\]/g' /etc/surfconext/engineblock.ini
    sed -i 's/database.master1.user     = ""/database.master1.user     = "root"/g' /etc/surfconext/engineblock.ini
    sed -i 's/database.master1.password = ""/database.master1.password = "c0n3xt"/g' /etc/surfconext/engineblock.ini
    # we really need Mail writerName otherwise the migrate script below b0rks...
    echo '' >> /etc/surfconext/engineblock.ini
    echo '; logs' >> /etc/surfconext/engineblock.ini
    echo 'logs.mail.writerName = "Mail"' >> /etc/surfconext/engineblock.ini
    echo 'logs.mail.writerNamespace = "EngineBlock_Log_Writer"' >> /etc/surfconext/engineblock.ini
    echo 'logs.mail.filterName = "Priority"' >> /etc/surfconext/engineblock.ini
    echo 'logs.mail.filterParams.priority = 3 ; Errors' >> /etc/surfconext/engineblock.ini
    echo 'logs.mail.writerParams.filterValues[] = "encryption.key.private"' >> /etc/surfconext/engineblock.ini
    echo 'logs.mail.writerParams.filterValues[] = "ldap.password"' >> /etc/surfconext/engineblock.ini
    echo 'logs.mail.writerParams.filterValues[] = "serviceRegistry.user_secret"' >> /etc/surfconext/engineblock.ini
    echo 'logs.mail.writerParams.filterValues[] = "database.master1.password"' >> /etc/surfconext/engineblock.ini
    echo 'logs.mail.writerParams.filterValues[] = "grouper.password"' >> /etc/surfconext/engineblock.ini
    echo 'logs.mail.writerParams.filterValues[] = "hz.auth.consumerSecret"' >> /etc/surfconext/engineblock.ini
    echo 'logs.mail.writerParams.from.email = "noreply@surfnet.nl"' >> /etc/surfconext/engineblock.ini
    echo 'logs.mail.writerParams.from.name  = "SURFconext EngineBlock"' >> /etc/surfconext/engineblock.ini

    # configure LDAP
    sed -i 's/ldap.host               = ""/ldap.host               = "ldap.openconext.local"/g' /etc/surfconext/engineblock.ini
    sed -i 's/ldap.password           = ""/ldap.password           = "jf7RH4Hj20De"/g' /etc/surfconext/engineblock.ini
    echo 'ldap.useSsl = false' >> /etc/surfconext/engineblock.ini

    echo 'phpSettings.display_errors = true' >> /etc/surfconext/engineblock.ini
    sed -i 's/serviceregistry.example.com/serviceregistry.openconext.local/g' /etc/surfconext/engineblock.ini
    sed -i 's/ksD76Fh2Sj3e3/engineblock/g' /etc/surfconext/engineblock.ini
    sed -i 's/cookie.lang.domain = "dev.surfconext.nl"/cookie.lang.domain = "openconext.local"/g' /etc/surfconext/engineblock.ini
    sed -i 's/static.host         = "static.dev.surfconext.nl"/static.host         = "static.openconext.local"/g' /etc/surfconext/engineblock.ini

    # Edit the profile.sh file to set correct environment variable
    echo 'export ENGINEBLOCK_ENV="production"' > /etc/profile.d/openconext.sh
    echo 'export PATH=$PATH:/opt/maven/bin' >> /etc/profile.d/openconext.sh

    chmod +x /etc/profile.d/openconext.sh
    source /etc/profile.d/openconext.sh

    # Generate Self Signed Certificate for EngineBlock and add it to the configuration
    cd /tmp &&
    openssl req -subj '/CN=EngineBlock/OU=Services/O=SURFnet/C=NL/' -newkey rsa:2048 -new -x509 -days 3652 -nodes -out example.org.crt -keyout example.org.pem &&
    CRT=`cat example.org.crt` &&
    PEM=`cat example.org.pem` &&
    echo "" >> /etc/surfconext/engineblock.ini &&
    echo "encryption.key.public = \"${CRT}\"" >> /etc/surfconext/engineblock.ini &&
    echo "encryption.key.private = \"${PEM}\"" >> /etc/surfconext/engineblock.ini &&
    rm example.org.crt example.org.pem
    cd -
fi