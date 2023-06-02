#! /usr/bin/env bash

succeeded=0
ipWorking=

while IFS="" read -r p || [ -n "$p" ]
do
    curl "$p"
    
    if [[ $? -eq 0 ]]
    then
        echo connection to '"'$p'"' succeeded!
        
        ipWorking=$p
        ((succeeded=$succeeded+1))
    else
        echo > /dev/null
    #    echo connection to '"'$p'"' failed!
    fi

done < ipList.txt

echo $succeeded connection'('s')' succeeded!

#if [[ $succeeded -ne 0 ]]
#then
    
    #echo connection to '"'$ipWorking'"' succeeded
#    echo connection to '"'$p'"' failed!
#
#fi



exit 0