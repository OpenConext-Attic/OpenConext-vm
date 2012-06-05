# We need Sun's Java for now unfortunately due to OpenJDK bug(s)
# See http://bugs.openjdk.java.net/show_bug.cgi?id=100167
# Note Oracle doesn't allow you to wget java anymore:
# http://stackoverflow.com/questions/10268583/cant-install-java-jdk-on-linux-through-wget-is-there-a-workaround
# to get Java from the Oracle website we'd need to emulate an entire browser
# which is too much work, so we just get it from another source
# even though this is a risk as we can't be sure it's not been tampered with
# TODO: checksum checking

yum -q list jdk
if [ $? -ne 0 ]
then
    cd /root &&
    yum -y install java-1.6.0-openjdk-devel &&
    echo "Downloading http://files.sumix.com/java/j2se_1.6.0_32/jdk-6u32-linux-x64-rpm.bin..." &&
    wget -N -nv http://files.sumix.com/java/j2se_1.6.0_32/jdk-6u32-linux-x64-rpm.bin &&
    sh jdk-6u32-linux-x64-rpm.bin -noregister &&
    rm -vf jdk-6u32-linux-x64-rpm.bin &&
    rm -vf jdk*.rpm &&
    rm -vf sun-javadb*.rpm &&
    cd /etc/alternatives &&
    rm -vf java &&
    ln -s /usr/java/latest/bin/java &&
    rm -vf javac &&
    ln -s /usr/java/latest/bin/javac &&
    cd -
fi