#!/bin/bash
function mp { echo -e "\033]2;$opt\007" && mplayer  -msglevel all=-1:demuxer=4:network=4 -cache 2048 $1 $2|lolcat; }

PS3='Entrer le numéro de la radio choisie : '
options=(
	"Ambient Sleeping Pill"
	"FIP"
	"FIP Jazz"
	"FIP Groove"
	"FIP World"
	"FIP Electro"
	"Radio Zinzine"
	"Radio Meuh"
	"Radio Libertaire"
	"Radio Klaxon"
	"Radio Larzac"
	"Onde Courte"
	"Plum FM"
	"Saint Afrique"
	"Radio Canuts"
	"Radio Pikez"
	"Radio La Locale"
	"Cause Commune"
	"Balla Radio"
	"Radio Jovem Bissau"
	"Radio Gumbé"
	"Mradio musique"
	"Phaune Radio"
	"Radio Primitive"
	"Another Planet"
	"Campus Toulouse"
	"FMR"
	"Canal Sud"
	"France Culture"
	"France Inter"
	"France Musique"
	"France Musique - Classique Easy"
	"France Musique - Classique Plus"
	"France Musique - Ocora Monde"
	"France Musique - La Contemporaine"
	"France Musique - Concerts"
	"France Musique - La Jazz"
	"Jazz Radio - Funk"
	"Jazz Radio - Manouche"
	"TSF Jazz"
	"Jazz Radio"
	"Long Player"
	"KBOO"
	"ChillSky - Lofi Hip Hop Radio"
	"TuneIn Classic Hip Hop"
	"NTS - 100% Hip Hop"
	"Global Funk Radio"
	"SomaFM - Cliqhop IDM"
	"SomaFM - Groove Salad"
	"SomaFM - Groove Salad Classic"
	"SomaFM - Fluid"
	"SomaFM - Secret Agent"
	"SomaFM - Beat Blender"
	"SomaFM - Space Station"
	"SomaFM - Lush"
	"SomaFM - Drone Zone"
	"SomaFM - Sonic Universe"
	"SomaFM - Suburbs of Goa"
	"SomaFM - Deep Space One"
	"NTS - Slow Focus"
	"LeDjam Radio"
	"Radio Sing Sing"
	"La Grosse Radio - Reggae"
	"Prun'"
	"Nova"
	"Nova - La nuit"
	"Nova - Vintage"
	"Nova - Lyon"
	"Nova - Bordeaux"
	"8bit.fm Radio"
	"SomaFM - DEF CON Radio"
	"SomaFM - DOOMED"
	"SomaFM - Metal Detector"
	"SomaFM - BAGel Radio"
	"SomaFM - Left Coast 70s"
	"SomaFM - Seven Inch Soul"
	"Quit")
select opt in "${options[@]}"
do
    case $opt in
		"FIP")
           mp http://icecast.radiofrance.fr/fip-hifi.aac ;;
        "FIP Jazz")
           mp http://icecast.radiofrance.fr/fipjazz-hifi.aac ;;
        "FIP Groove")
           mp http://icecast.radiofrance.fr/fipgroove-hifi.aac ;;
		"FIP World")
		   mp http://direct.fipradio.fr/live/fip-webradio4.mp3 ;;
		"FIP Electro")
           mp http://direct.fipradio.fr/live/fip-webradio8.mp3 ;;
		"Radio Zinzine")
		   mp http://91.121.65.189:8000/3?1526206575807.mp3 ;;
		"Radio Meuh")
		   mp http://radiomeuh.ice.infomaniak.ch/radiomeuh-128.mp3 ;;
		"Radio Libertaire")
		   mp -playlist http://ecoutez.radio-libertaire.org:8080/radiolib.m3u ;;
		"Radio Klaxon")
		   mp -playlist https://grenoble.indymedia.org/radio_klaxon.m3u ;;
		"Radio Larzac")
		   mp http://stream.radiolarzac.org:8000/radiolarzac ;;
		"Onde Courte")
		   mp http://stream.ondecourte.fr/radio.ogg ;;
		"Plum FM")
		   mp http://plumfm.online.radiobreizh.bzh/live.mp3 ;;
        "Saint Afrique")
           mp http://stream.radios-arra.fr:8000/stafrique ;;
		"Radio Canuts")
		   mp http://live.francra.org:8000/radiocanut?alea=MjAxOS0wNy0yNCAyMzozODowMw== ;;
		"Radio Pikez")
		   mp http://ecouter.pikez.space:8000/pikez_hd ;;
		"Radio La Locale")
		   mp http://91.121.134.23:8000/lalocale.mp3 ;;
		"Cause Commune")
		   mp http://vdl.stream-lat.org:8000/voixdulat_mp3 ;;
		"Balla Radio")
           mp http://192.99.35.93:5730 ;;
		"Radio Jovem Bissau")
           mp http://srv3.ipstm.net:9014 ;;
		"Radio Gumbé")
		   mp http://149.56.183.178:8548/stream/1/ ;;
		"Mradio musique")
           mp http://37.221.196.27:8022 ;;
		"Phaune Radio")
		   mp http://stream.phauneradio.com/phaune_256 ;;
		"Radio Primitive")
		   mp -playlist http://www.radioprimitive.fr:8000/live.m3u ;;
		"Another Planet")
		   mp -playlist http://stream.anotherplanet.fm:2199/tunein/shoutcast.pls ;;
		"Campus Toulouse")
		   mp http://stream.radiotime.com/listen.m3u?streamId=10555650 ;;
		"FMR")
		   mp http://giss.tv:8000/radio-fmr.mp3 ;;
		"Canal Sud")
		   mp http://91.224.148.160:8000/canalsud-live ;;
		"France Culture")
		   mp http://direct.franceculture.fr/ts/franceculture-midfi.mp3 ;;
		"France Inter")
           mp http://direct.franceinter.fr/live/franceinter-midfi.mp3 ;;
        "France Musique")
           mp http://direct.francemusique.fr/live/francemusique-midfi.mp3 ;;
        "France Musique - Classique Easy")
           mp http://direct.francemusique.fr/live/francemusiqueeasyclassique-hifi.mp3 ;;
        "France Musique - Classique Plus")
		   mp http://direct.francemusique.fr/live/francemusiqueclassiqueplus-hifi.mp3 ;;
        "France Musique - Ocora Monde")
		   mp http://direct.francemusique.fr/live/francemusiqueocoramonde-hifi.mp3 ;;
        "France Musique - La Contemporaine")
		   mp http://direct.francemusique.fr/live/francemusiquelacontemporaine-hifi.mp3 ;;
        "France Musique - Concerts")
		   mp http://direct.francemusique.fr/live/francemusiqueconcertsradiofrance-hifi.mp3 ;;
        "France Musique - La Jazz")
		   mp http://direct.francemusique.fr/live/francemusiquelajazz-hifi.mp3 ;;
		"Jazz Radio - Funk")
		   mp http://jazz-wr06.ice.infomaniak.ch/jazz-wr06-128.mp3 ;;
		"Jazz Radio - Manouche")
		   mp http://jazz-wr02.ice.infomaniak.ch/jazz-wr02-128.mp3 ;;
		"TSF Jazz")
           mp http://tsfjazz.ice.infomaniak.ch/tsfjazz-high.mp3 ;;
        "Jazz Radio")
		   mp http://jazzradio.ice.infomaniak.ch/jazzradio-high.mp3 ;;
		"Long Player")
		   mp -playlist http://icecast.spc.org:8000/longplayer.m3u ;;
		"KBOO")
		   mp http://live.kboo.fm:8000/high ;;
		"ChillSky - Lofi Hip Hop Radio")
		   mp http://hyades.shoutca.st:8043/stream ;;
		"TuneIn Classic Hip Hop")
		   mp http://tunein4.streamguys1.com/clshhfree1 ;;
		"NTS - 100% Hip Hop")
		   mp https://stream-mixtape-geo.ntslive.net/mixtape2 ;;
		"Global Funk Radio")
		   mp http://91.121.139.194:8184/stream ;;
		"SomaFM - Cliqhop IDM")
		   mp -playlist https://somafm.com/cliqhop256.pls ;;
		"SomaFM - Groove Salad")
		   mp -playlist https://somafm.com/groovesalad256.pls ;;
		"SomaFM - Groove Salad Classic")
		   mp -playlist https://somafm.com/gsclassic.pls ;;
		"SomaFM - Fluid")
		   mp -playlist https://somafm.com/fluid.pls ;;
		"SomaFM - Secret Agent")
		   mp -playlist https://somafm.com/secretagent.pls ;;
		"SomaFM - Beat Blender")
		   mp -playlist https://somafm.com/beatblender130.pls ;;
		"SomaFM - Space Station")
           mp -playlist https://somafm.com/spacestation.pls ;;
		"SomaFM - Lush")
           mp -playlist https://somafm.com/lush.pls ;;
		"SomaFM - Drone Zone")
		   mp -playlist https://somafm.com/dronezone256.pls ;;
		"SomaFM - Sonic Universe")
		   mp -playlist https://somafm.com/sonicuniverse192.pls ;;
		"SomaFM - Suburbs of Goa")
		   mp -playlist https://somafm.com/suburbsofgoa.pls ;;
		"SomaFM - Deep Space One")
		   mp -playlist https://somafm.com/deepspaceone.pls ;;
		"NTS - Slow Focus")
		   mp https://stream-mixtape-geo.ntslive.net/mixtape7 ;;
		"LeDjam Radio")
		   mp http://www.djamradio.com/sound ;;
		"Radio Sing Sing")
		   mp http://stream.sing-sing.org:8000/singsingaac128 ;;
		"La Grosse Radio - Reggae")
		   mp http://hd.lagrosseradio.info/lagrosseradio-reggae-192.mp3 ;;
		"Prun'")
           mp -playlist http://streaming.prun.net/streamprun.m3u ;;
        "Nova")
           mp http://novazz.ice.infomaniak.ch/novazz-128.mp3 ;;
		"Nova - La nuit")
           mp http://nova-ln.ice.infomaniak.ch/nova-ln-128.mp3 ;;
        "Nova - Vintage")
           mp http://nova-vnt.ice.infomaniak.ch/nova-vnt-128.mp3 ;;
        "Nova - Lyon")
		   mp http://snb.ice.infomaniak.ch/snb-high.mp3 ;;
		"Nova - Bordeaux")
		   mp http://snb.ice.infomaniak.ch/snb-high.mp3 ;;
		"8bit.fm Radio")
		   mp http://8bit.fm:8000/live ;;
		"SomaFM - DEF CON Radio")
		   mp -playlist https://somafm.com/defcon256.pls ;;
		"SomaFM - DOOMED")
		   mp -playlist https://somafm.com/doomed.pls ;;
		"SomaFM - Metal Detector")
		   mp -playlist https://somafm.com/metal.pls ;;
		"SomaFM - BAGel Radio")
		   mp -playlist https://somafm.com/bagel.pls ;;
		"SomaFM - Left Coast 70s")
		   mp -playlist https://somafm.com/seventies320.pls ;;
		"Seven Inch Soul")
		   mp -playlist https://somafm.com/7soul.pls ;;
		"Ambient Sleeping Pill")
		   mp https://radio.stereoscenic.com/asp-s ;;
		"Quit")
            break ;;
        *) echo "Qu'est-ce que tu entends par $REPLY ?" ;;
    esac
done

# Sauvegarde / poubelle :
#	   AAZO : mp http://77.67.46.74:8000/aazoradio-hiphop.mp3
