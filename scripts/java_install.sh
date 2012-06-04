# We need Sun's Java for now unfortunately due to OpenJDK bug(s)
# See http://bugs.openjdk.java.net/show_bug.cgi?id=100167

yum -q list jdk | grep 'installed'
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