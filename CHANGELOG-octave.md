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

### Sans interruptions

- Plus aucune demande de don, de note ni de partage : l'onglet « Soutenir », la fenêtre qui s'ouvrait après 8 minutes d'écoute et la tuile « Noter l'app » sont retirés.
- Plus de pause au 50ᵉ titre écouté : la fenêtre de célébration arrêtait la musique.
- Plus de lien vers le Discord de Musly ni de publicité pour Spotverlay.
- Plus de téléchargement de traductions au démarrage : les traductions arrivent avec chaque version.

### Développement

- Compilation avec Flutter 3.47.7, la version utilisée par Musly.
