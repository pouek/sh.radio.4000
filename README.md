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

Faire lancer à son terminal la commande : 
```
bash -c /chemin/complet/radio.sh
```
Exemples :
```
gnome-terminal --geometry=117x27 -t "Radio 4000" -- bash -c ~/chemin/vers/radio.sh

```
#### Lecture d'une radio
Sélection d'une radio à l'aide du numéro correspondant puis touche Entrée.

Raccourcis clavier :
 - Q : Arrêt du flux et retour à l'acceuil
 - 0 : Augmenter le volume
 - 9 : Diminuer le volume
 - M : Couper le son

### À faire ?
- ajouter la possibilité de passer un des choix du menu en paramètre lors du lancement du script, pour sauter l'étape "Menu" (ex : "./radio.sh --lecture" ira directement au sous-menu de choix d'une station à lire)
- ajouter une option de retour au menu depuis les sous-menus.
- ajouter d'autres exemples de raccourcis clavier selon les différents terminaux et leurs syntaxes.
- documenter comment on ajoute/enleve/archive/désarchive une radio, mais ça me paraît intuitif.

### Rêve
Pouvoir rediriger la sortie de mpv dans lolcat..
