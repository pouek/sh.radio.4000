# sh.radio.4000
Lecteur de webradios en bash avec mes radios favorites.

Nécessite le lecteur mpv.

Sélection d'un flux à l'aide du numéro correspondant puis touche Entrée.

Arrêt du flux et retour à l'acceuil avec le raccouris Ctrl + C. Ensuite pour refaire apparaître la liste des radios, taper Entrée.

### Installation 
- Télécharger les fichier radio.sh et radios.txt
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

#### Raccourcis clavier mplayer (pendant la lecture, donc) :
- Augmenter le volume : "0"
- Diminuer le volume : "9"
- Couper le son : "M"
- Autres : [documentation sur ubuntu-fr.org](https://doc.ubuntu-fr.org/mplayer#les_commandes_au_clavier)

### À faire
- ajouter la fonction d'ajout / suppression de radio, c'est à dire de couple flux + nom
- ce qui nécessite d'ajouter un menu pour basculer entre lecture et gestion de la liste de radios
- ajouter d'autres exemples de raccourcis clavier selon les différents terminaux et leurs syntaxes.

### Rêve
Rediriger la sortie de mplayer dans lolcat..
