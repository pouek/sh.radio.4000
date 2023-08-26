# sh.radio.4000
Lecteur de radios internet en langage shell avec mes radios favorites.

## Prérequis

Nécessite le lecteur mpv. 
Choisir parmi :
```
sudo apt install mpv
```
```
brew install mpv
```

## Installation 
### Graphique (simple)
- Télécharger un zip depuis les [Releases](https://github.com/pouek/sh.radio.4000/releases) avec _Clic-Droit_ > _Enregistrer sous_ sur le lien.
- Extraire les fichiers [radio.sh] et [liste-radios.txt] avec _Clic-Droit_ > _Extraire/décompresser_ sur l'archive.
- Conserver ces 2 fichiers dans le même dossier.
- Clic-droit dans ce dossier > Ouvrir un terminal (ici, donc)
- Rendre le script _exécutable_ avec
```
chmod u+x radio.sh 
```
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
Les fonctions Lecture, Ajout, Retrait, Archivage, Désarchivage sont accessibles depuis le menu d'accueil.

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

Faire lancer à son terminal la commande : 
```
bash -c /chemin/complet/radio.sh
```
Exemples :
```
gnome-terminal --geometry=117x27 -t "Radio 4000" -- bash -c ~/chemin/vers/radio.sh

```
### Passage d'un choix de menu en paramètre lors du lancement du script
_Pour sauter l'étape "Menu"_

Exemples : 
- ``` ./radio.sh lecture ``` ira directement au sous-menu de choix d'une station à lire
- ``` ./radio.sh aide ``` pour la liste des options

### Lecture d'une radio
Sélection d'une radio à l'aide du numéro correspondant puis touche Entrée.

Raccourcis clavier :
 - Q : Arrêt du flux et retour à l'acceuil
 - 0 : Augmenter le volume
 - 9 : Diminuer le volume
 - M : Couper le son

## À faire ?
- ajouter une option de retour au menu depuis les sous-menus.
- ajouter d'autres exemples de raccourcis clavier selon les différents terminaux et leurs syntaxes.
- documenter comment on ajoute/enleve/archive/désarchive une radio, mais ça me paraît intuitif.

## Rêve
Pouvoir rediriger la sortie de mpv dans lolcat..
