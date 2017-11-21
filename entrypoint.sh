#!/bin/sh


if [ "$MODULE" = "ss-local" ];then

    $MODULE -s $SERVER_ADDR \
             -p $SERVER_PORT \
             -k $PASSWORD \
             -b $LOCAL_ADDR \
             -l $LOCAL_PORT \
             -m $METHOD \
             -t $TIMEOUT \
             --fast-open  \
             -a $USER \
             --plugin obfs-local \
             --plugin-opts "obfs=http;obfs-host=www.bing.com" \
             $ARGS

else

   $MODULE -s $SERVER_ADDR \
                -p $SERVER_PORT \
                -k ${PASSWORD:-$(hostname)} \
                -m $METHOD \
                -t $TIMEOUT \
                --fast-open \
                -d $DNS_ADDR \
                -d $DNS_ADDR_2 \
                -u \
                -a $USER \
                --plugin obfs-server \
                --plugin-opts "obfs=http" \
                $ARGS
fi

