// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Octave';

  @override
  String get goodMorning => 'Buon giorno';

  @override
  String get goodAfternoon => 'Buona sera';

  @override
  String get goodEvening => 'Buon pomeriggio';

  @override
  String get recentlyPlayed => 'Riprodotte Recentemente';

  @override
  String get yourPlaylists => 'Le Tue Playlist';

  @override
  String get favoritePlaylists => 'Favorite Playlists';

  @override
  String get sectionAlbums => 'Albums';

  @override
  String get sectionEPs => 'EPs';

  @override
  String get sectionSingles => 'Singles';

  @override
  String get madeForYou => 'Fatte Per Te';

  @override
  String get topRated => 'Più Votata';

  @override
  String get refresh => 'Aggiorna';

  @override
  String get errorLoadingSongs => 'Errore durante il caricamento delle canzoni';

  @override
  String get noSongsInGenre => 'Nessun brano in questo genere';

  @override
  String get errorLoadingAlbums => 'Errore nel caricamento degli album';

  @override
  String get login => 'Accedi';

  @override
  String get serverUrl => 'URL del Server';

  @override
  String get username => 'Nome Utente';

  @override
  String get password => 'Password';

  @override
  String get selectCertificate => 'Seleziona Certificato TLS/SSL';

  @override
  String failedToSelectCertificate(String error) {
    return 'Impossibile selezionare il certificato: $error';
  }

  @override
  String get serverUrlMustStartWith =>
      'L\'URL del server deve iniziare con http:// o https://';

  @override
  String get failedToConnect => 'Connessione fallita';

  @override
  String get library => 'Libreria';

  @override
  String get search => 'Cerca';

  @override
  String get settings => 'Impostazioni';

  @override
  String get albums => 'Album';

  @override
  String get artists => 'Artisti';

  @override
  String get songs => 'Brani';

  @override
  String get playlists => 'Playlist';

  @override
  String get genres => 'Generi';

  @override
  String get favorites => 'Preferiti';

  @override
  String get nowPlaying => 'In riproduzione';

  @override
  String get queue => 'Coda';

  @override
  String get lyrics => 'Testi';

  @override
  String get play => 'Riproduci';

  @override
  String get pause => 'Pausa';

  @override
  String get next => 'Successivo';

  @override
  String get previous => 'Precedente';

  @override
  String get shuffle => 'Casuale';

  @override
  String get repeat => 'Ripeti';

  @override
  String get addToPlaylist => 'Aggiungi alla Playlist';

  @override
  String get removeFromPlaylist => 'Rimuovi dalla Playlist';

  @override
  String get addToFavorites => 'Aggiungi ai Preferiti';

  @override
  String get removeFromFavorites => 'Rimuovi dai Preferiti';

  @override
  String get download => 'Scarica';

  @override
  String get delete => 'Cancella';

  @override
  String get cancel => 'Annulla';

  @override
  String get save => 'Salva';

  @override
  String get close => 'Chiudi';

  @override
  String get storage => 'Spazio di archiviazione';

  @override
  String get language => 'Lingua';

  @override
  String get version => 'Versione';

  @override
  String get unknownArtist => 'Artista sconosciuto';

  @override
  String get unknownAlbum => 'Album sconosciuto';

  @override
  String get playAll => 'Riproduci tutto';

  @override
  String get sortBy => 'Ordina Per';

  @override
  String get noLyricsAvailable => 'Nessun testo disponibile per questo brano';

  @override
  String get loading => 'Caricamento in corso...';

  @override
  String get error => 'Errore';

  @override
  String get retry => 'Riprova';

  @override
  String get allSongs => 'Tutti i Brani';

  @override
  String trackNumber(int number) {
    return 'Traccia $number';
  }

  @override
  String songsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count canzoni',
      one: '1 canzone',
      zero: 'Nessuna canzone',
    );
    return '$_temp0';
  }

  @override
  String albumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count album',
      one: '1 album',
      zero: 'Nessun album',
    );
    return '$_temp0';
  }

  @override
  String get logout => 'Logout';

  @override
  String get offlineMode => 'Modalità offline';

  @override
  String get radio => 'Radio';

  @override
  String get platform => 'Piattaforma';

  @override
  String get server => 'Server';

  @override
  String get playerInterface => 'Interfaccia Lettore';

  @override
  String get smartRecommendations => 'Raccomandazioni intelligenti';

  @override
  String get showVolumeSlider => 'Mostra Cursore Del Volume';

  @override
  String get showVolumeSliderSubtitle =>
      'Visualizza il controllo del volume nella schermata Ora in riproduzione';

  @override
  String get enableRecommendations => 'Attiva Raccomandazioni';

  @override
  String get enableRecommendationsSubtitle =>
      'Ottieni suggerimenti musicali personalizzati';

  @override
  String get listeningData => 'Dati Di Ascolto';

  @override
  String totalPlays(int count) {
    return '$count Riproduzioni Totali';
  }

  @override
  String get clearListeningHistory => 'Cancella Cronologia Ascolti';

  @override
  String get confirmClearHistory =>
      'Questo resetterà tutti i tuoi dati di ascolto e i tuoi consigli. Sei sicuro?';

  @override
  String get historyCleared => 'Cronologia di ascolto cancellata';

  @override
  String get selectLanguage => 'Seleziona lingua';

  @override
  String get systemDefault => 'Predefinita di Sistema';

  @override
  String get communityTranslations => 'Traduzioni da Community';

  @override
  String get communityTranslationsSubtitle =>
      'Aiuta a tradurre Octave su GitHub';

  @override
  String get yourLibrary => 'La Tua Libreria';

  @override
  String get filterAll => 'Tutto';

  @override
  String get filterPlaylists => 'Playlist';

  @override
  String get likedSongs => 'Brani preferiti';

  @override
  String get likedAlbums => 'Liked Albums';

  @override
  String get localMusicLibrary => 'Local Music Library';

  @override
  String get mergeLocalLibrary => 'Merge with Server Library';

  @override
  String get mergeLocalLibrarySubtitle =>
      'Show local music alongside your server library';

  @override
  String get localMusicStats => 'Local Music Files';

  @override
  String get addMusicFolder => 'Add Music Folder';

  @override
  String get rescanLocalMusic => 'Rescan Local Music';

  @override
  String get scanForMusic => 'Scan for Music';

  @override
  String get radioStations => 'Stazioni radio';

  @override
  String get playlist => 'Playlist';

  @override
  String get internetRadio => 'Radio Internet';

  @override
  String get newPlaylist => 'Nuova Playlist';

  @override
  String get playlistName => 'Nome Playlist';

  @override
  String get create => 'Crea';

  @override
  String get deletePlaylist => 'Elimina Playlist';

  @override
  String deletePlaylistConfirmation(String name) {
    return 'Sei sicuro di voler eliminare la playlist \"$name\"?';
  }

  @override
  String playlistDeleted(String name) {
    return 'Playlist \"$name\" eliminata';
  }

  @override
  String errorCreatingPlaylist(Object error) {
    return 'Errore nella creazione della playlist: $error';
  }

  @override
  String playlistCreated(String name) {
    return 'Playlist \"$name\" creata';
  }

  @override
  String get homeSection => 'Home';

  @override
  String get categoryNewReleases => 'Nuovi Rilasci';

  @override
  String get categoryRadio => 'Radio';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get tabPlayback => 'Riproduzione';

  @override
  String get tabStorage => 'Spazio di archiviazione';

  @override
  String get tabServer => 'Server';

  @override
  String get tabDisplay => 'Schermo';

  @override
  String get tabAbout => 'Informazioni';

  @override
  String get sectionAutoDj => 'AUTO DJ';

  @override
  String get autoDjMode => 'Modalità DJ Automatica';

  @override
  String songsToAdd(int count) {
    return 'Brani da aggiungere: $count';
  }

  @override
  String get replayGainMode => 'Modalità';

  @override
  String get sectionStreamingQuality => 'QUALITÀ DI STREAMING';

  @override
  String get format => 'Formato';

  @override
  String get serverType => 'Tipo di server';

  @override
  String get notConnected => 'Non connesso';

  @override
  String get unknown => 'Sconosciuto';

  @override
  String get musicFolders => 'Cartelle Musica';

  @override
  String get noMusicFolders => 'Nessuna cartella musicale trovata';

  @override
  String get switchProfile => 'Cambia Profilo';

  @override
  String get switchServer => 'Cambia Server';

  @override
  String get sectionAccount => 'ACCOUNT';

  @override
  String get logoutConfirmation =>
      'Sei sicuro di voler uscire? Questo cancellerà tutti i dati memorizzati nella cache.';

  @override
  String get imageCache => 'Cache delle immagini';

  @override
  String get sectionCacheCleanup => 'PULIZIA DELLA CACHE';

  @override
  String get clearAllCache => 'Svuota tutta la cache';

  @override
  String get allCacheCleared => 'Tutta la cache cancellata';

  @override
  String get sectionOfflineDownloads => 'DOWNLOAD OFFLINE';

  @override
  String get downloadedSongs => 'Brani Scaricati';

  @override
  String downloadingLibrary(int progress, int total) {
    return 'Scaricamento Della Libreria... $progress/$total';
  }

  @override
  String get downloadAllLibrary => 'Scarica Tutta La Libreria';

  @override
  String downloadLibraryConfirm(int count) {
    return 'Questo scaricherà  $count brani sul tuo dispositivo. Questo potrebbe richiedere un po\' di tempo e utilizzare uno spazio di archiviazione significativo.\n\nContinuare?';
  }

  @override
  String get libraryDownloadStarted => 'Download della libreria avviato';

  @override
  String get deleteDownloads => 'Elimina tutti i download';

  @override
  String get downloadsDeleted => 'Tutti i download eliminati';

  @override
  String get noSongsAvailable =>
      'Nessun brano disponibile. Carica prima la tua libreria.';

  @override
  String downloadedStats(int count, String size) {
    return '$count canzoni • $size';
  }

  @override
  String get removeFromLiked => 'Rimuovi dai brani aggiunti ai preferiti';

  @override
  String get addToLiked => 'Aggiungi alle canzoni preferite';

  @override
  String get playNext => 'Riproduci Successivo';

  @override
  String get addToQueue => 'Aggiungi alla coda';

  @override
  String get goToAlbum => 'Vai all\'album';

  @override
  String get goToArtist => 'Vai all\'artista';

  @override
  String get rateSong => 'Vota Brano';

  @override
  String rateSongValue(int rating, String stars) {
    return 'Valuta Canzone ($rating $stars)';
  }

  @override
  String get ratingRemoved => 'Valutazione rimossa';

  @override
  String rated(int rating, String stars) {
    return 'Votato $rating $stars';
  }

  @override
  String get removeRating => 'Rimuovi Voto';

  @override
  String get downloaded => 'Scaricato';

  @override
  String downloading(int percent) {
    return 'Scaricamento... $percent%';
  }

  @override
  String get removeDownload => 'Rimuovi download';

  @override
  String get removeDownloadConfirm =>
      'Rimuovere questa canzone dalla memoria offline?';

  @override
  String get downloadRemoved => 'Download rimosso';

  @override
  String downloadedTitle(String title) {
    return 'Scaricato \"$title\"';
  }

  @override
  String get downloadFailed => 'Download fallito';

  @override
  String downloadError(Object error) {
    return 'Errore di download: $error';
  }

  @override
  String addedToPlaylist(String title, String playlist) {
    return 'Aggiunto \"$title\" alla $playlist';
  }

  @override
  String errorAddingToPlaylist(Object error) {
    return 'Errore nell\'aggiungere alla playlist: $error';
  }

  @override
  String get noPlaylists => 'Nessuna playlist disponibile';

  @override
  String artistNotFound(String name) {
    return 'Artista \"$name\" non trovato';
  }

  @override
  String errorSearchingArtist(Object error) {
    return 'Errore cercando l\'artista: $error';
  }

  @override
  String get removedFromFavorites => 'Rimosso dai preferiti';

  @override
  String get addedToFavorites => 'Aggiunto ai preferiti';

  @override
  String get star => 'stella';

  @override
  String get stars => 'stelle';

  @override
  String get albumNotFound => 'Album non trovato';

  @override
  String get topSongs => 'Canzoni più ascoltate';

  @override
  String get connected => 'Collegato';

  @override
  String get noSongPlaying => 'Nessuna brano in riproduzione';

  @override
  String get playlistNameHint => 'Nome della playlist';

  @override
  String errorLoadingPlaylists(Object error) {
    return 'Errore nel caricare le playlist: $error';
  }

  @override
  String get playlistNotFound => 'Playlist non trovata';

  @override
  String get noSongsInPlaylist => 'Nessun brano in questa playlist';

  @override
  String get noFavoriteSongsYet => 'Ancora nessuna canzone preferita';

  @override
  String get noFavoriteAlbumsYet => 'Ancora nessun album preferito';

  @override
  String get listeningHistory => 'Cronologia Ascolti';

  @override
  String get sortByTitleAZ => 'Titolo (A-Z)';

  @override
  String get sortByTitleZA => 'Titolo (Z-A)';

  @override
  String get sortByArtistAZ => 'Artista (A-Z)';

  @override
  String get sortByAlbumAZ => 'Album (A-Z)';

  @override
  String get recentlyAdded => 'Aggiunto di Recente';

  @override
  String get noSongsFound => 'Nessuna canzone trovata';

  @override
  String get noAlbumsFound => 'Nessun album trovato';

  @override
  String get noHomepageUrl => 'Nessun URL di homepage disponibile';

  @override
  String get copyStreamUrl => 'Copia URL streaming';

  @override
  String get failedToLoadRadioStations =>
      'Impossibile caricare le stazioni radio';

  @override
  String get noRadioStations => 'Nessuna stazione radio';

  @override
  String get connectToServerSubtitle => 'Connettiti al tuo server Subsonic';

  @override
  String get pleaseEnterServerUrl => 'Inserisci l\'URL del server';

  @override
  String get invalidUrlFormat => 'L\'URL deve iniziare con http:// o https://';

  @override
  String get pleaseEnterUsername => 'Inserisci il nome utente';

  @override
  String get pleaseEnterPassword => 'Inserisci la password';

  @override
  String get legacyAuthentication => 'Autenticazione Legacy';

  @override
  String get legacyAuthSubtitle => 'Usa per vecchi server Subsonic';

  @override
  String get allowSelfSignedCerts => 'Consenti Certificati Auto-Firmati';

  @override
  String get allowSelfSignedSubtitle =>
      'Per server con certificati TLS/SSL personalizzati';

  @override
  String get advancedOptions => 'Opzioni Avanzate';

  @override
  String get customTlsCertificate => 'Certificato TLS/Ssl Personalizzato';

  @override
  String get customCertificateSubtitle =>
      'Carica un certificato personalizzato per server con CA non standard';

  @override
  String get selectCertificateFile => 'Seleziona il file del certificato';

  @override
  String get clientCertificate => 'Certificato Client (mTLS)';

  @override
  String get clientCertificateSubtitle =>
      'Autenticare questo client utilizzando un certificato (richiede un server abilitato per mTLS)';

  @override
  String get selectClientCertificate => 'Seleziona Certificato Client';

  @override
  String get clientCertPassword => 'Password del certificato (opzionale)';

  @override
  String failedToSelectClientCert(String error) {
    return 'Impossibile selezionare il certificato: $error';
  }

  @override
  String get connect => 'Connetti';

  @override
  String get useLocalFiles => 'Usa File Locali';

  @override
  String get startingScan => 'Avvio scansione...';

  @override
  String get storagePermissionRequired => 'Permesso di archiviazione richiesto';

  @override
  String get noMusicFilesFound =>
      'Nessun file musicale trovato sul tuo dispositivo';

  @override
  String get remove => 'Rimuovi';

  @override
  String failedToSetRating(Object error) {
    return 'Impossibile impostare la valutazione: $error';
  }

  @override
  String get home => 'Home';

  @override
  String get collapse => 'Comprimi';

  @override
  String get expand => 'Espandi';

  @override
  String get createPlaylist => 'Crea playlist';

  @override
  String get checkForUpdates => 'Verifica aggiornamenti';

  @override
  String get checkingForUpdates => 'Verifica aggiornamenti in corso...';

  @override
  String get appUpToDate => 'Octave è aggiornato';

  @override
  String get updateAvailable => 'Aggiornamento disponibile';

  @override
  String get updateNow => 'Aggiorna ora';

  @override
  String get openOnGitHub => 'Apri su GitHub';

  @override
  String get skipThisVersion => 'Salta questa versione';

  @override
  String get localFilesModeBanner => 'Modalità File Locali';

  @override
  String get offlineModeBanner =>
      'Modalità offline – Solo riproduzione di musica scaricata';

  @override
  String get whatsNew => 'Cosa c\'è di nuovo';

  @override
  String get remindLater => 'Dopo';

  @override
  String get seeAll => 'Vedi tutti';

  @override
  String get artistDataNotFound => 'Artista non trovato';

  @override
  String get addedArtistToQueue => 'Added artist to Queue';

  @override
  String get addedArtistToQueueError => 'Failed adding artist to Queue';

  @override
  String get casting => 'In trasmissione';

  @override
  String get disconnect => 'Disconnetti';

  @override
  String get removedFromLikedSongs => 'Rimosso da brani che ti piacciono';

  @override
  String get addedToLikedSongs => 'Aggiunto a brani che ti piacciono';

  @override
  String get connecting => 'In connessione';

  @override
  String errorStartingDownload(Object error) {
    return 'Errore nell\'avvio del download: $error';
  }

  @override
  String get errorLoadingGenres => 'Errore nel caricamento dei generi';

  @override
  String get noGenresFound => 'Nessun genere trovato';

  @override
  String get noAlbumsInGenre => 'Nessun album in questo genere';

  @override
  String genreTooltip(int songCount, int albumCount) {
    return '$songCount canzoni • $albumCount album';
  }

  @override
  String get jukeboxMode => 'Modalità Jukebox';

  @override
  String get jukeboxClearQueue => 'Cancella la coda';

  @override
  String get jukeboxQueueEmpty => 'Nessuna canzone in coda';

  @override
  String get playOnJukebox => 'Riproduci su Jukebox';

  @override
  String get addToJukeboxQueue => 'Aggiungi alla coda di Jukebox';

  @override
  String get jukeboxNotSupported =>
      'La modalità Jukebox non è supportata da questo server. Abilitarla nella configurazione del server (ad es. EnableJukebox = true in Navidrome).';

  @override
  String get musicFoldersHint =>
      'Lascia tutto abilitato per usare tutte le cartelle (predefinito).';

  @override
  String get serverUnreachableTitle => 'Impossibile raggiungere il server';

  @override
  String get serverUnreachableSubtitle =>
      'Controllare la connessione o le impostazioni del server.';

  @override
  String get openOfflineMode => 'Apri in modalità offline';

  @override
  String get appearanceSection => 'Aspetto';

  @override
  String get themeLabel => 'Tema';

  @override
  String get accentColorLabel => 'Tema colore';

  @override
  String get circularDesignLabel => 'Design Circolare';

  @override
  String get circularDesignSubtitle =>
      'UI galleggiante e arrotondata con pannelli traslucidi ed effetto sfocatura di vetro sul lettore e sulla barra di navigazione.';

  @override
  String get themeModeSystem => 'Sistema';

  @override
  String get themeModeLight => 'Chiaro';

  @override
  String get themeModeDark => 'Scuro';

  @override
  String get liveLabel => 'LIVE';

  @override
  String get sectionVolumeNormalization =>
      'NORMALIZZAZIONE VOLUME (REPLAYGAIN)';

  @override
  String get sectionFadeInOut => 'FADE IN/OUT';

  @override
  String get fadeInOutEnable => 'Enable Fade In/Out';

  @override
  String get fadeInOutSubtitle => 'Smoothly fade audio when playing or pausing';

  @override
  String fadeDuration(int duration) {
    return 'Fade Duration: ${duration}ms';
  }

  @override
  String get replayGainModeOff => 'Off';

  @override
  String get replayGainModeTrack => 'Traccia';

  @override
  String get replayGainModeAlbum => 'Album';

  @override
  String replayGainPreamp(String value) {
    return 'Preamp: $value dB';
  }

  @override
  String get replayGainPreventClipping => 'Previeni Il Clipping';

  @override
  String replayGainFallbackGain(String value) {
    return 'Guadagno Fallback: $value dB';
  }

  @override
  String autoDjSongsToAdd(int count) {
    return 'Brani da aggiungere: $count';
  }

  @override
  String get transcodingEnable => 'Abilita La Transcodifica';

  @override
  String get transcodingEnableSubtitle =>
      'Riduce l\'utilizzo dei dati con qualità inferiore';

  @override
  String get smartTranscoding => 'Trascodifica Intelligente';

  @override
  String get smartTranscodingSubtitle =>
      'Regola automaticamente la qualità in base alla tua connessione (WiFi vs dati mobili)';

  @override
  String get smartTranscodingDetectedNetwork => 'Rete rilevata: ';

  @override
  String smartTranscodingActiveBitrate(String bitrate) {
    return 'Bitrate attivo $bitrate';
  }

  @override
  String get transcodingWifiQuality => 'Qualità WiFi';

  @override
  String get transcodingWifiQualitySubtitleSmart =>
      'Usato automaticamente su WiFi';

  @override
  String get transcodingWifiQualitySubtitle => 'Bitrate quando su WiFi';

  @override
  String get transcodingMobileQuality => 'Qualità Mobile';

  @override
  String get transcodingMobileQualitySubtitleSmart =>
      'Utilizzato automaticamente su dati cellulari';

  @override
  String get transcodingMobileQualitySubtitle =>
      'Bitrate quando su dati mobili';

  @override
  String get transcodingFormat => 'Formato';

  @override
  String get transcodingFormatSubtitle =>
      'Codec audio utilizzato per lo streaming';

  @override
  String get transcodingBitrateOriginal => 'Originale (Nessuna Transcodifica)';

  @override
  String get transcodingFormatOriginal => 'Originale';

  @override
  String get sectionAboutInformation => 'INFORMAZIONI';

  @override
  String get sectionAboutDeveloper => 'SVILUPPATORE';

  @override
  String get sectionAboutLinks => 'LINKS';

  @override
  String get aboutVersion => 'Versione';

  @override
  String get aboutPlatform => 'Piattaforma';

  @override
  String get aboutMadeBy => 'Realizzato da dddevid';

  @override
  String get aboutGitHub => 'github.com/ddddevid';

  @override
  String get aboutLinkGitHub => 'Repository GitHub';

  @override
  String get aboutLinkChangelog => 'Changelog';

  @override
  String get aboutLinkReportIssue => 'Segnala un problema';

  @override
  String get playbackSpeed => 'Playback Speed';

  @override
  String get preservePitch => 'Preserve pitch';

  @override
  String get preservePitchSubtitle => 'Keep original pitch when changing speed';

  @override
  String get sleepTimer => 'Sleep Timer';

  @override
  String sleepTimerMinutes(int count) {
    return '$count min';
  }

  @override
  String get done => 'Done';

  @override
  String get audioFocusDenied =>
      'Couldn\'t start playback — another app has audio focus';

  @override
  String get addToLibrary => 'Add to Library';

  @override
  String get alreadyInLibrary => 'Song already in server library';

  @override
  String get selectPlaylist => 'Seleziona Playlist';

  @override
  String get endOfSong => 'Fine Brano';

  @override
  String get connectToDevice => 'Connetti a un Dispositivo';

  @override
  String get wrappedSeasonal => 'Octave Playback è Stagionale';

  @override
  String get playYourTopSongs => 'Riproduci i tuoi brani top';

  @override
  String get lyricsDisplaySection => 'VISUALIZZAZIONE TESTO';

  @override
  String get lyricsKeepScreenOn => 'Tieni schermo acceso';

  @override
  String get lyricsKeepScreenOnSubtitle =>
      'Evita che lo schermo si spenga durante la visualizzazione dei testi';

  @override
  String get hideWindowTitlebar =>
      'Nascondi barra del titolo / decorazioni della finestra';

  @override
  String get hideWindowTitlebarSubtitle =>
      'Nasconde la barra del titolo nativa (utile per Linux Wayland e tiling window manager)';

  @override
  String get sectionSmartCrossfade => 'SMART CROSSFADE';

  @override
  String get trackCrossfade => 'Dissolvenza incrociata tra i brani';

  @override
  String get crossfadeOffSubtitle => 'Disattivata (Transizione istantanea)';

  @override
  String crossfadeDurationSubtitle(int seconds) {
    return '$seconds secondi di dissolvenza incrociata tra i brani';
  }

  @override
  String crossfadeDurationBadge(int seconds) {
    return '${seconds}s';
  }

  @override
  String get sectionGaplessPlayback => 'RIPRODUZIONE SENZA PAUSE';

  @override
  String get gaplessPlayback => 'Riproduzione senza pause';

  @override
  String get gaplessPlaybackSubtitle => 'Elimina il silenzio tra i brani';

  @override
  String get networkWifi => 'WiFi';

  @override
  String get networkMobile => 'Dati mobili';

  @override
  String get activeDownloads => 'Download attivi';

  @override
  String get noDownloadsInProgress => 'Nessun download in corso';

  @override
  String get playlistDownloads => 'Download playlist';

  @override
  String playlistSongsDownloadedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count brani scaricati',
      one: '1 brano scaricato',
    );
    return '$_temp0';
  }

  @override
  String totalCacheDiskUsage(String size) {
    return 'Totale cache: $size';
  }

  @override
  String folderAdded(String path) {
    return 'Cartella aggiunta: $path';
  }

  @override
  String get removeFolderTitle => 'Rimuovi cartella';

  @override
  String removeFolderConfirm(String path) {
    return 'Rimuovere \"$path\" dai percorsi di scansione?';
  }

  @override
  String get folderRemoved => 'Cartella rimossa';

  @override
  String get loadingLibrary => 'Caricamento libreria in corso...';

  @override
  String get libraryEmptyError =>
      'La libreria sembra vuota o non è stato possibile caricarla. Assicurati che il tuo server supporti la scansione completa della libreria.';

  @override
  String get serverStatusConnected => 'CONNESSO';

  @override
  String get serverStatusConnecting => 'CONNESSIONE';

  @override
  String get serverStatusOffline => 'OFFLINE';

  @override
  String get serverStatusNotConnected => 'Non connesso';

  @override
  String get switchServerButton => 'Cambia';

  @override
  String get savedServersSection => 'SERVER E SERVIZI SALVATI';

  @override
  String get manage => 'Gestisci';

  @override
  String get serverActiveBadge => 'ATTIVO';

  @override
  String get addServerOrService => 'Aggiungi server o servizio';

  @override
  String get muslyPlaybackDev => 'Anteprima Playback (Modalità Test)';

  @override
  String get muslyPlaybackDevSubtitle =>
      'Esplora direttamente l\'anteprima del tuo Year-in-Review senza attendere novembre';

  @override
  String get muslyPlaybackAnnual => 'Octave Playback';

  @override
  String get muslyPlaybackAnnualSubtitle =>
      'Il tuo Year-in-Review annuale si sblocca automaticamente ogni anno tra fine novembre e metà gennaio.\n\nContinua ad ascoltare musica per espandere il tuo universo sonoro!';

  @override
  String devPlaybackTapsAway(int count) {
    return 'A $count tocchi dall\'anteprima sviluppatore di Playback';
  }

  @override
  String get devPlaybackUnlocked =>
      'Anteprima sviluppatore di Playback sbloccata!';

  @override
  String get switchServerTitle => 'Cambia server';

  @override
  String get switchServerSubtitle =>
      'Seleziona un server attivo o una sorgente di streaming';

  @override
  String get addServerButton => 'Aggiungi server';

  @override
  String get noServersSavedYet => 'Nessun server salvato';

  @override
  String connectedTo(String name) {
    return 'Connesso a $name';
  }

  @override
  String errorConnectingServer(String error) {
    return 'Errore durante la connessione al server: $error';
  }

  @override
  String get renameServerProfile => 'Rinomina profilo server';

  @override
  String get profileNameLabel => 'Nome profilo';

  @override
  String get enterNewNameHint => 'Inserisci nuovo nome';

  @override
  String get removeServerTitle => 'Rimuovi server';

  @override
  String removeServerConfirm(String name) {
    return 'Sei sicuro di voler rimuovere \"$name\" dai server salvati?';
  }

  @override
  String get noPlaylistsFound => 'Nessuna playlist trovata';

  @override
  String get addAllToQueue => 'Aggiungi tutti alla coda';

  @override
  String songsAddedToQueue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count brani aggiunti alla coda',
      one: '1 brano aggiunto alla coda',
    );
    return '$_temp0';
  }

  @override
  String get searchInAlbum => 'Cerca nell\'album';

  @override
  String get searchInPlaylist => 'Cerca nella playlist';

  @override
  String get filterTracks => 'Filtra tracce...';

  @override
  String get filterSongs => 'Filtra brani...';

  @override
  String get noSongsInQueue => 'Nessun brano in coda';

  @override
  String get moreOptions => 'Altre opzioni';

  @override
  String get upNext => 'In coda';

  @override
  String get removeSelected => 'Rimuovi selezionati';

  @override
  String get reorderSongs => 'Riordina brani';

  @override
  String get selectSongs => 'Seleziona brani';

  @override
  String get doneReordering => 'Fine riordinamento';

  @override
  String get downloadAlbum => 'Scarica album';

  @override
  String get downloadPlaylist => 'Scarica playlist';

  @override
  String get downloadedTapToRemove => 'Scaricato — tocca per rimuovere';

  @override
  String get downloadingTapToCancel =>
      'Download in corso — tocca per annullare';

  @override
  String get removeDownloadsTitle => 'Rimuovere i download?';

  @override
  String removeAlbumDownloadsConfirm(int count, String name) {
    return 'Rimuovere tutti i $count brani scaricati da \"$name\"?';
  }

  @override
  String removePlaylistDownloadsConfirm(int count, String name) {
    return 'Rimuovere tutti i $count brani scaricati da \"$name\"?';
  }

  @override
  String queuedSongsForDownload(int count) {
    return 'Messi in coda $count brani per il download…';
  }

  @override
  String get songRemovedFromPlaylist => 'Brano rimosso dalla playlist';

  @override
  String errorRemovingSong(String error) {
    return 'Errore durante la rimozione del brano: $error';
  }

  @override
  String errorReorderingSong(String error) {
    return 'Errore durante il riordino del brano: $error';
  }

  @override
  String get removeSongsTitle => 'Rimuovi brani';

  @override
  String removePlaylistSongsConfirm(int count, String name) {
    return 'Rimuovere $count brani da \"$name\"?';
  }

  @override
  String removedSongsFromPlaylist(int count) {
    return 'Rimossi $count brani dalla playlist';
  }

  @override
  String get alreadyInPlaylist => 'Già nella playlist';

  @override
  String alreadyInPlaylistConfirm(String title, String playlist) {
    return '\"$title\" è già presente in \"$playlist\". Vuoi aggiungerlo comunque?';
  }

  @override
  String get addAnyway => 'Aggiungi comunque';

  @override
  String get offlineModeQuestion => 'Modalità offline?';

  @override
  String get drumroll => 'RULLO DI TAMBURI...';

  @override
  String get readyToDiscoverTopSong => 'Pronto a scoprire\nla tua canzone #1?';

  @override
  String get tapToBegin => 'Tocca per iniziare';

  @override
  String get minutesListened => 'MINUTI ASCOLTATI';

  @override
  String get totalHours => 'Ore totali';

  @override
  String get uniqueTracks => 'Brani unici';

  @override
  String get topSongsHeader => 'BRANI PREFERITI';

  @override
  String get yourMostListenedSongs => 'I tuoi brani più ascoltati';

  @override
  String get topArtistsHeader => 'I TUOI ARTISTI TOP';

  @override
  String playsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ascolti',
      one: '1 ascolto',
    );
    return '$_temp0';
  }

  @override
  String get topSongBadge => 'Brano #1';

  @override
  String get topArtistMetric => 'Top Artista';

  @override
  String get genreMetric => 'Genere';

  @override
  String get muslyPlaybackHeader => 'OCTAVE PLAYBACK';

  @override
  String get minutes => 'Minuti';

  @override
  String get nowPlayingHeader => 'IN RIPRODUZIONE';

  @override
  String get stop => 'Stop';

  @override
  String get closeQueue => 'Chiudi Coda';

  @override
  String get timerOff => 'Disattivo';

  @override
  String get history => 'Cronologia';

  @override
  String get searchInLibrary => 'Cerca nella Libreria';

  @override
  String get add => 'Aggiungi';

  @override
  String get clear => 'Cancella';

  @override
  String get back => 'Indietro';

  @override
  String get radios => 'Radio';

  @override
  String get downloads => 'Download';

  @override
  String get noDownloadedSongsYet => 'Nessun brano scaricato';

  @override
  String get noDownloadedAlbumsYet => 'Nessun album scaricato';

  @override
  String get allowSelfSignedCertificatesSubtitle =>
      'Utile per reti LAN locali o certificati SSL autofirmati';

  @override
  String get legacyAuthenticationSubtitle =>
      'Richiesto per versioni legacy delle API Subsonic';

  @override
  String get certificateFileSubtitle => 'File .crt, .pem o .cer';

  @override
  String get clientIdentityFileSubtitle =>
      'File di identità client .p12 o .pfx';

  @override
  String get copyError => 'Copia errore';

  @override
  String get errorCopiedToClipboard => 'Errore copiato negli appunti';

  @override
  String get failedToUpdateFavorite =>
      'Impossibile aggiornare lo stato preferito';

  @override
  String queuedSongsFromAlbumsForDownload(int songCount, int albumCount) {
    return 'Messi in coda $songCount brani da $albumCount album per il download…';
  }

  @override
  String get downloadAllAlbums => 'Scarica tutti gli album';

  @override
  String get downloadAllFavorites => 'Scarica tutti i preferiti';

  @override
  String get downloadAll => 'Scarica tutto';

  @override
  String get createPlaylistSubtitle =>
      'Crea una playlist personalizzata con i tuoi brani preferiti';

  @override
  String get addMusicSource => 'Aggiungi Sorgente Musicale';

  @override
  String get addMusicSourceSubtitle =>
      'Connetti Navidrome, Jellyfin o Web Stream';

  @override
  String get removeFromFavoritesTitle => 'Rimuovere dai Preferiti?';

  @override
  String removeFromFavoritesConfirm(String title) {
    return 'Vuoi rimuovere \"$title\" dai preferiti?';
  }

  @override
  String failedToRemove(String error) {
    return 'Impossibile rimuovere: $error';
  }

  @override
  String streamUrlLabel(String url) {
    return 'URL Stream: $url';
  }

  @override
  String get shuffleNewSelection => 'Riproduci casualmente nuova selezione';

  @override
  String get sortDurationLongest => 'Durata (Dal più lungo)';

  @override
  String get connectToServer => 'Connettiti al Server';

  @override
  String get renameProfile => 'Rinomina Profilo';

  @override
  String get recentSearches => 'Ricerche recenti';

  @override
  String get createPlaylistToGetStarted => 'Crea una playlist per iniziare';

  @override
  String get addRadioStationsHint =>
      'Aggiungi stazioni radio nelle impostazioni del tuo server per vederle qui.';

  @override
  String get skip => 'Salta';

  @override
  String get profileNameOptional => 'Nome Profilo (Opzionale)';

  @override
  String get serverUrlRequired => 'URL del Server *';

  @override
  String get lanServerUrlOptional => 'URL Server LAN (Opzionale)';

  @override
  String get usernameRequired => 'Nome Utente *';

  @override
  String get passwordRequired => 'Password *';

  @override
  String get whatDoYouWantToPlay => 'Cosa vuoi ascoltare?';

  @override
  String get noLyricsFound => 'Nessun testo disponibile';

  @override
  String get dynamicColor => 'Material You (Colore dinamico)';

  @override
  String get muslyPlayback => 'Octave Playback';

  @override
  String get synthesizingUniverse => 'Sintetizzando il tuo universo sonoro';

  @override
  String get getReadyForBeatDrop => 'Preparati al drop sonoro...';

  @override
  String yourYearInSound(int year) {
    return 'Il tuo $year\nin Musica';
  }

  @override
  String get yourYearInSoundSubtitle =>
      'Hai esplorato profondità sonore, rivissuto momenti e creato ricordi attraverso la musica.';

  @override
  String get yourMusicalChronotype => 'IL TUO CRONOTIPO MUSICALE';

  @override
  String get genreGalaxy => 'GALASSIA DEI GENERI';

  @override
  String get soundsThatGuidedYou => 'I suoni che ti hanno guidato';

  @override
  String get yourMusicalAnchors => 'I tuoi pilastri musicali';

  @override
  String get yourListeningPersonality => 'LA TUA PERSONALITÀ MUSICALE';

  @override
  String get yourYearInReviewIsReady => 'Il tuo Year in Review è pronto!';

  @override
  String get chronotypeMidnightWanderer => 'Esploratore Notturno 🌙';

  @override
  String get chronotypeMidnightWandererDesc =>
      'I tuoi momenti musicali più profondi avvengono a tarda notte, quando il mondo tace.';

  @override
  String get chronotypeSunriseHarmonizer => 'Armonizzatore dell\'Alba ☀️';

  @override
  String get chronotypeSunriseHarmonizerDesc =>
      'Inizi ogni mattina con ritmo, impostando la colonna sonora per l\'intera giornata.';

  @override
  String get chronotypeAfternoonFlow => 'Flusso del Pomeriggio ⚡';

  @override
  String get chronotypeAfternoonFlowDesc =>
      'Il pomeriggio è il tuo momento clou per l\'ascolto, alimentando la tua energia con suoni carichi di ritmo.';

  @override
  String get chronotypeTwilightLounger => 'Sognatore del Crepuscolo 🌆';

  @override
  String get chronotypeTwilightLoungerDesc =>
      'Le serate sono fatte per rilassarsi e perdersi in viaggi immersivi tra gli album.';

  @override
  String get archetypeLuminary => 'Il Luminare';

  @override
  String get archetypeLuminaryBadge => 'ESPLORATORE SONORO';

  @override
  String get archetypeLuminaryDesc =>
      'Porti alla luce generi diversi e cerchi costantemente nuovi orizzonti musicali.';

  @override
  String get archetypeLuminaryTrait1 => 'Gusto Eclettico';

  @override
  String get archetypeLuminaryTrait2 => 'Fluido tra Generi';

  @override
  String get archetypeLuminaryTrait3 => 'Alta Scoperta';

  @override
  String get archetypeDevotee => 'Il Devoto';

  @override
  String get archetypeDevoteeBadge => 'SUPERFAN';

  @override
  String get archetypeDevoteeDesc =>
      'Quando ami un artista o un album, lo ascolti a ripetizione con dedizione senza pari.';

  @override
  String get archetypeDevoteeTrait1 => 'Profonda Fedeltà';

  @override
  String get archetypeDevoteeTrait2 => 'Ascoltatore di Album';

  @override
  String get archetypeDevoteeTrait3 => 'Legame Emotivo';

  @override
  String get archetypeNightOwl => 'Il Gufo Notturno';

  @override
  String get archetypeNightOwlBadge => 'VIBRAZIONI NOTTURNE';

  @override
  String get archetypeNightOwlDesc =>
      'La tua anima appartiene ai paesaggi sonori di mezzanotte, accordi d\'atmosfera e sessioni sotto le stelle.';

  @override
  String get archetypeNightOwlTrait1 => 'Atmosferico';

  @override
  String get archetypeNightOwlTrait2 => 'Introspettivo';

  @override
  String get archetypeNightOwlTrait3 => 'Flusso Notturno';

  @override
  String get archetypeSunrise => 'L\'Armonizzatore dell\'Alba';

  @override
  String get archetypeSunriseBadge => 'CATALIZZATORE D\'ENERGIA';

  @override
  String get archetypeSunriseDesc =>
      'Svegli il mondo con vibrazioni positive e lasci che melodie ottimiste accendano la tua giornata.';

  @override
  String get archetypeSunriseTrait1 => 'Coinvolgente';

  @override
  String get archetypeSunriseTrait2 => 'Energia Mattutina';

  @override
  String get archetypeSunriseTrait3 => 'Carica Ritmica';

  @override
  String get archetypeAlchemist => 'L\'Alchimista Sonoro';

  @override
  String get archetypeAlchemistBadge => 'CURATORE DI VIBRAZIONI';

  @override
  String get archetypeAlchemistDesc =>
      'Trasformi i momenti quotidiani in esperienze cinematografiche con colonne sonore perfettamente curate.';

  @override
  String get archetypeAlchemistTrait1 => 'Istinto da Curatore';

  @override
  String get archetypeAlchemistTrait2 => 'Vibrazione Cinematografica';

  @override
  String get archetypeAlchemistTrait3 => 'Maestro d\'Atmosfera';

  @override
  String get percentileTop05 => 'Top 0.5% Ascoltatore Globale';

  @override
  String get percentileTop1 => 'Top 1% Ascoltatore Globale';

  @override
  String get percentileTop5 => 'Top 5% Ascoltatore Globale';

  @override
  String get percentileTop10 => 'Top 10% Ascoltatore Globale';

  @override
  String get percentileTopAficionado => 'Top Appassionato di Musica';

  @override
  String get superfanBadge01 => 'Top 0.1% Superfan';

  @override
  String get superfanBadge1 => 'Top 1% Fan';

  @override
  String get superfanBadge5 => 'Top 5% Fan';

  @override
  String get tabAndroidAuto => 'Android Auto';

  @override
  String get androidAutoNotSupported =>
      'Android Auto non è supportato su questo dispositivo.';

  @override
  String get androidAutoCategories => 'Categorie';

  @override
  String get androidAutoPerformance => 'Prestazioni';

  @override
  String get androidAutoShowRecent => 'Mostra Recenti';

  @override
  String get androidAutoShowFavorites => 'Mostra Preferiti';

  @override
  String get androidAutoShowAlbums => 'Mostra Album';

  @override
  String get androidAutoShowArtists => 'Mostra Artisti';

  @override
  String get androidAutoShowPlaylists => 'Mostra Playlist';

  @override
  String get androidAutoShowGenres => 'Mostra Generi';

  @override
  String get androidAutoShowRadio => 'Mostra Radio';

  @override
  String get androidAutoShowDownloads => 'Mostra Scaricati';

  @override
  String get androidAutoMaxItems => 'Limite Elementi';

  @override
  String get androidAutoMaxItemsDesc =>
      'Numero massimo di elementi da caricare per categoria';

  @override
  String get androidAutoNowPlaying => 'Ora in Riproduzione';

  @override
  String get androidAutoRecent => 'Recenti';

  @override
  String get androidAutoFavorites => 'Preferiti';

  @override
  String get androidAutoAlbums => 'Album';

  @override
  String get androidAutoArtists => 'Artisti';

  @override
  String get androidAutoPlaylists => 'Playlist';

  @override
  String get androidAutoGenres => 'Generi';

  @override
  String get androidAutoRadio => 'Radio';

  @override
  String get androidAutoDownloads => 'Scaricati';

  @override
  String get androidAutoShuffle => 'Riproduzione Casuale';

  @override
  String get androidAutoQueue => 'Coda';

  @override
  String get androidAutoEmptyFavorites => 'Nessun brano nei preferiti';

  @override
  String get androidAutoEmptyRadio => 'Nessuna stazione radio configurata';

  @override
  String get androidAutoEmptyDownloads => 'Nessun brano scaricato';

  @override
  String get androidAutoDefaultServer => 'Server Predefinito';

  @override
  String get androidAutoDefaultServerDesc =>
      'Seleziona quale server usare quando avvii Android Auto';

  @override
  String get androidAutoUseActiveServer => 'Usa server attivo dell\'app';

  @override
  String get colorIntensityLabel => 'Color intensity';

  @override
  String get colorIntensityNeutral => 'Neutral';

  @override
  String get colorIntensityVivid => 'Colorful';

  @override
  String get pureBlackLabel => 'Pure black';

  @override
  String get pureBlackSubtitle =>
      'Black background in dark mode, saves battery on OLED screens';

  @override
  String get welcomeTagline => 'Your music, your way.';

  @override
  String get welcomeStart => 'Get started';

  @override
  String get setupSkip => 'Skip';

  @override
  String get setupBack => 'Back';

  @override
  String get setupContinue => 'Continue';

  @override
  String get setupRecommended => 'Recommended';

  @override
  String setupHelloTitle(String name) {
    return 'Hello $name';
  }

  @override
  String get setupHelloBody =>
      'A few questions to set Octave up the way you like. It takes about two minutes, and everything can be changed later in Settings.';

  @override
  String get setupHelloStart => 'Start';

  @override
  String get setupLater => 'Later';

  @override
  String get setupColorTitle => 'Your color';

  @override
  String get setupColorBody =>
      'It tints the whole app. Night blue is the color of the logo.';

  @override
  String get setupModeTitle => 'Light or dark';

  @override
  String get setupModeBody => 'Automatic follows your phone\'s setting.';

  @override
  String get setupModeAuto => 'Automatic';

  @override
  String get setupModeLight => 'Light';

  @override
  String get setupModeDark => 'Dark';

  @override
  String get setupArtistsTitle => 'Your artists';

  @override
  String get setupArtistsBody =>
      'Pick the ones you listen to most. They become favorites and shape your mixes.';

  @override
  String get setupArtistsEmpty => 'No artists in your library yet.';

  @override
  String setupArtistsContinue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Continue with $count artists',
      one: 'Continue with 1 artist',
    );
    return '$_temp0';
  }

  @override
  String get setupHomeTitle => 'Your home screen';

  @override
  String get setupHomeBody => 'Choose what appears on the home screen.';

  @override
  String get setupHomeFavoritePlaylists => 'Favorite playlists';

  @override
  String get setupHomeFavoritePlaylistsDesc =>
      'Playlists you marked as favorite, at the top.';

  @override
  String get setupHomeRecommendations => 'Mixes for you';

  @override
  String get setupHomeRecommendationsDesc =>
      'Suggestions based on what you listen to.';

  @override
  String get setupQualityTitle => 'Sound quality';

  @override
  String get setupQualityBody =>
      'Higher quality uses more data. Octave picks the format for you.';

  @override
  String get setupQualityWifi => 'On Wi-Fi';

  @override
  String get setupQualityMobile => 'On mobile data';

  @override
  String get setupQualityBest => 'Best quality';

  @override
  String get setupQualityBestDesc => 'Original file, lossless when available';

  @override
  String get setupQualityBalanced => 'Balanced';

  @override
  String get setupQualityBalancedDesc => 'About 85 MB per hour';

  @override
  String get setupQualitySaver => 'Data saver';

  @override
  String get setupQualitySaverDesc => 'About 60 MB per hour';

  @override
  String get setupOfflineTitle => 'Offline listening';

  @override
  String get setupOfflineBody =>
      'Songs you like can download by themselves, to play them without a network.';

  @override
  String get setupOfflineYes => 'Download my liked songs';

  @override
  String get setupOfflineYesDesc => 'Each song you like is saved on the phone.';

  @override
  String get setupOfflineNo => 'I\'ll choose myself';

  @override
  String get setupOfflineNoDesc =>
      'Download albums and playlists from their menu.';

  @override
  String get setupPermissionsTitle => 'Permissions';

  @override
  String get setupPermissionsBody =>
      'Two permissions keep the music playing when the screen is off.';

  @override
  String get setupPermNotifications => 'Notifications';

  @override
  String get setupPermNotificationsDesc =>
      'Shows the player on the lock screen.';

  @override
  String get setupPermBattery => 'Battery';

  @override
  String get setupPermBatteryDesc =>
      'Without it, some phones stop the music when the screen is off.';

  @override
  String get setupPermAllow => 'Allow';

  @override
  String get setupPermGranted => 'Allowed';

  @override
  String get setupDoneTitle => 'All set';

  @override
  String get setupDoneBody =>
      'Everything can be changed in Settings. You can also run this setup again from About.';

  @override
  String get setupDoneStart => 'Start listening';

  @override
  String get setupSummaryColor => 'Color';

  @override
  String get setupSummaryMode => 'Display';

  @override
  String get setupSummaryArtists => 'Favorite artists';

  @override
  String get setupSummaryWifi => 'Quality on Wi-Fi';

  @override
  String get setupSummaryMobile => 'Quality on mobile data';

  @override
  String get setupSummaryOffline => 'Automatic downloads';

  @override
  String get setupYes => 'Yes';

  @override
  String get setupNo => 'No';

  @override
  String get setupRedoTitle => 'Run setup again';

  @override
  String get setupRedoSubtitle =>
      'Color, display, artists, quality and downloads';

  @override
  String get colorNameOctave => 'Night';

  @override
  String get colorNameRed => 'Grenadine';

  @override
  String get colorNameOrange => 'Tangerine';

  @override
  String get colorNameYellow => 'Lemon';

  @override
  String get colorNameGreen => 'Forest';

  @override
  String get colorNameTeal => 'Pool';

  @override
  String get colorNameBlue => 'Blue';

  @override
  String get colorNamePink => 'Pink';

  @override
  String get colorNamePurple => 'Lilac';

  @override
  String get colorNameDynamic => 'Wallpaper';

  @override
  String get colorNameMint => 'Mint';

  @override
  String get colorNameIris => 'Iris';

  @override
  String get colorNameSand => 'Sand';

  @override
  String get colorNameSlate => 'Slate';

  @override
  String get setupStyleTitle => 'Your covers';

  @override
  String get setupStyleBody => 'Their shape across the whole app.';

  @override
  String get setupStyleRounded => 'Rounded';

  @override
  String get setupStyleSquare => 'Square';

  @override
  String get setupStyleCircle => 'Round';

  @override
  String get setupSummaryCovers => 'Covers';

  @override
  String get filterMusic => 'Music';

  @override
  String get homeJumpBackIn => 'Jump back in';

  @override
  String get homeListenAgain => 'Listen again';

  @override
  String get homeTopHits => 'Your top hits';

  @override
  String get homeArtistsYouLove => 'Artists you love';

  @override
  String get artistSingular => 'Artist';

  @override
  String get songSingular => 'Song';

  @override
  String get albumSingular => 'Album';

  @override
  String get sortRecents => 'Recents';

  @override
  String get sortAlphabetical => 'Alphabetical';

  @override
  String get sortCreator => 'Creator';

  @override
  String get libraryLikedSongsSubtitle => 'Playlist • Favorites';

  @override
  String librarySongsSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count songs saved offline',
      one: '1 song saved offline',
      zero: 'No songs saved offline',
    );
    return '$_temp0';
  }

  @override
  String libraryPlaylistSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Playlist • $count songs',
      one: 'Playlist • 1 song',
    );
    return '$_temp0';
  }

  @override
  String libraryAlbumSubtitle(String artist) {
    return 'Album • $artist';
  }

  @override
  String get switchToList => 'Show as list';

  @override
  String get switchToGrid => 'Show as grid';

  @override
  String get librarySearchHint => 'Search in library…';

  @override
  String get librarySearchEmpty => 'Search your library';

  @override
  String get browseAll => 'Browse all';

  @override
  String get genresAndMoods => 'Genres & moods';

  @override
  String get searchCategoryPop => 'Pop & hits';

  @override
  String get searchCategoryHipHop => 'Hip-hop & rap';

  @override
  String get searchCategoryRock => 'Rock & alternative';

  @override
  String get searchCategoryChill => 'Chill & relax';

  @override
  String searchNoResultsFor(String query) {
    return 'No results for “$query”';
  }

  @override
  String get searchNoResultsHint => 'Check the spelling or try another search.';

  @override
  String get searchTopResult => 'Top result';

  @override
  String get selectAll => 'Select all';

  @override
  String get deselectAll => 'Deselect all';

  @override
  String get radioHomepage => 'Website';

  @override
  String aboutArtist(String name) {
    return 'About $name';
  }

  @override
  String songAddedToQueue(String title) {
    return '“$title” added to queue';
  }

  @override
  String ratingFailed(String error) {
    return 'Couldn\'t save the rating: $error';
  }

  @override
  String get connectChooseOutput => 'Choose where the music plays';

  @override
  String get connectSpeakersTvs => 'Speakers & TVs';

  @override
  String get deviceWindowsPc => 'Windows PC';

  @override
  String get deviceMac => 'Mac';

  @override
  String get deviceLinuxPc => 'Linux PC';

  @override
  String get deviceIphone => 'iPhone';

  @override
  String get deviceThis => 'This device';

  @override
  String get playingOnThisDevice => 'Playing on this device';

  @override
  String connectFailed(String name) {
    return 'Couldn\'t connect to $name';
  }

  @override
  String errorWithDetails(String error) {
    return 'Error: $error';
  }

  @override
  String get autoDownloadFavorites => 'Download liked songs automatically';

  @override
  String get autoDownloadFavoritesSubtitle =>
      'Each song you like is saved for offline listening';

  @override
  String get castConnectedTooltip => 'Cast: connected';

  @override
  String dlnaTooltip(String name) {
    return 'DLNA: $name';
  }

  @override
  String get dlnaDeviceFallback => 'device';

  @override
  String get dlnaControlInfo =>
      'Playback is sent to this DLNA device. Use Octave\'s controls to manage it.';

  @override
  String get connectionSlow => 'The connection is taking a while…';

  @override
  String get updateDownloadComplete => 'Download complete';

  @override
  String updateDownloadFailed(String error) {
    return 'Download failed: $error';
  }

  @override
  String get updateDefaultChangelog => 'Improvements and bug fixes.';

  @override
  String get disconnectConfirm => 'Disconnect from this server?';

  @override
  String get options => 'Options';

  @override
  String get hideQueue => 'Hide queue';

  @override
  String get mute => 'Mute';

  @override
  String get unmute => 'Unmute';

  @override
  String get queueEmpty => 'The queue is empty';

  @override
  String nextUpCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Next up · $count songs',
      one: 'Next up · 1 song',
    );
    return '$_temp0';
  }

  @override
  String get lyricsSyncedBadge => 'Synced';

  @override
  String get pausedBadge => 'Paused';

  @override
  String playbackYear(int year) {
    return 'Playback $year';
  }

  @override
  String get autoDjOff => 'Off';

  @override
  String get autoDjShuffleLibrary => 'Shuffle library';

  @override
  String get autoDjSimilarSongs => 'Similar songs';

  @override
  String get autoDjSameGenre => 'Same genre';

  @override
  String get autoDjSameArtist => 'Same artist';

  @override
  String get autoDjSmartMix => 'Smart mix';

  @override
  String get coverEdit => 'Edit cover';

  @override
  String get coverEditorTitle => 'Cover';

  @override
  String get coverTabTemplate => 'Layout';

  @override
  String get coverTabText => 'Text';

  @override
  String get coverTabColors => 'Colors';

  @override
  String get coverTabImage => 'Picture';

  @override
  String get coverTemplateGradient => 'Gradient';

  @override
  String get coverTemplateMinimal => 'Minimal';

  @override
  String get coverTemplateBigType => 'Big type';

  @override
  String get coverTemplateBand => 'Band';

  @override
  String get coverTemplatePhoto => 'Photo';

  @override
  String get coverTemplateVinyl => 'Record';

  @override
  String get coverTemplateShapes => 'Shapes';

  @override
  String get coverTemplateGrid => 'Mosaic';

  @override
  String get coverTitleLabel => 'Title';

  @override
  String get coverSubtitleLabel => 'Subtitle';

  @override
  String get coverSubtitleHint => 'For example: for the road';

  @override
  String get coverFontLabel => 'Font';

  @override
  String get coverUppercase => 'Capital letters';

  @override
  String get coverMainColor => 'Main color';

  @override
  String get coverSecondColor => 'Second color';

  @override
  String get coverColorsFromCovers =>
      'The first colors come from the playlist covers.';

  @override
  String get coverPickPhoto => 'Choose a photo';

  @override
  String get coverUsePlaylistCovers => 'Use the playlist covers';

  @override
  String get coverImageHint => 'The Band and Photo layouts show this picture.';

  @override
  String get coverAutomatic => 'Back to the automatic cover';

  @override
  String get coverSaved => 'Cover saved';

  @override
  String get coverSaveFailed => 'Could not save the cover';

  @override
  String get coverSharedNote =>
      'The cover also shows in the other apps of the server (Arpeggi, the web player), for the playlists you created.';

  @override
  String get coverDiscardTitle => 'Discard changes?';

  @override
  String get coverDiscard => 'Discard';

  @override
  String get coverSwapColors => 'Swap the colors';

  @override
  String get loginHintSelfSigned =>
      'Try turning on \"Allow self-signed certificates\" in the advanced options.';

  @override
  String get loginHintCredentials =>
      'Check your username and password, then try again.';

  @override
  String get loginHintServerPath =>
      'Check the end of the server address (for example /navidrome).';

  @override
  String get loginHintTimeout =>
      'The server took too long to answer. Check your connection.';

  @override
  String get loginTapEnableSelfSigned =>
      'Tap to allow self-signed certificates';

  @override
  String get loginClickEnableSelfSigned =>
      'Click to allow self-signed certificates';

  @override
  String get loginSelectMusicFiles => 'Choose your music files…';

  @override
  String get loginNoFilesSelected =>
      'No file chosen. Tap \"Use phone files\" and choose your music.';

  @override
  String get localFilesDescription =>
      'Play the audio files of this phone, without a server.';

  @override
  String get loginInsecureHttp =>
      'Unencrypted HTTP connection: passwords and music travel in clear text on public networks. Prefer HTTPS.';

  @override
  String get profileNameHint => 'For example: Home, Work';

  @override
  String get clientCertPasswordHint => 'Password of the .p12 or .pfx file';

  @override
  String get serverUrlHint => 'https://music.example.com';

  @override
  String get loginUseServer => 'Connect to a server';

  @override
  String get connectSearching => 'Looking for speakers and TVs…';

  @override
  String get connectNoDevices =>
      'No device found. Your phone and the speaker must be on the same Wi-Fi network, and the speaker must be on.';

  @override
  String get customizeHome => 'Customize home';

  @override
  String get customizeHomeHint =>
      'Drag the rows into the order you like, and hide the ones you do not use.';

  @override
  String get customizeHomeReset => 'Back to the original order';

  @override
  String get homeSectionQuickAccess => 'Shortcuts';

  @override
  String get homeSectionFavoritePlaylists => 'Favorite playlists';

  @override
  String get homeSectionMixes => 'Mixes';

  @override
  String get coverSavedThisDevice =>
      'Cover saved on this device. The server did not accept it.';

  @override
  String get mixQuickPicks => 'Quick picks';

  @override
  String get mixDiscover => 'Discovery mix';

  @override
  String mixOfArtist(String name) {
    return '$name mix';
  }

  @override
  String mixOfGenre(String genre) {
    return '$genre mix';
  }

  @override
  String get mixMorning => 'Morning mood';

  @override
  String get mixAfternoon => 'Afternoon mood';

  @override
  String get mixEvening => 'Evening mood';

  @override
  String get mixNight => 'Night mood';

  @override
  String get aboutLinkPrivacy => 'Privacy';
}
