./gradlew clean build

rm /opt/homebrew/opt/wildfly-as/libexec/standalone/deployments/web_lab2.war
cp build/libs/web_lab2.war /opt/homebrew/opt/wildfly-as/libexec/standalone/deployments/
#tail -f /opt/homebrew/opt/wildfly-as/libexec/standalone/log/server.log
/opt/homebrew/opt/wildfly-as/libexec/bin/standalone.sh
