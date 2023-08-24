##!/data/data/com.termux/files/usr/bin/bash
#!/bin/bash
liste=./liste-radios.txt
source "$liste"
function ecris { cp "$liste" o."$liste"; declare -p radios > "$liste"; declare -p archives >> "$liste" ;}
function enregistre {
    echo "Liste des radios actives : "
    for clef in "${!radios[@]}";do
        echo "$clef : ${radios[$clef]}"
    done
    echo "Liste des radios archivées : "
    for clef in "${!archives[@]}";do
        echo "$clef : ${archives[$clef]}"
    done
    read -p "Enregistrer ? (O/n) " enreg
    if [[ "$enreg" == "[Oo]"* ]] ; then ecris ; fi
}
function lis {
#function mp { echo -e "\033]2;$opt\007" && mplayer  -msglevel all=-1:demuxer=4:network=4 -cache 2048 $1 $2|lolcat; }
function mp { echo -e "\033]2;$opt\007" && script -c "mpv $1 --audio-buffer=10 --volume=80" /dev/null | grep -v "File tags:" ; } #| lolcat ; }
PS3='Quel est le numéro de la radio à lire ? '
select opt in "${!radios[@]}"
do
    flux="${radios[$opt]}"
#    if [[ "$flux" ==  *".pls" || "$flux" == *".m3u" ]] ; then
#	mp "-playlist" "$flux"
#    else
	mp "$flux"
#    fi
    menu
done
}
function ajoute {
    echo "(Caractères autorisés : lettres, chiffres, '-',' _')"
    read -p "Quel est le nom de la radio ?" nom
    read -p "Quel est l'adresse du flux ? " flux
    radios+=(["$nom"]="$flux")
    enregistre && menu
}
function enleve {
PS3='Quel est le numéro de la radio à enlever ? '
select opt in "${!radios[@]}"
do
    unset radios["$opt"]
    enregistre && menu
done
}
function archive {
PS3='Quel est le numéro de la radio à archiver ? '
select opt in "${!radios[@]}"
do
    archives+=(["$opt"]="${radios[$opt]}")
    unset radios["$opt"]
    enregistre && menu
done
}
function desarchive {
PS3='Quel est le numéro de la radio à désarchiver ? '
select opt in "${!archives[@]}"
do
    radios+=(["$opt"]="{$archives[$opt]}")
    unset archives["$opt"]
    enregistre && menu
done
}
function menu {
clear
actions=( "Lire" "Ajouter" "Enlever" "Archiver" "Désarchiver" "Quitter")
PS3='Que veux-tu faire ? '
select act in "${actions[@]}"
do
    case "$act" in
        "Lire")
	    lis ;;
        "Ajouter")
	    ajoute ;;
	"Enlever")
	    enleve ;;
        "Archiver")
	    archive ;;
	"Désarchiver")
	    desarchive ;;
	"Quitter")
            exit 0 ;;
        *) echo "Qu'entends-tu par $REPLY ?" ;;
    esac
done
}
menu
