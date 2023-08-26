##!/data/data/com.termux/files/usr/bin/bash
#!/bin/bash
# Fichier contenant la liste des couples nom + flux de chaque radio
# Une partie "radios" (actives) et une "archives"
liste=./liste-radios.txt
source "$liste"
# Fonction qui met à jour cette liste en fonction des modifications demandées
function ecris { cp "$liste" o."$liste"; declare -p radios > "$liste"; declare -p archives >> "$liste" ;}
# Fonction pour demander confirmation 
function oui_non {
    while true; do
        read -p "$* [o/n]: " yn
        case $yn in
            [Oo]*) return 0  ;;
            [Nn]*) echo "Abandonné" ; return  1 ;;
        esac
    done
}
# Fonction qui fait vérifier les modifications de stations
# avant de les enregistrer dans le fichier liste
function enregistre {
    echo "Liste des radios actives : "
    for clef in "${!radios[@]}";do
        echo "$clef : ${radios[$clef]}"
    done
    echo "Liste des radios archivées : "
    for clef in "${!archives[@]}";do
        echo "$clef : ${archives[$clef]}"
    done
    oui_non "Enregistrer ?" && ecris
    menu
}
# Fonction qui demande la radio a lire et la lis
function lis {
# Fonctiond qui lisent le flux
#function mp { echo -e "\033]2;$opt\007" && mplayer  -msglevel all=-1:demuxer=4:network=4 -cache 2048 $1 $2|lolcat; }
function mp { echo -e "\033]2;$opt\007" && script -c "mpv $1 --audio-buffer=10 --volume=80" /dev/null | grep -v "File tags:" ; } #| lolcat ; }
PS3='Quel est le numéro de la radio à lire ? 
0 pour retourner au menu maintenant, Q ensuite
en lecture : 9-0 volume, p pause, m silence
'
select opt in "${!radios[@]}"
do
    case "$opt" in
        "")
           menu ;;
        *)
           flux="${radios[$opt]}"
#          if [[ "$flux" ==  *".pls" || "$flux" == *".m3u" ]] ; then
#              mp "-playlist" "$flux"
#          else
	       mp "$flux"
#          fi
             ;;
     esac
done
menu
}
# Fonction d'ajout de station à la liste
# To-do : auto-corriger le nom
function ajoute {
    echo "(Caractères autorisés : lettres, chiffres, '-',' _')"
    read -p "Quel est le nom de la radio ?" nom
    read -p "Quel est l'adresse du flux ? " flux
    echo "Test du flux, Ctrl+C pour revenir" ; sleep 3 ; mp "$flux"
fi
# Fonction de retrait d'une station
function enleve {
PS3="Quel est le numéro de la radio à enlever ? 
0 pour retourner au menu principal
"
select opt in "${!radios[@]}"
do
    case "$opt" in
        "")
            menu ;;
        *)
        unset radios["$opt"] ;;
    esac
done
enregistre && menu
}
# Fonction d'archivage d'une station
function archive {
PS3='Quel est le numéro de la radio à archiver ? 
0 pour retourner au menu principal
'
select opt in "${!radios[@]}"
do
    case "$opt" in
        "")
            menu ;;
        *)
            archives+=(["$opt"]="${radios[$opt]}")
            unset radios["$opt"] ;;
    esac
done
enregistre && menu
}
# Fonction de désarchivage d'une station
function desarchive {
PS3='Quel est le numéro de la radio à désarchiver ? 
0 pour retourner au menu
'
select opt in "${!archives[@]}"
do
    case "$opt" in
	"")
	    menu ;;
	*)
	    radios+=(["$opt"]="{$archives[$opt]}")
	    unset archives["$opt"] 
	    enregistre #;;
    esac
done
menu
}
# Fonction donnant les détails d'une station (flux)
function informe {
PS3='Quelle est la radio dont tu veux les détails ? 
0 pour retourner au menu
'
select opt in "${!radios[@]}"
do
    case "$opt" in
       "")
           menu ;;
       *)
          echo "Nom : $opt, flux : ${radios[$opt]}" ;;
    esac
done
menu
}
# Fonction de menu principal
function menu {
clear
actions=( "Lire" "Ajouter" "Enlever" "Archiver" "Désarchiver" "Détails" "Quitter")
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
	"Détails")
            informe ;;
        "Quitter")
            exit 0 ;;
        *) echo "Qu'entends-tu par $REPLY ?" ;;
    esac
done
}
# Lancement du menu, avec paramètre
if [[ -n "$1" ]] ; then
    case "$1" in
        "lire")
	    lis ;;
        "ajouter")
	    ajoute ;;
	"enlever")
	    enleve ;;
        "archiver")
	    archive ;;
	"desarchiver")
	    desarchive ;;
        "Détails")
            informe ;;
	"aide")
	    echo "Options : rien, lire, ajouter, enlever, archiver, desarchiver, aide"
            exit 0 ;;
        *)
	    echo "Options : rien, lire, ajouter, enlever, archiver, desarchiver, aide"
            exit 0 ;;
    esac
else
# Lancement du menu, sans paramètre
    menu
fi
