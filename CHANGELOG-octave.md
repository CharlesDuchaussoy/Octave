# Journal des versions d'Octave

Ce fichier liste les modifications d'Octave par rapport à [Musly](https://github.com/dddevid/Musly). Le journal de Musly lui-même est dans [CHANGELOG.md](CHANGELOG.md).

## 1.0.0 — en préparation

Basée sur Musly 2.0.3 (`master` au commit `b199276`, 18 octobre 2026).

### Identité

- Nom **Octave** dans toute l'interface et dans toutes les langues, à la place de Musly.
- Nouvelle icône et nouveau logo : une croche dessinée comme un 8, blanche sur bleu nuit.
- Identifiant Android `io.github.charlesduchaussoy.octave` : Octave s'installe à côté de Musly sans le remplacer.
- Numérotation propre, qui commence à 1.0.0.
- Octave se présente sous le nom « Octave » au serveur. Octo le reconnaît et lui applique ses réglages (paroles minutées, albums de la bibliothèque seule).

### Liens et services

- Les mises à jour depuis l'app viennent des versions publiées d'Octave, jamais de celles de Musly.
- Les liens « GitHub », « Nouveautés », « Signaler un problème », traductions et politique de confidentialité mènent à Octave. Le crédit à dddevid, auteur de Musly, reste dans l'écran « À propos ».
- Politique de confidentialité adaptée à Octave : elle décrit ce qu'Octave envoie au serveur (rapports de lecture, file d'attente, signalements) et ne mentionne plus ce qui a été retiré.
- À propos indique le développeur d'Octave, garde le crédit à Musly et donne la licence. La plateforme s'écrit « Android » et non « ANDROID ».
- **Signaler un problème**, dans les Réglages et dans À propos : un formulaire envoie un problème ou une idée au serveur, sans compte GitHub. On peut joindre les infos techniques (version, appareil, titre en cours, journal récent de l'app, nettoyé de l'adresse du serveur et des mots de passe). Si le serveur ne reçoit pas les signalements, l'app ouvre une page GitHub déjà remplie.

### Français

- L'app est entièrement en français : les 1 035 textes, relus et tutoyés partout (la traduction communautaire de Musly mélangeait « vous » et « tu » et n'en couvrait que la moitié).
- Environ 150 textes écrits en dur dans les écrans (en anglais, et même en italien dans l'import de playlists et la fenêtre de mise à jour) passent par les traductions.
- Les mix de l'accueil ont des noms français : Sélection rapide, Mix découverte, Ambiance du matin, de l'après-midi, du soir et de la nuit, Mix d'un artiste ou d'un genre.

### Première installation

- Un écran d'accueil sobre avant la connexion, à la place des trois pages de présentation de Musly.
- Une connexion simple, en français : l'adresse du serveur, le nom d'utilisateur et le mot de passe. Le choix du type de serveur (Subsonic, Jellyfin, flux web) disparaît ; les réglages techniques (ancienne authentification, certificats) passent dans les options avancées.
- Une configuration guidée après la connexion, une question par écran, avec un choix conseillé déjà sélectionné : couleur et mode d'affichage (avec un aperçu en direct), forme des pochettes, artistes favoris, rubriques de l'accueil, qualité du son en Wi-Fi et en données mobiles, téléchargement automatique des titres aimés, autorisations (notifications et batterie), puis un résumé.
- Chaque étape peut être passée. Tant que la configuration n'est ni terminée ni passée en entier (« Passer la configuration » sur le premier écran), elle se rouvre à l'ouverture de l'app, à l'étape où elle s'était arrêtée, avec les choix déjà faits : en revenant en arrière ou dans le résumé, ce sont bien eux qui s'affichent.
- « Refaire la configuration » (À propos) s'ouvre en plein écran et repart du début. Les compilations (« Various Artists ») ne sont plus proposées parmi les artistes. La progression est lue « Étape 5 sur 10 » par les lecteurs d'écran.
- La configuration se refait depuis Réglages, À propos.

### Design

- Nouveau design aux couleurs du logo : fonds bleu nuit et accent bleu ciel en mode sombre, accent bleu nuit en mode clair.
- Toutes les couleurs de l'app sont calculées à partir d'une seule couleur, avec des contrastes de lecture vérifiés.
- Réglages d'apparence : couleur de l'app, intensité des couleurs (de neutre à coloré) et noir pur pour les écrans OLED.
- Icônes des réglages sobres et uniformes, vignettes des titres aimés et des téléchargements assorties.
- Police Inter intégrée à l'app.
- 13 couleurs nommées au choix : Nuit, Rose, Grenadine, Mandarine, Citron, Menthe, Forêt, Piscine, Bleu, Iris, Lilas, Sable et Ardoise, en plus des couleurs du fond d'écran.
- La couleur choisie se voit partout : en mode clair, les fonds la prennent (rose pâle, bleu pâle…) ; en mode sombre, les fonds restent presque noirs, comme dans Apple Music, et la couleur passe sur les boutons, les icônes et les textes actifs. Le bouton « Lecture » des albums, playlists et artistes est rempli de cette couleur.
- Barre d'onglets et mini-lecteur flottants, sur un fond flou : le contenu défile dessous, et les menus s'ouvrent par-dessus.
- Réglages en une seule liste, comme sur iPhone, à la place des six onglets qui se chevauchaient sur un téléphone.
- Pochettes de l'accueil sans cadre, artistes en vrais cercles.
- Glisser le mini-lecteur vers la gauche passe au titre suivant, vers la droite revient au précédent, comme dans Spotify.
- Accueil personnalisable : on range les rubriques en les glissant et on masque celles dont on ne se sert pas (Réglages, Affichage, ou en bas de l'accueil).
- Page d'artiste façon Apple Music : la photo en pleine largeur et le nom en grand. Une fois la page remontée, le nom se range à côté de la flèche retour ; les titres populaires s'alignent sur la marge, sans grand vide autour des listes.
- Les titres de section (Titres populaires, Albums, genres) sont en gras comme les autres.
- Tuiles « Tout parcourir » en couleurs unies, sans dégradé ni violet ; champ de recherche plein, comme sur iPhone.
- Le lecteur plein écran et tout ce qui s'ouvre depuis lui suivent la couleur de l'app et la police Inter (avant : violet et police par défaut).
- Le lecteur plein écran a un fond uni pris de la pochette, comme Spotify, à la place des halos colorés animés en continu de Musly. Le thème le règle : l'intensité des couleurs le rend plus ou moins coloré, le noir pur le passe au noir, et un réglage (Affichage, Lecteur) lui donne plutôt la couleur de l'app. La barre de progression et les paroles prennent la couleur de l'app.
- Les paroles ne brillent plus : la lueur autour de la ligne en cours est retirée.
- Les filtres de l'Accueil, de la Bibliothèque et de la Recherche défilent jusqu'au bord de l'écran, au lieu d'être coupés net à la marge.
- Un titre trop long défile enfin dans le lecteur plein écran, avec des bords qui s'estompent, au lieu d'être coupé au milieu d'une lettre. Si les animations sont coupées dans Android, il finit par des points de suspension.

### Enceintes Google Home et Chromecast

- Octave envoie aux enceintes un format qu'elles savent lire : le fichier d'origine quand c'est possible (MP3, FLAC jusqu'à 96 kHz, Opus, AAC, WAV), sinon du MP3 à 320 kb/s, toujours avec le bon type annoncé. Musly envoyait le fichier tel quel, parfois transcodé par le serveur sans le dire, ce que les enceintes refusent.
- La fenêtre « Écouter sur un appareil » indique qu'elle cherche, puis rappelle que le téléphone et l'enceinte doivent être sur le même Wi-Fi.
- L'enceinte reçoit le titre en cours et les 20 suivants, et les joue d'elle-même : la musique continue quand le téléphone se met en veille ou qu'Octave est fermé. Octave suit l'enceinte et complète sa liste au fur et à mesure, y compris avec les titres ajoutés à la file.
- Les titres s'enchaînent sans blanc : l'enceinte prépare le suivant 20 secondes avant la fin.
- En se reconnectant à une enceinte qui joue encore sa file, Octave reprend là où elle en est au lieu de revenir au titre d'avant.
- Un titre que l'enceinte ne peut pas lire est passé, au lieu d'arrêter la musique (trois fois de suite au plus).

### Réglages plus simples

- Retirés, avec une valeur par défaut : dossiers de musique, mode jukebox, paroles LRCLIB (toujours actives), interrupteurs de cache, analyse des BPM, dossier et nombre de téléchargements simultanés, écran allumé pendant les téléchargements, boutons du mini-lecteur (le cœur est affiché, les étoiles, répéter et aléatoire non), recherche en direct (toujours active), résolution des pochettes, style des paroles.
- « Vider tout le cache » reste, avec la place utilisée.

### Pochettes de playlist

- Un éditeur de pochettes, comme « Créer une pochette » de Spotify : menu d'une playlist, puis « Modifier la pochette ».
- 10 modèles : Dégradé, Minimal, Duo, Typo géante, Formes, Vinyle, Bandeau, Photo, Cadre et Mosaïque.
- La photo se cadre au doigt sur l'aperçu (glisser pour la déplacer, pincer pour zoomer), avec un effet au choix : normale, noir et blanc, ou teintée de la couleur principale.
- Le titre a trois tailles et se centre au besoin. Les couleurs vont au-delà de la palette : « Autre couleur » choisit n'importe quelle teinte, intensité et clarté.
- La pochette est dessinée à part en 1200 × 1200 une fois toutes ses images chargées : plus de pochette envoyée floue ou avec une image manquante.
- En Typo géante, les mots longs sont rognés par le bord au lieu d'être coupés en deux ; la Mosaïque montre 9, 4 ou 1 pochettes, sans répéter les mêmes ; la couleur en cours apparaît toujours parmi les pastilles.
- Titre et sous-titre, 5 polices intégrées (Inter, Bebas Neue, DM Serif Display, Space Mono, Pacifico), majuscules, deux couleurs (dont celles tirées des pochettes de la playlist) et une photo du téléphone.
- Contrairement à Spotify, la pochette se rouvre et se retouche. « Revenir à la pochette automatique » rend la mosaïque.
- La pochette est envoyée au serveur par Octo : elle s'affiche dans toutes les apps branchées sur le serveur et sur tous les appareils. Son modèle est gardé aussi, pour la retoucher depuis un autre téléphone. Sans Octo, elle reste sur l'appareil où elle a été faite.

### Uniquement ton serveur

- Octave se connecte à Navidrome (et aux serveurs Subsonic) : Jellyfin, Emby, les flux web YouTube, Android TV, Tizen et la présence Discord sont retirés du code, avec leurs paquets. Environ 37 000 lignes et 2 750 textes inutiles en moins.
- L'import de playlists, qui associait les titres Spotify à des vidéos YouTube, est retiré.
- Python et yt-dlp, embarqués dans l'APK pour YouTube, sont retirés : l'APK arm64-v8a pèse 27,5 Mo.

### Avec Octo

- L'Accueil a une ligne « Tes mix » : les mix et radios qu'Octo fait pour le compte. « Tes playlists » ne garde que les playlists du compte, et les mix calculés sur le téléphone ne s'affichent plus que sans Octo.
- La bibliothèque se synchronise en quelques requêtes (tous les titres par pages de 500) au lieu d'une requête par album, qui chargeait le Raspberry Pi : 1 requête au lieu de 32 pour le compte d'essai.
- Reprendre sur un autre appareil : Octave garde sa file sur le serveur (au changement de titre, à la pause, en quittant l'app). À l'ouverture, une bannière de l'Accueil propose de reprendre la file laissée ailleurs plus récemment, sur un autre appareil ou dans une autre app comme Arpeggi, au même titre et au même moment. Le serveur n'a qu'une file par compte : la dernière enregistrée l'emporte. Les fichiers du téléphone et les titres hors bibliothèque n'y vont pas.
- Octave dit au serveur ce qu'il joue (rapports de lecture OpenSubsonic) : Navidrome affiche le titre en cours, et Octo compte l'écoute dès le tiers du titre. Les rapports ne comptent jamais une écoute de plus : Octo n'en garde qu'une.
- Pour les comptes qu'Octo autorise, le menu d'un titre propose « Chercher une meilleure qualité » et « Retirer de ma bibliothèque » (après confirmation ; le fichier est mis de côté 30 jours).
- Les titres trouvés par Octo hors de la bibliothèque (recherche, mix) ont un petit globe devant le nom de l'artiste, dans les listes et la file. Octo ne marque plus leur pochette pour Octave.
- La playlist « Titres likés » d'Octo n'apparaît plus : elle n'est mise à jour que toutes les 10 minutes, alors que « Titres aimés » d'Octave l'est tout de suite.

### Lecture

- Un titre ne se rejoue plus en double : la fin d'un titre ne lance le suivant qu'une fois, et le cache de lecture de Musly, qui pouvait relancer un titre déjà fini, est retiré.
- Les titres s'enchaînent toujours sans blanc ; le réglage disparaît.
- Appuyer sur Lecture après la fin d'un titre passe au suivant au lieu de rejouer le même.
- Le bouton « File d'attente » du lecteur plein écran ouvrait les paroles : leur défilement automatique faisait aussi défiler les pages du lecteur et y ramenait à chaque nouvelle ligne. Seule la liste des paroles défile désormais.
- Une lecture reprise à une position (file restaurée, retour d'une enceinte) démarre bien à cette position, et le serveur sait tout de suite ce qui est en cours : le lecteur attendait la pause suivante pour le faire.
- Quand le serveur convertit le son (qualité réduite), Octave lui demande la taille du fichier : la durée et l'avance dans le titre restent justes.
- Le cœur d'un titre aimé reste plein partout : après un redémarrage, depuis la page d'un album, et quand le titre a été aimé sur un autre appareil. Aimer un titre met à jour en même temps le lecteur, la file, la bibliothèque et les titres aimés.
- Avec le minuteur « Fin du titre », la lecture s'arrête au début du titre suivant et le lecteur montre ce titre : il gardait l'ancien titre affiché pendant que le son était déjà sur le suivant.
- Après la fermeture de l'app, la file reprend là où elle s'était arrêtée au lieu de repartir de 0:00. Une pause depuis la notification ou le casque est aussi enregistrée.
- Une radio qui ne se lance pas ne vide plus la file : le titre en cours revient, en pause, et un message le dit. La liste des radios n'affiche plus l'adresse technique des flux. Les radios n'apparaissent (recherche, bibliothèque, Android Auto) que si le serveur en propose.

### Playlists

- Le bouton « + » du lecteur ouvre directement le choix de la playlist. Son ancien menu proposait « Ajouter à la bibliothèque », qui n'ajoutait rien.
- Le choix de la playlist ne montre que les playlists du compte, avec leur pochette : plus les mix d'Octo ni les listes automatiques, où l'on ne peut rien ajouter.
- Ajouter un titre déjà présent pose de nouveau la question « L'ajouter quand même ? » : la fenêtre se fermait avant, et rien ne se passait.
- Une playlist vide affiche « aucun titre » (et non « 1 titre ») avec l'icône des playlists, au lieu du logo du serveur.

### Mises à jour

- Sur Android, la mise à jour télécharge l'APK fait pour le processeur du téléphone (arm64-v8a pour presque tous).
- Chaque mise à jour téléchargée est vérifiée avec son empreinte SHA-256 : un fichier abîmé n'est jamais installé.
- Les versions Android sont signées avec la clé d'Octave : une mise à jour ne s'installe que si elle vient d'Octave.

### Fichiers du téléphone

- Les albums et les artistes ont leur pochette, et le lecteur plein écran affiche celle du titre au lieu du logo.

### Sans interruptions

- Plus aucune demande de don, de note ni de partage : l'onglet « Soutenir », la fenêtre qui s'ouvrait après 8 minutes d'écoute et la tuile « Noter l'app » sont retirés.
- Plus de pause au 50ᵉ titre écouté : la fenêtre de célébration arrêtait la musique.
- Plus de lien vers le Discord de Musly ni de publicité pour Spotverlay.
- Plus de téléchargement de traductions au démarrage : les traductions arrivent avec chaque version.
- Plus de fenêtre de confidentialité au premier lancement : la politique de confidentialité est dans À propos.

### Développement

- Compilation avec Flutter 3.47.7, la version utilisée par Musly.
- GitHub Actions compile chaque version marquée `v*` : les APK Android signés (un par processeur), l'installateur Windows, l'archive Linux avec son script d'installation et les empreintes SHA-256. La version est préparée en brouillon, à relire avant de la publier.
- Chaque pull request est vérifiée (analyse et tests).
- Les programmes Windows et Linux s'appellent `octave`.
- Fichiers de Musly retirés : site web, fiches des magasins d'applications, version macOS, synchronisation Crowdin, scripts Docker et anciens workflows.
