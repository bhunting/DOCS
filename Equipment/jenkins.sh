#!/bin/bash

### BEGIN INIT INFO
# Provides:          jenkins
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2
# Default-Stop:      0 1 3 4 5 6
# Short-Description: Start jenkins at boot time
# Description:       Enable jenkins CI service.
### END INIT INFO

DESC="Jenkins CI Server"
NAME=jenkins
PIDFILE=/var/run/$NAME.pid
RUN_AS=jenkins
export JAVAHOME=/opt/jre/jre1.7.0_76
export CLASSPATH=/opt/jre/jre1.7.0_76
export JENKINS_BASE=/opt/jenkins
COMMAND=/opt/jre/java -- -jar /opt/jenkins/jenkins.war

d_start() {
	start-stop-daemon --start --quiet --background --make-pidfile --pidfile $PIDFILE --chuid $RUN_AS --exec $COMMAND
}

d_stop() {
	start-stop-daemon --stop --quiet --pidfile $PIDFILE
	if [ -e $PIDFILE ]
		then rm $PIDFILE
	fi
}

case $1 in
	start)
	echo -n "Starting $DESC: $NAME"
	d_start
	echo "."
	;;
	stop)
	echo -n "Stopping $DESC: $NAME"
	d_stop
	echo "."
	;;
	restart)
	echo -n "Restarting $DESC: $NAME"
	d_stop
	sleep 1
	d_start
	echo "."
	;;
	*)
	echo "usage: $NAME {start|stop|restart}"
	exit 1
	;;
esac

exit 0



