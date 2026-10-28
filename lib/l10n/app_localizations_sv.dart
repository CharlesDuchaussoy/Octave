// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appName => 'Octave';

  @override
  String get goodMorning => 'God morgon';

  @override
  String get goodAfternoon => 'God eftermiddag';

  @override
  String get goodEvening => 'God kväll';

  @override
  String get recentlyPlayed => 'Nyligen spelade';

  @override
  String get yourPlaylists => 'Dina Spellistor';

  @override
  String get homeServerMixes => 'Your mixes';

  @override
  String get queueHandoffTitle => 'Pick up where you left off';

  @override
  String queueHandoffOnDevice(String song, String ago) {
    return '$song · on another device, $ago';
  }

  @override
  String queueHandoffInApp(String song, String app, String ago) {
    return '$song · in $app, $ago';
  }

  @override
  String get queueHandoffResume => 'Resume';

  @override
  String get queueHandoffDismiss => 'Not now';

  @override
  String get agoNow => 'just now';

  @override
  String agoMinutes(int count) {
    return '$count min ago';
  }

  @override
  String agoHours(int count) {
    return '$count h ago';
  }

  @override
  String agoDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: 'yesterday',
    );
    return '$_temp0';
  }

  @override
  String get homeSectionPhoneMixes => 'Mixes made on this device';

  @override
  String get favoritePlaylists => 'Favorite Playlists';

  @override
  String get sectionAlbums => 'Albums';

  @override
  String get sectionEPs => 'EPs';

  @override
  String get sectionSingles => 'Singles';

  @override
  String get madeForYou => 'Skapat För Dig';

  @override
  String get topRated => 'Top Rated';

  @override
  String get refresh => 'Ladda om';

  @override
  String get errorLoadingSongs => 'Fel vid laddning av låtar';

  @override
  String get noSongsInGenre => 'Inga låtar i detta genre';

  @override
  String get errorLoadingAlbums => 'Fel vid laddning av album';

  @override
  String get login => 'Logga in';

  @override
  String get serverUrl => 'Server URL';

  @override
  String get username => 'Användarnamn';

  @override
  String get password => 'Lösenord';

  @override
  String get selectCertificate => 'Välj TLS/SSL Certifikat';

  @override
  String failedToSelectCertificate(String error) {
    return 'Misslyckades välja certifikat: $error';
  }

  @override
  String get serverUrlMustStartWith =>
      'Server URL måste starta med http:// eller https://';

  @override
  String get failedToConnect => 'Misslyckades ansluta';

  @override
  String get library => 'Bibliotek';

  @override
  String get search => 'Sök';

  @override
  String get settings => 'Inställningar';

  @override
  String get albums => 'Album';

  @override
  String get artists => 'Artister';

  @override
  String get songs => 'Låtar';

  @override
  String get playlists => 'Spellistor';

  @override
  String get genres => 'Genrer';

  @override
  String get favorites => 'Favoriter';

  @override
  String get nowPlaying => 'Spelas Nu';

  @override
  String get queue => 'Kö';

  @override
  String get lyrics => 'Låttext';

  @override
  String get play => 'Spela';

  @override
  String get pause => 'Pausa';

  @override
  String get next => 'Nästa';

  @override
  String get previous => 'Förra';

  @override
  String get shuffle => 'Blanda';

  @override
  String get repeat => 'Upprepa';

  @override
  String get addToPlaylist => 'Lägg till Spellista';

  @override
  String get removeFromPlaylist => 'Ta bort från Spellista';

  @override
  String get addToFavorites => 'Lägg till Favoriter';

  @override
  String get removeFromFavorites => 'Ta bort från Favoriter';

  @override
  String get download => 'Ladda ner';

  @override
  String get delete => 'Ta bort';

  @override
  String get cancel => 'Avbryt';

  @override
  String get save => 'Spara';

  @override
  String get close => 'Stäng';

  @override
  String get storage => 'Lagring';

  @override
  String get language => 'Språk';

  @override
  String get version => 'Version';

  @override
  String get unknownArtist => 'Okänd Artist';

  @override
  String get unknownAlbum => 'Okänt Album';

  @override
  String get playAll => 'Spela Alla';

  @override
  String get sortBy => 'Sortera efter';

  @override
  String get noLyricsAvailable => 'Ingen låttext tillgänglig';

  @override
  String get loading => 'Laddar...';

  @override
  String get error => 'Fel';

  @override
  String get retry => 'Försök igen';

  @override
  String get allSongs => 'Alla Låtar';

  @override
  String trackNumber(int number) {
    return 'Låt $number';
  }

  @override
  String songsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count låtar',
      one: '1 låt',
      zero: 'Inga låtar',
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
      zero: 'Inga album',
    );
    return '$_temp0';
  }

  @override
  String get logout => 'Logga ut';

  @override
  String get offlineMode => 'Offline Läge';

  @override
  String get radio => 'Radio';

  @override
  String get platform => 'Plattform';

  @override
  String get server => 'Server';

  @override
  String get playerInterface => 'Spelargränsnitt';

  @override
  String get playerBackgroundFromCover => 'Cover color in the background';

  @override
  String get playerBackgroundFromCoverSubtitle =>
      'Otherwise the full player takes the app color.';

  @override
  String get smartRecommendations => 'Smarta Rekommendationer';

  @override
  String get showVolumeSlider => 'Visa Volym Slider';

  @override
  String get showVolumeSliderSubtitle =>
      'Visa volymkontroll i Spelas Nu skärmen';

  @override
  String get enableRecommendations => 'Aktivera Rekommendationer';

  @override
  String get enableRecommendationsSubtitle => 'Få personliga musikförslag';

  @override
  String get listeningData => 'Lyssningsdata';

  @override
  String totalPlays(int count) {
    return '$count uppspelningar';
  }

  @override
  String get clearListeningHistory => 'Rensa lyssningshistorik';

  @override
  String get confirmClearHistory =>
      'Detta kommer nollställa all din lyssningsdata och rekommendationer. Är du säker?';

  @override
  String get historyCleared => 'Lyssningshistorik rensad';

  @override
  String get selectLanguage => 'Välj Språk';

  @override
  String get systemDefault => 'Systemets Standard';

  @override
  String get communityTranslations => 'Översättningar av Community:t';

  @override
  String get communityTranslationsSubtitle =>
      'Hjälp översätta Octave på GitHub';

  @override
  String get yourLibrary => 'Ditt Bibliotek';

  @override
  String get filterAll => 'Alla';

  @override
  String get filterPlaylists => 'Spellistor';

  @override
  String get likedSongs => 'Gillade Låtar';

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
  String get radioStations => 'Radio Stationer';

  @override
  String get playlist => 'Spellista';

  @override
  String get internetRadio => 'Internet Radio';

  @override
  String get newPlaylist => 'Ny Spellista';

  @override
  String get playlistName => 'Spellistans Namn';

  @override
  String get create => 'Skapa';

  @override
  String get deletePlaylist => 'Ta bort Spellista';

  @override
  String deletePlaylistConfirmation(String name) {
    return 'Är du säker på att du vill ta port spellistan \"$name\"?';
  }

  @override
  String playlistDeleted(String name) {
    return 'Spellista \"$name\" borttagen';
  }

  @override
  String errorCreatingPlaylist(Object error) {
    return 'Fel uppstod vid skapandet av spellista: $error';
  }

  @override
  String playlistCreated(String name) {
    return 'Spellista \"$name\" skapad';
  }

  @override
  String get homeSection => 'Home';

  @override
  String get categoryNewReleases => 'Nytt Släpp';

  @override
  String get categoryRadio => 'Radio';

  @override
  String get settingsTitle => 'Inställningar';

  @override
  String get tabPlayback => 'Uppspelning';

  @override
  String get tabStorage => 'Lagring';

  @override
  String get tabServer => 'Server';

  @override
  String get tabDisplay => 'Display';

  @override
  String get tabAbout => 'Om';

  @override
  String get sectionAutoDj => 'AUTO DJ';

  @override
  String get autoDjMode => 'Auto DJ läge';

  @override
  String songsToAdd(int count) {
    return 'Låtar att lägga till: $count';
  }

  @override
  String get replayGainMode => 'Läge';

  @override
  String get sectionStreamingQuality => 'STREAMING KVALITET';

  @override
  String get format => 'Format';

  @override
  String get serverType => 'Server Typ';

  @override
  String get notConnected => 'Inte ansluten';

  @override
  String get unknown => 'Okänd';

  @override
  String get musicFolders => 'Musik Mappar';

  @override
  String get noMusicFolders => 'Inga musik mappar hittades';

  @override
  String get switchProfile => 'Switch Profile';

  @override
  String get switchServer => 'Switch Server';

  @override
  String get sectionAccount => 'KONTO';

  @override
  String get logoutConfirmation =>
      'Är du säker på att du vill logga ut? Detta kommer även rensa all cachelagrad data.';

  @override
  String get imageCache => 'Bild Cache';

  @override
  String get sectionCacheCleanup => 'CACHE RENSNING';

  @override
  String get clearAllCache => 'Rensa all cache';

  @override
  String get allCacheCleared => 'Alla cacher rensade';

  @override
  String get sectionOfflineDownloads => 'OFFLINE NERLADDNINGAR';

  @override
  String get downloadedSongs => 'Nedladdade Låtar';

  @override
  String downloadingLibrary(int progress, int total) {
    return 'Laddar ner Bibliotek... $progress/$total';
  }

  @override
  String get downloadAllLibrary => 'Ladda ner Hela Biblioteket';

  @override
  String downloadLibraryConfirm(int count) {
    return 'Detta kommer att ladda ner $count låtar till din enhet. Detta kan ta ett tag och använda en del lagringsutrymme.\n\nFortsätt?';
  }

  @override
  String get libraryDownloadStarted => 'Nerladdning av bibliotek startad';

  @override
  String get deleteDownloads => 'Radera Alla Nedladdningar';

  @override
  String get downloadsDeleted => 'Alla nerladdningar raderades';

  @override
  String get noSongsAvailable =>
      'Inga låtar tillgängliga. Ladda ditt bibliotek först.';

  @override
  String downloadedStats(int count, String size) {
    return '$count låtar • $size';
  }

  @override
  String get removeFromLiked => 'Ta bort från Gillade Låtar';

  @override
  String get addToLiked => 'Lägg till Gillade låtar';

  @override
  String get playNext => 'Spela Nästa';

  @override
  String get addToQueue => 'Lägg till i Kö';

  @override
  String get goToAlbum => 'Gå till Album';

  @override
  String get goToArtist => 'Gå till Artist';

  @override
  String get libraryUpgrade => 'Look for a better quality';

  @override
  String get libraryUpgradeStarted =>
      'Looking for a better copy. The song is replaced if one is found.';

  @override
  String get libraryRemove => 'Remove from my library';

  @override
  String get libraryRemoveTitle => 'Remove this song?';

  @override
  String libraryRemoveMessage(int days) {
    return 'The file is set aside for $days days, then deleted. It will not be downloaded again.';
  }

  @override
  String get libraryRemoved => 'Song removed from your library';

  @override
  String get libraryActionSkipped => 'Nothing to do for this song';

  @override
  String get libraryActionFailed => 'The server could not do it';

  @override
  String get rateSong => 'Betygsätt Låt';

  @override
  String rateSongValue(int rating, String stars) {
    return 'Betygsätt Låt ($rating $stars)';
  }

  @override
  String get ratingRemoved => 'Betyg borttaget';

  @override
  String rated(int rating, String stars) {
    return 'Betygsatt $rating $stars';
  }

  @override
  String get removeRating => 'Ta bort Betyg';

  @override
  String get downloaded => 'Nerladdad';

  @override
  String downloading(int percent) {
    return 'Laddar ner... $percent%';
  }

  @override
  String get removeDownload => 'Ta bort Nerladdning';

  @override
  String get removeDownloadConfirm =>
      'Ta bort den här låten från offline lagring?';

  @override
  String get downloadRemoved => 'Nerladdning borttagen';

  @override
  String downloadedTitle(String title) {
    return 'Laddade ner \"$title\"';
  }

  @override
  String get downloadFailed => 'Nerladdning misslyckades';

  @override
  String downloadError(Object error) {
    return 'Nerladdningsfel: $error';
  }

  @override
  String addedToPlaylist(String title, String playlist) {
    return 'Lade till \"$title\" till $playlist';
  }

  @override
  String errorAddingToPlaylist(Object error) {
    return 'Fel vid tillägg till spellista: $error';
  }

  @override
  String get noPlaylists => 'Inga spellistor tillgängliga';

  @override
  String artistNotFound(String name) {
    return 'Artist \"$name\" hittades inte';
  }

  @override
  String errorSearchingArtist(Object error) {
    return 'Fel vid sökning av artist: $error';
  }

  @override
  String get removedFromFavorites => 'Ta bort från Favoriter';

  @override
  String get addedToFavorites => 'Lades till i Favoriter';

  @override
  String get star => 'stjärna';

  @override
  String get stars => 'stjärnor';

  @override
  String get albumNotFound => 'Albumet hittades inte';

  @override
  String get topSongs => 'Topplåtar';

  @override
  String get connected => 'Ansluten';

  @override
  String get noSongPlaying => 'Ingen låt spelas';

  @override
  String get playlistNameHint => 'Spellista namn';

  @override
  String get playlistNotFound => 'Spellistan hittades inte';

  @override
  String get noSongsInPlaylist => 'Inga låtar i den här spellistan';

  @override
  String get noFavoriteSongsYet => 'Inga favoritlåtar än';

  @override
  String get noFavoriteAlbumsYet => 'Inga favoritalbum än';

  @override
  String get listeningHistory => 'Lyssnings Historik';

  @override
  String get sortByTitleAZ => 'Titel (A-Ö)';

  @override
  String get sortByTitleZA => 'Titel (Ö-A)';

  @override
  String get sortByArtistAZ => 'Artist (A-Ö)';

  @override
  String get sortByAlbumAZ => 'Album (A-Ö)';

  @override
  String get recentlyAdded => 'Nyligen tillagda';

  @override
  String get noSongsFound => 'Inga låtar hittades';

  @override
  String get noAlbumsFound => 'Inget album hittades';

  @override
  String get noHomepageUrl => 'Ingen hemsida URL tillgänglig';

  @override
  String get copyStreamUrl => 'Kopiera Stream URL';

  @override
  String get failedToLoadRadioStations =>
      'Misslyckades att ladda radiostationer';

  @override
  String get noRadioStations => 'Inga Radiostationer';

  @override
  String get connectToServerSubtitle => 'Anslut till din Subsonic server';

  @override
  String get pleaseEnterServerUrl => 'Ange server URL';

  @override
  String get invalidUrlFormat => 'URL måste börja med http:// eller https://';

  @override
  String get pleaseEnterUsername => 'Ange användarnamn';

  @override
  String get pleaseEnterPassword => 'Ange lösenord';

  @override
  String get legacyAuthentication => 'Legacy Autentisering';

  @override
  String get legacyAuthSubtitle => 'Använd för äldre Subsonic servrar';

  @override
  String get allowSelfSignedCerts => 'Tillåt självsignerade certifikat';

  @override
  String get allowSelfSignedSubtitle =>
      'För servrar med anpassade TLS/SSL certifikat';

  @override
  String get advancedOptions => 'Avancerade Inställningar';

  @override
  String get customTlsCertificate => 'Anpassad TLS/SSL Certifikat';

  @override
  String get customCertificateSubtitle =>
      'Ladda upp ett anpassat certifikat för servrar med icke-standard CA';

  @override
  String get selectCertificateFile => 'Välj Certifikat';

  @override
  String get clientCertificate => 'Klientcertifikat (mTLS)';

  @override
  String get clientCertificateSubtitle =>
      'Autentisera denna klient med ett certifikat (kräver mTLS-aktiverad server)';

  @override
  String get selectClientCertificate => 'Välj Klientcertifikat';

  @override
  String get clientCertPassword => 'Lösenord för certifikat (valfritt)';

  @override
  String failedToSelectClientCert(String error) {
    return 'Misslyckades välja klientcertifikat: $error';
  }

  @override
  String get connect => 'Anslut';

  @override
  String get useLocalFiles => 'Använd Lokala Filer';

  @override
  String get startingScan => 'Startar skanning...';

  @override
  String get storagePermissionRequired =>
      'Lagringsbehörighet krävs för att skanna lokala filer';

  @override
  String get noMusicFilesFound => 'Inga musikfiler hittades på din enhet';

  @override
  String get remove => 'Ta bort';

  @override
  String failedToSetRating(Object error) {
    return 'Misslyckades att ange betyg: $error';
  }

  @override
  String get home => 'Hem';

  @override
  String get collapse => 'Kollapsa';

  @override
  String get expand => 'Expandera';

  @override
  String get createPlaylist => 'Skapa spellista';

  @override
  String get checkForUpdates => 'Check for updates';

  @override
  String get checkingForUpdates => 'Checking for updates...';

  @override
  String get appUpToDate => 'Octave is up to date';

  @override
  String get updateAvailable => 'Uppdatering Tillgänglig';

  @override
  String get updateNow => 'Update now';

  @override
  String get openOnGitHub => 'Open on GitHub';

  @override
  String get skipThisVersion => 'Skip this version';

  @override
  String get localFilesModeBanner => 'Lokalt Filläge';

  @override
  String get offlineModeBanner =>
      'Offline-läge – Endast uppspelning av nerladdad musik';

  @override
  String get whatsNew => 'Nyheter';

  @override
  String get remindLater => 'Senare';

  @override
  String get seeAll => 'Se Alla';

  @override
  String get artistDataNotFound => 'Artist hittades inte';

  @override
  String get addedArtistToQueue => 'Added artist to Queue';

  @override
  String get addedArtistToQueueError => 'Failed adding artist to Queue';

  @override
  String get casting => 'Castar';

  @override
  String get disconnect => 'Koppla ifrån';

  @override
  String get removedFromLikedSongs => 'Borttagen från Gillade Låtar';

  @override
  String get addedToLikedSongs => 'Lades till i Gillade Låtar';

  @override
  String get connecting => 'Ansluter';

  @override
  String errorStartingDownload(Object error) {
    return 'Fel vid start av nerladdning: $error';
  }

  @override
  String get errorLoadingGenres => 'Fel vid laddning av genrer';

  @override
  String get noGenresFound => 'Inga genrer hittades';

  @override
  String get noAlbumsInGenre => 'Inga album i denna genre';

  @override
  String genreTooltip(int songCount, int albumCount) {
    return '$songCount låtar • $albumCount album';
  }

  @override
  String get jukeboxMode => 'Jukeboxläge';

  @override
  String get jukeboxClearQueue => 'Rensa Kö';

  @override
  String get jukeboxQueueEmpty => 'Inga låtar i kö';

  @override
  String get playOnJukebox => 'Spela på Jukebox';

  @override
  String get addToJukeboxQueue => 'Lägg till i Jukeboxkön';

  @override
  String get jukeboxNotSupported =>
      'Jukeboxläget stöds inte av denna server. Aktivera det i din serverkonfiguration (t.ex. EnableJukebox = true in Navidrome).';

  @override
  String get musicFoldersHint =>
      'Lämna alla aktiverade för att använda alla mappar (standard).';

  @override
  String get serverUnreachableTitle => 'Kan inte nå servern';

  @override
  String get serverUnreachableSubtitle =>
      'Kontrollera din anslutning eller dina serverinställningar.';

  @override
  String get openOfflineMode => 'Öppna i offline läge';

  @override
  String get appearanceSection => 'Utseende';

  @override
  String get themeLabel => 'Tema';

  @override
  String get accentColorLabel => 'Accentfärg';

  @override
  String get circularDesignLabel => 'Cirkulär Design';

  @override
  String get circularDesignSubtitle =>
      'Flytande, avrundat UI med genomskinliga paneler och glass-blur effekt på spelaren och navigationsfältet.';

  @override
  String get themeModeSystem => 'System';

  @override
  String get themeModeLight => 'Ljust';

  @override
  String get themeModeDark => 'Mörkt';

  @override
  String get liveLabel => 'LIVE';

  @override
  String radioUnavailable(String name) {
    return 'Can\'t play $name right now.';
  }

  @override
  String get sectionVolumeNormalization => 'VOLYM NORMALISERING (REPLAYGAIN)';

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
  String get replayGainModeOff => 'Av';

  @override
  String get replayGainModeTrack => 'Låt';

  @override
  String get replayGainModeAlbum => 'Album';

  @override
  String replayGainPreamp(String value) {
    return 'Preamp: $value dB';
  }

  @override
  String get replayGainPreventClipping => 'Förhindra Ljudklippning';

  @override
  String replayGainFallbackGain(String value) {
    return 'Fallback Gain: $value dB';
  }

  @override
  String autoDjSongsToAdd(int count) {
    return 'Låtar att tillägga: $count';
  }

  @override
  String get transcodingEnable => 'Aktivera Transkodning';

  @override
  String get transcodingEnableSubtitle =>
      'Minska dataanvändningen med lägre kvalitet';

  @override
  String get smartTranscoding => 'Smart Transkodning';

  @override
  String get smartTranscodingSubtitle =>
      'Justerar kvaliteten automatiskt baserat på din anslutning (WiFi vs mobildata)';

  @override
  String get smartTranscodingDetectedNetwork => 'Upptäckt nätverk: ';

  @override
  String smartTranscodingActiveBitrate(String bitrate) {
    return 'Aktiv bithastighet: $bitrate';
  }

  @override
  String get transcodingWifiQuality => 'WiFi Kvalité';

  @override
  String get transcodingWifiQualitySubtitleSmart =>
      'Används automatiskt på WiFi';

  @override
  String get transcodingWifiQualitySubtitle =>
      'Bithastighet vid användning av WiFi';

  @override
  String get transcodingMobileQuality => 'Mobildata Kvalité';

  @override
  String get transcodingMobileQualitySubtitleSmart =>
      'Används automatiskt på mobildata';

  @override
  String get transcodingMobileQualitySubtitle =>
      'Bithastighet vid användning av mobildata';

  @override
  String get transcodingFormat => 'Format';

  @override
  String get transcodingFormatSubtitle => 'Ljudkodek som används för streaming';

  @override
  String get transcodingBitrateOriginal => 'Original (Ingen Omkodning)';

  @override
  String get transcodingFormatOriginal => 'Original';

  @override
  String get sectionAboutInformation => 'INFORMATION';

  @override
  String get sectionAboutDeveloper => 'UTVECKLARE';

  @override
  String get sectionAboutLinks => 'LÄNKAR';

  @override
  String get aboutVersion => 'Version';

  @override
  String get aboutPlatform => 'Plattform';

  @override
  String get aboutMadeBy => 'Gjord av dddevid';

  @override
  String get aboutGitHub => 'github.com/dddevid';

  @override
  String get aboutLinkGitHub => 'GitHub Repository';

  @override
  String get aboutLinkChangelog => 'Ändringshistorik';

  @override
  String get aboutLinkReportIssue => 'Rapportera Problem';

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
  String get endOfSong => 'End of Song';

  @override
  String get connectToDevice => 'Connect to a Device';

  @override
  String get wrappedSeasonal => 'Octave Playback is Seasonal';

  @override
  String get playYourTopSongs => 'Play Your Top Songs';

  @override
  String get lyricsDisplaySection => 'LYRICS DISPLAY';

  @override
  String get lyricsKeepScreenOn => 'Keep Screen On';

  @override
  String get lyricsKeepScreenOnSubtitle =>
      'Prevent the screen from turning off while reading lyrics';

  @override
  String get hideWindowTitlebar => 'Hide Window Titlebar / Decorations';

  @override
  String get hideWindowTitlebarSubtitle =>
      'Hides native titlebar (useful for Linux Wayland & tiling window managers)';

  @override
  String get sectionSmartCrossfade => 'SMART CROSSFADE';

  @override
  String get trackCrossfade => 'Track Crossfade';

  @override
  String get crossfadeOffSubtitle => 'Off (Instant transition)';

  @override
  String crossfadeDurationSubtitle(int seconds) {
    return '$seconds seconds crossfade between songs';
  }

  @override
  String crossfadeDurationBadge(int seconds) {
    return '${seconds}s';
  }

  @override
  String get sectionGaplessPlayback => 'GAPLESS PLAYBACK';

  @override
  String get gaplessPlayback => 'Gapless Playback';

  @override
  String get gaplessPlaybackSubtitle => 'Eliminate silence between songs';

  @override
  String get networkWifi => 'WiFi';

  @override
  String get networkMobile => 'Mobile';

  @override
  String get activeDownloads => 'Active Downloads';

  @override
  String get noDownloadsInProgress => 'No downloads in progress';

  @override
  String get playlistDownloads => 'Playlist Downloads';

  @override
  String playlistSongsDownloadedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count songs downloaded',
      one: '1 song downloaded',
    );
    return '$_temp0';
  }

  @override
  String totalCacheDiskUsage(String size) {
    return 'Total cache: $size';
  }

  @override
  String folderAdded(String path) {
    return 'Added folder: $path';
  }

  @override
  String get removeFolderTitle => 'Remove Folder';

  @override
  String removeFolderConfirm(String path) {
    return 'Remove \"$path\" from scan paths?';
  }

  @override
  String get folderRemoved => 'Folder removed';

  @override
  String get loadingLibrary => 'Loading library...';

  @override
  String get libraryEmptyError =>
      'Library appears to be empty or failed to load. Make sure your server supports full library scanning.';

  @override
  String get serverStatusConnected => 'CONNECTED';

  @override
  String get serverStatusConnecting => 'CONNECTING';

  @override
  String get serverStatusOffline => 'OFFLINE';

  @override
  String get serverStatusNotConnected => 'Not Connected';

  @override
  String get switchServerButton => 'Switch';

  @override
  String get savedServersSection => 'SAVED SERVERS & SERVICES';

  @override
  String get manage => 'Manage';

  @override
  String get serverActiveBadge => 'ACTIVE';

  @override
  String get addServerOrService => 'Add Server / Service';

  @override
  String get muslyPlaybackDev => 'Playback Preview (Test Mode)';

  @override
  String get muslyPlaybackDevSubtitle =>
      'Explore your Year-in-Review preview directly without waiting for November';

  @override
  String get muslyPlaybackAnnual => 'Octave Playback';

  @override
  String get muslyPlaybackAnnualSubtitle =>
      'Your annual Year-in-Review unlocks automatically every year between late November and mid-January.\n\nKeep listening to music to expand your sonic universe!';

  @override
  String devPlaybackTapsAway(int count) {
    return '$count taps away from Developer Playback Preview';
  }

  @override
  String get devPlaybackUnlocked => 'Developer Playback Preview unlocked!';

  @override
  String get switchServerTitle => 'Switch Server';

  @override
  String get switchServerSubtitle =>
      'Select an active server or streaming source';

  @override
  String get addServerButton => 'Add Server';

  @override
  String get noServersSavedYet => 'No servers saved yet';

  @override
  String connectedTo(String name) {
    return 'Connected to $name';
  }

  @override
  String errorConnectingServer(String error) {
    return 'Error connecting to server: $error';
  }

  @override
  String get renameServerProfile => 'Rename Server Profile';

  @override
  String get profileNameLabel => 'Profile Name';

  @override
  String get enterNewNameHint => 'Enter new name';

  @override
  String get removeServerTitle => 'Remove Server';

  @override
  String removeServerConfirm(String name) {
    return 'Are you sure you want to remove \"$name\" from your saved servers?';
  }

  @override
  String get noPlaylistsFound => 'No playlists found';

  @override
  String get addAllToQueue => 'Add all to queue';

  @override
  String songsAddedToQueue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count songs added to queue',
      one: '1 song added to queue',
    );
    return '$_temp0';
  }

  @override
  String get searchInAlbum => 'Search in album';

  @override
  String get searchInPlaylist => 'Search in playlist';

  @override
  String get filterTracks => 'Filter tracks...';

  @override
  String get filterSongs => 'Filter songs...';

  @override
  String get noSongsInQueue => 'No songs in queue';

  @override
  String get moreOptions => 'More options';

  @override
  String get upNext => 'Up Next';

  @override
  String get removeSelected => 'Remove selected';

  @override
  String get reorderSongs => 'Reorder songs';

  @override
  String get selectSongs => 'Select songs';

  @override
  String get doneReordering => 'Done reordering';

  @override
  String get downloadAlbum => 'Download album';

  @override
  String get downloadPlaylist => 'Download playlist';

  @override
  String get downloadedTapToRemove => 'Downloaded — tap to remove';

  @override
  String get downloadingTapToCancel => 'Downloading — tap to cancel';

  @override
  String get removeDownloadsTitle => 'Remove downloads?';

  @override
  String removeAlbumDownloadsConfirm(int count, String name) {
    return 'Remove all $count downloaded songs from \"$name\"?';
  }

  @override
  String removePlaylistDownloadsConfirm(int count, String name) {
    return 'Remove all $count downloaded songs from \"$name\"?';
  }

  @override
  String queuedSongsForDownload(int count) {
    return 'Queued $count songs for download…';
  }

  @override
  String get songRemovedFromPlaylist => 'Song removed from playlist';

  @override
  String errorRemovingSong(String error) {
    return 'Error removing song: $error';
  }

  @override
  String errorReorderingSong(String error) {
    return 'Error reordering song: $error';
  }

  @override
  String get removeSongsTitle => 'Remove songs';

  @override
  String removePlaylistSongsConfirm(int count, String name) {
    return 'Remove $count song(s) from \"$name\"?';
  }

  @override
  String removedSongsFromPlaylist(int count) {
    return 'Removed $count song(s) from playlist';
  }

  @override
  String get alreadyInPlaylist => 'Already in playlist';

  @override
  String alreadyInPlaylistConfirm(String title, String playlist) {
    return '\"$title\" is already in \"$playlist\". Do you still want to add it?';
  }

  @override
  String get addAnyway => 'Add anyway';

  @override
  String get offlineModeQuestion => 'Offline mode?';

  @override
  String get drumroll => 'DRUMROLL...';

  @override
  String get readyToDiscoverTopSong => 'Ready to discover\nyour #1 song?';

  @override
  String get tapToBegin => 'Tap to begin';

  @override
  String get minutesListened => 'MINUTES LISTENED';

  @override
  String get totalHours => 'Total hours';

  @override
  String get uniqueTracks => 'Unique tracks';

  @override
  String get topSongsHeader => 'TOP SONGS';

  @override
  String get yourMostListenedSongs => 'Your most listened songs';

  @override
  String get topArtistsHeader => 'TOP ARTISTS';

  @override
  String playsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count plays',
      one: '1 play',
    );
    return '$_temp0';
  }

  @override
  String get topSongBadge => 'Song #1';

  @override
  String get topArtistMetric => 'Top Artist';

  @override
  String get genreMetric => 'Genre';

  @override
  String get muslyPlaybackHeader => 'OCTAVE PLAYBACK';

  @override
  String get minutes => 'Minutes';

  @override
  String get nowPlayingHeader => 'NOW PLAYING';

  @override
  String get stop => 'Stop';

  @override
  String get closeQueue => 'Close Queue';

  @override
  String get timerOff => 'Off';

  @override
  String get history => 'History';

  @override
  String get searchInLibrary => 'Search in Library';

  @override
  String get add => 'Add';

  @override
  String get clear => 'Clear';

  @override
  String get back => 'Back';

  @override
  String get radios => 'Radios';

  @override
  String get downloads => 'Downloads';

  @override
  String get noDownloadedSongsYet => 'No downloaded songs yet';

  @override
  String get noDownloadedAlbumsYet => 'No downloaded albums yet';

  @override
  String get allowSelfSignedCertificatesSubtitle =>
      'Useful for internal LAN or custom self-signed SSL';

  @override
  String get legacyAuthenticationSubtitle =>
      'Required for older Subsonic API implementations';

  @override
  String get certificateFileSubtitle => '.crt, .pem or .cer file';

  @override
  String get clientIdentityFileSubtitle => '.p12 or .pfx client identity file';

  @override
  String get copyError => 'Copy error';

  @override
  String get errorCopiedToClipboard => 'Error copied to clipboard';

  @override
  String get failedToUpdateFavorite => 'Failed to update liked status';

  @override
  String queuedSongsFromAlbumsForDownload(int songCount, int albumCount) {
    return 'Queued $songCount songs from $albumCount albums for download…';
  }

  @override
  String get downloadAllAlbums => 'Download All Albums';

  @override
  String get downloadAllFavorites => 'Download All Favorites';

  @override
  String get downloadAll => 'Download All';

  @override
  String get createPlaylistSubtitle =>
      'Build a custom playlist with your favorite tracks';

  @override
  String get addMusicSource => 'Add Music Source';

  @override
  String get addMusicSourceSubtitle => 'Another Navidrome server';

  @override
  String get removeFromFavoritesTitle => 'Remove from Favorites?';

  @override
  String removeFromFavoritesConfirm(String title) {
    return 'Do you want to remove \"$title\" from favorites?';
  }

  @override
  String failedToRemove(String error) {
    return 'Failed to remove: $error';
  }

  @override
  String streamUrlLabel(String url) {
    return 'Stream URL: $url';
  }

  @override
  String get shuffleNewSelection => 'Shuffle New Selection';

  @override
  String get sortDurationLongest => 'Duration (Longest first)';

  @override
  String get connectToServer => 'Connect to Server';

  @override
  String get renameProfile => 'Rename Profile';

  @override
  String get recentSearches => 'Recent Searches';

  @override
  String get createPlaylistToGetStarted => 'Create a playlist to get started';

  @override
  String get addRadioStationsHint =>
      'Add radio stations in your server settings to see them here.';

  @override
  String get skip => 'Skip';

  @override
  String get profileNameOptional => 'Profile Name (Optional)';

  @override
  String get serverUrlRequired => 'Server URL *';

  @override
  String get lanServerUrlOptional => 'LAN Server URL (Optional)';

  @override
  String get usernameRequired => 'Username *';

  @override
  String get passwordRequired => 'Password *';

  @override
  String get whatDoYouWantToPlay => 'What do you want to play?';

  @override
  String get noLyricsFound => 'No lyrics available';

  @override
  String get dynamicColor => 'Material You (Dynamic Color)';

  @override
  String get muslyPlayback => 'Octave Playback';

  @override
  String get synthesizingUniverse => 'Synthesizing your listening universe';

  @override
  String get getReadyForBeatDrop => 'Get ready for the beat drop...';

  @override
  String yourYearInSound(int year) {
    return 'Your $year\nin Sound';
  }

  @override
  String get yourYearInSoundSubtitle =>
      'You explored sonic depths, relived moments, and built memories through music.';

  @override
  String get yourMusicalChronotype => 'YOUR MUSICAL CHRONOTYPE';

  @override
  String get genreGalaxy => 'GENRE GALAXY';

  @override
  String get soundsThatGuidedYou => 'The sounds that guided you';

  @override
  String get yourMusicalAnchors => 'Your musical anchors';

  @override
  String get yourListeningPersonality => 'YOUR LISTENING PERSONALITY';

  @override
  String get yourYearInReviewIsReady => 'Your Year in Review is ready!';

  @override
  String get chronotypeMidnightWanderer => 'Midnight Wanderer 🌙';

  @override
  String get chronotypeMidnightWandererDesc =>
      'Your deepest music moments unfold late at night when the world is quiet.';

  @override
  String get chronotypeSunriseHarmonizer => 'Sunrise Harmonizer ☀️';

  @override
  String get chronotypeSunriseHarmonizerDesc =>
      'You kickstart every morning with rhythm, setting the soundtrack for the entire day.';

  @override
  String get chronotypeAfternoonFlow => 'Afternoon Flow ⚡';

  @override
  String get chronotypeAfternoonFlowDesc =>
      'Midday is your prime listening peak, powering through your momentum with high-energy sound.';

  @override
  String get chronotypeTwilightLounger => 'Twilight Lounger 🌆';

  @override
  String get chronotypeTwilightLoungerDesc =>
      'Evenings are made for unwinding and losing yourself in immersive album journeys.';

  @override
  String get archetypeLuminary => 'The Luminary';

  @override
  String get archetypeLuminaryBadge => 'SONIC EXPLORER';

  @override
  String get archetypeLuminaryDesc =>
      'You shine light on diverse genres and constantly seek out fresh musical horizons.';

  @override
  String get archetypeLuminaryTrait1 => 'Eclectic Taste';

  @override
  String get archetypeLuminaryTrait2 => 'Genre Fluid';

  @override
  String get archetypeLuminaryTrait3 => 'High Discovery';

  @override
  String get archetypeDevotee => 'The Devotee';

  @override
  String get archetypeDevoteeBadge => 'SUPERFAN';

  @override
  String get archetypeDevoteeDesc =>
      'When you love an artist or album, you listen on repeat with unmatched dedication.';

  @override
  String get archetypeDevoteeTrait1 => 'Deep Loyalty';

  @override
  String get archetypeDevoteeTrait2 => 'Album Listener';

  @override
  String get archetypeDevoteeTrait3 => 'Emotional Bond';

  @override
  String get archetypeNightOwl => 'The Night Owl';

  @override
  String get archetypeNightOwlBadge => 'NOCTURNAL VIBES';

  @override
  String get archetypeNightOwlDesc =>
      'Your soul belongs to midnight soundscapes, atmospheric chords, and starry listening sessions.';

  @override
  String get archetypeNightOwlTrait1 => 'Atmospheric';

  @override
  String get archetypeNightOwlTrait2 => 'Introspective';

  @override
  String get archetypeNightOwlTrait3 => 'Late-Night Flow';

  @override
  String get archetypeSunrise => 'The Sunrise Harmonizer';

  @override
  String get archetypeSunriseBadge => 'ENERGY CATALYST';

  @override
  String get archetypeSunriseDesc =>
      'You wake up the world with high vibrations and let optimistic melodies spark your day.';

  @override
  String get archetypeSunriseTrait1 => 'Uplifting';

  @override
  String get archetypeSunriseTrait2 => 'Morning Energy';

  @override
  String get archetypeSunriseTrait3 => 'Rhythmic Drive';

  @override
  String get archetypeAlchemist => 'The Sonic Alchemist';

  @override
  String get archetypeAlchemistBadge => 'VIBE CURATOR';

  @override
  String get archetypeAlchemistDesc =>
      'You transmute everyday moments into cinematic experiences with perfectly curated soundtracks.';

  @override
  String get archetypeAlchemistTrait1 => 'Curator Instinct';

  @override
  String get archetypeAlchemistTrait2 => 'Cinematic Vibe';

  @override
  String get archetypeAlchemistTrait3 => 'Mood Master';

  @override
  String get percentileTop05 => 'Top 0.5% Global Listener';

  @override
  String get percentileTop1 => 'Top 1% Global Listener';

  @override
  String get percentileTop5 => 'Top 5% Global Listener';

  @override
  String get percentileTop10 => 'Top 10% Global Listener';

  @override
  String get percentileTopAficionado => 'Top Music Aficionado';

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
      'Android Auto is not supported on this device.';

  @override
  String get androidAutoCategories => 'Categories';

  @override
  String get androidAutoPerformance => 'Performance';

  @override
  String get androidAutoShowRecent => 'Show Recent';

  @override
  String get androidAutoShowFavorites => 'Show Favorites';

  @override
  String get androidAutoShowAlbums => 'Show Albums';

  @override
  String get androidAutoShowArtists => 'Show Artists';

  @override
  String get androidAutoShowPlaylists => 'Show Playlists';

  @override
  String get androidAutoShowGenres => 'Show Genres';

  @override
  String get androidAutoShowRadio => 'Show Radio';

  @override
  String get androidAutoShowDownloads => 'Show Downloads';

  @override
  String get androidAutoMaxItems => 'Item Limit';

  @override
  String get androidAutoMaxItemsDesc =>
      'Maximum number of items to load per category';

  @override
  String get androidAutoNowPlaying => 'Now Playing';

  @override
  String get androidAutoRecent => 'Recent';

  @override
  String get androidAutoFavorites => 'Favorites';

  @override
  String get androidAutoAlbums => 'Albums';

  @override
  String get androidAutoArtists => 'Artists';

  @override
  String get androidAutoPlaylists => 'Playlists';

  @override
  String get androidAutoGenres => 'Genres';

  @override
  String get androidAutoRadio => 'Radio';

  @override
  String get androidAutoDownloads => 'Downloads';

  @override
  String get androidAutoShuffle => 'Shuffle';

  @override
  String get androidAutoQueue => 'Queue';

  @override
  String get androidAutoEmptyFavorites => 'No favorite songs';

  @override
  String get androidAutoEmptyRadio => 'No radio stations configured';

  @override
  String get androidAutoEmptyDownloads => 'No downloaded songs';

  @override
  String get androidAutoDefaultServer => 'Default Server';

  @override
  String get androidAutoDefaultServerDesc =>
      'Select which server to use when you start Android Auto';

  @override
  String get androidAutoUseActiveServer => 'Use app\'s active server';

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
      zero: 'Playlist • no songs',
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
  String get updateFileDamaged =>
      'The downloaded file is damaged, so it was not installed. Try again.';

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
  String get coverTemplateFrame => 'Frame';

  @override
  String get coverTemplateDuo => 'Duo';

  @override
  String get coverTextSize => 'Size';

  @override
  String get coverTextSizeSmall => 'Small';

  @override
  String get coverTextSizeMedium => 'Medium';

  @override
  String get coverTextSizeLarge => 'Large';

  @override
  String get coverTextAlign => 'Alignment';

  @override
  String get coverAlignLeft => 'Left';

  @override
  String get coverAlignCenter => 'Centered';

  @override
  String get coverMoreColors => 'Other color';

  @override
  String get coverHue => 'Hue';

  @override
  String get coverIntensity => 'Intensity';

  @override
  String get coverLightness => 'Lightness';

  @override
  String get coverUseColor => 'Use this color';

  @override
  String get coverPhotoGesture =>
      'Drag the picture on the preview to move it, pinch to zoom.';

  @override
  String get coverRecenter => 'Recenter';

  @override
  String get coverImageEffect => 'Effect';

  @override
  String get coverEffectNone => 'Normal';

  @override
  String get coverEffectMono => 'Black and white';

  @override
  String get coverEffectTint => 'Tinted';

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
  String get coverImageHint =>
      'The Band, Photo and Frame layouts show this picture.';

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
