##!/data/data/com.termux/files/usr/bin/bash
#!/bin/bash
source ./radios.txt
buf=radios
arch=archives

function lecture {
#function mp { echo -e "\033]2;$opt\007" && mplayer  -msglevel all=-1:demuxer=4:network=4 -cache 2048 $1 $2|lolcat; }
function mp { echo -e "\033]2;$opt\007" && script -c "mpv $1 --audio-buffer=10 --volume=80" /dev/null | grep -v "File tags:" ; } #| lolcat ; }
PS3='Quel est le numéro de la radio à lire ?'
select opt in "${!radios[@]}"
do
    flux="${radios[$opt]}"
#    if [[ "$flux" ==  *".pls" || "$flux" == *".m3u" ]] ; then 
#	mp "-playlist" "$flux"
#    else
	mp "$flux"
#    fi
done
}
function ajout {
read -p "Quel est le nom de la radio ? \
Caractères autorisés : lettres, chiffres, '-',' _'" nom
read -p "Quel est l'adresse du flux ?" flux
buf+="${$nom[$flux]}"
for cle in "${!buf[@]}";do echo "$cle : ${buf[$cle]}"; done
read -p "Enregistrer ? (O/n)" enreg
if [[ "$enreg" == "[Oo]"* ]] ; then echo "ok, en fait la fonction n'est pas finie"; fi
}
function archive {
PS3='Entrer le numéro de la radio choisie : '
select opt in "${!radios[@]}"
do
    echo "Voici ce que devrait faire la fonction, en cours..."
    echo unset "${radios[$opt]}"
    echo arch+="${radios[$opt]}"
done
}
function menu {
actions=( "Lire" "Ajouter" "Archiver" "Quitter")
PS3='Que veux-tu faire ?'
select act in "${actions[@]}"
do
    case $act in
        "Lire")
	    lecture ;;
        "Ajouter")
	    ajout ;;
        "Archiver")
	    archive ;;
	"Quitter")
            break ;;
        *) echo "Qu'entends-tu par $act ?" ;;
    esac
done
}
menu
