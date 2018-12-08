#!/bin/bash

init()
{
    SERVER="irc.freenode.net"
    PORT="6667"
    NICK="IRC_Bot"
    CHANNEL="#UX32VD/IRC_Test"
    PREFIX="IRC"
    
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

message()
{
    FROM=${1%%!*} FROM=${FROM:1}
    TO=$3
    MSG=$@ MSG=${MSG#\:*\:}
    
    case ${MSG^^} in
        $PREFIX* )
            MSG=${MSG#[A-Z]* }
            ;;
        * )
            return 1
            ;;
    esac
    
    case ${MSG^^} in
        "ECHO"* )
            send ${MSG:4}
            ;;
        "ME"* )
            send "You are $FROM"
            ;;
        "HI"* )
            send "Hello, It's me, I'm just a little irc"
            ;;
        "SAY"* )
            send "No..."
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
