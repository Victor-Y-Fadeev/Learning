#!/bin/bash

init()
{
    SERVER="irc.freenode.net"
    PORT="6667"
    NICK="IRC_Bot"
    CHANNEL="#UX32VD/IRC_Test"
    DIR="./command"
    PREFIX="irc"
    
    if ! [ -d $DIR ] ; then
        mkdir $DIR
    fi
    
    exec 3>&-
    exec 3<>/dev/tcp/$SERVER/$PORT
    
    echo "USER $NICK localhost localhost $NICK" >&3
    echo "NICK $NICK" >&3
    echo "JOIN $CHANNEL" >&3
}

send()
{
    echo "PRIVMSG $CHANNEL :$@" >&3
}

command()
{
    CMD=`expr "$1" : '\([a-zA-Z0-9_-]* *\)'`
    CMD=${CMD,,}
    CMD=${CMD%% *}
}

message()
{
    FROM=${1%%!*} FROM=${FROM:1}
    TO=$3
    MSG=$@ MSG=${MSG#\:*\:}
    
    case ${MSG,,} in
        $PREFIX* )
            MSG=${MSG#[a-zA-Z0-9_-]* }
            command $MSG
            MSG=${MSG#[a-zA-Z0-9_-]* }
            ;;
        * )
            return 1
            ;;
    esac
    
    case $CMD in
        "echo" )
            send $MSG
            ;;
        "nick" )
            send "Your nick - $FROM"
            ;;
        "off" )
            send "Shutdown"
            echo "QUIT" >&3
            exit 0
            ;;
        "help" )
            send "Command list: echo nick off new remove" `ls $DIR`
            ;;
        "new" )
            command $MSG
            
            if ! [ -f $DIR/$CMD ] ; then
                send "New command $CMD"
                echo ${MSG#[a-zA-Z0-9_-]* } > "$DIR/$CMD"
            else
                send "Command exist!"
            fi
            ;;
        "remove" )
            command $MSG
            
            if [ -f $DIR/$CMD ] ; then
                send "Command delete"
                rm $DIR/$CMD
            else
                send "Command not found!"
            fi
            ;;
        * )
            if [ -f $DIR/$CMD ] ; then
                send `cat $DIR/$CMD`
            else
                send "Command not found!"
            fi
            ;;
    esac
}

parse()
{
    if [[ $1 == "PING" ]] ; then
        echo "PONG $2" >&3
    fi
    
    if [[ $2 == "PRIVMSG" ]] ; then
        message $@
    fi
}

main()
{
    init
    
    while read line <&3
    do
        echo $line
        parse $line
    done
}

main $@
