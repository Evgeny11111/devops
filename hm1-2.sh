#!/bin/bash

# our script
DAEMON_PATH="D:/study/Devops/hometask1"
NAME=procces
DAEMON=process

PIDFILE=D:/study/Devops/hometask1/$NAME.pid

free -mo -s 10m &> test.csv &
case "$1" in
start)
    cd $DAEMON_PATH
    PID=`$DAEMON > /dev/null 2>&1 & echo $!`
        if [ -z $PID ]; then
            printf "%s\n" "Fail"
        else
            echo $PID > $PIDFILE
            printf "%s\n" "Ok"
        fi
;;   
status)
        if [ -f $PIDFILE ]; then
            PID=`cat $PIDFILE`
            if [ -z "`ps axf | grep ${PID} | grep -v grep`" ]; then
                printf "%s\n" "Process dead but pidfile exists"
            else
                echo "Running"
            fi
        else
            printf "%s\n" "Service not running"
        fi
;;
stop)
            PID=`cat $PIDFILE`
            cd $DAEMON_PATH
        if [ -f $PIDFILE ]; then
            kill -HUP $PID
            printf "%s\n" "Ok"
            rm -f $PIDFILE
        else
            printf "%s\n" "pidfile not found"
        fi
;; 

*) 
     echo "Usage: $0 {status|start|stop}"

esac