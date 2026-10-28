// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Octave';

  @override
  String get goodMorning => 'Buenos días';

  @override
  String get goodAfternoon => 'Buenas tardes';

  @override
  String get goodEvening => 'Buenas noches';

  @override
  String get recentlyPlayed => 'Reproducido Recientemente';

  @override
  String get yourPlaylists => 'Tus Listas';

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
  String get madeForYou => 'Hecho Para Ti';

  @override
  String get topRated => 'Mejor Valorado';

  @override
  String get refresh => 'Actualizar';

  @override
  String get errorLoadingSongs => 'Error al cargar las pistas';

  @override
  String get noSongsInGenre => 'No hay canciones en este género';

  @override
  String get errorLoadingAlbums => 'Error al cargar álbumes';

  @override
  String get login => 'Inicio de sesión';

  @override
  String get serverUrl => 'URL de servidor';

  @override
  String get username => 'Nombre de usuario';

  @override
  String get password => 'Contraseña';

  @override
  String get selectCertificate => 'Seleccione certificado TLS/SSL';

  @override
  String failedToSelectCertificate(String error) {
    return 'No se pudo seleccionar el certificado: $error';
  }

  @override
  String get serverUrlMustStartWith =>
      'La URL del servidor debe comenzar con http:// o https://';

  @override
  String get failedToConnect => 'Error al conectar';

  @override
  String get library => 'Biblioteca';

  @override
  String get search => 'Búsqueda';

  @override
  String get settings => 'Preferencias';

  @override
  String get albums => 'Álbumes';

  @override
  String get artists => 'Artistas';

  @override
  String get songs => 'Canciones';

  @override
  String get playlists => 'Listas';

  @override
  String get genres => 'Géneros';

  @override
  String get favorites => 'Favoritos';

  @override
  String get nowPlaying => 'Reproduciendo';

  @override
  String get queue => 'Cola';

  @override
  String get lyrics => 'Letras';

  @override
  String get play => 'Reproducir';

  @override
  String get pause => 'Pausa';

  @override
  String get next => 'Siguiente';

  @override
  String get previous => 'Anterior';

  @override
  String get shuffle => 'Aleatorio';

  @override
  String get repeat => 'Repetir';

  @override
  String get addToPlaylist => 'Añadir a lista';

  @override
  String get removeFromPlaylist => 'Eliminar de la Lista';

  @override
  String get addToFavorites => 'Añadir a favoritos';

  @override
  String get removeFromFavorites => 'Eliminar de favoritos';

  @override
  String get download => 'Descargar';

  @override
  String get delete => 'Eliminar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get close => 'Cerrar';

  @override
  String get storage => 'Almacenamiento';

  @override
  String get language => 'Idioma';

  @override
  String get version => 'Versión';

  @override
  String get unknownArtist => 'Artista desconocido';

  @override
  String get unknownAlbum => 'Álbum Desconocido';

  @override
  String get playAll => 'Reproducir todo';

  @override
  String get sortBy => 'Ordenar por';

  @override
  String get noLyricsAvailable => 'No hay letra disponible';

  @override
  String get loading => 'Cargando...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Reintentar';

  @override
  String get allSongs => 'Todas las Canciones';

  @override
  String trackNumber(int number) {
    return 'Pista $number';
  }

  @override
  String songsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count canciones',
      one: '1 canción',
      zero: 'No hay canciones',
    );
    return '$_temp0';
  }

  @override
  String albumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count álbumes',
      one: '1 álbum',
      zero: 'No hay álbumes',
    );
    return '$_temp0';
  }

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get offlineMode => 'Modo Sin Conexión';

  @override
  String get radio => 'Radio';

  @override
  String get platform => 'Plataforma';

  @override
  String get server => 'Servidor';

  @override
  String get playerInterface => 'Interfaz del reproductor';

  @override
  String get playerBackgroundFromCover => 'Cover color in the background';

  @override
  String get playerBackgroundFromCoverSubtitle =>
      'Otherwise the full player takes the app color.';

  @override
  String get smartRecommendations => 'Recomendaciones Inteligentes';

  @override
  String get showVolumeSlider => 'Mostrar barra de volumen';

  @override
  String get showVolumeSliderSubtitle =>
      'Mostrar control de volumen en la pantalla de reproducción';

  @override
  String get enableRecommendations => 'Habilitar Recomendaciones';

  @override
  String get enableRecommendationsSubtitle =>
      'Obtener sugerencias musicales personalizadas';

  @override
  String get listeningData => 'Datos de Reproducción';

  @override
  String totalPlays(int count) {
    return '$count reproducciones totales';
  }

  @override
  String get clearListeningHistory => 'Borrar Historial de Reproducción';

  @override
  String get confirmClearHistory =>
      'Esto restablecerá todos sus datos de reproducción y recomendaciones. ¿Está seguro?';

  @override
  String get historyCleared => 'Historial de Reproducción borrado';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get systemDefault => 'Valores por defecto del sistema';

  @override
  String get communityTranslations => 'Traducciones por la comunidad';

  @override
  String get communityTranslationsSubtitle =>
      'Ayude a traducir Octave en GitHub';

  @override
  String get yourLibrary => 'Tu Biblioteca';

  @override
  String get filterAll => 'Todo';

  @override
  String get filterPlaylists => 'Listas';

  @override
  String get likedSongs => 'Canciones que te gustan';

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
  String get radioStations => 'Emisoras de radio';

  @override
  String get playlist => 'Lista';

  @override
  String get internetRadio => 'Radio de Internet';

  @override
  String get newPlaylist => 'Nueva Lista';

  @override
  String get playlistName => 'Nombre de la Lista';

  @override
  String get create => 'Crear';

  @override
  String get deletePlaylist => 'Eliminar Lista';

  @override
  String deletePlaylistConfirmation(String name) {
    return '¿Está seguro de que desea eliminar la lista \"$name\"?';
  }

  @override
  String playlistDeleted(String name) {
    return 'Lista \"$name\" eliminada';
  }

  @override
  String errorCreatingPlaylist(Object error) {
    return 'Error al crear la lista: $error';
  }

  @override
  String playlistCreated(String name) {
    return 'Lista \"$name\" creada';
  }

  @override
  String get homeSection => 'Home';

  @override
  String get categoryNewReleases => 'Estrenos';

  @override
  String get categoryRadio => 'Radio';

  @override
  String get settingsTitle => 'Preferencias';

  @override
  String get tabPlayback => 'Reproducción';

  @override
  String get tabStorage => 'Almacenamiento';

  @override
  String get tabServer => 'Servidor';

  @override
  String get tabDisplay => 'Pantalla';

  @override
  String get tabAbout => 'Acerca de';

  @override
  String get sectionAutoDj => 'AUTO DJ';

  @override
  String get autoDjMode => 'Modo Auto DJ';

  @override
  String songsToAdd(int count) {
    return 'Canciones a añadir: $count';
  }

  @override
  String get replayGainMode => 'Modo';

  @override
  String get sectionStreamingQuality => 'CALIDAD DE TRANSMISIÓN';

  @override
  String get format => 'Formato';

  @override
  String get serverType => 'Tipo de Servidor';

  @override
  String get notConnected => 'No conectado';

  @override
  String get unknown => 'Desconocido';

  @override
  String get musicFolders => 'Carpeta de Música';

  @override
  String get noMusicFolders => 'No se encontraron carpetas de música';

  @override
  String get switchProfile => 'Switch Profile';

  @override
  String get switchServer => 'Switch Server';

  @override
  String get sectionAccount => 'CUENTA';

  @override
  String get logoutConfirmation =>
      '¿Seguro que quieres cerrar sesión? También se eliminarán todos los datos en caché.';

  @override
  String get imageCache => 'Caché de Imágenes';

  @override
  String get sectionCacheCleanup => 'LIMPIEZA DE CACHÉ';

  @override
  String get clearAllCache => 'Borrar toda la caché';

  @override
  String get allCacheCleared => 'Toda la caché borrada';

  @override
  String get sectionOfflineDownloads => 'DESCARGAS SIN CONEXIÓN';

  @override
  String get downloadedSongs => 'Canciones Descargadas';

  @override
  String downloadingLibrary(int progress, int total) {
    return 'Descargando Biblioteca... $progress/$total';
  }

  @override
  String get downloadAllLibrary => 'Descargar toda la Biblioteca';

  @override
  String downloadLibraryConfirm(int count) {
    return 'Esto descargará $count canciones en tu dispositivo. Esto puede tardar un rato y usar un espacio de almacenamiento significativo.\n\n¿Continuar?';
  }

  @override
  String get libraryDownloadStarted => 'Descarga de la Biblioteca iniciada';

  @override
  String get deleteDownloads => 'Eliminar Todas las Descargas';

  @override
  String get downloadsDeleted => 'Todas las descargas eliminadas';

  @override
  String get noSongsAvailable =>
      'No hay canciones disponibles. Por favor, cargue su biblioteca primero.';

  @override
  String downloadedStats(int count, String size) {
    return '$count canciones · $size';
  }

  @override
  String get removeFromLiked => 'Eliminar de Canciones que te gustan';

  @override
  String get addToLiked => 'Añadir a Canciones que te gustan';

  @override
  String get playNext => 'Reproducir a continuación';

  @override
  String get addToQueue => 'Añadir a la Cola';

  @override
  String get goToAlbum => 'Ir al Álbum';

  @override
  String get goToArtist => 'Ir al artista';

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
  String get rateSong => 'Puntuar canción';

  @override
  String rateSongValue(int rating, String stars) {
    return 'Puntuar Canción ($rating $stars)';
  }

  @override
  String get ratingRemoved => 'Valoración eliminada';

  @override
  String rated(int rating, String stars) {
    return 'Valorado con $rating $stars';
  }

  @override
  String get removeRating => 'Eliminar Puntuación';

  @override
  String get downloaded => 'Descargado';

  @override
  String downloading(int percent) {
    return 'Descargando... $percent%';
  }

  @override
  String get removeDownload => 'Eliminar la descarga';

  @override
  String get removeDownloadConfirm =>
      '¿Eliminar esta canción del almacenamiento sin conexión?';

  @override
  String get downloadRemoved => 'Descarga eliminada';

  @override
  String downloadedTitle(String title) {
    return 'Descargado \"$title\"';
  }

  @override
  String get downloadFailed => 'Descarga fallida';

  @override
  String downloadError(Object error) {
    return 'Error de descarga: $error';
  }

  @override
  String addedToPlaylist(String title, String playlist) {
    return 'Añadido \"$title\" a $playlist';
  }

  @override
  String errorAddingToPlaylist(Object error) {
    return 'Error al añadir a la lista: $error';
  }

  @override
  String get noPlaylists => 'No hay listas disponibles';

  @override
  String artistNotFound(String name) {
    return 'Artista \"$name\" no encontrado';
  }

  @override
  String errorSearchingArtist(Object error) {
    return 'Error al buscar el artista: $error';
  }

  @override
  String get removedFromFavorites => 'Eliminado de favoritos';

  @override
  String get addedToFavorites => 'Añadido a favoritos';

  @override
  String get star => 'estrella';

  @override
  String get stars => 'estrellas';

  @override
  String get albumNotFound => 'Álbum no encontrado.';

  @override
  String get topSongs => 'Canciones Destacadas';

  @override
  String get connected => 'Conectado';

  @override
  String get noSongPlaying => 'No se está reproduciendo ninguna canción';

  @override
  String get playlistNameHint => 'Nombre de la Lista';

  @override
  String errorLoadingPlaylists(Object error) {
    return 'Error al cargar lista: $error';
  }

  @override
  String get playlistNotFound => 'Lista no encontrada';

  @override
  String get noSongsInPlaylist => 'No hay canciones en esta lista';

  @override
  String get noFavoriteSongsYet => 'Aún no hay canciones favoritas';

  @override
  String get noFavoriteAlbumsYet => 'Aún no hay álbumes favoritos';

  @override
  String get listeningHistory => 'Historial de Reproducción';

  @override
  String get sortByTitleAZ => 'Título (A-Z)';

  @override
  String get sortByTitleZA => 'Título (Z-A)';

  @override
  String get sortByArtistAZ => 'Artista (A-Z)';

  @override
  String get sortByAlbumAZ => 'Álbum (A-Z)';

  @override
  String get recentlyAdded => 'Añadido recientemente';

  @override
  String get noSongsFound => 'No se han encontrado canciones';

  @override
  String get noAlbumsFound => 'No se encontraron álbumes';

  @override
  String get noHomepageUrl => 'No hay URL de página de inicio disponible';

  @override
  String get copyStreamUrl => 'Copiar URL de la Transmisión';

  @override
  String get failedToLoadRadioStations =>
      'Error al cargar las emisoras de radio';

  @override
  String get noRadioStations => 'Sin Emisoras de Radio';

  @override
  String get connectToServerSubtitle => 'Conectar a tu servidor de Subsonic';

  @override
  String get pleaseEnterServerUrl =>
      'Por favor, introduzca la URL del servidor';

  @override
  String get invalidUrlFormat =>
      'La dirección URL debe comenzar con http:// o https://';

  @override
  String get pleaseEnterUsername => 'Por favor, introduzca nombre de usuario';

  @override
  String get pleaseEnterPassword => 'Por favor, introduzca contraseña';

  @override
  String get legacyAuthentication => 'Autenticación heredada';

  @override
  String get legacyAuthSubtitle => 'Usar para servidores Subsonic antiguos';

  @override
  String get allowSelfSignedCerts => 'Permitir certificados autofirmados';

  @override
  String get allowSelfSignedSubtitle =>
      'Para servidores con certificados TLS/SSL personalizados';

  @override
  String get advancedOptions => 'Opciones Avanzadas';

  @override
  String get customTlsCertificate => 'Certificado TLS/SSL personalizado';

  @override
  String get customCertificateSubtitle =>
      'Subir un certificado personalizado para servidores con CA no estándar';

  @override
  String get selectCertificateFile => 'Seleccionar archivo de certificado';

  @override
  String get clientCertificate => 'Certificado de Cliente (mTLS)';

  @override
  String get clientCertificateSubtitle =>
      'Autenticar este cliente usando un certificado (requiere un servidor con mTLS)';

  @override
  String get selectClientCertificate => 'Seleccionar Certificado de Cliente';

  @override
  String get clientCertPassword => 'Certificar contraseña (opcional)';

  @override
  String failedToSelectClientCert(String error) {
    return 'No se pudo seleccionar el certificado del cliente: $error';
  }

  @override
  String get connect => 'Conectar';

  @override
  String get useLocalFiles => 'Usar Archivos Locales';

  @override
  String get startingScan => 'Iniciando escaneo...';

  @override
  String get storagePermissionRequired =>
      'Permiso de almacenamiento necesario para escanear archivos locales';

  @override
  String get noMusicFilesFound =>
      'No se han encontrado archivos de música en tu dispositivo';

  @override
  String get remove => 'Eliminar';

  @override
  String failedToSetRating(Object error) {
    return 'Error al establecer la valoración: $error';
  }

  @override
  String get home => 'Inicio';

  @override
  String get collapse => 'Contraer';

  @override
  String get expand => 'Expandir';

  @override
  String get createPlaylist => 'Crear Lista';

  @override
  String get checkForUpdates => 'Check for updates';

  @override
  String get checkingForUpdates => 'Checking for updates...';

  @override
  String get appUpToDate => 'Octave is up to date';

  @override
  String get updateAvailable => 'Actualización Disponible';

  @override
  String get updateNow => 'Update now';

  @override
  String get openOnGitHub => 'Open on GitHub';

  @override
  String get skipThisVersion => 'Skip this version';

  @override
  String get localFilesModeBanner => 'Modo archivos locales';

  @override
  String get offlineModeBanner =>
      'Modo sin conexión - Reproduciendo solo música descargada';

  @override
  String get whatsNew => 'Novedades';

  @override
  String get remindLater => 'Más tarde';

  @override
  String get seeAll => 'Ver todo';

  @override
  String get artistDataNotFound => 'Artista no encontrado';

  @override
  String get addedArtistToQueue => 'Artista añadido a la cola';

  @override
  String get addedArtistToQueueError => 'Error al añadir artista a la cola';

  @override
  String get casting => 'Casting';

  @override
  String get disconnect => 'Desconectar';

  @override
  String get removedFromLikedSongs => 'Eliminado de Canciones que te gustan';

  @override
  String get addedToLikedSongs => 'Añadido a Canciones que te gustan';

  @override
  String get connecting => 'Conectando';

  @override
  String errorStartingDownload(Object error) {
    return 'Error al iniciar la descarga: $error';
  }

  @override
  String get errorLoadingGenres => 'Error al cargar géneros';

  @override
  String get noGenresFound => 'No se encontraron géneros';

  @override
  String get noAlbumsInGenre => 'No hay álbumes en este género';

  @override
  String genreTooltip(int songCount, int albumCount) {
    return '$songCount canciones • $albumCount  ábumes';
  }

  @override
  String get jukeboxMode => 'Modo tocadiscos';

  @override
  String get jukeboxClearQueue => 'Limpiar cola';

  @override
  String get jukeboxQueueEmpty => 'No hay canciones en cola';

  @override
  String get playOnJukebox => 'Reproducir en Jukebox';

  @override
  String get addToJukeboxQueue => 'Añadir a la cola de Tocadiscos';

  @override
  String get jukeboxNotSupported =>
      'El modo Jukebox no es compatible con este servidor. Actívalo en la configuración del servidor (p. ej. EnableJukebox = true en Navidrome).';

  @override
  String get musicFoldersHint =>
      'Deja todo activado para usar todas las carpetas (predeterminado).';

  @override
  String get serverUnreachableTitle => 'No se puede acceder al servidor';

  @override
  String get serverUnreachableSubtitle =>
      'Compruebe su conexión o configuración del servidor.';

  @override
  String get openOfflineMode => 'Abrir en modo sin conexión';

  @override
  String get appearanceSection => 'Apariencia';

  @override
  String get themeLabel => 'Tema';

  @override
  String get accentColorLabel => 'Color acentuado';

  @override
  String get circularDesignLabel => 'Diseño circular';

  @override
  String get circularDesignSubtitle =>
      'Interfaz flotante y redondeada con paneles translúcidos y efecto desenfoque de cristal en el reproductor y la barra de navegación.';

  @override
  String get themeModeSystem => 'Sistema';

  @override
  String get themeModeLight => 'Claro';

  @override
  String get themeModeDark => 'Oscuro';

  @override
  String get liveLabel => 'EN DIRECTO';

  @override
  String get sectionVolumeNormalization =>
      'NORMALIZACIÓN DE VOLUMEN (REPLAYGAIN)';

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
  String get replayGainModeOff => 'Desactivado';

  @override
  String get replayGainModeTrack => 'Pista';

  @override
  String get replayGainModeAlbum => 'Álbum';

  @override
  String replayGainPreamp(String value) {
    return 'Preamplificador: $value dB';
  }

  @override
  String get replayGainPreventClipping => 'Evitar recorte';

  @override
  String replayGainFallbackGain(String value) {
    return 'Ganancia de reserva: $value dB';
  }

  @override
  String autoDjSongsToAdd(int count) {
    return 'Canciones a añadir: $count';
  }

  @override
  String get transcodingEnable => 'Habilitar Transcodificación';

  @override
  String get transcodingEnableSubtitle =>
      'Reducir el uso de datos con menor calidad';

  @override
  String get smartTranscoding => 'Transcodificación Inteligente';

  @override
  String get smartTranscodingSubtitle =>
      'Ajusta automáticamente la calidad en función de tu conexión (WiFi vs datos móviles)';

  @override
  String get smartTranscodingDetectedNetwork => 'Red detectada: ';

  @override
  String smartTranscodingActiveBitrate(String bitrate) {
    return 'Tasa de bits activa: $bitrate';
  }

  @override
  String get transcodingWifiQuality => 'Calidad WiFi';

  @override
  String get transcodingWifiQualitySubtitleSmart =>
      'Utilizado automáticamente con WiFi';

  @override
  String get transcodingWifiQualitySubtitle => 'Tasa de bits al usar WiFi';

  @override
  String get transcodingMobileQuality => 'Calidad Móvil';

  @override
  String get transcodingMobileQualitySubtitleSmart =>
      'Utilizado automáticamente en datos móviles';

  @override
  String get transcodingMobileQualitySubtitle =>
      'Tasa de bits al usar datos móviles';

  @override
  String get transcodingFormat => 'Formato';

  @override
  String get transcodingFormatSubtitle =>
      'Códec de audio usado para la transmisión';

  @override
  String get transcodingBitrateOriginal => 'Original (Sin Transcodificación)';

  @override
  String get transcodingFormatOriginal => 'Original';

  @override
  String get sectionAboutInformation => 'INFORMACIÓN';

  @override
  String get sectionAboutDeveloper => 'DESARROLLADOR';

  @override
  String get sectionAboutLinks => 'ENLACES';

  @override
  String get aboutVersion => 'Versión';

  @override
  String get aboutPlatform => 'Plataforma';

  @override
  String get aboutMadeBy => 'Hecho por dddevid';

  @override
  String get aboutGitHub => 'github.com/dddevid';

  @override
  String get aboutLinkGitHub => 'Repositorio de GitHub';

  @override
  String get aboutLinkChangelog => 'Historial de actualizaciones';

  @override
  String get aboutLinkReportIssue => 'Reportar problema';

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
  String get selectPlaylist => 'Select Playlist';

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
