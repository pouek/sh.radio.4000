##!/data/data/com.termux/files/usr/bin/bash
#!/bin/bash
# Lecteur et gestionnaire de webradio en langage shell

# Sélection du lecteur. "mpv" pour mpv ou "mplayer" pour mplayer
lecteur="mpv"
# Types de fichiers contenant la liste des couples nom + flux de chaque radio
# Un fichier "favoris" (actives) et un "archives", avec des suffixes .txt pour être éditables à la main.
declare -a types=("favoris" "archives")

for type in "${types[@]}"; do
    declare -A "$type"
    declare -n temp="$type"
    while IFS=$'\t' read -r -a tableau
    do
        (("${#tableau[*]}" <= 2)) || continue
        temp+=(["${tableau[@]:0:1}"]="${tableau[@]:1:1}")
    done < "$type".txt
done

#source ./liste_radios.txt
# Fonction de mise à jour de cette liste à chaque modification
function ecris {
	ordonner
	for type in "${types[@]}" ; do
		rm "$type".txt
		declare -n temp="$type"
		declare -n temp_ord="$type"_ord
		for cle in "${temp_ord[@]}"; do
			echo "$cle	${temp[${cle}]}" >> "$type".txt
		done
	done
}
# Fonction de tri des noms de favoris, résultats sauvés dans des tableaux indexés en *_ord 
function ordonner {
	IFS=$'\n' favoris_ord=($(sort <<<"${!favoris[@]}")) ; unset IFS
	IFS=$'\n' archives_ord=($(sort <<<"${!archives[@]}")) ; unset IFS
}
ordonner
# Fonction d'intéraction : confirmation/infirmation
function oui_non {
    while true; do
        read -p "$* [O/n]: " yn
        case $yn in
            [Oo]*) return 0  ;;
            [Nn]*) echo "Abandonné" ; return  1 ;;
            *) return 0  ;;
        esac
    done
}
# Fonction qui fait vérifier les modifications de favoris
# avant de les enregistrer dans le fichier liste
function enregistre {
	ordonner
    echo "	### Liste des radios actives : ###"
    for clef in "${favoris_ord[@]}";do
        echo "$clef : ${favoris[$clef]}"
    done
    echo "	### Liste des radios archivées : ###"
    for clef in "${archives_ord[@]}";do
        echo "$clef : ${archives[$clef]}"
    done
    oui_non "Enregistrer ? " && ecris
    menu
}
# Fonctions qui lisent les flux
function mpo { echo -e "\033]2;$opt\007"; echo -e "Lecture de $opt"; mplayer  -msglevel all=-1:demuxer=4:network=4 -cache 2048 $1 $2 ; } #|lolcat : }
function mp { echo -e "\033]2;$opt\007"; echo -e "Lecture de $opt"; script -c "mpv $1 --audio-buffer=10 --volume=80" /dev/null | grep -v "File tags:" ; } #|lolcat;}
# Fonction propose les stations à lire, et les lis
function lis {
	PS3='Quel est le numéro de la radio à lire ? 
0 pour retourner au menu maintenant, Q ensuite
en lecture : 9-0 volume, p pause, m silence
'
	select opt in "${favoris_ord[@]}"
	do
		case "$opt" in
			"")
				menu ;;
			*)
				flux="${favoris[${opt}]}"
				case $lecteur in
					"mplayer")
						if [[ "$flux" ==  *".pls" || "$flux" == *".m3u" ]] ; then
							mpo "-playlist" "$flux"
						else
							mpo "$flux"
						fi ;;			
					"mpv") mp "$flux" ;;
					*) echo "Erreur : lecteur non existant" ; exit 0;;
				esac ;;
		esac
	done
	menu
}
# Fonction d'ajout de favori à la liste
function ajoute {
    read -p "Quel est le nom de la radio ? " nom
    read -p "Quel est l'adresse du flux ? " flux
    echo "Test du flux, Ctrl+C pour revenir" ; sleep 1 ; 
    mp "$flux" ; 
    if $(oui_non "Le nom '$nom' est correct et le flux audible ? "); then
		favoris+=(["$nom"]="$flux") ; enregistre
	else echo "Pas de soucis, on recommence !" && ajoute
	fi
}
# Fonction de retrait d'une station
function enleve {
	PS3="Enlever un favori ou une archive ? " 
	select type in "favori" "archive"
	do
		case "$type" in
			"")
				menu;;
			"favori")
				PS3="Quel est le numéro de la radio à enlever ? 
0 pour retourner au menu principal
"	
				select opt in "${favoris_ord[@]}"
				do
					case "$opt" in
						"")
							menu ;;
						*)
							unset 'favoris[$opt]'
							enregistre ;;
					esac
				done;;
			"archive")
				PS3="Quel est le numéro de la radio à enlever ? 
0 pour retourner au menu principal
"	
				select opt in "${archives_ord[@]}"
				do
					case "$opt" in
						"")
							menu ;;
						*)
							unset archives["$opt"] 
							enregistre ;;
					esac
				done;;
		esac
	done
}
# Fonction d'archivage d'un favori
function archive {
	PS3='Quel est le numéro de la radio à archiver ? 
0 pour retourner au menu principal
'
	select opt in "${favoris_ord[@]}"
		do
			case "$opt" in
				"")
					menu ;;
				*)
					archives+=(["$opt"]="${favoris[$opt]}")
					unset favoris["$opt"] 
					enregistre ;;
			esac
		done
}
# Fonction de désarchivage d'une station
function desarchive {
	PS3='Quel est le numéro de la radio à désarchiver ? 
0 pour retourner au menu
'
	select opt in "${archives_ord[@]}"
	do
		case "$opt" in
			"")
				menu ;;
			*)
				favoris+=(["$opt"]="${archives[$opt]}")
				unset archives["$opt"] 
				enregistre ;;
		esac
	done
	menu
}
# Fonction donnant les détails d'un favori (flux)
function informe {
PS3='Quelle est la radio dont tu veux les détails ? 
0 pour retourner au menu
'
select opt in "${favoris_ord[@]}"
do
    case "$opt" in
       "")
           menu ;;
       *)
          echo "Nom : $opt, flux : ${favoris[$opt]}" ;;
    esac
done
menu
}
# Fonction d'édition d'un favori
function edite {
	PS3='Quel est le numéro de la radio à éditer ? 
0 pour retourner au menu principal
'
	select opt in "${favoris_ord[@]}"
		do
			case "$opt" in
				"")
				    menu ;;
				*)
				    echo "Flux actuel : ${favoris["$opt"]} "
    				    read -p "Par quelle adresse lz remplacer ? " flux
    				    echo "Test du flux, Ctrl+C pour revenir" ; sleep 1 ; 
                                    mp "$flux" ; 
                                    if $(oui_non "Le nom '$opt' est correct et le flux audible ? "); then
		                        favoris["$opt"]="$flux" ; enregistre
	                            else echo "Pas de soucis, on recommence !" && ajoute
				    fi ;;
			esac
		done
}
# Fonction de menu principal
function menu {
	clear
	actions=( "lire" "ajouter" "enlever" "archiver" "désarchiver" "voir détails" "éditer" "quitter")
	PS3='Que veux-tu faire ? '
	select act in "${actions[@]}"
	do
		case "$act" in
			"lire")
			lis ;;
			"ajouter")
			ajoute ;;
		"enlever")
			enleve ;;
			"archiver")
			archive ;;
		"désarchiver")
			desarchive ;;
		"éditer")
			edite ;;
		"voir détails")
			informe ;;
		"quitter")
			exit 0 ;;
		*) echo "Qu'entends-tu par $REPLY ? " ;;
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
	"éditer")
	    edite ;;
        "archiver")
	    archive ;;
	"desarchiver")
	    desarchive ;;
        "voir détails")
            informe ;;
	"voir aide")
	    echo "Options : rien, lire, ajouter, enlever, archiver, désarchiver, éditer, voir détails, voir aide"
            exit 0 ;;
        *)
	    echo "Options : rien, lire, ajouter, enlever, archiver, désarchiver, voir détails, voir aide"
            exit 0 ;;
    esac
else
	# Lancement du menu, sans paramètre
    menu
fi
