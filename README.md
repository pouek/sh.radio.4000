# sh.radio.4000
Lecteur de webradios en bash avec mes radios favorites.
Nécessite le lecteur mplayer.
Sélection d'un flux à l'aide du numéro correspondant puis touche Entrée.
Arrêt du flux et retour à l'acceuil avec le raccouris Ctrl + C. Ensuite pour refaire apparaître la liste des radios, taper Entrée.

À faire :
- ajouter la fonction d'ajout / suppression de radio, c'est à dire de couple flux + nom
- ce qui nécessite d'ajouter un menu pour basculer entre lecture et gestion de la liste de radios

Rêve : 
arriver à rediriger la sortie de mplayer dans lolcat

Installation : 
télécharger le fichier .sh
le rendre exécutable avec 
> chmod u+x radio.sh 
l'exécuter avec
> ./radio.sh # si on est dans le dossier
> /chemin/complet/radio.sh
On peut créer un raccourcis clavier en faisant exécuter "bash -c /chemin/complet/radio.sh" à son terminal.
Exemples :
> gnome-terminal --geometry=117x27 -t "Radio 4000" -- bash -c ~/chemin/vers/radio.sh
