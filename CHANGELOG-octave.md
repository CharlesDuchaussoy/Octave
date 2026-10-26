# Journal des versions d'Octave

Ce fichier liste les modifications d'Octave par rapport à [Musly](https://github.com/dddevid/Musly). Le journal de Musly lui-même est dans [CHANGELOG.md](CHANGELOG.md).

## 1.0.0 — en préparation

Basée sur Musly 2.0.3 (`master` au commit `b199276`, 18 octobre 2026).

### Identité

- Nom **Octave** dans toute l'interface et dans toutes les langues, à la place de Musly.
- Nouvelle icône et nouveau logo : une croche dessinée comme un 8, blanche sur bleu nuit.
- Identifiant Android `io.github.charlesduchaussoy.octave` : Octave s'installe à côté de Musly sans le remplacer.
- Numérotation propre, qui commence à 1.0.0.
- Octave se présente sous le nom « Octave » aux serveurs Jellyfin. Pour Navidrome, il garde le nom « Musly » : Octo y attache ses réglages (paroles minutées, albums de la bibliothèque seule) jusqu'à ce qu'il reconnaisse Octave.

### Liens et services

- Les mises à jour depuis l'app viennent des versions publiées d'Octave, jamais de celles de Musly.
- Les liens « GitHub », « Nouveautés », « Signaler un problème », traductions et politique de confidentialité mènent à Octave. Le crédit à dddevid, auteur de Musly, reste dans l'écran « À propos ».
- Politique de confidentialité adaptée à Octave.

### Français

- L'app est entièrement en français : les 1 035 textes, relus et tutoyés partout (la traduction communautaire de Musly mélangeait « vous » et « tu » et n'en couvrait que la moitié).
- Environ 150 textes écrits en dur dans les écrans (en anglais, et même en italien dans l'import de playlists et la fenêtre de mise à jour) passent par les traductions.

### Première installation

- Un écran d'accueil sobre avant la connexion, à la place des trois pages de présentation de Musly.
- Une configuration guidée après la connexion, une question par écran, avec un choix conseillé déjà sélectionné : couleur et mode d'affichage (avec un aperçu en direct), forme des pochettes, artistes favoris, rubriques de l'accueil, qualité du son en Wi-Fi et en données mobiles, téléchargement automatique des titres aimés, autorisations (notifications et batterie), puis un résumé.
- Chaque étape peut être passée, et l'app reprend à la même étape si elle est fermée en cours de route.
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

### Pochettes de playlist

- Un éditeur de pochettes, comme « Créer une pochette » de Spotify : menu d'une playlist, puis « Modifier la pochette ».
- 8 modèles : Dégradé, Minimal, Typo géante, Bandeau, Photo, Vinyle, Formes et Mosaïque.
- Titre et sous-titre, 5 polices intégrées (Inter, Bebas Neue, DM Serif Display, Space Mono, Pacifico), majuscules, deux couleurs (dont celles tirées des pochettes de la playlist) et une photo du téléphone.
- Contrairement à Spotify, la pochette se rouvre et se retouche. « Revenir à la pochette automatique » rend la mosaïque.
- Pour l'instant, la pochette n'apparaît que dans Octave, sur l'appareil où elle a été faite. La partager avec les autres apps du serveur demande une commande dans Octo.

### Fichiers du téléphone

- Les albums et les artistes ont leur pochette, et le lecteur plein écran affiche celle du titre au lieu du logo.

### Sans interruptions

- Plus aucune demande de don, de note ni de partage : l'onglet « Soutenir », la fenêtre qui s'ouvrait après 8 minutes d'écoute et la tuile « Noter l'app » sont retirés.
- Plus de pause au 50ᵉ titre écouté : la fenêtre de célébration arrêtait la musique.
- Plus de lien vers le Discord de Musly ni de publicité pour Spotverlay.
- Plus de téléchargement de traductions au démarrage : les traductions arrivent avec chaque version.

### Développement

- Compilation avec Flutter 3.47.7, la version utilisée par Musly.
