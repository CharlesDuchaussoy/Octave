<div align="center">

# Octave

**Ton serveur de musique, dans ta poche.**

Le lecteur de musique de notre serveur privé, pour la famille et les amis.<br>
Une version modifiée de [Musly](https://github.com/dddevid/Musly), pensée pour Navidrome et Octo.

[![Licence CC BY-NC-SA 4.0](https://img.shields.io/badge/licence-CC%20BY--NC--SA%204.0-lightgrey?style=for-the-badge)](LICENSE)
[![Basé sur Musly](https://img.shields.io/badge/bas%C3%A9%20sur-Musly-fa243c?style=for-the-badge)](https://github.com/dddevid/Musly)
[![Flutter 3.47.7](https://img.shields.io/badge/Flutter-3.47.7-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://docs.flutter.dev/release/archive)

![Android](https://img.shields.io/badge/Android-3DDC84?style=flat-square&logo=android&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D4?style=flat-square&logo=windows11&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat-square&logo=linux&logoColor=black)

</div>

---

> [!NOTE]
> **Octave est en préparation.** Aucune version n'est encore publiée : la première sera la 1.0.0.

## Sommaire

- [Pourquoi Octave](#pourquoi-octave)
- [Avancement](#avancement)
- [Fonctionnalités](#fonctionnalités)
- [Plateformes](#plateformes)
- [Le serveur](#le-serveur)
- [Installation](#installation)
- [Compiler Octave](#compiler-octave)
- [Suivre Musly](#suivre-musly)
- [Licence et crédits](#licence-et-crédits)

## Pourquoi Octave

Musly est un excellent client Subsonic, libre et gratuit. Octave part de Musly pour l'ajuster à un usage précis : un serveur personnel (Navidrome + Octo) partagé entre quelques proches, avec une app en français, simple à installer et qui se met à jour seule.

Depuis la reprise de Musly 2.0.3, Octave avance de son côté : il reprend à la main les corrections de Musly qui le concernent, et le reste de son code peut changer librement.

## Avancement

| | Étape |
|:-:|---|
| ✅ | Base : Musly 2.0.3, `master` du 18 octobre 2026 (`b199276`), qui apporte notamment la mise à jour depuis l'app et l'import de playlists |
| ✅ | Nom, icône et identifiant Android propres (`io.github.charlesduchaussoy.octave`) : Octave s'installe à côté de Musly |
| ⏳ | Traduction française complète (926 textes sur 926) |
| ⏳ | Compilation automatique des versions Android, Windows et Linux par GitHub Actions (prête, à essayer avec la première version) |
| ⏳ | Mises à jour proposées et installées depuis l'app (déjà branchées sur les versions d'Octave, à tester avec la première) |
| ⏳ | Versions Windows et Linux publiées |

Le détail de chaque version est dans [CHANGELOG-octave.md](CHANGELOG-octave.md), dès la première.

## Fonctionnalités

Héritées de Musly :

- 🎵 **Ton serveur Navidrome**, ou tout serveur compatible Subsonic
- 💾 **Écoute hors ligne** de titres, albums et playlists
- 🎧 **Paroles synchronisées**, avec un appui pour aller au bon moment
- 🔀 **File d'attente qui se remplit seule** à partir de tes titres et artistes préférés
- 📊 **Statistiques d'écoute** et bilan de l'année
- 📡 **Diffusion** vers Google Cast, UPnP et DLNA
- 🚗 **Android Auto**
- 📁 **Fichiers audio du téléphone**, sans serveur
- 🌙 **Bleu nuit d'Octave**, en clair, en sombre ou en noir pur, avec d'autres couleurs au choix et Material You
- 📱 **Interface adaptée** aux téléphones, tablettes et ordinateurs

Propres à Octave :

- 🇫🇷 **Entièrement en français**, avec une configuration guidée au premier lancement
- 🎨 **13 couleurs**, en clair ou en sombre, calculées avec des contrastes vérifiés
- 🖼️ **Pochettes de playlist** à créer soi-même, partagées par le serveur avec Octo
- 🔊 **Enceintes Google Home** : un format qu'elles savent lire, toujours
- 🔄 **Mises à jour** depuis l'app, signées et vérifiées

## Plateformes

| Plateforme | État |
|---|---|
| **Android** | Priorité : c'est la version distribuée en premier |
| **Windows** | Installateur compilé à chaque version, pas encore essayé |
| **Linux** | Archive compilée à chaque version, avec un script d'installation |
| iOS, macOS | Non distribuées : il faudrait un compte développeur Apple payant |

Sur iPhone, l'app conseillée pour notre serveur reste **Arpeggi**, gratuite sur l'App Store.

## Le serveur

Octave est fait pour **notre** serveur, mais il marche avec n'importe quel Navidrome. Voici ce qu'il faut, et ce que chaque pièce apporte.

### Ce qu'il faut

| Pièce | Rôle | Obligatoire ? |
|---|---|---|
| Une machine 64 bits avec Docker | Un Raspberry Pi 4 ou 5 suffit. Navidrome et Octo sont légers ; ce sont la conversion du son et les téléchargements qui demandent du processeur | Oui |
| [Navidrome](https://www.navidrome.org) **0.64** ou plus récent | Range la musique et la sert aux apps (API Subsonic et ses extensions OpenSubsonic) | Oui |
| [Octo](https://github.com/winters27/octo) | Se place devant Navidrome et ajoute mix, statistiques, paroles minutées et catalogue (voir plus bas) | Non, mais conseillé |
| Un reverse proxy en HTTPS (nginx, Caddy…) | Donne une adresse sûre aux téléphones, chez soi comme dehors | Oui, dès que l'app sort de la maison |

### Comment les pièces s'enchaînent

```
Octave, Arpeggi…  ──HTTPS /rest/──▶  reverse proxy  ──▶  Octo  ──▶  Navidrome
                                                         │
                       ce qu'Octo ne connaît pas ────────┘ est transmis tel quel
```

- Les apps parlent Subsonic à l'adresse publique, sur le chemin `/rest/` **seulement**.
- Octo répond aux commandes qu'il connaît et transmet tout le reste à Navidrome, qui n'est pas exposé lui-même.
- Les pages d'administration (Navidrome, tableau de bord d'Octo) restent sur le réseau de la maison ou un réseau privé type Tailscale. **Ne publie jamais le tableau de bord d'Octo** : il n'a pas de mot de passe.

### Ce qu'Octo apporte

| Fonction | Sans Octo (Navidrome seul) | Avec Octo |
|---|---|---|
| Bibliothèque, playlists, favoris, hors ligne | Oui | Oui |
| Une bibliothèque par compte | Dossiers partagés | Chacun ne voit que sa musique, et ses goûts ne changent pas les mix des autres |
| Mix et playlists automatiques | Calculés sur le téléphone | Calculés par le serveur pour chaque compte (cœurs, playlists, écoutes, titres passés), visibles aussi dans Arpeggi |
| Paroles | Celles des fichiers | Paroles minutées (LRCLIB) |
| Statistiques d'écoute | Sur le téléphone | Par compte, sur 7, 30 et 365 jours |
| Catalogue | La bibliothèque | La recherche montre aussi des titres absents de la bibliothèque (Deezer, Last.fm) ; leur ajout passe par des sources d'acquisition optionnelles, choisies par le propriétaire du serveur |
| Pochettes de playlist faites dans Octave | Gardées sur le téléphone | Envoyées au serveur et visibles partout (commandes `octo.setPlaylistImage`, ajoutées dans notre version d'Octo, non publiée) |

Octave se présente au serveur sous le nom « Octave », qu'Octo reconnaît. Sans Octo, les écrans qui en dépendent se replient sur ce que fait Navidrome.

### Réglages de Navidrome conseillés

- **Conversion du son** (Réglages, Lecteurs) : Navidrome crée un « lecteur » par compte et par app à la première connexion. Laisse le lecteur « Octave » **sans conversion** : Octave choisit lui-même la qualité (Wi-Fi ou données mobiles) et demande une version allégée quand il le faut. Pour plafonner les données mobiles de tout le monde, mets plutôt un débit maximal sur ce lecteur.
- **Albums** : `ND_PID_ALBUM="albumartistid,album,albumversion"`, pour qu'un album aux étiquettes incomplètes ne soit pas coupé en deux.
- **Fichiers supprimés** : `ND_SCANNER_PURGEMISSING="always"`, pour qu'ils disparaissent des apps au lieu d'échouer à la lecture.
- **Last.fm** : une clé d'API (`ND_LASTFM_APIKEY`, `ND_LASTFM_SECRET`) pour les radios d'artistes et les biographies.

### Comptes

Chaque personne a son propre compte, créé sur invitation du propriétaire du serveur. Un compte ordinaire suffit : jamais de compte administrateur dans une app.

### Enceintes Google Home et Chromecast

- Le téléphone et l'enceinte doivent être sur le **même Wi-Fi** : c'est ainsi que l'enceinte est trouvée.
- C'est **l'enceinte qui télécharge la musique** auprès du serveur, pas le téléphone : l'adresse du serveur doit donc être joignable depuis l'enceinte. Une adresse publique en HTTPS marche partout ; une adresse de réseau privé (Tailscale) ne marche pas, l'enceinte n'y a pas accès.
- Octave envoie le fichier d'origine quand l'enceinte sait le lire (MP3, FLAC, Opus, AAC, WAV), sinon il demande au serveur du MP3 à 320 kb/s.

### Sur iPhone

Octave n'est pas distribué sur iPhone (il faudrait un compte développeur Apple payant). L'app conseillée est **Arpeggi**, gratuite sur l'App Store : elle parle Subsonic et profite aussi d'Octo.

## Installation

Les versions seront publiées dans la page [**Releases**](https://github.com/CharlesDuchaussoy/Octave/releases).

### Android

1. Télécharge le fichier `octave-<version>-android-arm64-v8a.apk` de la dernière version (il convient à presque tous les téléphones).
2. Ouvre-le et autorise l'installation quand Android le demande.
3. Lance Octave et connecte-toi avec l'adresse et le compte que tu as reçus.

Octave s'installe à côté de Musly sans le remplacer, puis se met à jour tout seul.

### Windows

Télécharge `octave-<version>-windows-setup.exe` et lance-le.

### Linux

Télécharge `octave-<version>-linux-x64.tar.gz`, décompresse-le, puis lance `./install.sh` dans le dossier. Octave s'installe dans `~/.local/share/octave` et apparaît dans le menu des applications. Il faut `mpv` (paquet `mpv-libs` sur Fedora). `./install.sh --uninstall` le retire.

## Compiler Octave

### Prérequis

- [Flutter](https://docs.flutter.dev/release/archive) **3.47.7** (stable)
- [Android Studio](https://developer.android.com/studio) pour le SDK Android
- Pour Windows : Visual Studio 2022 avec « Développement Desktop en C++ »
- Pour Linux : `clang cmake ninja pkg-config gtk3 libmpv` et leurs dépendances

### Commandes

```sh
git clone https://github.com/CharlesDuchaussoy/Octave.git
cd Octave
flutter pub get
flutter run                                      # sur un téléphone branché
flutter build apk --release --split-per-abi      # versions Android signées
```

Une version signée a besoin d'un fichier `android/key.properties` qui pointe vers la clé de signature. Ce fichier et la clé ne sont **jamais** dans le dépôt.

### Publier une version

1. Change le numéro dans `pubspec.yaml` (`version: 1.0.1+2` : le nombre après `+` augmente à chaque version) et dans `UpdateService.currentVersion` (`lib/services/update_service.dart`). Les deux doivent être égaux, sinon la compilation s'arrête.
2. Complète [CHANGELOG-octave.md](CHANGELOG-octave.md), puis fusionne sur `master`.
3. Crée l'étiquette et envoie-la : `git tag v1.0.1 && git push origin v1.0.1`.
4. GitHub Actions compile tout et prépare un brouillon dans [Releases](https://github.com/CharlesDuchaussoy/Octave/releases). Relis-le, essaie l'APK, puis publie-le : les apps installées proposent alors la mise à jour.

La clé de signature Android est rangée dans les secrets du dépôt (`ANDROID_KEYSTORE_BASE64`, `ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEY_ALIAS`, `ANDROID_KEY_PASSWORD`). Sans elle, une étiquette ne produit pas de version.

## Suivre Musly

Le dépôt d'origine est déclaré comme `upstream` :

```sh
git remote add upstream https://github.com/dddevid/Musly.git
git fetch upstream
git merge upstream/master
```

Les corrections de Musly arrivent ainsi dans Octave en gardant nos changements.

## Licence et crédits

Octave est une **œuvre dérivée de [Musly](https://github.com/dddevid/Musly)**, créé par [dddevid](https://github.com/dddevid) avec ses contributeurs. Tout le mérite de l'application d'origine leur revient.

Octave est distribué sous la même licence que Musly : **[Creative Commons Attribution - Pas d'utilisation commerciale - Partage dans les mêmes conditions 4.0 International (CC BY-NC-SA 4.0)](LICENSE)**.

- ✅ Tu peux utiliser, modifier et partager Octave, en citant Musly et Octave.
- ✅ Toute version modifiée doit rester sous cette même licence.
- ❌ **Aucun usage commercial** : pas de vente, pas de publicité, pas de publication sur le Google Play Store ni sur un autre magasin d'applications.

Les mentions d'attribution et la liste des modifications sont dans [NOTICE.md](NOTICE.md).

Octave n'est ni affilié à Musly ni approuvé par ses auteurs. Les noms Navidrome, Subsonic, Android, Windows et Linux appartiennent à leurs détenteurs respectifs.

<div align="center">
<br>
<sub>Fait avec soin pour écouter ensemble, en famille et entre amis.</sub>
</div>
