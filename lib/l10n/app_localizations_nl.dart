// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'Octave';

  @override
  String get goodMorning => 'Good morning';

  @override
  String get goodAfternoon => 'Good afternoon';

  @override
  String get goodEvening => 'Good evening';

  @override
  String get recentlyPlayed => 'Recently Played';

  @override
  String get yourPlaylists => 'Your Playlists';

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
  String get madeForYou => 'Made For You';

  @override
  String get topRated => 'Top Rated';

  @override
  String get refresh => 'Refresh';

  @override
  String get errorLoadingSongs => 'Error loading songs';

  @override
  String get noSongsInGenre => 'No songs in this genre';

  @override
  String get errorLoadingAlbums => 'Error loading albums';

  @override
  String get login => 'Login';

  @override
  String get serverUrl => 'Server URL';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get selectCertificate => 'Select TLS/SSL Certificate';

  @override
  String failedToSelectCertificate(String error) {
    return 'Failed to select certificate: $error';
  }

  @override
  String get serverUrlMustStartWith =>
      'Server URL must start with http:// or https://';

  @override
  String get failedToConnect => 'Failed to connect';

  @override
  String get library => 'Library';

  @override
  String get search => 'Search';

  @override
  String get settings => 'Settings';

  @override
  String get albums => 'Albums';

  @override
  String get artists => 'Artists';

  @override
  String get songs => 'Songs';

  @override
  String get playlists => 'Playlists';

  @override
  String get genres => 'Genres';

  @override
  String get favorites => 'Favorites';

  @override
  String get nowPlaying => 'Now Playing';

  @override
  String get queue => 'Queue';

  @override
  String get lyrics => 'Lyrics';

  @override
  String get play => 'Play';

  @override
  String get pause => 'Pause';

  @override
  String get next => 'Next';

  @override
  String get previous => 'Previous';

  @override
  String get shuffle => 'Shuffle';

  @override
  String get repeat => 'Repeat';

  @override
  String get addToPlaylist => 'Add to Playlist';

  @override
  String get removeFromPlaylist => 'Remove from Playlist';

  @override
  String get addToFavorites => 'Add to Favorites';

  @override
  String get removeFromFavorites => 'Remove from Favorites';

  @override
  String get download => 'Download';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get close => 'Close';

  @override
  String get storage => 'Storage';

  @override
  String get language => 'Language';

  @override
  String get version => 'Version';

  @override
  String get unknownArtist => 'Unknown Artist';

  @override
  String get unknownAlbum => 'Unknown Album';

  @override
  String get playAll => 'Play All';

  @override
  String get sortBy => 'Sort by';

  @override
  String get noLyricsAvailable => 'No lyrics available';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get allSongs => 'All Songs';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String songsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count songs',
      one: '1 song',
      zero: 'No songs',
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
      zero: 'No albums',
    );
    return '$_temp0';
  }

  @override
  String get logout => 'Logout';

  @override
  String get offlineMode => 'Offline Mode';

  @override
  String get radio => 'Radio';

  @override
  String get platform => 'Platform';

  @override
  String get server => 'Server';

  @override
  String get playerInterface => 'Player Interface';

  @override
  String get playerBackgroundFromCover => 'Cover color in the background';

  @override
  String get playerBackgroundFromCoverSubtitle =>
      'Otherwise the full player takes the app color.';

  @override
  String get smartRecommendations => 'Smart Recommendations';

  @override
  String get showVolumeSlider => 'Show Volume Slider';

  @override
  String get showVolumeSliderSubtitle =>
      'Display volume control in Now Playing screen';

  @override
  String get enableRecommendations => 'Enable Recommendations';

  @override
  String get enableRecommendationsSubtitle =>
      'Get personalized music suggestions';

  @override
  String get listeningData => 'Listening Data';

  @override
  String totalPlays(int count) {
    return '$count total plays';
  }

  @override
  String get clearListeningHistory => 'Clear Listening History';

  @override
  String get confirmClearHistory =>
      'This will reset all your listening data and recommendations. Are you sure?';

  @override
  String get historyCleared => 'Listening history cleared';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get systemDefault => 'System Default';

  @override
  String get communityTranslations => 'Translations by Community';

  @override
  String get communityTranslationsSubtitle => 'Help translate Octave on GitHub';

  @override
  String get yourLibrary => 'Your Library';

  @override
  String get filterAll => 'All';

  @override
  String get filterPlaylists => 'Playlists';

  @override
  String get likedSongs => 'Liked Songs';

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
  String get radioStations => 'Radio Stations';

  @override
  String get playlist => 'Playlist';

  @override
  String get internetRadio => 'Internet Radio';

  @override
  String get newPlaylist => 'New Playlist';

  @override
  String get playlistName => 'Playlist Name';

  @override
  String get create => 'Create';

  @override
  String get deletePlaylist => 'Delete Playlist';

  @override
  String deletePlaylistConfirmation(String name) {
    return 'Are you sure you want to delete the playlist \"$name\"?';
  }

  @override
  String playlistDeleted(String name) {
    return 'Playlist \"$name\" deleted';
  }

  @override
  String errorCreatingPlaylist(Object error) {
    return 'Error creating playlist: $error';
  }

  @override
  String playlistCreated(String name) {
    return 'Playlist \"$name\" created';
  }

  @override
  String get homeSection => 'Home';

  @override
  String get categoryNewReleases => 'New Releases';

  @override
  String get categoryRadio => 'Radio';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get tabPlayback => 'Playback';

  @override
  String get tabStorage => 'Storage';

  @override
  String get tabServer => 'Server';

  @override
  String get tabDisplay => 'Display';

  @override
  String get tabAbout => 'About';

  @override
  String get sectionAutoDj => 'AUTO DJ';

  @override
  String get autoDjMode => 'Auto DJ Mode';

  @override
  String songsToAdd(int count) {
    return 'Songs to Add: $count';
  }

  @override
  String get replayGainMode => 'Mode';

  @override
  String get sectionStreamingQuality => 'STREAMING QUALITY';

  @override
  String get format => 'Format';

  @override
  String get serverType => 'Server Type';

  @override
  String get notConnected => 'Not connected';

  @override
  String get unknown => 'Unknown';

  @override
  String get musicFolders => 'Music Folders';

  @override
  String get noMusicFolders => 'No music folders found';

  @override
  String get switchProfile => 'Switch Profile';

  @override
  String get switchServer => 'Switch Server';

  @override
  String get sectionAccount => 'ACCOUNT';

  @override
  String get logoutConfirmation =>
      'Are you sure you want to logout? This will also clear all cached data.';

  @override
  String get imageCache => 'Image Cache';

  @override
  String get sectionCacheCleanup => 'CACHE CLEANUP';

  @override
  String get clearAllCache => 'Clear All Cache';

  @override
  String get allCacheCleared => 'All cache cleared';

  @override
  String get sectionOfflineDownloads => 'OFFLINE DOWNLOADS';

  @override
  String get downloadedSongs => 'Downloaded Songs';

  @override
  String downloadingLibrary(int progress, int total) {
    return 'Downloading Library... $progress/$total';
  }

  @override
  String get downloadAllLibrary => 'Download All Library';

  @override
  String downloadLibraryConfirm(int count) {
    return 'This will download $count songs to your device. This may take a while and use significant storage space.\n\nContinue?';
  }

  @override
  String get libraryDownloadStarted => 'Library download started';

  @override
  String get deleteDownloads => 'Delete All Downloads';

  @override
  String get downloadsDeleted => 'All downloads deleted';

  @override
  String get noSongsAvailable =>
      'No songs available. Please load your library first.';

  @override
  String downloadedStats(int count, String size) {
    return '$count songs • $size';
  }

  @override
  String get removeFromLiked => 'Remove from Liked Songs';

  @override
  String get addToLiked => 'Add to Liked Songs';

  @override
  String get playNext => 'Play Next';

  @override
  String get addToQueue => 'Add to Queue';

  @override
  String get goToAlbum => 'Go to Album';

  @override
  String get goToArtist => 'Go to Artist';

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
  String get rateSong => 'Rate Song';

  @override
  String rateSongValue(int rating, String stars) {
    return 'Rate Song ($rating $stars)';
  }

  @override
  String get ratingRemoved => 'Rating removed';

  @override
  String rated(int rating, String stars) {
    return 'Rated $rating $stars';
  }

  @override
  String get removeRating => 'Remove Rating';

  @override
  String get downloaded => 'Downloaded';

  @override
  String downloading(int percent) {
    return 'Downloading... $percent%';
  }

  @override
  String get removeDownload => 'Remove Download';

  @override
  String get removeDownloadConfirm => 'Remove this song from offline storage?';

  @override
  String get downloadRemoved => 'Download removed';

  @override
  String downloadedTitle(String title) {
    return 'Downloaded \"$title\"';
  }

  @override
  String get downloadFailed => 'Download failed';

  @override
  String downloadError(Object error) {
    return 'Download error: $error';
  }

  @override
  String addedToPlaylist(String title, String playlist) {
    return 'Added \"$title\" to $playlist';
  }

  @override
  String errorAddingToPlaylist(Object error) {
    return 'Error adding to playlist: $error';
  }

  @override
  String get noPlaylists => 'No playlists available';

  @override
  String artistNotFound(String name) {
    return 'Artist \"$name\" not found';
  }

  @override
  String errorSearchingArtist(Object error) {
    return 'Error searching for artist: $error';
  }

  @override
  String get removedFromFavorites => 'Removed from favorites';

  @override
  String get addedToFavorites => 'Added to favorites';

  @override
  String get star => 'star';

  @override
  String get stars => 'stars';

  @override
  String get albumNotFound => 'Album not found';

  @override
  String get topSongs => 'Top Songs';

  @override
  String get connected => 'Connected';

  @override
  String get noSongPlaying => 'No song playing';

  @override
  String get playlistNameHint => 'Playlist name';

  @override
  String get playlistNotFound => 'Playlist not found';

  @override
  String get noSongsInPlaylist => 'No songs in this playlist';

  @override
  String get noFavoriteSongsYet => 'No favorite songs yet';

  @override
  String get noFavoriteAlbumsYet => 'No favorite albums yet';

  @override
  String get listeningHistory => 'Listening History';

  @override
  String get sortByTitleAZ => 'Title (A-Z)';

  @override
  String get sortByTitleZA => 'Title (Z-A)';

  @override
  String get sortByArtistAZ => 'Artist (A-Z)';

  @override
  String get sortByAlbumAZ => 'Album (A-Z)';

  @override
  String get recentlyAdded => 'Recently Added';

  @override
  String get noSongsFound => 'No songs found';

  @override
  String get noAlbumsFound => 'No albums found';

  @override
  String get noHomepageUrl => 'No homepage URL available';

  @override
  String get copyStreamUrl => 'Copy Stream URL';

  @override
  String get failedToLoadRadioStations => 'Failed to load radio stations';

  @override
  String get noRadioStations => 'No Radio Stations';

  @override
  String get connectToServerSubtitle => 'Connect to your Subsonic server';

  @override
  String get pleaseEnterServerUrl => 'Please enter server URL';

  @override
  String get invalidUrlFormat => 'URL must start with http:// or https://';

  @override
  String get pleaseEnterUsername => 'Please enter username';

  @override
  String get pleaseEnterPassword => 'Please enter password';

  @override
  String get legacyAuthentication => 'Legacy Authentication';

  @override
  String get legacyAuthSubtitle => 'Use for older Subsonic servers';

  @override
  String get allowSelfSignedCerts => 'Allow Self-Signed Certificates';

  @override
  String get allowSelfSignedSubtitle =>
      'For servers with custom TLS/SSL certificates';

  @override
  String get advancedOptions => 'Advanced Options';

  @override
  String get customTlsCertificate => 'Custom TLS/SSL Certificate';

  @override
  String get customCertificateSubtitle =>
      'Upload a custom certificate for servers with non-standard CA';

  @override
  String get selectCertificateFile => 'Select Certificate File';

  @override
  String get clientCertificate => 'Client Certificate (mTLS)';

  @override
  String get clientCertificateSubtitle =>
      'Authenticate this client using a certificate (requires mTLS-enabled server)';

  @override
  String get selectClientCertificate => 'Select Client Certificate';

  @override
  String get clientCertPassword => 'Certificate password (optional)';

  @override
  String failedToSelectClientCert(String error) {
    return 'Failed to select client certificate: $error';
  }

  @override
  String get connect => 'Connect';

  @override
  String get useLocalFiles => 'Use Local Files';

  @override
  String get startingScan => 'Starting scan...';

  @override
  String get storagePermissionRequired => 'Storage permission required';

  @override
  String get noMusicFilesFound => 'No music files found on your device';

  @override
  String get remove => 'Remove';

  @override
  String failedToSetRating(Object error) {
    return 'Failed to set rating: $error';
  }

  @override
  String get home => 'Home';

  @override
  String get collapse => 'Collapse';

  @override
  String get expand => 'Expand';

  @override
  String get createPlaylist => 'Create playlist';

  @override
  String get checkForUpdates => 'Check for updates';

  @override
  String get checkingForUpdates => 'Checking for updates...';

  @override
  String get appUpToDate => 'Octave is up to date';

  @override
  String get updateCheckFailed =>
      'Couldn\'t check for updates. Check your connection and try again.';

  @override
  String get updateAvailable => 'Update Available';

  @override
  String get updateNow => 'Update now';

  @override
  String get openOnGitHub => 'Open on GitHub';

  @override
  String get skipThisVersion => 'Skip this version';

  @override
  String get localFilesModeBanner => 'Local Files Mode';

  @override
  String get offlineModeBanner =>
      'Offline Mode – Playing downloaded music only';

  @override
  String get whatsNew => 'What\'s New';

  @override
  String get remindLater => 'Later';

  @override
  String get seeAll => 'See All';

  @override
  String get artistDataNotFound => 'Artist not found';

  @override
  String get addedArtistToQueue => 'Added artist to Queue';

  @override
  String get addedArtistToQueueError => 'Failed adding artist to Queue';

  @override
  String get casting => 'Casting';

  @override
  String get disconnect => 'Disconnect';

  @override
  String get removedFromLikedSongs => 'Removed from Liked Songs';

  @override
  String get addedToLikedSongs => 'Added to Liked Songs';

  @override
  String get connecting => 'Connecting';

  @override
  String errorStartingDownload(Object error) {
    return 'Error starting download: $error';
  }

  @override
  String get errorLoadingGenres => 'Error loading genres';

  @override
  String get noGenresFound => 'No genres found';

  @override
  String get noAlbumsInGenre => 'No albums in this genre';

  @override
  String genreTooltip(int songCount, int albumCount) {
    return '$songCount songs • $albumCount albums';
  }

  @override
  String get jukeboxMode => 'Jukebox Mode';

  @override
  String get jukeboxClearQueue => 'Clear Queue';

  @override
  String get jukeboxQueueEmpty => 'No songs in queue';

  @override
  String get playOnJukebox => 'Play on Jukebox';

  @override
  String get addToJukeboxQueue => 'Add to Jukebox Queue';

  @override
  String get jukeboxNotSupported =>
      'Jukebox mode is not supported by this server. Enable it in your server configuration (e.g. EnableJukebox = true in Navidrome).';

  @override
  String get musicFoldersHint =>
      'Leave all enabled to use all folders (default).';

  @override
  String get serverUnreachableTitle => 'Cannot reach server';

  @override
  String get serverUnreachableSubtitle =>
      'Check your connection or server settings.';

  @override
  String get openOfflineMode => 'Open in offline mode';

  @override
  String get appearanceSection => 'Appearance';

  @override
  String get themeLabel => 'Theme';

  @override
  String get accentColorLabel => 'App color';

  @override
  String get circularDesignLabel => 'Circular Design';

  @override
  String get circularDesignSubtitle =>
      'Floating, rounded UI with translucent panels and glass-blur effect on the player and navigation bar.';

  @override
  String get themeModeSystem => 'System';

  @override
  String get themeModeLight => 'Light';

  @override
  String get themeModeDark => 'Dark';

  @override
  String get liveLabel => 'LIVE';

  @override
  String radioUnavailable(String name) {
    return 'Can\'t play $name right now.';
  }

  @override
  String get outsideLibrary => 'Not in your library';

  @override
  String get sectionVolumeNormalization => 'VOLUME NORMALIZATION (REPLAYGAIN)';

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
  String get replayGainModeTrack => 'Track';

  @override
  String get replayGainModeAlbum => 'Album';

  @override
  String replayGainPreamp(String value) {
    return 'Preamp: $value dB';
  }

  @override
  String get replayGainPreventClipping => 'Prevent Clipping';

  @override
  String replayGainFallbackGain(String value) {
    return 'Fallback Gain: $value dB';
  }

  @override
  String autoDjSongsToAdd(int count) {
    return 'Songs to Add: $count';
  }

  @override
  String get transcodingEnable => 'Enable Transcoding';

  @override
  String get transcodingEnableSubtitle =>
      'Reduce data usage with lower quality';

  @override
  String get smartTranscoding => 'Smart Transcoding';

  @override
  String get smartTranscodingSubtitle =>
      'Automatically adjusts quality based on your connection (WiFi vs mobile data)';

  @override
  String get smartTranscodingDetectedNetwork => 'Detected network: ';

  @override
  String smartTranscodingActiveBitrate(String bitrate) {
    return 'Active bitrate: $bitrate';
  }

  @override
  String get transcodingWifiQuality => 'WiFi Quality';

  @override
  String get transcodingWifiQualitySubtitleSmart =>
      'Used automatically on WiFi';

  @override
  String get transcodingWifiQualitySubtitle => 'Bitrate when on WiFi';

  @override
  String get transcodingMobileQuality => 'Mobile Quality';

  @override
  String get transcodingMobileQualitySubtitleSmart =>
      'Used automatically on cellular data';

  @override
  String get transcodingMobileQualitySubtitle => 'Bitrate when on mobile data';

  @override
  String get transcodingFormat => 'Format';

  @override
  String get transcodingFormatSubtitle => 'Audio codec used for streaming';

  @override
  String get transcodingBitrateOriginal => 'Original (No Transcoding)';

  @override
  String get transcodingFormatOriginal => 'Original';

  @override
  String get sectionAboutInformation => 'INFORMATION';

  @override
  String get sectionAboutDeveloper => 'DEVELOPER';

  @override
  String get sectionAboutLinks => 'LINKS';

  @override
  String get aboutVersion => 'Version';

  @override
  String get aboutPlatform => 'Platform';

  @override
  String get aboutMadeBy => 'Made by dddevid';

  @override
  String get aboutGitHub => 'github.com/dddevid/Musly';

  @override
  String get aboutLinkGitHub => 'GitHub Repository';

  @override
  String get aboutLinkChangelog => 'Changelog';

  @override
  String get aboutLinkReportIssue => 'Report Issue';

  @override
  String get aboutLicense => 'License';

  @override
  String get reportKindBug => 'A problem';

  @override
  String get reportKindIdea => 'An idea';

  @override
  String get reportMessageHintBug => 'What happened? What were you doing?';

  @override
  String get reportMessageHintIdea => 'What would you like Octave to do?';

  @override
  String get reportIncludeDetails => 'Include technical details';

  @override
  String get reportIncludeDetailsSubtitle =>
      'App version, device, song playing and the app\'s recent log. Never a password.';

  @override
  String get reportSend => 'Send';

  @override
  String get reportSent => 'Thanks, your message is sent.';

  @override
  String get reportGitHubNote =>
      'Your server doesn\'t take reports: the message will open on GitHub, which needs an account.';

  @override
  String get reportOpenGitHub => 'Continue on GitHub';

  @override
  String reportSendFailed(String error) {
    return 'Couldn\'t send: $error';
  }

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
  String get setupSkipAll => 'Skip setup';

  @override
  String get setupArtistsTitle => 'Your artists';

  @override
  String get setupArtistsBody =>
      'Pick the ones you love. Octo uses them for your mixes and radios.';

  @override
  String get setupArtistsSearchHint => 'Search for an artist';

  @override
  String setupArtistsPicked(int count) {
    return 'Your picks ($count)';
  }

  @override
  String get setupArtistsMine => 'Your most played';

  @override
  String get setupArtistsFrance => 'Most played in France';

  @override
  String get setupArtistsWorld => 'Most played worldwide';

  @override
  String get setupArtistsNoResult => 'No artist found.';

  @override
  String get setupArtistsEmpty =>
      'No suggestions right now. Search for your artists above.';

  @override
  String setupArtistsContinue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Continue with $count artists',
      one: 'Continue with $count artist',
    );
    return '$_temp0';
  }

  @override
  String get setupSummaryArtists => 'Artists';

  @override
  String setupStepOf(int current, int total) {
    return 'Step $current of $total';
  }

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
