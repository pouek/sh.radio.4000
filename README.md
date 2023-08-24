# sh.radio.4000
Lecteur de radios internet en langage bash avec mes radios favorites.

### Prérequis

Nécessite le lecteur mpv.
```
sudo apt install mpv
```

### Installation 
- Télécharger les fichier [radio.sh](<https://raw.githubusercontent.com/pouek/sh.radio.4000/main/radios.sh>) et [liste-radios.txt](<https://raw.githubusercontent.com/pouek/sh.radio.4000/main/liste-radios.txt>) ( _Clic-Droit_ > _Enregistrer sous_ )
- Rendre le script exécutable avec
```
chmod u+x radio.sh 
```

### Utilisation
#### Lancement depuis le terminal
- Si on est déjà dans le dossier
```
./radio.sh
```
- Depuis n'importe où
```
/chemin/complet/vers/radio.sh
```
#### Lancement par raccourcis clavier 

Il fera lancer "bash -c /chemin/complet/radio.sh" à son terminal.

Exemples :
```
gnome-terminal --geometry=117x27 -t "Radio 4000" -- bash -c ~/chemin/vers/radio.sh

```
#### Menu "lire" 

Sélection d'une radio à l'aide du numéro correspondant puis touche Entrée.

Arrêt du flux et retour à l'acceuil avec la touche "Q". 

Pour refaire apparaître la liste des radios, taper Entrée.

Pas de retour au Menu : "Ctrl + C", et relancer le script... en cours..

#### Raccourcis clavier mpv (pendant la lecture, donc) :
- Augmenter le volume : "0"
- Diminuer le volume : "9"
- Couper le son : "M"
- Quitter : "Q"

### À faire ?
- ajouter une option de retour au menu depuis les sous-menus.
- ajouter d'autres exemples de raccourcis clavier selon les différents terminaux et leurs syntaxes.
- documenter comment on ajoute/enleve/archive/désarchive une radio, mais ça me paraît intuitif.

### Rêve
Pouvoir rediriger la sortie de mpv dans lolcat..
