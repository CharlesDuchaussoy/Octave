<div align="center">

# Octave

**Ton serveur de musique, dans ta poche.**

Le lecteur de musique de notre serveur privé, pour la famille et les amis.<br>
Une version modifiée de [Musly](https://github.com/dddevid/Musly), pensée pour Navidrome et Octo.

[![Licence CC BY-NC-SA 4.0](https://img.shields.io/badge/licence-CC%20BY--NC--SA%204.0-lightgrey?style=for-the-badge)](LICENSE)
[![Basé sur Musly](https://img.shields.io/badge/bas%C3%A9%20sur-Musly-fa243c?style=for-the-badge)](https://github.com/dddevid/Musly)
[![Flutter 3.41.7](https://img.shields.io/badge/Flutter-3.41.7-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://docs.flutter.dev/release/archive)

![Android](https://img.shields.io/badge/Android-3DDC84?style=flat-square&logo=android&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D4?style=flat-square&logo=windows11&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat-square&logo=linux&logoColor=black)

</div>

---

> [!NOTE]
> **Octave est en préparation.** Aucune version n'est encore publiée. La première, la 1.0.0, reprendra Musly tel quel, avec son propre nom et sa propre icône.

## Sommaire

- [Pourquoi Octave](#pourquoi-octave)
- [Avancement](#avancement)
- [Fonctionnalités](#fonctionnalités)
- [Plateformes](#plateformes)
- [Installation](#installation)
- [Compiler Octave](#compiler-octave)
- [Suivre Musly](#suivre-musly)
- [Licence et crédits](#licence-et-crédits)

## Pourquoi Octave

Musly est un excellent client Subsonic, libre et gratuit. Octave part de Musly pour l'ajuster à un usage précis : un serveur personnel (Navidrome + Octo) partagé entre quelques proches, avec une app en français, simple à installer et qui se met à jour seule.

Octave suit Musly de près et récupère régulièrement ses nouveautés et ses corrections.

## Avancement

| | Étape |
|:-:|---|
| ✅ | Base : Musly `master` du 27 septembre 2026 (`44ff278`), qui corrige notamment les titres lus deux fois sur Android ([Musly #244](https://github.com/dddevid/Musly/issues/244)) |
| ⏳ | Nom, icône et identifiant Android propres, pour s'installer à côté de Musly |
| ⏳ | Traduction française complète (926 textes sur 926) |
| ⏳ | Compilation automatique des versions Android par GitHub Actions |
| ⏳ | Mises à jour proposées et installées depuis l'app |
| ⏳ | Versions Windows et Linux publiées |

Le détail de chaque version est dans [CHANGELOG-octave.md](CHANGELOG-octave.md), dès la première.

## Fonctionnalités

Héritées de Musly :

- 🎵 **Serveurs Navidrome, Subsonic, Jellyfin, Emby et Airsonic**
- 💾 **Écoute hors ligne** de titres, albums et playlists
- 🎧 **Paroles synchronisées**, avec un appui pour aller au bon moment
- 🔀 **File d'attente qui se remplit seule** à partir de tes titres et artistes préférés
- 📊 **Statistiques d'écoute** et bilan de l'année
- 📡 **Diffusion** vers Google Cast, UPnP et DLNA
- 🚗 **Android Auto**
- 📻 **Radios en ligne** et fichiers audio du téléphone
- 🌙 **Thème clair ou sombre**, couleurs Material You
- 📱 **Interface adaptée** aux téléphones, tablettes et ordinateurs

## Plateformes

| Plateforme | État |
|---|---|
| **Android** | Priorité : c'est la version distribuée en premier |
| **Windows** | Prévue |
| **Linux** | Prévue |
| iOS, macOS | Non distribuées : il faudrait un compte développeur Apple payant |

Sur iPhone, l'app conseillée pour notre serveur reste **Arpeggi**, gratuite sur l'App Store.

## Installation

Les versions seront publiées dans la page [**Releases**](https://github.com/CharlesDuchaussoy/Octave/releases).

1. Télécharge le fichier `app-arm64-v8a-release.apk` de la dernière version (il convient à presque tous les téléphones récents).
2. Ouvre-le et autorise l'installation quand Android le demande.
3. Lance Octave et connecte-toi avec l'adresse et le compte que tu as reçus.

Octave s'installe à côté de Musly sans le remplacer.

## Compiler Octave

### Prérequis

- [Flutter](https://docs.flutter.dev/release/archive) **3.41.7** (stable)
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

Octave n'est ni affilié à Musly ni approuvé par ses auteurs. Les noms Navidrome, Subsonic, Jellyfin, Emby, Android, Windows et Linux appartiennent à leurs détenteurs respectifs.

<div align="center">
<br>
<sub>Fait avec soin pour écouter ensemble, en famille et entre amis.</sub>
</div>
