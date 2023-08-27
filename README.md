# sh.radio.4000
Lecteur de radios internet en langage shell avec mes radios favorites.

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
__Adapter le chemin à votre situation !__
```
bash -c "~/chemin/vers/sh.radio.4000 && ./radio.sh lire"
```
Exemples :
```
gnome-terminal --geometry=117x30 -t "Radio 4000" -- bash -c "~/chemin/vers/sh.radio.4000 && ./radio.sh lire"
```

### Passage d'un choix de menu en paramètre lors du lancement du script
_Pour sauter l'étape "Menu"_

Exemples : 
- ``` ./radio.sh lire ``` ira directement au sous-menu de choix d'une station à lire
- ``` ./radio.sh aide ``` pour la liste des options

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
