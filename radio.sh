#!/bin/bash
function mp { echo -e "\033]2;$opt\007" && mplayer  -msglevel all=-1:demuxer=4:network=4 -cache 2048 $1 $2|lolcat; }
source ./radios.txt

PS3='Entrer le numéro de la radio choisie : '
select opt in "${!radios[@]}"
do
    mp "${radios[$opt]}"
done
