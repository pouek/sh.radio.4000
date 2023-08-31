# sh.radio.4000
Lecteur et gestionnaire de radios internet, en langage shell, avec mes radios favorites.

Webradios player and manager, in shell language, with my favorites.

English read-me lower.

## Prérequis

Installer le lecteur [mpv](https://mpv.io/).

(Ou mplayer et éventuellement lolcat, voir [code](https://github.com/pouek/sh.radio.4000/blob/main/radio.sh)) 

Installable sous GNU/Linux, depuis votre gestionnaire de logiciels, ou par le terminal :
- Debian, Mint, Ubuntu, Termux, ... :
```
sudo apt install mpv
```
- Fedora et dérivés :
```
dnf install packagename
```
- MacOS avec [homebrew](https://brew.sh/) :
```
brew install mpv
```

## Installation 
### Graphique (à la souris)
- [Cliquer ici pour télécharger le zip](https://github.com/pouek/sh.radio.4000/archive/refs/heads/main.zip).
- Extraire les fichiers avec _Clic-Droit_ sur le _fichier .zip_ > _Extraire ou décompresser_.
- Les fichiers _radio.sh_ et _liste-radios.txt_ doivent rester dans le même dossier.
- Clic-droit sur le fichier _radio.sh_ > _Propriétés_, puis chercher et cocher la case _Exécuter_.  
   
### En ligne de commande
#### Avec Termux
Pour rendre le script _exécutable_ il faut le laisser dans le "home" de Termux.
- ``` cd ```
#### Commun à Termux et autres terminaux
- ``` git clone https://www.github.com/pouek/sh.radio.4000 ```
- ``` cd sh.radio.4000/ ```
- ``` chmod u+x radio.sh ```

## Utilisation
### Menu
Les fonctions _lecture_, _ajout_, _retrait_, _archivage_, _désarchivage_, et _détails_ sont accessibles depuis le menu d'accueil.

### Lancement depuis le terminal
- Si on est déjà dans le dossier
```
./radio.sh
```
- Depuis n'importe où
```
/chemin/complet/vers/radio.sh
```
### Lancement par raccourcis clavier 

Avec l'outil de raccourcis clavier de son système (GNU/Linux), faire lancer la commande suivante à son terminal : 

___Adapter le chemin à votre situation !___
```
bash -c "~/chemin/vers/sh.radio.4000 && ./radio.sh lire"
```
Exemples :
```
gnome-terminal --geometry=117x30 -t "Radio 4000" -- bash -c "~/chemin/vers/sh.radio.4000 && ./radio.sh lire"
```

### Passage d'un choix de menu en paramètre lors du lancement du script
__Options : "rien" (→ menu), "lire", "ajouter", "enlever", "archiver", "désarchiver", "voir détails", "voir aide".__
_Pour sauter l'étape "Menu"_

Exemples : 
- ``` ./radio.sh lire ``` ira directement au sous-menu de choix d'une station à lire
- ``` ./radio.sh voir aide ``` pour la liste des options

### Lecture d'une radio
Sélection d'une radio à l'aide du numéro correspondant puis touche Entrée.

Raccourcis clavier mpv :
 - Q : Arrêt du flux et retour à l'acceuil
 - 0 : Augmenter le volume
 - 9 : Diminuer le volume
 - M : Couper le son

## À faire ?
- ajouter d'autres exemples de raccourcis clavier de lancement selon les différents terminaux et leurs syntaxes.
- documenter comment on ajoute/enleve/archive/désarchive une radio, mais ça me paraît intuitif.

## Rêve
Pouvoir rediriger la sortie de mpv dans lolcat..


# Read me
Webradios player and manager, in shell language, with my favorites.

# Prerequisites
Install the player [mpv](https://mpv.io/).
(Or mplayer and possibly lolcat, see [code](https://github.com/pouek/sh.radio.4000/blob/main/radio.sh))

Installable under GNU/Linux, from your software manager, or by the terminal:
- Debian, Mint, Ubuntu, Termux, ... :
"
sudo apt install mpv
"
- Fedora and derivatives:
"
dnf install packagename
"
- MacOS with [homebrew](https://brew.sh/):
"
brew install mpv
"

# Installation
## Graphic (with mouse)
- [Click here to download the zip](https://github.com/pouek/sh.radio.4000/archive/refs/heads/main.zip).
- Extract files with _Right-Click_ on the _file .zip_ > _Extract or uncompress_.
- _radio.sh_ and _liste-radios.txt_ files must remain in the same folder.
- Right click on the file _radio.sh_ > _Properties_, then search and check the box _Execute_.

## Order line
## With Termux
To make the script _executable_ you have to leave it in the "home" of Termux.
- ``` cd ```
## Common to Termux and other terminals
- ``` git clone https://www.github.com/pouek/sh.radio.4000 ```
- ``` cd sh.radio.4000/ ```
``` chmod u+x radio.sh ```

# Use
_lecture_ (read), _ajout_ (add), _retrait_ (remove), _archivage_ (archive), _désarchivage_ (unarchive), and _détails_ (details) are available from the menu.


## Launch from terminal
- If we're already in the folder.
```
./radio.sh
```
- From anywhere
```
/chemin/complete/vers/radio.sh
```

## Launch by keyboard shortcuts
With the keyboard shortcut tool of your system (GNU/Linux), launch the following command with its terminal:

___Adapt the path to your situation!___
```
bash -c "~/path/to/sh.radio.4000 " ./radio.sh lire"
```
Examples:
```
gnome-terminal --geometry=117x30 -t "Radio 4000" -- bash -c "~/chemin/vers/sh.radio.4000 " ./radio.sh lire"
```

## Switching from a menu option to parameter when launching the script
__Options : "" (nothing → menu), "lire" (read), "ajouter" (add), "enlever" (remove), "archiver" (archive), "desarchiver" (unarchive), "voir détails" (see details), "voir aide" (see help). __
_Useful to jump the "Menu" step_

Examples:
- ``` ./radio.sh lire ``` will go directly to the submenu of choice of a station to read
- ``` ./radio.sh see help ``` for the list of options

# Playing a radio
Select a radio using the corresponding number and then enter key.

Keyboard shortcuts mpv :
- Q: Quit the player and return to the main menu
- 0 : Increase the volume
- 9: Reduce volume
- M: Cut the sound

# To do?
- add other examples of launch keyboard shortcuts according to the different terminals and their syntax.
- documenting how to add/remove/archive/unsarchive a radio, but it seems intuitive to me.

# Dream
To redirect the output of mpv in lolcat..
