// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Octave';

  @override
  String get emulatorDetected => 'Émulateur détecté';

  @override
  String get emulatorNotAllowed =>
      'Cette app ne fonctionne pas sur un émulateur.\nUtilise un vrai téléphone.';

  @override
  String get goodMorning => 'Bonjour';

  @override
  String get goodAfternoon => 'Bon après-midi';

  @override
  String get goodEvening => 'Bonsoir';

  @override
  String get forYou => 'Pour toi';

  @override
  String get quickPicks => 'Sélection rapide';

  @override
  String get discoverMix => 'Mix découverte';

  @override
  String get recentlyPlayed => 'Écouté récemment';

  @override
  String get yourPlaylists => 'Tes playlists';

  @override
  String get favoritePlaylists => 'Playlists favorites';

  @override
  String get sectionAlbums => 'Albums';

  @override
  String get sectionEPs => 'EP';

  @override
  String get sectionSingles => 'Singles';

  @override
  String get madeForYou => 'Pour toi';

  @override
  String get topRated => 'Les mieux notés';

  @override
  String get noContentAvailable => 'Rien à afficher pour l\'instant';

  @override
  String get tryRefreshing => 'Actualise ou vérifie la connexion au serveur';

  @override
  String get refresh => 'Actualiser';

  @override
  String get errorLoadingSongs => 'Impossible de charger les titres';

  @override
  String get noSongsInGenre => 'Aucun titre dans ce genre';

  @override
  String get errorLoadingAlbums => 'Impossible de charger les albums';

  @override
  String get noTopRatedAlbums => 'Aucun album noté pour l\'instant';

  @override
  String get login => 'Connexion';

  @override
  String get serverUrl => 'Adresse du serveur';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get password => 'Mot de passe';

  @override
  String get selectCertificate => 'Choisir un certificat TLS/SSL';

  @override
  String failedToSelectCertificate(String error) {
    return 'Impossible de choisir le certificat : $error';
  }

  @override
  String get serverUrlMustStartWith =>
      'L\'adresse du serveur doit commencer par http:// ou https://';

  @override
  String get failedToConnect => 'Connexion impossible';

  @override
  String get library => 'Bibliothèque';

  @override
  String get search => 'Rechercher';

  @override
  String get settings => 'Réglages';

  @override
  String get albums => 'Albums';

  @override
  String get artists => 'Artistes';

  @override
  String get songs => 'Titres';

  @override
  String get playlists => 'Playlists';

  @override
  String get genres => 'Genres';

  @override
  String get years => 'Années';

  @override
  String get favorites => 'Favoris';

  @override
  String get nowPlaying => 'À l\'écoute';

  @override
  String get queue => 'File d\'attente';

  @override
  String get lyrics => 'Paroles';

  @override
  String get play => 'Lecture';

  @override
  String get pause => 'Pause';

  @override
  String get next => 'Suivant';

  @override
  String get previous => 'Précédent';

  @override
  String get shuffle => 'Aléatoire';

  @override
  String get repeat => 'Répéter';

  @override
  String get repeatOne => 'Répéter le titre';

  @override
  String get repeatOff => 'Ne pas répéter';

  @override
  String get addToPlaylist => 'Ajouter à une playlist';

  @override
  String get removeFromPlaylist => 'Retirer de la playlist';

  @override
  String get addToFavorites => 'Ajouter aux favoris';

  @override
  String get removeFromFavorites => 'Retirer des favoris';

  @override
  String get download => 'Télécharger';

  @override
  String get delete => 'Supprimer';

  @override
  String get cancel => 'Annuler';

  @override
  String get ok => 'OK';

  @override
  String get save => 'Enregistrer';

  @override
  String get close => 'Fermer';

  @override
  String get general => 'Général';

  @override
  String get appearance => 'Apparence';

  @override
  String get playback => 'Lecture';

  @override
  String get storage => 'Stockage';

  @override
  String get about => 'À propos';

  @override
  String get darkMode => 'Mode sombre';

  @override
  String get language => 'Langue';

  @override
  String get version => 'Version';

  @override
  String get madeBy => 'Créé par dddevid';

  @override
  String get githubRepository => 'Dépôt GitHub';

  @override
  String get reportIssue => 'Signaler un problème';

  @override
  String get joinDiscord => 'Rejoindre la communauté Discord';

  @override
  String get unknownArtist => 'Artiste inconnu';

  @override
  String get unknownAlbum => 'Album inconnu';

  @override
  String get playAll => 'Tout lire';

  @override
  String get shuffleAll => 'Tout en aléatoire';

  @override
  String get sortBy => 'Trier par';

  @override
  String get sortByName => 'Nom';

  @override
  String get sortByArtist => 'Artiste';

  @override
  String get sortByAlbum => 'Album';

  @override
  String get sortByDate => 'Date';

  @override
  String get sortByDuration => 'Durée';

  @override
  String get ascending => 'Croissant';

  @override
  String get descending => 'Décroissant';

  @override
  String get noLyricsAvailable => 'Pas de paroles pour ce titre';

  @override
  String get loading => 'Chargement…';

  @override
  String get error => 'Erreur';

  @override
  String get retry => 'Réessayer';

  @override
  String get noResults => 'Aucun résultat';

  @override
  String get searchHint => 'Titres, albums, artistes…';

  @override
  String get allSongs => 'Tous les titres';

  @override
  String get allAlbums => 'Tous les albums';

  @override
  String get allArtists => 'Tous les artistes';

  @override
  String trackNumber(int number) {
    return 'Piste $number';
  }

  @override
  String songsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titres',
      one: '1 titre',
      zero: 'Aucun titre',
    );
    return '$_temp0';
  }

  @override
  String albumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count albums',
      one: '1 album',
      zero: 'Aucun album',
    );
    return '$_temp0';
  }

  @override
  String get logout => 'Se déconnecter';

  @override
  String get confirmLogout => 'Te déconnecter ?';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get offlineMode => 'Mode hors connexion';

  @override
  String get radio => 'Radio';

  @override
  String get changelog => 'Nouveautés';

  @override
  String get platform => 'Plateforme';

  @override
  String get server => 'Serveur';

  @override
  String get display => 'Affichage';

  @override
  String get playerInterface => 'Lecteur';

  @override
  String get smartRecommendations => 'Recommandations';

  @override
  String get showVolumeSlider => 'Curseur de volume';

  @override
  String get showVolumeSliderSubtitle =>
      'Affiche le réglage du volume dans le lecteur';

  @override
  String get showStarRatings => 'Notes en étoiles';

  @override
  String get showStarRatingsSubtitle =>
      'Note les titres et affiche leurs notes';

  @override
  String get showMiniPlayerHeart => 'Bouton cœur';

  @override
  String get showMiniPlayerHeartSubtitle =>
      'Ajoute aux favoris depuis le mini-lecteur';

  @override
  String get showMiniPlayerRepeat => 'Bouton répéter';

  @override
  String get showMiniPlayerRepeatSubtitle =>
      'Change la répétition depuis le mini-lecteur';

  @override
  String get showMiniPlayerShuffle => 'Bouton aléatoire';

  @override
  String get showMiniPlayerShuffleSubtitle =>
      'Active l\'aléatoire depuis le mini-lecteur';

  @override
  String get enableRecommendations => 'Activer les recommandations';

  @override
  String get enableRecommendationsSubtitle =>
      'Des suggestions selon ce que tu écoutes';

  @override
  String get listeningData => 'Données d\'écoute';

  @override
  String totalPlays(int count) {
    return '$count écoutes au total';
  }

  @override
  String get clearListeningHistory => 'Effacer l\'historique d\'écoute';

  @override
  String get confirmClearHistory =>
      'Toutes tes données d\'écoute et tes recommandations seront effacées. Continuer ?';

  @override
  String get historyCleared => 'Historique d\'écoute effacé';

  @override
  String get discordStatus => 'Statut Discord';

  @override
  String get discordStatusSubtitle =>
      'Affiche le titre en cours sur ton profil Discord';

  @override
  String get selectLanguage => 'Choisir la langue';

  @override
  String get systemDefault => 'Langue du téléphone';

  @override
  String get communityTranslations => 'Traductions';

  @override
  String get communityTranslationsSubtitle =>
      'Aide à traduire Octave sur GitHub';

  @override
  String get yourLibrary => 'Bibliothèque';

  @override
  String get filterAll => 'Tout';

  @override
  String get faves => 'Favoris';

  @override
  String get filterPlaylists => 'Playlists';

  @override
  String get filterAlbums => 'Albums';

  @override
  String get filterArtists => 'Artistes';

  @override
  String get likedSongs => 'Titres aimés';

  @override
  String get likedAlbums => 'Albums aimés';

  @override
  String get noLikedAlbums => 'Aucun album aimé pour l\'instant';

  @override
  String get localMusicLibrary => 'Musique du téléphone';

  @override
  String get mergeLocalLibrary => 'Fusionner avec le serveur';

  @override
  String get mergeLocalLibrarySubtitle =>
      'Affiche la musique du téléphone avec celle du serveur';

  @override
  String get localMusicStats => 'Fichiers du téléphone';

  @override
  String get addMusicFolder => 'Ajouter un dossier';

  @override
  String get rescanLocalMusic => 'Analyser à nouveau';

  @override
  String get localLibraryEmpty => 'Ta bibliothèque est vide';

  @override
  String get localLibraryEmptySubtitle =>
      'Aucun fichier audio trouvé. Touche le bouton ci-dessous pour relancer l\'analyse.';

  @override
  String get libraryEmpty => 'Ta bibliothèque est vide';

  @override
  String get libraryEmptySubtitle => 'Ajoute des titres pour commencer.';

  @override
  String get scanForMusic => 'Chercher de la musique';

  @override
  String get radioStations => 'Radios';

  @override
  String get playlist => 'Playlist';

  @override
  String get internetRadio => 'Radio en ligne';

  @override
  String get newPlaylist => 'Nouvelle playlist';

  @override
  String get playlistName => 'Nom de la playlist';

  @override
  String get create => 'Créer';

  @override
  String get deletePlaylist => 'Supprimer la playlist';

  @override
  String deletePlaylistConfirmation(String name) {
    return 'Supprimer la playlist « $name » ?';
  }

  @override
  String playlistDeleted(String name) {
    return 'Playlist « $name » supprimée';
  }

  @override
  String errorCreatingPlaylist(Object error) {
    return 'Impossible de créer la playlist : $error';
  }

  @override
  String errorDeletingPlaylist(Object error) {
    return 'Impossible de supprimer la playlist : $error';
  }

  @override
  String playlistCreated(String name) {
    return 'Playlist « $name » créée';
  }

  @override
  String get searchTitle => 'Rechercher';

  @override
  String get searchPlaceholder => 'Artistes, titres, albums';

  @override
  String get tryDifferentSearch => 'Essaie une autre recherche';

  @override
  String get noSuggestions => 'Aucune suggestion';

  @override
  String get browseCategories => 'Parcourir';

  @override
  String get liveSearchSection => 'Recherche';

  @override
  String get liveSearch => 'Résultats pendant la saisie';

  @override
  String get liveSearchSubtitle =>
      'Met à jour les résultats à chaque lettre tapée';

  @override
  String get homeSection => 'Accueil';

  @override
  String get showFavoritePlaylistsOnHome =>
      'Playlists favorites sur l\'accueil';

  @override
  String get showFavoritePlaylistsOnHomeSubtitle =>
      'Chaque playlist favorite a sa propre rangée en haut de l\'accueil';

  @override
  String get categoryMadeForYou => 'Pour toi';

  @override
  String get categoryNewReleases => 'Nouveautés';

  @override
  String get categoryTopRated => 'Les mieux notés';

  @override
  String get categoryGenres => 'Genres';

  @override
  String get categoryFavorites => 'Favoris';

  @override
  String get categoryRadio => 'Radio';

  @override
  String get settingsTitle => 'Réglages';

  @override
  String get tabPlayback => 'Lecture';

  @override
  String get tabStorage => 'Stockage';

  @override
  String get tabServer => 'Serveur';

  @override
  String get tabDisplay => 'Affichage';

  @override
  String get tabAbout => 'À propos';

  @override
  String get sectionAutoDj => 'DJ AUTOMATIQUE';

  @override
  String get autoDjMode => 'Mode DJ automatique';

  @override
  String songsToAdd(int count) {
    return 'Titres à ajouter : $count';
  }

  @override
  String get sectionReplayGain => 'VOLUME ÉGALISÉ (REPLAYGAIN)';

  @override
  String get replayGainMode => 'Mode';

  @override
  String preamp(String value) {
    return 'Préampli : $value dB';
  }

  @override
  String get preventClipping => 'Éviter la saturation';

  @override
  String fallbackGain(String value) {
    return 'Gain par défaut : $value dB';
  }

  @override
  String get sectionStreamingQuality => 'QUALITÉ DE LECTURE';

  @override
  String get enableTranscoding => 'Convertir les fichiers';

  @override
  String get qualityWifi => 'Qualité en Wi-Fi';

  @override
  String get qualityMobile => 'Qualité en données mobiles';

  @override
  String get format => 'Format';

  @override
  String get transcodingSubtitle =>
      'Consomme moins de données, avec une qualité plus basse';

  @override
  String get modeOff => 'Désactivé';

  @override
  String get modeTrack => 'Titre';

  @override
  String get modeAlbum => 'Album';

  @override
  String get sectionServerConnection => 'CONNEXION AU SERVEUR';

  @override
  String get serverType => 'Type de serveur';

  @override
  String get notConnected => 'Non connecté';

  @override
  String get unknown => 'Inconnu';

  @override
  String get sectionMusicFolders => 'DOSSIERS DE MUSIQUE';

  @override
  String get musicFolders => 'Dossiers de musique';

  @override
  String get noMusicFolders => 'Aucun dossier de musique';

  @override
  String get sectionSavedProfiles => 'COMPTES ENREGISTRÉS';

  @override
  String get switchProfile => 'Changer de compte';

  @override
  String get switchServer => 'Changer de serveur';

  @override
  String get addProfile => 'Ajouter un compte';

  @override
  String switchProfileConfirmation(String profile) {
    return 'Se connecter à « $profile » ?';
  }

  @override
  String get sectionAccount => 'COMPTE';

  @override
  String get logoutConfirmation =>
      'Te déconnecter ? Les données en cache seront aussi effacées.';

  @override
  String get sectionCacheSettings => 'CACHE';

  @override
  String get imageCache => 'Cache des images';

  @override
  String get musicCache => 'Cache de la musique';

  @override
  String get bpmCache => 'Cache des BPM';

  @override
  String get saveAlbumCovers => 'Garder les pochettes sur le téléphone';

  @override
  String get saveSongMetadata => 'Garder les infos des titres sur le téléphone';

  @override
  String get saveBpmAnalysis => 'Garder l\'analyse des BPM sur le téléphone';

  @override
  String get sectionCacheCleanup => 'NETTOYAGE';

  @override
  String get clearAllCache => 'Vider tout le cache';

  @override
  String get allCacheCleared => 'Cache vidé';

  @override
  String get sectionOfflineDownloads => 'TÉLÉCHARGEMENTS';

  @override
  String get downloadedSongs => 'Titres téléchargés';

  @override
  String downloadingLibrary(int progress, int total) {
    return 'Téléchargement de la bibliothèque… $progress/$total';
  }

  @override
  String get downloadAllLibrary => 'Télécharger toute la bibliothèque';

  @override
  String downloadLibraryConfirm(int count) {
    return '$count titres vont être téléchargés sur ce téléphone. Cela peut prendre du temps et beaucoup de place.\n\nContinuer ?';
  }

  @override
  String get keepScreenOnDuringDownload => 'Garder l\'écran allumé';

  @override
  String get keepScreenOnDuringDownloadSubtitle =>
      'Évite que le téléchargement s\'arrête quand le téléphone se verrouille';

  @override
  String get parallelDownloads => 'Téléchargements simultanés';

  @override
  String get parallelDownloadsSubtitle =>
      'Télécharge plusieurs titres à la fois';

  @override
  String get downloadSingular => 'téléchargement';

  @override
  String get downloadPlural => 'téléchargements';

  @override
  String get slowerButStable => 'Plus lent mais plus fiable';

  @override
  String get fasterButMoreData => 'Plus rapide mais consomme plus';

  @override
  String get libraryDownloadStarted =>
      'Téléchargement de la bibliothèque lancé';

  @override
  String get deleteDownloads => 'Supprimer tous les téléchargements';

  @override
  String get downloadsDeleted => 'Téléchargements supprimés';

  @override
  String get noSongsAvailable =>
      'Aucun titre disponible. Charge d\'abord ta bibliothèque.';

  @override
  String get sectionBpmAnalysis => 'ANALYSE DES BPM';

  @override
  String get cachedBpms => 'BPM en cache';

  @override
  String get cacheAllBpms => 'Analyser tous les BPM';

  @override
  String get clearBpmCache => 'Vider le cache des BPM';

  @override
  String get bpmCacheCleared => 'Cache des BPM vidé';

  @override
  String downloadedStats(int count, String size) {
    return '$count titres • $size';
  }

  @override
  String get sectionInformation => 'INFORMATIONS';

  @override
  String get sectionDeveloper => 'DÉVELOPPEUR';

  @override
  String get sectionLinks => 'LIENS';

  @override
  String get githubRepo => 'Dépôt GitHub';

  @override
  String get playingFrom => 'LECTURE DEPUIS';

  @override
  String get live => 'EN DIRECT';

  @override
  String get streamingLive => 'En direct';

  @override
  String get stopRadio => 'Arrêter la radio';

  @override
  String get removeFromLiked => 'Retirer des titres aimés';

  @override
  String get addToLiked => 'Ajouter aux titres aimés';

  @override
  String get playNext => 'Lire ensuite';

  @override
  String get addToQueue => 'Ajouter à la file d\'attente';

  @override
  String get goToAlbum => 'Voir l\'album';

  @override
  String get goToArtist => 'Voir l\'artiste';

  @override
  String get rateSong => 'Noter le titre';

  @override
  String rateSongValue(int rating, String stars) {
    return 'Noter le titre ($rating $stars)';
  }

  @override
  String get ratingRemoved => 'Note retirée';

  @override
  String rated(int rating, String stars) {
    return 'Noté $rating $stars';
  }

  @override
  String get removeRating => 'Retirer la note';

  @override
  String get downloaded => 'Téléchargé';

  @override
  String downloading(int percent) {
    return 'Téléchargement… $percent %';
  }

  @override
  String get removeDownload => 'Supprimer le téléchargement';

  @override
  String get removeDownloadConfirm => 'Retirer ce titre du téléphone ?';

  @override
  String get downloadRemoved => 'Téléchargement supprimé';

  @override
  String downloadedTitle(String title) {
    return '« $title » téléchargé';
  }

  @override
  String get downloadFailed => 'Le téléchargement a échoué';

  @override
  String downloadError(Object error) {
    return 'Erreur de téléchargement : $error';
  }

  @override
  String addedToPlaylist(String title, String playlist) {
    return '« $title » ajouté à $playlist';
  }

  @override
  String errorAddingToPlaylist(Object error) {
    return 'Impossible d\'ajouter à la playlist : $error';
  }

  @override
  String get noPlaylists => 'Aucune playlist';

  @override
  String get createNewPlaylist => 'Nouvelle playlist';

  @override
  String artistNotFound(String name) {
    return 'Artiste « $name » introuvable';
  }

  @override
  String errorSearchingArtist(Object error) {
    return 'Impossible de chercher l\'artiste : $error';
  }

  @override
  String get selectArtist => 'Choisir un artiste';

  @override
  String get removedFromFavorites => 'Retiré des favoris';

  @override
  String get addedToFavorites => 'Ajouté aux favoris';

  @override
  String get star => 'étoile';

  @override
  String get stars => 'étoiles';

  @override
  String get albumNotFound => 'Album introuvable';

  @override
  String durationHoursMinutes(int hours, int minutes) {
    return '$hours H $minutes MIN';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes MIN';
  }

  @override
  String get topSongs => 'Titres populaires';

  @override
  String get connected => 'Connecté';

  @override
  String get noSongPlaying => 'Aucun titre en lecture';

  @override
  String get internetRadioUppercase => 'RADIO EN LIGNE';

  @override
  String get playingNext => 'À suivre';

  @override
  String get createPlaylistTitle => 'Nouvelle playlist';

  @override
  String get playlistNameHint => 'Nom de la playlist';

  @override
  String playlistCreatedWithSong(String name) {
    return 'Playlist « $name » créée avec ce titre';
  }

  @override
  String errorLoadingPlaylists(Object error) {
    return 'Impossible de charger les playlists : $error';
  }

  @override
  String get playlistNotFound => 'Playlist introuvable';

  @override
  String get noSongsInPlaylist => 'Cette playlist est vide';

  @override
  String get noFavoriteSongsYet => 'Aucun titre aimé pour l\'instant';

  @override
  String get noFavoriteAlbumsYet => 'Aucun album aimé pour l\'instant';

  @override
  String get listeningHistory => 'Historique d\'écoute';

  @override
  String get noListeningHistory => 'Pas encore d\'historique';

  @override
  String get songsWillAppearHere =>
      'Les titres que tu écoutes apparaîtront ici';

  @override
  String get sortByTitleAZ => 'Titre (A-Z)';

  @override
  String get sortByTitleZA => 'Titre (Z-A)';

  @override
  String get sortByArtistAZ => 'Artiste (A-Z)';

  @override
  String get sortByArtistZA => 'Artiste (Z-A)';

  @override
  String get sortByAlbumAZ => 'Album (A-Z)';

  @override
  String get sortByAlbumZA => 'Album (Z-A)';

  @override
  String get recentlyAdded => 'Ajouts récents';

  @override
  String get noSongsFound => 'Aucun titre';

  @override
  String get noAlbumsFound => 'Aucun album';

  @override
  String get noHomepageUrl => 'Cette radio n\'a pas de site web';

  @override
  String get playStation => 'Écouter la radio';

  @override
  String get openHomepage => 'Ouvrir le site web';

  @override
  String get copyStreamUrl => 'Copier l\'adresse du flux';

  @override
  String get failedToLoadRadioStations => 'Impossible de charger les radios';

  @override
  String get noRadioStations => 'Aucune radio';

  @override
  String get noRadioStationsHint =>
      'Les radios ajoutées sur le serveur Navidrome apparaîtront ici.';

  @override
  String get connectToServerSubtitle => 'Connecte-toi à ton serveur de musique';

  @override
  String get pleaseEnterServerUrl => 'Saisis l\'adresse du serveur';

  @override
  String get invalidUrlFormat =>
      'L\'adresse doit commencer par http:// ou https://';

  @override
  String get pleaseEnterUsername => 'Saisis ton nom d\'utilisateur';

  @override
  String get pleaseEnterPassword => 'Saisis ton mot de passe';

  @override
  String get legacyAuthentication => 'Ancienne authentification';

  @override
  String get legacyAuthSubtitle => 'Pour les anciens serveurs Subsonic';

  @override
  String get allowSelfSignedCerts => 'Accepter les certificats autosignés';

  @override
  String get allowSelfSignedSubtitle =>
      'Pour les serveurs avec un certificat TLS/SSL personnel';

  @override
  String get advancedOptions => 'Options avancées';

  @override
  String get customTlsCertificate => 'Certificat TLS/SSL personnel';

  @override
  String get customCertificateSubtitle =>
      'Importe le certificat d\'un serveur dont l\'autorité n\'est pas reconnue';

  @override
  String get selectCertificateFile => 'Choisir un fichier de certificat';

  @override
  String get clientCertificate => 'Certificat client (mTLS)';

  @override
  String get clientCertificateSubtitle =>
      'Identifie cet appareil par un certificat (le serveur doit accepter le mTLS)';

  @override
  String get selectClientCertificate => 'Choisir le certificat client';

  @override
  String get clientCertPassword => 'Mot de passe du certificat (facultatif)';

  @override
  String failedToSelectClientCert(String error) {
    return 'Impossible de choisir le certificat client : $error';
  }

  @override
  String get connect => 'Se connecter';

  @override
  String get or => 'OU';

  @override
  String get useLocalFiles => 'Utiliser les fichiers du téléphone';

  @override
  String get startingScan => 'Analyse en cours…';

  @override
  String get storagePermissionRequired =>
      'Autorise l\'accès au stockage pour trouver la musique';

  @override
  String get noMusicFilesFound => 'Aucun fichier audio trouvé sur ce téléphone';

  @override
  String get remove => 'Retirer';

  @override
  String failedToSetRating(Object error) {
    return 'Impossible d\'enregistrer la note : $error';
  }

  @override
  String get home => 'Accueil';

  @override
  String get playlistsSection => 'PLAYLISTS';

  @override
  String get collapse => 'Réduire';

  @override
  String get expand => 'Agrandir';

  @override
  String get createPlaylist => 'Nouvelle playlist';

  @override
  String get importPlaylist => 'Importer une playlist';

  @override
  String get importPlaylistSubtitle =>
      'Depuis Spotify ou YouTube Music, sans compte';

  @override
  String get checkForUpdates => 'Rechercher une mise à jour';

  @override
  String get checkingForUpdates => 'Recherche de mise à jour…';

  @override
  String get appUpToDate => 'Octave est à jour';

  @override
  String get updateAvailable => 'Mise à jour disponible';

  @override
  String get updateNow => 'Mettre à jour';

  @override
  String get downloadingUpdate => 'Téléchargement de la mise à jour…';

  @override
  String get openOnGitHub => 'Ouvrir sur GitHub';

  @override
  String get skipThisVersion => 'Ignorer cette version';

  @override
  String get updateDownloaded => 'Téléchargement terminé. Installation…';

  @override
  String get likedSongsSidebar => 'Titres aimés';

  @override
  String playlistSongsCount(int count) {
    return 'Playlist • $count titres';
  }

  @override
  String get failedToLoadLyrics => 'Impossible de charger les paroles';

  @override
  String get lyricsNotFoundSubtitle => 'Aucune parole trouvée pour ce titre';

  @override
  String get backToCurrent => 'Revenir à la ligne en cours';

  @override
  String get exitFullscreen => 'Quitter le plein écran';

  @override
  String get fullscreen => 'Plein écran';

  @override
  String get noLyrics => 'Pas de paroles';

  @override
  String get internetRadioMiniPlayer => 'Radio en ligne';

  @override
  String get liveBadge => 'EN DIRECT';

  @override
  String get localFilesModeBanner => 'Mode fichiers du téléphone';

  @override
  String get offlineModeBanner =>
      'Hors connexion – musique téléchargée uniquement';

  @override
  String get updateAvailableSubtitle =>
      'Une nouvelle version d\'Octave est disponible';

  @override
  String updateCurrentVersion(String version) {
    return 'Installée : v$version';
  }

  @override
  String updateLatestVersion(String version) {
    return 'Nouvelle : v$version';
  }

  @override
  String get whatsNew => 'Nouveautés';

  @override
  String get downloadUpdate => 'Télécharger';

  @override
  String get remindLater => 'Plus tard';

  @override
  String get seeAll => 'Tout afficher';

  @override
  String get artistDataNotFound => 'Artiste introuvable';

  @override
  String get addedArtistToQueue => 'Artiste ajouté à la file d\'attente';

  @override
  String get addedArtistToQueueError =>
      'Impossible d\'ajouter l\'artiste à la file d\'attente';

  @override
  String get casting => 'Diffusion';

  @override
  String get dlna => 'DLNA';

  @override
  String get castDlnaBeta => 'Cast / DLNA (bêta)';

  @override
  String get chromecast => 'Chromecast';

  @override
  String get dlnaUpnp => 'DLNA / UPnP';

  @override
  String get disconnect => 'Se déconnecter';

  @override
  String get searchingDevices => 'Recherche d\'appareils';

  @override
  String get castWifiHint =>
      'Vérifie que ton appareil Cast / DLNA\nest sur le même réseau Wi-Fi';

  @override
  String connectedToDevice(String name) {
    return 'Connecté à $name';
  }

  @override
  String failedToConnectDevice(String name) {
    return 'Impossible de se connecter à $name';
  }

  @override
  String get removedFromLikedSongs => 'Retiré des titres aimés';

  @override
  String get addedToLikedSongs => 'Ajouté aux titres aimés';

  @override
  String get enableShuffle => 'Activer l\'aléatoire';

  @override
  String get enableRepeat => 'Activer la répétition';

  @override
  String get connecting => 'Connexion…';

  @override
  String get closeLyrics => 'Fermer les paroles';

  @override
  String errorStartingDownload(Object error) {
    return 'Impossible de lancer le téléchargement : $error';
  }

  @override
  String get errorLoadingGenres => 'Impossible de charger les genres';

  @override
  String get noGenresFound => 'Aucun genre';

  @override
  String get noAlbumsInGenre => 'Aucun album dans ce genre';

  @override
  String genreTooltip(int songCount, int albumCount) {
    return '$songCount titres • $albumCount albums';
  }

  @override
  String get sectionJukebox => 'MODE JUKEBOX';

  @override
  String get jukeboxMode => 'Mode jukebox';

  @override
  String get jukeboxModeSubtitle =>
      'Joue le son sur le serveur plutôt que sur ce téléphone';

  @override
  String get openJukeboxController => 'Ouvrir la télécommande du jukebox';

  @override
  String get jukeboxClearQueue => 'Vider la file d\'attente';

  @override
  String get jukeboxShuffleQueue => 'Mélanger la file d\'attente';

  @override
  String get jukeboxQueueEmpty => 'La file d\'attente est vide';

  @override
  String get jukeboxNowPlaying => 'À l\'écoute';

  @override
  String get jukeboxQueue => 'File d\'attente';

  @override
  String get jukeboxVolume => 'Volume';

  @override
  String get playOnJukebox => 'Lire sur le jukebox';

  @override
  String get addToJukeboxQueue => 'Ajouter à la file du jukebox';

  @override
  String get jukeboxNotSupported =>
      'Ce serveur ne gère pas le mode jukebox. Active-le dans sa configuration (par exemple EnableJukebox = true dans Navidrome).';

  @override
  String get musicFoldersDialogTitle => 'Choisir les dossiers de musique';

  @override
  String get musicFoldersHint =>
      'Laisse tout coché pour utiliser tous les dossiers.';

  @override
  String get musicFoldersSaved => 'Dossiers de musique enregistrés';

  @override
  String get artworkStyleSection => 'Style des pochettes';

  @override
  String get artworkCornerRadius => 'Arrondi des coins';

  @override
  String get artworkCornerRadiusSubtitle =>
      'Règle l\'arrondi des coins des pochettes';

  @override
  String get artworkCornerRadiusNone => 'Aucun';

  @override
  String get artworkShape => 'Forme';

  @override
  String get artworkShapeRounded => 'Arrondie';

  @override
  String get artworkShapeCircle => 'Ronde';

  @override
  String get artworkShapeSquare => 'Carrée';

  @override
  String get artworkShadow => 'Ombre';

  @override
  String get artworkShadowNone => 'Aucune';

  @override
  String get artworkShadowSoft => 'Légère';

  @override
  String get artworkShadowMedium => 'Moyenne';

  @override
  String get artworkShadowStrong => 'Marquée';

  @override
  String get artworkShadowColor => 'Couleur de l\'ombre';

  @override
  String get artworkShadowColorBlack => 'Noir';

  @override
  String get artworkShadowColorAccent => 'Couleur de l\'app';

  @override
  String get artworkPreview => 'Aperçu';

  @override
  String artworkCornerRadiusLabel(int value) {
    return '$value px';
  }

  @override
  String get noArtwork => 'Pas de pochette';

  @override
  String get serverUnreachableTitle => 'Serveur injoignable';

  @override
  String get serverUnreachableSubtitle =>
      'Vérifie ta connexion ou les réglages du serveur.';

  @override
  String get openOfflineMode => 'Ouvrir hors connexion';

  @override
  String get appearanceSection => 'Apparence';

  @override
  String get themeLabel => 'Thème';

  @override
  String get accentColorLabel => 'Couleur de l\'app';

  @override
  String get circularDesignLabel => 'Barres flottantes';

  @override
  String get circularDesignSubtitle =>
      'Barre d\'onglets et mini-lecteur flottants, arrondis et translucides.';

  @override
  String get themeModeSystem => 'Auto';

  @override
  String get themeModeLight => 'Clair';

  @override
  String get themeModeDark => 'Sombre';

  @override
  String get liveLabel => 'EN DIRECT';

  @override
  String get discordStatusText => 'Texte du statut Discord';

  @override
  String get discordStatusTextSubtitle =>
      'Deuxième ligne de ton activité Discord';

  @override
  String get discordRpcStyleArtist => 'Nom de l\'artiste';

  @override
  String get discordRpcStyleSong => 'Titre du morceau';

  @override
  String get discordRpcStyleApp => 'Nom de l\'app (Octave)';

  @override
  String get sectionVolumeNormalization => 'VOLUME ÉGALISÉ (REPLAYGAIN)';

  @override
  String get sectionFadeInOut => 'FONDU';

  @override
  String get fadeInOutEnable => 'Fondu à la lecture et à la pause';

  @override
  String get fadeInOutSubtitle => 'Le son monte et descend en douceur';

  @override
  String fadeDuration(int duration) {
    return 'Durée du fondu : $duration ms';
  }

  @override
  String get replayGainModeOff => 'Désactivé';

  @override
  String get replayGainModeTrack => 'Par titre';

  @override
  String get replayGainModeAlbum => 'Par album';

  @override
  String replayGainPreamp(String value) {
    return 'Préampli : $value dB';
  }

  @override
  String get replayGainPreventClipping => 'Éviter la saturation';

  @override
  String replayGainFallbackGain(String value) {
    return 'Gain par défaut : $value dB';
  }

  @override
  String autoDjSongsToAdd(int count) {
    return 'Titres à ajouter : $count';
  }

  @override
  String get transcodingEnable => 'Convertir les fichiers';

  @override
  String get transcodingEnableSubtitle =>
      'Consomme moins de données, avec une qualité plus basse';

  @override
  String get smartTranscoding => 'Qualité selon le réseau';

  @override
  String get smartTranscodingSubtitle =>
      'Adapte la qualité au réseau (Wi-Fi ou données mobiles)';

  @override
  String get smartTranscodingDetectedNetwork => 'Réseau détecté : ';

  @override
  String smartTranscodingActiveBitrate(String bitrate) {
    return 'Débit utilisé : $bitrate';
  }

  @override
  String get transcodingWifiQuality => 'Qualité en Wi-Fi';

  @override
  String get transcodingWifiQualitySubtitleSmart =>
      'Utilisée automatiquement en Wi-Fi';

  @override
  String get transcodingWifiQualitySubtitle => 'Débit en Wi-Fi';

  @override
  String get transcodingMobileQuality => 'Qualité en données mobiles';

  @override
  String get transcodingMobileQualitySubtitleSmart =>
      'Utilisée automatiquement en données mobiles';

  @override
  String get transcodingMobileQualitySubtitle => 'Débit en données mobiles';

  @override
  String get transcodingFormat => 'Format';

  @override
  String get transcodingFormatSubtitle =>
      'Format audio utilisé pour la lecture';

  @override
  String get transcodingBitrateOriginal => 'D\'origine (sans conversion)';

  @override
  String get transcodingFormatOriginal => 'D\'origine';

  @override
  String get imageCacheTitle => 'Cache des images';

  @override
  String get imageCacheSubtitle => 'Garde les pochettes sur le téléphone';

  @override
  String get musicCacheTitle => 'Cache de la musique';

  @override
  String get musicCacheSubtitle =>
      'Garde les infos des titres sur le téléphone';

  @override
  String get bpmCacheTitle => 'Cache des BPM';

  @override
  String get bpmCacheSubtitle => 'Garde l\'analyse des BPM sur le téléphone';

  @override
  String get sectionAboutInformation => 'INFORMATIONS';

  @override
  String get sectionAboutDeveloper => 'DÉVELOPPEUR';

  @override
  String get sectionAboutLinks => 'LIENS';

  @override
  String get aboutVersion => 'Version';

  @override
  String get aboutPlatform => 'Plateforme';

  @override
  String get aboutMadeBy => 'Basé sur Musly, créé par dddevid';

  @override
  String get aboutGitHub => 'github.com/dddevid';

  @override
  String get aboutLinkGitHub => 'Dépôt GitHub';

  @override
  String get aboutLinkChangelog => 'Nouveautés';

  @override
  String get aboutLinkReportIssue => 'Signaler un problème';

  @override
  String get sectionAnalyticsPrivacy => 'Statistiques et vie privée';

  @override
  String get anonymousAnalytics => 'Statistiques anonymes';

  @override
  String get anonymousAnalyticsSubtitle =>
      'Aide à améliorer Octave avec des rapports anonymes';

  @override
  String get deviceId => 'Identifiant de l\'appareil';

  @override
  String deviceIdAnonymous(String id) {
    return 'Identifiant anonyme : $id';
  }

  @override
  String get deviceIdDisabled =>
      'Active les statistiques pour voir l\'identifiant anonyme';

  @override
  String get aboutDeviceId => 'À propos de l\'identifiant';

  @override
  String get aboutDeviceIdSubtitle =>
      'Cet identifiant anonyme est créé par l\'app. Il ne permet pas de savoir qui tu es et ne sert qu\'aux statistiques.';

  @override
  String get supportWayRate => 'Laisser une note';

  @override
  String get supportMadeWithLove => 'Créé avec passion en Italie';

  @override
  String get playbackSpeed => 'Vitesse de lecture';

  @override
  String get normalSpeed => 'Normale (1×)';

  @override
  String get preservePitch => 'Garder la hauteur du son';

  @override
  String get preservePitchSubtitle =>
      'Garde la hauteur d\'origine quand la vitesse change';

  @override
  String get pitch => 'Hauteur';

  @override
  String get pitchPreserved => 'hauteur conservée';

  @override
  String speedTooltipWithPitch(String speed, String pitch) {
    return 'Vitesse $speed · hauteur $pitch×';
  }

  @override
  String speedTooltipPitchPreserved(String speed) {
    return 'Vitesse $speed · hauteur conservée';
  }

  @override
  String get sleepTimer => 'Minuteur de sommeil';

  @override
  String get sleepTimerActive => 'Minuteur en cours';

  @override
  String get fadeOut => 'Baisser le son à la fin';

  @override
  String fadeOutSubtitle(int seconds) {
    return 'Le volume baisse peu à peu pendant les $seconds dernières secondes';
  }

  @override
  String get finishCurrentSong => 'Finir le titre en cours';

  @override
  String get finishCurrentSongSubtitle => 'S\'arrête à la fin du titre';

  @override
  String sleepTimerMinutes(int count) {
    return '$count min';
  }

  @override
  String sleepTimerHours(int count) {
    return '$count h';
  }

  @override
  String sleepTimerSetFor(String duration) {
    return 'Arrêt dans $duration';
  }

  @override
  String get customDuration => 'Autre durée…';

  @override
  String get cancelTimer => 'Annuler le minuteur';

  @override
  String get customSleepTimer => 'Durée du minuteur';

  @override
  String get set => 'Valider';

  @override
  String get addToPlaylistTitle => 'Ajouter à une playlist';

  @override
  String get yourPlaylistsLabel => 'Tes playlists';

  @override
  String get enableLrcLibFallback => 'Chercher les paroles sur LRCLIB';

  @override
  String get lrcLibFallbackSubtitle =>
      'Cherche les paroles sur LRCLIB quand le serveur n\'en a pas';

  @override
  String get themeSaved => 'Thème enregistré';

  @override
  String get themeUnsavedChanges => 'Modifications non enregistrées';

  @override
  String get themeUnsavedChangesTitle => 'Modifications non enregistrées';

  @override
  String get themeUnsavedChangesBody => 'Enregistrer avant de quitter ?';

  @override
  String get discard => 'Ne pas enregistrer';

  @override
  String get done => 'OK';

  @override
  String pickColor(String label) {
    return 'Choisir : $label';
  }

  @override
  String get titleStyle => 'Style du titre';

  @override
  String get artistStyle => 'Style de l\'artiste';

  @override
  String get themeActive => 'ACTIF';

  @override
  String get themeSafeMode => 'SÛR';

  @override
  String get themeCodeMode => 'CODE';

  @override
  String get themeAnimBadge => 'ANIM';

  @override
  String themeAuthor(String author) {
    return 'par $author';
  }

  @override
  String get audioFocusDenied =>
      'Lecture impossible : une autre app utilise le son';

  @override
  String get addToLibrary => 'Ajouter à la bibliothèque';

  @override
  String get alreadyInLibrary => 'Ce titre est déjà dans ta bibliothèque';

  @override
  String get selectPlaylist => 'Choisir une playlist';

  @override
  String get endOfSong => 'Fin du titre';

  @override
  String get muslyConnect => 'Octave Connect';

  @override
  String get connectToDevice => 'Écouter sur un appareil';

  @override
  String get currentlyPlayingOn => 'Lecture en cours sur';

  @override
  String get noDevicesFound =>
      'Aucun autre appareil Octave sur ce réseau Wi-Fi.';

  @override
  String get transferPlaybackHere => 'Continuer la lecture ici';

  @override
  String playbackTransferredTo(String device) {
    return 'Lecture transférée sur $device';
  }

  @override
  String get muslyBeatSync => 'Octave BeatSync';

  @override
  String get beatSyncSubtitle =>
      'Synchronise plusieurs téléphones et ordinateurs en Wi-Fi pour jouer ensemble, à la milliseconde près.';

  @override
  String get hostParty => 'Lancer une soirée';

  @override
  String get joinParty => 'Rejoindre une soirée';

  @override
  String get leaveParty => 'Quitter la soirée';

  @override
  String get audioPhaseCalibration => 'Réglage du décalage';

  @override
  String get phaseCalibrationSubtitle =>
      'À ajuster avec un casque Bluetooth ou une enceinte qui a du retard.';

  @override
  String get partySpeakers => 'Appareils de la soirée';

  @override
  String get muslyWrapped => 'Bilan Octave';

  @override
  String get wrappedSeasonal => 'Le bilan arrive en fin d\'année';

  @override
  String get playYourTopSongs => 'Écouter tes titres préférés';

  @override
  String get lyricsUnderArtwork => 'Paroles sous la pochette';

  @override
  String get lyricsUnderArtworkSubtitle =>
      'Affiche la ligne en cours des paroles sous la pochette, dans le lecteur';

  @override
  String get lyricsDisplaySection => 'AFFICHAGE DES PAROLES';

  @override
  String get lyricsBlurUnfocused => 'Flouter les autres lignes';

  @override
  String get lyricsBlurUnfocusedSubtitle =>
      'Les lignes passées et à venir sont floutées';

  @override
  String get lyricsAlignment => 'Alignement des paroles';

  @override
  String get lyricsAlignmentCentered => 'Centrées';

  @override
  String get lyricsAlignmentLeft => 'À gauche';

  @override
  String get alignLeft => 'Gauche';

  @override
  String get alignCenter => 'Centre';

  @override
  String get lyricsGlowEffect => 'Ligne en cours lumineuse';

  @override
  String get lyricsGlowEffectSubtitle => 'Un léger halo sur la ligne chantée';

  @override
  String get lyricsKeepScreenOn => 'Garder l\'écran allumé';

  @override
  String get lyricsKeepScreenOnSubtitle =>
      'L\'écran reste allumé pendant que tu lis les paroles';

  @override
  String get hideWindowTitlebar => 'Masquer la barre de titre';

  @override
  String get hideWindowTitlebarSubtitle =>
      'Masque la barre de titre de la fenêtre (utile sous Linux Wayland)';

  @override
  String get sectionSmartCrossfade => 'FONDU ENCHAÎNÉ';

  @override
  String get trackCrossfade => 'Fondu enchaîné';

  @override
  String get crossfadeOffSubtitle => 'Désactivé (passage direct)';

  @override
  String crossfadeDurationSubtitle(int seconds) {
    return '$seconds secondes de fondu entre les titres';
  }

  @override
  String crossfadeDurationBadge(int seconds) {
    return '$seconds s';
  }

  @override
  String get sectionGaplessPlayback => 'LECTURE SANS BLANC';

  @override
  String get gaplessPlayback => 'Lecture sans blanc';

  @override
  String get gaplessPlaybackSubtitle => 'Enchaîne les titres sans silence';

  @override
  String get sectionLyrics => 'PAROLES';

  @override
  String get networkWifi => 'Wi-Fi';

  @override
  String get networkMobile => 'Mobile';

  @override
  String get downloadFolder => 'Dossier des téléchargements';

  @override
  String get downloadFolderDefault => 'Par défaut (stockage interne)';

  @override
  String get activeDownloads => 'Téléchargements en cours';

  @override
  String get noDownloadsInProgress => 'Aucun téléchargement en cours';

  @override
  String get playlistDownloads => 'Playlists téléchargées';

  @override
  String playlistSongsDownloadedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titres téléchargés',
      one: '1 titre téléchargé',
    );
    return '$_temp0';
  }

  @override
  String get songsStreamCache => 'Cache des titres';

  @override
  String get imageArtworkCache => 'Cache des pochettes';

  @override
  String cacheDiskUsage(String size) {
    return '$size utilisés';
  }

  @override
  String totalCacheDiskUsage(String size) {
    return 'Cache total : $size';
  }

  @override
  String get clearAudioCacheTooltip => 'Vider le cache des titres';

  @override
  String get clearImageCacheTooltip => 'Vider le cache des pochettes';

  @override
  String get audioCacheCleared => 'Cache des titres vidé';

  @override
  String get imageCacheCleared => 'Cache des pochettes vidé';

  @override
  String folderAdded(String path) {
    return 'Dossier ajouté : $path';
  }

  @override
  String get removeFolderTitle => 'Retirer le dossier';

  @override
  String removeFolderConfirm(String path) {
    return 'Ne plus analyser « $path » ?';
  }

  @override
  String get folderRemoved => 'Dossier retiré';

  @override
  String get loadingLibrary => 'Chargement de la bibliothèque…';

  @override
  String get libraryEmptyError =>
      'La bibliothèque semble vide ou n\'a pas pu être chargée. Vérifie que le serveur permet de la parcourir en entier.';

  @override
  String get serverStatusConnected => 'CONNECTÉ';

  @override
  String get serverStatusConnecting => 'CONNEXION';

  @override
  String get serverStatusOffline => 'HORS LIGNE';

  @override
  String get serverStatusNotConnected => 'Non connecté';

  @override
  String get switchServerButton => 'Changer';

  @override
  String get savedServersSection => 'SERVEURS ENREGISTRÉS';

  @override
  String get manage => 'Gérer';

  @override
  String get serverActiveBadge => 'Actif';

  @override
  String get addServerOrService => 'Ajouter un serveur';

  @override
  String get muslyPlaybackDev => 'Aperçu du bilan (test)';

  @override
  String get muslyPlaybackDevSubtitle =>
      'Voir l\'aperçu du bilan de l\'année sans attendre novembre';

  @override
  String get muslyPlaybackAnnual => 'Bilan de l\'année';

  @override
  String get muslyPlaybackAnnualSubtitle =>
      'Ton bilan de l\'année s\'ouvre tout seul chaque année, de fin novembre à mi-janvier.\n\nContinue d\'écouter ta musique d\'ici là !';

  @override
  String get submit => 'Envoyer';

  @override
  String devPlaybackTapsAway(int count) {
    return 'Encore $count appuis pour l\'aperçu du bilan';
  }

  @override
  String get devPlaybackUnlocked => 'Aperçu du bilan débloqué';

  @override
  String get switchServerTitle => 'Changer de serveur';

  @override
  String get switchServerSubtitle => 'Choisis le serveur à utiliser';

  @override
  String get addServerButton => 'Ajouter un serveur';

  @override
  String get noServersSavedYet => 'Aucun serveur enregistré';

  @override
  String connectedTo(String name) {
    return 'Connecté à $name';
  }

  @override
  String errorConnectingServer(String error) {
    return 'Connexion au serveur impossible : $error';
  }

  @override
  String get renameServerProfile => 'Renommer le serveur';

  @override
  String get profileNameLabel => 'Nom';

  @override
  String get enterNewNameHint => 'Nouveau nom';

  @override
  String get removeServerTitle => 'Retirer le serveur';

  @override
  String removeServerConfirm(String name) {
    return 'Retirer « $name » des serveurs enregistrés ?';
  }

  @override
  String get noPlaylistsFound => 'Aucune playlist';

  @override
  String get addAllToQueue => 'Tout ajouter à la file d\'attente';

  @override
  String songsAddedToQueue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titres ajoutés à la file d\'attente',
      one: '1 titre ajouté à la file d\'attente',
    );
    return '$_temp0';
  }

  @override
  String get searchInAlbum => 'Rechercher dans l\'album';

  @override
  String get searchInPlaylist => 'Rechercher dans la playlist';

  @override
  String get filterTracks => 'Filtrer les titres…';

  @override
  String get filterSongs => 'Filtrer les titres…';

  @override
  String get noSongsInQueue => 'La file d\'attente est vide';

  @override
  String get moreOptions => 'Plus d\'options';

  @override
  String get upNext => 'À suivre';

  @override
  String get removeSelected => 'Retirer la sélection';

  @override
  String get reorderSongs => 'Réorganiser';

  @override
  String get selectSongs => 'Sélectionner';

  @override
  String get doneReordering => 'Terminer';

  @override
  String get downloadAlbum => 'Télécharger l\'album';

  @override
  String get downloadPlaylist => 'Télécharger la playlist';

  @override
  String get downloadedTapToRemove => 'Téléchargé, touche pour retirer';

  @override
  String get downloadingTapToCancel =>
      'Téléchargement en cours, touche pour annuler';

  @override
  String get removeDownloadsTitle => 'Retirer les téléchargements ?';

  @override
  String removeAlbumDownloadsConfirm(int count, String name) {
    return 'Retirer les $count titres téléchargés de « $name » ?';
  }

  @override
  String removePlaylistDownloadsConfirm(int count, String name) {
    return 'Retirer les $count titres téléchargés de « $name » ?';
  }

  @override
  String queuedSongsForDownload(int count) {
    return '$count titres en attente de téléchargement…';
  }

  @override
  String get songRemovedFromPlaylist => 'Titre retiré de la playlist';

  @override
  String errorRemovingSong(String error) {
    return 'Impossible de retirer le titre : $error';
  }

  @override
  String errorReorderingSong(String error) {
    return 'Impossible de déplacer le titre : $error';
  }

  @override
  String get removeSongsTitle => 'Retirer des titres';

  @override
  String removePlaylistSongsConfirm(int count, String name) {
    return 'Retirer $count titre(s) de « $name » ?';
  }

  @override
  String removedSongsFromPlaylist(int count) {
    return '$count titre(s) retiré(s) de la playlist';
  }

  @override
  String get alreadyInPlaylist => 'Déjà dans la playlist';

  @override
  String alreadyInPlaylistConfirm(String title, String playlist) {
    return '« $title » est déjà dans « $playlist ». L\'ajouter quand même ?';
  }

  @override
  String get addAnyway => 'Ajouter quand même';

  @override
  String get offlineModeQuestion => 'Passer hors connexion ?';

  @override
  String get drumroll => 'ROULEMENT DE TAMBOUR…';

  @override
  String get readyToDiscoverTopSong => 'Prêt à découvrir\nton titre n° 1 ?';

  @override
  String get tapToBegin => 'Touche pour commencer';

  @override
  String get minutesListened => 'MINUTES D\'ÉCOUTE';

  @override
  String get totalHours => 'Heures au total';

  @override
  String get uniqueTracks => 'Titres différents';

  @override
  String get topSongsHeader => 'TITRES PRÉFÉRÉS';

  @override
  String get yourMostListenedSongs => 'Tes titres les plus écoutés';

  @override
  String get topArtistsHeader => 'ARTISTES PRÉFÉRÉS';

  @override
  String playsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count écoutes',
      one: '1 écoute',
    );
    return '$_temp0';
  }

  @override
  String get topSongBadge => 'Titre n° 1';

  @override
  String get topArtistMetric => 'Artiste n° 1';

  @override
  String get genreMetric => 'Genre';

  @override
  String get muslyPlaybackHeader => 'BILAN OCTAVE';

  @override
  String get enableMuslyConnect => 'Activer Octave Connect';

  @override
  String get enableMuslyConnectSubtitle =>
      'Trouve les appareils proches en Wi-Fi pour les piloter et écouter ensemble';

  @override
  String get availableDevices => 'Appareils disponibles';

  @override
  String get lanDiscoveryActive =>
      'Recherche sur le réseau • aucun appareil proche';

  @override
  String nearbyDevicesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count appareils trouvés à proximité',
      one: '1 appareil trouvé à proximité',
    );
    return '$_temp0';
  }

  @override
  String get minutes => 'Minutes';

  @override
  String get nowPlayingHeader => 'À L\'ÉCOUTE';

  @override
  String get privacyFirstTitle => 'Ta vie privée d\'abord';

  @override
  String get privacyFirstSubtitle => 'Tes données restent chez toi.';

  @override
  String get noDataSellingTitle => 'Aucune revente';

  @override
  String get noDataSellingDescription =>
      'Tes données ne sont jamais vendues, partagées ni transmises à qui que ce soit.';

  @override
  String get localFirstStorageTitle => 'Tout reste sur ton téléphone';

  @override
  String get localFirstStorageDescription =>
      'Ta bibliothèque et tes identifiants restent sur ton appareil.';

  @override
  String get privateOpenTitle => 'Privé et libre';

  @override
  String get privateOpenDescription =>
      'Octave n\'envoie aucune statistique : ni identifiant personnel, ni suivi d\'utilisation.';

  @override
  String get readFullPrivacyPolicy => 'Lire la politique de confidentialité';

  @override
  String get viewCompleteDetailsWebsite => 'Le détail complet est sur GitHub';

  @override
  String get understandAndContinue => 'J\'ai compris';

  @override
  String get declineAndExit => 'Refuser et quitter';

  @override
  String get exitApp => 'Quitter l\'app';

  @override
  String get stop => 'Arrêter';

  @override
  String get closeQueue => 'Fermer la file d\'attente';

  @override
  String get timerOff => 'Désactivé';

  @override
  String get history => 'Historique';

  @override
  String get searchInLibrary => 'Rechercher dans la bibliothèque';

  @override
  String get add => 'Ajouter';

  @override
  String get clear => 'Effacer';

  @override
  String get back => 'Retour';

  @override
  String get previousSlide => 'Précédent';

  @override
  String get nextSlide => 'Suivant';

  @override
  String get radios => 'Radios';

  @override
  String get downloads => 'Téléchargements';

  @override
  String get noDownloadedSongsYet => 'Aucun titre téléchargé pour l\'instant';

  @override
  String get noDownloadedAlbumsYet => 'Aucun album téléchargé pour l\'instant';

  @override
  String get connectedToWebStream => 'Connecté à Web Stream';

  @override
  String get allowSelfSignedCertificatesSubtitle =>
      'Utile sur un réseau local ou avec un certificat personnel';

  @override
  String get legacyAuthenticationSubtitle =>
      'Nécessaire pour les anciens serveurs Subsonic';

  @override
  String get certificateFileSubtitle => 'Fichier .crt, .pem ou .cer';

  @override
  String get clientIdentityFileSubtitle => 'Fichier d\'identité .p12 ou .pfx';

  @override
  String get copyError => 'Copier l\'erreur';

  @override
  String get errorCopiedToClipboard => 'Erreur copiée';

  @override
  String get failedToUpdateFavorite => 'Impossible de mettre à jour le favori';

  @override
  String queuedSongsFromAlbumsForDownload(int songCount, int albumCount) {
    return '$songCount titres de $albumCount albums en attente de téléchargement…';
  }

  @override
  String get downloadAllAlbums => 'Télécharger tous les albums';

  @override
  String get downloadAllFavorites => 'Télécharger tous les favoris';

  @override
  String get downloadAll => 'Tout télécharger';

  @override
  String get createPlaylistSubtitle =>
      'Rassemble tes titres préférés dans une playlist';

  @override
  String get addMusicSource => 'Ajouter une source';

  @override
  String get addMusicSourceSubtitle => 'Navidrome, Jellyfin ou Web Stream';

  @override
  String get removeFromFavoritesTitle => 'Retirer des favoris ?';

  @override
  String removeFromFavoritesConfirm(String title) {
    return 'Retirer « $title » des favoris ?';
  }

  @override
  String failedToRemove(String error) {
    return 'Impossible de retirer : $error';
  }

  @override
  String streamUrlLabel(String url) {
    return 'Adresse du flux : $url';
  }

  @override
  String get shuffleNewSelection => 'Nouvelle sélection aléatoire';

  @override
  String get sortDurationLongest => 'Durée (plus longs d\'abord)';

  @override
  String get connectToServer => 'Se connecter au serveur';

  @override
  String get renameProfile => 'Renommer';

  @override
  String get addWebStream => 'Ajouter Web Stream';

  @override
  String get addWebStreamSubtitle => 'Écoute en ligne, sans compte';

  @override
  String get recentSearches => 'Recherches récentes';

  @override
  String get createPlaylistToGetStarted => 'Crée une playlist pour commencer';

  @override
  String get addRadioStationsHint =>
      'Les radios ajoutées dans les réglages du serveur apparaîtront ici.';

  @override
  String get skip => 'Passer';

  @override
  String get profileNameOptional => 'Nom du compte (facultatif)';

  @override
  String get serverUrlRequired => 'Adresse du serveur *';

  @override
  String get lanServerUrlOptional => 'Adresse sur le réseau local (facultatif)';

  @override
  String get usernameRequired => 'Nom d\'utilisateur *';

  @override
  String get passwordRequired => 'Mot de passe *';

  @override
  String get playingInSync => 'Lecture synchronisée';

  @override
  String get switchedBackToThisDevice => 'Lecture revenue sur cet appareil';

  @override
  String connectedToDeviceName(String device) {
    return 'Connecté à $device';
  }

  @override
  String get whatDoYouWantToPlay => 'Que veux-tu écouter ?';

  @override
  String get noLyricsFound => 'Pas de paroles pour ce titre';

  @override
  String get dynamicColor => 'Couleurs du fond d\'écran (Material You)';

  @override
  String get muslyPlayback => 'Bilan Octave';

  @override
  String get synthesizingUniverse => 'Préparation de ton bilan';

  @override
  String get getReadyForBeatDrop => 'Prépare-toi…';

  @override
  String yourYearInSound(int year) {
    return 'Ton année $year\nen musique';
  }

  @override
  String get yourYearInSoundSubtitle =>
      'Des découvertes, des titres réécoutés, des souvenirs en musique.';

  @override
  String get yourMusicalChronotype => 'TON RYTHME D\'ÉCOUTE';

  @override
  String get genreGalaxy => 'TES GENRES';

  @override
  String get soundsThatGuidedYou => 'Les sons qui t\'ont accompagné';

  @override
  String get yourMusicalAnchors => 'Tes artistes de l\'année';

  @override
  String get yourListeningPersonality => 'TON PROFIL D\'ÉCOUTE';

  @override
  String get yourYearInReviewIsReady => 'Ton bilan de l\'année est prêt !';

  @override
  String get chronotypeMidnightWanderer => 'Oiseau de nuit 🌙';

  @override
  String get chronotypeMidnightWandererDesc =>
      'Tes plus beaux moments de musique arrivent tard le soir, quand tout est calme.';

  @override
  String get chronotypeSunriseHarmonizer => 'Lève-tôt en musique ☀️';

  @override
  String get chronotypeSunriseHarmonizerDesc =>
      'Tu lances chaque matin en rythme, avec la bande-son de ta journée.';

  @override
  String get chronotypeAfternoonFlow => 'Énergie de l\'après-midi ⚡';

  @override
  String get chronotypeAfternoonFlowDesc =>
      'L\'après-midi, c\'est ton pic d\'écoute : de quoi garder la pêche.';

  @override
  String get chronotypeTwilightLounger => 'Écoute du soir 🌆';

  @override
  String get chronotypeTwilightLoungerDesc =>
      'Le soir, tu te poses et tu te laisses porter par des albums entiers.';

  @override
  String get archetypeLuminary => 'L\'explorateur';

  @override
  String get archetypeLuminaryBadge => 'EXPLORATEUR DU SON';

  @override
  String get archetypeLuminaryDesc =>
      'Tu passes d\'un genre à l\'autre et tu cherches sans cesse de nouveaux horizons.';

  @override
  String get archetypeLuminaryTrait1 => 'Goûts variés';

  @override
  String get archetypeLuminaryTrait2 => 'Tous les genres';

  @override
  String get archetypeLuminaryTrait3 => 'Grand découvreur';

  @override
  String get archetypeDevotee => 'Le fidèle';

  @override
  String get archetypeDevoteeBadge => 'SUPERFAN';

  @override
  String get archetypeDevoteeDesc =>
      'Quand tu aimes un artiste ou un album, tu l\'écoutes en boucle sans te lasser.';

  @override
  String get archetypeDevoteeTrait1 => 'Grande fidélité';

  @override
  String get archetypeDevoteeTrait2 => 'Écoute par albums';

  @override
  String get archetypeDevoteeTrait3 => 'Lien fort';

  @override
  String get archetypeNightOwl => 'Le noctambule';

  @override
  String get archetypeNightOwlBadge => 'AMBIANCE DE NUIT';

  @override
  String get archetypeNightOwlDesc =>
      'Tu vibres sur des sons nocturnes, des ambiances planantes et des écoutes sous les étoiles.';

  @override
  String get archetypeNightOwlTrait1 => 'Planant';

  @override
  String get archetypeNightOwlTrait2 => 'Introspectif';

  @override
  String get archetypeNightOwlTrait3 => 'Couche-tard';

  @override
  String get archetypeSunrise => 'Le matinal';

  @override
  String get archetypeSunriseBadge => 'PLEIN D\'ÉNERGIE';

  @override
  String get archetypeSunriseDesc =>
      'Tu réveilles le monde avec des mélodies positives qui lancent ta journée.';

  @override
  String get archetypeSunriseTrait1 => 'Entraînant';

  @override
  String get archetypeSunriseTrait2 => 'Énergie du matin';

  @override
  String get archetypeSunriseTrait3 => 'Rythmé';

  @override
  String get archetypeAlchemist => 'Le créateur d\'ambiances';

  @override
  String get archetypeAlchemistBadge => 'CURATEUR';

  @override
  String get archetypeAlchemistDesc =>
      'Tu transformes chaque moment en scène de film grâce à une bande-son parfaitement choisie.';

  @override
  String get archetypeAlchemistTrait1 => 'Sens du choix';

  @override
  String get archetypeAlchemistTrait2 => 'Ambiance cinéma';

  @override
  String get archetypeAlchemistTrait3 => 'Maître des humeurs';

  @override
  String get percentileTop05 => 'Dans les 0,5 % qui écoutent le plus';

  @override
  String get percentileTop1 => 'Dans les 1 % qui écoutent le plus';

  @override
  String get percentileTop5 => 'Dans les 5 % qui écoutent le plus';

  @override
  String get percentileTop10 => 'Dans les 10 % qui écoutent le plus';

  @override
  String get percentileTopAficionado => 'Grand passionné de musique';

  @override
  String get superfanBadge01 => 'Superfan (top 0,1 %)';

  @override
  String get superfanBadge1 => 'Grand fan (top 1 %)';

  @override
  String get superfanBadge5 => 'Fan (top 5 %)';

  @override
  String get tabAndroidAuto => 'Android Auto';

  @override
  String get androidAutoNotSupported =>
      'Android Auto n\'est pas disponible sur cet appareil.';

  @override
  String get androidAutoCategories => 'Rubriques';

  @override
  String get androidAutoPerformance => 'Performances';

  @override
  String get androidAutoShowRecent => 'Écouté récemment';

  @override
  String get androidAutoShowFavorites => 'Favoris';

  @override
  String get androidAutoShowAlbums => 'Albums';

  @override
  String get androidAutoShowArtists => 'Artistes';

  @override
  String get androidAutoShowPlaylists => 'Playlists';

  @override
  String get androidAutoShowGenres => 'Genres';

  @override
  String get androidAutoShowRadio => 'Radio';

  @override
  String get androidAutoShowDownloads => 'Téléchargements';

  @override
  String get androidAutoMaxItems => 'Nombre d\'éléments';

  @override
  String get androidAutoMaxItemsDesc =>
      'Nombre maximum d\'éléments chargés par rubrique';

  @override
  String get androidAutoNowPlaying => 'À l\'écoute';

  @override
  String get androidAutoRecent => 'Récents';

  @override
  String get androidAutoFavorites => 'Favoris';

  @override
  String get androidAutoAlbums => 'Albums';

  @override
  String get androidAutoArtists => 'Artistes';

  @override
  String get androidAutoPlaylists => 'Playlists';

  @override
  String get androidAutoGenres => 'Genres';

  @override
  String get androidAutoRadio => 'Radio';

  @override
  String get androidAutoDownloads => 'Téléchargements';

  @override
  String get androidAutoShuffle => 'Aléatoire';

  @override
  String get androidAutoQueue => 'File d\'attente';

  @override
  String get androidAutoEmptyFavorites => 'Aucun titre aimé';

  @override
  String get androidAutoEmptyRadio => 'Aucune radio';

  @override
  String get androidAutoEmptyDownloads => 'Aucun titre téléchargé';

  @override
  String get androidAutoLoading => 'Chargement…';

  @override
  String get androidAutoOnlineStream => 'Flux en ligne';

  @override
  String get androidAutoServerSection => 'Serveur';

  @override
  String get androidAutoDefaultServer => 'Serveur par défaut';

  @override
  String get androidAutoDefaultServerDesc =>
      'Le serveur utilisé quand Android Auto démarre';

  @override
  String get androidAutoUseActiveServer => 'Celui utilisé dans l\'app';

  @override
  String get colorIntensityLabel => 'Intensité des couleurs';

  @override
  String get colorIntensityNeutral => 'Neutre';

  @override
  String get colorIntensityVivid => 'Coloré';

  @override
  String get pureBlackLabel => 'Noir pur';

  @override
  String get pureBlackSubtitle =>
      'Fond noir en mode sombre, économise la batterie des écrans OLED';

  @override
  String get accentColorOctave => 'Bleu nuit Octave';

  @override
  String get welcomeTagline => 'Ta musique, à ta façon.';

  @override
  String get welcomeStart => 'Commencer';

  @override
  String get setupSkip => 'Passer';

  @override
  String get setupBack => 'Retour';

  @override
  String get setupContinue => 'Continuer';

  @override
  String get setupRecommended => 'Conseillé';

  @override
  String setupHelloTitle(String name) {
    return 'Bonjour $name';
  }

  @override
  String get setupHelloBody =>
      'Quelques questions pour régler Octave à ton goût. Compte environ deux minutes, et tout reste modifiable ensuite dans les Réglages.';

  @override
  String get setupHelloStart => 'Commencer';

  @override
  String get setupLater => 'Plus tard';

  @override
  String get setupColorTitle => 'Ta couleur';

  @override
  String get setupColorBody =>
      'Elle colore toute l\'app. Le bleu nuit est celui du logo.';

  @override
  String get setupModeTitle => 'Clair ou sombre';

  @override
  String get setupModeBody => 'Automatique suit le réglage du téléphone.';

  @override
  String get setupModeAuto => 'Automatique';

  @override
  String get setupModeLight => 'Clair';

  @override
  String get setupModeDark => 'Sombre';

  @override
  String get setupArtistsTitle => 'Tes artistes';

  @override
  String get setupArtistsBody =>
      'Choisis ceux que tu écoutes le plus. Ils deviennent tes favoris et inspirent tes mix.';

  @override
  String get setupArtistsEmpty =>
      'Aucun artiste dans ta bibliothèque pour l\'instant.';

  @override
  String setupArtistsContinue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Continuer avec $count artistes',
      one: 'Continuer avec 1 artiste',
    );
    return '$_temp0';
  }

  @override
  String get setupHomeTitle => 'Ton accueil';

  @override
  String get setupHomeBody =>
      'Choisis ce qui s\'affiche sur l\'écran d\'accueil.';

  @override
  String get setupHomeFavoritePlaylists => 'Playlists favorites';

  @override
  String get setupHomeFavoritePlaylistsDesc =>
      'Les playlists que tu as mises en favori, en haut.';

  @override
  String get setupHomeRecommendations => 'Mix pour toi';

  @override
  String get setupHomeRecommendationsDesc =>
      'Des suggestions selon ce que tu écoutes.';

  @override
  String get setupQualityTitle => 'Qualité du son';

  @override
  String get setupQualityBody =>
      'Plus la qualité est haute, plus les titres consomment de données. Octave choisit le format pour toi.';

  @override
  String get setupQualityWifi => 'En Wi-Fi';

  @override
  String get setupQualityMobile => 'En données mobiles';

  @override
  String get setupQualityBest => 'Meilleure qualité';

  @override
  String get setupQualityBestDesc =>
      'Fichier d\'origine, sans perte quand c\'est possible';

  @override
  String get setupQualityBalanced => 'Équilibrée';

  @override
  String get setupQualityBalancedDesc => 'Environ 85 Mo par heure';

  @override
  String get setupQualitySaver => 'Économie de données';

  @override
  String get setupQualitySaverDesc => 'Environ 60 Mo par heure';

  @override
  String get setupOfflineTitle => 'Hors connexion';

  @override
  String get setupOfflineBody =>
      'Les titres que tu aimes peuvent se télécharger tout seuls, pour les écouter sans réseau.';

  @override
  String get setupOfflineYes => 'Télécharger mes titres aimés';

  @override
  String get setupOfflineYesDesc =>
      'Chaque titre aimé est enregistré sur le téléphone.';

  @override
  String get setupOfflineNo => 'Je choisirai moi-même';

  @override
  String get setupOfflineNoDesc =>
      'Télécharge albums et playlists depuis leur menu.';

  @override
  String get setupPermissionsTitle => 'Autorisations';

  @override
  String get setupPermissionsBody =>
      'Deux autorisations pour que la musique continue écran éteint.';

  @override
  String get setupPermNotifications => 'Notifications';

  @override
  String get setupPermNotificationsDesc =>
      'Affiche le lecteur sur l\'écran verrouillé.';

  @override
  String get setupPermBattery => 'Batterie';

  @override
  String get setupPermBatteryDesc =>
      'Sans elle, certains téléphones coupent la musique écran éteint.';

  @override
  String get setupPermAllow => 'Autoriser';

  @override
  String get setupPermGranted => 'Autorisé';

  @override
  String get setupDoneTitle => 'C\'est prêt';

  @override
  String get setupDoneBody =>
      'Tout reste modifiable dans les Réglages. Tu peux aussi refaire cette configuration depuis À propos.';

  @override
  String get setupDoneStart => 'Commencer à écouter';

  @override
  String get setupSummaryColor => 'Couleur';

  @override
  String get setupSummaryMode => 'Affichage';

  @override
  String get setupSummaryArtists => 'Artistes favoris';

  @override
  String get setupSummaryWifi => 'Qualité en Wi-Fi';

  @override
  String get setupSummaryMobile => 'Qualité en données mobiles';

  @override
  String get setupSummaryOffline => 'Téléchargements automatiques';

  @override
  String get setupYes => 'Oui';

  @override
  String get setupNo => 'Non';

  @override
  String get setupRedoTitle => 'Refaire la configuration';

  @override
  String get setupRedoSubtitle =>
      'Couleur, affichage, artistes, qualité et téléchargements';

  @override
  String get colorNameOctave => 'Bleu nuit';

  @override
  String get colorNameRed => 'Rouge';

  @override
  String get colorNameOrange => 'Orange';

  @override
  String get colorNameYellow => 'Jaune';

  @override
  String get colorNameGreen => 'Vert';

  @override
  String get colorNameTeal => 'Bleu canard';

  @override
  String get colorNameBlue => 'Bleu';

  @override
  String get colorNamePink => 'Rose';

  @override
  String get colorNamePurple => 'Violet';

  @override
  String get colorNameDynamic => 'Couleurs du fond d\'écran';

  @override
  String get setupStyleTitle => 'Tes pochettes';

  @override
  String get setupStyleBody => 'Leur forme dans toute l\'app.';

  @override
  String get setupStyleRounded => 'Arrondies';

  @override
  String get setupStyleSquare => 'Carrées';

  @override
  String get setupStyleCircle => 'Rondes';

  @override
  String get setupSummaryCovers => 'Pochettes';

  @override
  String get filterMusic => 'Musique';

  @override
  String get homeJumpBackIn => 'Reprendre l\'écoute';

  @override
  String get homeListenAgain => 'À réécouter';

  @override
  String get homeTopHits => 'Tes incontournables';

  @override
  String get homeArtistsYouLove => 'Tes artistes';

  @override
  String get artistSingular => 'Artiste';

  @override
  String get songSingular => 'Titre';

  @override
  String get albumSingular => 'Album';

  @override
  String get sortRecents => 'Récents';

  @override
  String get sortAlphabetical => 'Alphabétique';

  @override
  String get sortCreator => 'Créateur';

  @override
  String get libraryLikedSongsSubtitle => 'Playlist • Favoris';

  @override
  String librarySongsSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titres hors connexion',
      one: '1 titre hors connexion',
      zero: 'Aucun titre hors connexion',
    );
    return '$_temp0';
  }

  @override
  String libraryPlaylistSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Playlist • $count titres',
      one: 'Playlist • 1 titre',
    );
    return '$_temp0';
  }

  @override
  String libraryAlbumSubtitle(String artist) {
    return 'Album • $artist';
  }

  @override
  String get switchToList => 'Afficher en liste';

  @override
  String get switchToGrid => 'Afficher en grille';

  @override
  String get librarySearchHint => 'Rechercher dans la bibliothèque…';

  @override
  String get librarySearchEmpty => 'Cherche dans ta bibliothèque';

  @override
  String get browseAll => 'Tout parcourir';

  @override
  String get genresAndMoods => 'Genres et ambiances';

  @override
  String get searchCategoryPop => 'Pop et tubes';

  @override
  String get searchCategoryHipHop => 'Hip-hop et rap';

  @override
  String get searchCategoryRock => 'Rock et alternatif';

  @override
  String get searchCategoryChill => 'Chill et détente';

  @override
  String searchNoResultsFor(String query) {
    return 'Aucun résultat pour « $query »';
  }

  @override
  String get searchNoResultsHint =>
      'Vérifie l\'orthographe ou essaie une autre recherche.';

  @override
  String get searchTopResult => 'Meilleur résultat';

  @override
  String get selectAll => 'Tout sélectionner';

  @override
  String get deselectAll => 'Tout désélectionner';

  @override
  String get radioHomepage => 'Site web';

  @override
  String aboutArtist(String name) {
    return 'À propos de $name';
  }

  @override
  String songAddedToQueue(String title) {
    return '« $title » ajouté à la file d\'attente';
  }

  @override
  String ratingFailed(String error) {
    return 'Impossible d\'enregistrer la note : $error';
  }

  @override
  String get connectChooseOutput => 'Choisis où jouer la musique';

  @override
  String get connectSpeakersTvs => 'Enceintes et TV';

  @override
  String get deviceWindowsPc => 'PC Windows';

  @override
  String get deviceMac => 'Mac';

  @override
  String get deviceLinuxPc => 'PC Linux';

  @override
  String get deviceIphone => 'iPhone';

  @override
  String get deviceThis => 'Cet appareil';

  @override
  String get playingOnThisDevice => 'Lecture sur cet appareil';

  @override
  String connectFailed(String name) {
    return 'Impossible de se connecter à $name';
  }

  @override
  String errorWithDetails(String error) {
    return 'Erreur : $error';
  }

  @override
  String get artworkSection => 'Pochettes';

  @override
  String get artworkResolution => 'Résolution des pochettes';

  @override
  String get artworkResLow => 'Basse (300 px)';

  @override
  String get artworkResNormal => 'Normale (600 px)';

  @override
  String get artworkResHigh => 'Haute (d\'origine)';

  @override
  String get autoDownloadFavorites => 'Télécharger les titres aimés';

  @override
  String get autoDownloadFavoritesSubtitle =>
      'Chaque titre aimé est enregistré pour l\'écoute hors connexion';

  @override
  String get castConnectedTooltip => 'Cast : connecté';

  @override
  String dlnaTooltip(String name) {
    return 'DLNA : $name';
  }

  @override
  String get dlnaDeviceFallback => 'appareil';

  @override
  String get dlnaControlInfo =>
      'La lecture est envoyée à cet appareil DLNA. Utilise les commandes d\'Octave pour la piloter.';

  @override
  String get connectionSlow => 'La connexion prend un peu de temps…';

  @override
  String get freeOnlineStreaming => 'Streaming en ligne gratuit';

  @override
  String get updateDownloadComplete => 'Téléchargement terminé';

  @override
  String updateDownloadFailed(String error) {
    return 'Le téléchargement a échoué : $error';
  }

  @override
  String get updateDefaultChangelog => 'Améliorations et corrections.';

  @override
  String get importEnterLink =>
      'Saisis le lien ou l\'identifiant d\'une playlist';

  @override
  String get importStarting => 'Démarrage de l\'import…';

  @override
  String get importSubtitle => 'Spotify ou YouTube Music, sans compte';

  @override
  String get importLinkHint => 'Colle un lien Spotify ou YouTube Music…';

  @override
  String get pasteFromClipboard => 'Coller depuis le presse-papiers';

  @override
  String get importLoadPreview => 'Afficher l\'aperçu';

  @override
  String get importPreviewTitle => 'Aperçu de la playlist';

  @override
  String importAuthor(String author) {
    return 'Par $author';
  }

  @override
  String importIncludedTracks(int count) {
    return 'Titres inclus ($count)';
  }

  @override
  String importButton(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Importer $count titres',
      one: 'Importer 1 titre',
    );
    return '$_temp0';
  }

  @override
  String get importInProgress => 'Import en cours…';

  @override
  String importTracksProgress(int current, int total) {
    return 'Titres : $current / $total';
  }

  @override
  String get importPreparing => 'Préparation des titres…';

  @override
  String get importSuccess => 'Playlist importée';

  @override
  String importReady(String name) {
    return '« $name » est prête à être écoutée';
  }

  @override
  String get openPlaylist => 'Ouvrir la playlist';

  @override
  String get disconnectConfirm => 'Se déconnecter de ce serveur ?';

  @override
  String get options => 'Options';

  @override
  String get hideQueue => 'Masquer la file d\'attente';

  @override
  String get mute => 'Couper le son';

  @override
  String get unmute => 'Rétablir le son';

  @override
  String get queueEmpty => 'La file d\'attente est vide';

  @override
  String nextUpCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'À suivre · $count titres',
      one: 'À suivre · 1 titre',
    );
    return '$_temp0';
  }

  @override
  String get lyricsSyncedBadge => 'Synchro';

  @override
  String get pausedBadge => 'En pause';

  @override
  String playbackYear(int year) {
    return 'Bilan $year';
  }

  @override
  String get autoDjOff => 'Désactivé';

  @override
  String get autoDjShuffleLibrary => 'Bibliothèque en aléatoire';

  @override
  String get autoDjSimilarSongs => 'Titres similaires';

  @override
  String get autoDjSameGenre => 'Même genre';

  @override
  String get autoDjSameArtist => 'Même artiste';

  @override
  String get autoDjSmartMix => 'Mix intelligent';
}
