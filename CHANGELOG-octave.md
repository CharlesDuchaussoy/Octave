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

### Sans interruptions

- Plus aucune demande de don, de note ni de partage : l'onglet « Soutenir », la fenêtre qui s'ouvrait après 8 minutes d'écoute et la tuile « Noter l'app » sont retirés.
- Plus de pause au 50ᵉ titre écouté : la fenêtre de célébration arrêtait la musique.
- Plus de lien vers le Discord de Musly ni de publicité pour Spotverlay.
- Plus de téléchargement de traductions au démarrage : les traductions arrivent avec chaque version.

### Développement

- Compilation avec Flutter 3.47.7, la version utilisée par Musly.
