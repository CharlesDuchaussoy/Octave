// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Octave';

  @override
  String get goodMorning => 'Доброе утро';

  @override
  String get goodAfternoon => 'Добрый день';

  @override
  String get goodEvening => 'Добрый вечер';

  @override
  String get recentlyPlayed => 'Недавно играли';

  @override
  String get yourPlaylists => 'Ваши плейлисты';

  @override
  String get favoritePlaylists => 'Favorite Playlists';

  @override
  String get sectionAlbums => 'Albums';

  @override
  String get sectionEPs => 'EPs';

  @override
  String get sectionSingles => 'Singles';

  @override
  String get madeForYou => 'Сделано для вас';

  @override
  String get topRated => 'Высоко оценённые';

  @override
  String get refresh => 'Обновить';

  @override
  String get errorLoadingSongs => 'Ошибка при загрузке треков';

  @override
  String get noSongsInGenre => 'Нет песен в этом жанре';

  @override
  String get errorLoadingAlbums => 'Ошибка при загрузке альбомов';

  @override
  String get login => 'Войти';

  @override
  String get serverUrl => 'URL-адрес сервера';

  @override
  String get username => 'Имя пользователя';

  @override
  String get password => 'Пароль';

  @override
  String get selectCertificate => 'Выберите сертификат TLS/SSL';

  @override
  String failedToSelectCertificate(String error) {
    return 'Не удалось выбрать сертификат: $error';
  }

  @override
  String get serverUrlMustStartWith =>
      'URL-адрес сервера должен начинаться с http:// или https://';

  @override
  String get failedToConnect => 'Не удалось подключиться';

  @override
  String get library => 'Библиотека';

  @override
  String get search => 'Поиск';

  @override
  String get settings => 'Настройки';

  @override
  String get albums => 'Альбомы';

  @override
  String get artists => 'Исполнители';

  @override
  String get songs => 'Песни';

  @override
  String get playlists => 'Плейлисты';

  @override
  String get genres => 'Жанры';

  @override
  String get favorites => 'Избранное';

  @override
  String get nowPlaying => 'Сейчас играет';

  @override
  String get queue => 'Очередь';

  @override
  String get lyrics => 'Текст';

  @override
  String get play => 'Играть';

  @override
  String get pause => 'Пауза';

  @override
  String get next => 'Далее';

  @override
  String get previous => 'Предыдущий';

  @override
  String get shuffle => 'Перемешивание';

  @override
  String get repeat => 'Повтор';

  @override
  String get addToPlaylist => 'Добавить в плейлист';

  @override
  String get removeFromPlaylist => 'Удалить трек из плейлиста';

  @override
  String get addToFavorites => 'Добавить в избранное';

  @override
  String get removeFromFavorites => 'Удалить из избранного';

  @override
  String get download => 'Скачать';

  @override
  String get delete => 'Удалить';

  @override
  String get cancel => 'Отмена';

  @override
  String get save => 'Сохранить';

  @override
  String get close => 'Закрыть';

  @override
  String get storage => 'Хранилище';

  @override
  String get language => 'Язык';

  @override
  String get version => 'Версия';

  @override
  String get unknownArtist => 'Неизвестный исполнитель';

  @override
  String get unknownAlbum => 'Неизвестный альбом';

  @override
  String get playAll => 'Проиграть все';

  @override
  String get sortBy => 'Сортировать по';

  @override
  String get noLyricsAvailable => 'Нет доступных текстов';

  @override
  String get loading => 'Загрузка...';

  @override
  String get error => 'Ошибка';

  @override
  String get retry => 'Повторить';

  @override
  String get allSongs => 'Все песни';

  @override
  String trackNumber(int number) {
    return 'Трек $number';
  }

  @override
  String songsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count песен',
      many: '$count песен',
      few: '$count песни',
      one: '1 песня',
      zero: 'Нет песен',
    );
    return '$_temp0';
  }

  @override
  String albumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count альбомов',
      many: '$count альбомов',
      few: '$count альбома',
      one: '1 альбом',
      zero: 'Нет альбомов',
    );
    return '$_temp0';
  }

  @override
  String get logout => 'Выйти';

  @override
  String get offlineMode => 'Автономный режим';

  @override
  String get radio => 'Радио';

  @override
  String get platform => 'Платформа';

  @override
  String get server => 'Сервер';

  @override
  String get playerInterface => 'Интерфейс плеера';

  @override
  String get smartRecommendations => 'Умные рекомендации';

  @override
  String get showVolumeSlider => 'Показать ползунок громкости';

  @override
  String get showVolumeSliderSubtitle =>
      'Отображать управление громкостью на экране воспроизведения';

  @override
  String get enableRecommendations => 'Включить рекомендации';

  @override
  String get enableRecommendationsSubtitle =>
      'Получайте персональные рекомендации';

  @override
  String get listeningData => 'Данные о прослушивании';

  @override
  String totalPlays(int count) {
    return 'Всего прослушиваний: $count ';
  }

  @override
  String get clearListeningHistory => 'Очистить историю прослушивания';

  @override
  String get confirmClearHistory =>
      'Это сбросит все ваши данные и рекомендации. Вы уверены?';

  @override
  String get historyCleared => 'История прослушивания очищена';

  @override
  String get selectLanguage => 'Выберите язык';

  @override
  String get systemDefault => 'Системный по умолчанию';

  @override
  String get communityTranslations => 'Переведено сообществом';

  @override
  String get communityTranslationsSubtitle =>
      'Помогите перевести Octave на GitHub';

  @override
  String get yourLibrary => 'Ваша библиотека';

  @override
  String get filterAll => 'Все';

  @override
  String get filterPlaylists => 'Плейлисты';

  @override
  String get likedSongs => 'Понравившиеся песни';

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
  String get radioStations => 'Радиостанции';

  @override
  String get playlist => 'Плейлист';

  @override
  String get internetRadio => 'Интернет-радио';

  @override
  String get newPlaylist => 'Новый плейлист';

  @override
  String get playlistName => 'Название плейлиста';

  @override
  String get create => 'Создать';

  @override
  String get deletePlaylist => 'Удалить плейлист';

  @override
  String deletePlaylistConfirmation(String name) {
    return 'Вы уверены, что хотите удалить плейлист «$name»?';
  }

  @override
  String playlistDeleted(String name) {
    return 'Плейлист с названием «$name» удалён';
  }

  @override
  String errorCreatingPlaylist(Object error) {
    return 'Ошибка при создании плейлиста: $error';
  }

  @override
  String playlistCreated(String name) {
    return 'Плейлист с названием «$name» создан';
  }

  @override
  String get homeSection => 'Home';

  @override
  String get categoryNewReleases => 'Новые выпуски';

  @override
  String get categoryRadio => 'Радио';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get tabPlayback => 'Воспроизведение';

  @override
  String get tabStorage => 'Хранилище';

  @override
  String get tabServer => 'Сервер';

  @override
  String get tabDisplay => 'Дисплей';

  @override
  String get tabAbout => 'Информация';

  @override
  String get sectionAutoDj => 'Авто-диджей';

  @override
  String get autoDjMode => 'Режим авто-диджея';

  @override
  String songsToAdd(int count) {
    return 'Песни для добавления: $count';
  }

  @override
  String get replayGainMode => 'Режим';

  @override
  String get sectionStreamingQuality => 'КАЧЕСТВО СТРИМИНГА';

  @override
  String get format => 'Формат';

  @override
  String get serverType => 'Тип сервера';

  @override
  String get notConnected => 'Нет подключения';

  @override
  String get unknown => 'Неизвестно';

  @override
  String get musicFolders => 'Папки с музыкой';

  @override
  String get noMusicFolders => 'Папки с музыкой не найдены';

  @override
  String get switchProfile => 'Switch Profile';

  @override
  String get switchServer => 'Switch Server';

  @override
  String get sectionAccount => 'АККАУНТ';

  @override
  String get logoutConfirmation =>
      'Вы уверены, что хотите выйти? Это также удалит все кэшированные данные.';

  @override
  String get imageCache => 'Кэш изображений';

  @override
  String get sectionCacheCleanup => 'ОЧИСТКА КЭША';

  @override
  String get clearAllCache => 'Очистить весь кэш';

  @override
  String get allCacheCleared => 'Весь кэш очищен';

  @override
  String get sectionOfflineDownloads => 'АВТОНОМНЫЕ ЗАГРУЗКИ';

  @override
  String get downloadedSongs => 'Загруженные треки';

  @override
  String downloadingLibrary(int progress, int total) {
    return 'Загрузка библиотеки... $progress/$total';
  }

  @override
  String get downloadAllLibrary => 'Загрузить всю библиотеку';

  @override
  String downloadLibraryConfirm(int count) {
    return 'Будет скачано $count песен. Это может занять некоторое время и потребовать значительного объёма памяти.\n\nПродолжить?';
  }

  @override
  String get libraryDownloadStarted => 'Загрузка библиотеки началась';

  @override
  String get deleteDownloads => 'Удалить все загрузки';

  @override
  String get downloadsDeleted => 'Все загрузки удалены';

  @override
  String get noSongsAvailable =>
      'Нет доступных треков. Пожалуйста, сначала добавьте файлы в библиотеку.';

  @override
  String downloadedStats(int count, String size) {
    return '$count пес. • $size';
  }

  @override
  String get removeFromLiked => 'Удалить из понравившихся песен';

  @override
  String get addToLiked => 'Добавить в понравившиеся песни';

  @override
  String get playNext => 'Воспроизвести следующим';

  @override
  String get addToQueue => 'Добавить в очередь';

  @override
  String get goToAlbum => 'Перейти к альбому';

  @override
  String get goToArtist => 'Перейти к исполнителю';

  @override
  String get rateSong => 'Оценить песню';

  @override
  String rateSongValue(int rating, String stars) {
    return 'Оценка песни ($rating $stars)';
  }

  @override
  String get ratingRemoved => 'Оценка удалена';

  @override
  String rated(int rating, String stars) {
    return 'Оценка $rating $stars';
  }

  @override
  String get removeRating => 'Удалить оценку';

  @override
  String get downloaded => 'Скачано';

  @override
  String downloading(int percent) {
    return 'Скачивание... $percent%';
  }

  @override
  String get removeDownload => 'Удалить загрузку';

  @override
  String get removeDownloadConfirm =>
      'Удалить эту песню из автономного хранилища?';

  @override
  String get downloadRemoved => 'Загрузка удалена';

  @override
  String downloadedTitle(String title) {
    return 'Загружено «$title»';
  }

  @override
  String get downloadFailed => 'Не удалось загрузить';

  @override
  String downloadError(Object error) {
    return 'Ошибка загрузки: $error';
  }

  @override
  String addedToPlaylist(String title, String playlist) {
    return 'Добавлено «$title» в плейлист «$playlist»';
  }

  @override
  String errorAddingToPlaylist(Object error) {
    return 'Ошибка при добавлении в плейлист: $error';
  }

  @override
  String get noPlaylists => 'Нет доступных плейлистов';

  @override
  String artistNotFound(String name) {
    return 'Исполнитель «$name» не найден';
  }

  @override
  String errorSearchingArtist(Object error) {
    return 'Ошибка при поиске исполнителя: $error';
  }

  @override
  String get removedFromFavorites => 'Удалено из избранного';

  @override
  String get addedToFavorites => 'Добавлено в избранное';

  @override
  String get star => 'зв.';

  @override
  String get stars => 'зв.';

  @override
  String get albumNotFound => 'Альбом не найден';

  @override
  String get topSongs => 'Лучшие песни';

  @override
  String get connected => 'Подключено';

  @override
  String get noSongPlaying => 'Трек не воспроизводится';

  @override
  String get playlistNameHint => 'Название плейлиста';

  @override
  String errorLoadingPlaylists(Object error) {
    return 'Ошибка при загрузке плейлистов: $error';
  }

  @override
  String get playlistNotFound => 'Плейлист не найден';

  @override
  String get noSongsInPlaylist => 'Нет песен в этом плейлисте';

  @override
  String get noFavoriteSongsYet => 'Нет избранных песен';

  @override
  String get noFavoriteAlbumsYet => 'Нет избранных альбомов';

  @override
  String get listeningHistory => 'История прослушивания';

  @override
  String get sortByTitleAZ => 'Название (А-Я)';

  @override
  String get sortByTitleZA => 'Название (Я-А)';

  @override
  String get sortByArtistAZ => 'Исполнитель (А-Я)';

  @override
  String get sortByAlbumAZ => 'Альбом (А-Я)';

  @override
  String get recentlyAdded => 'Недавно добавлено';

  @override
  String get noSongsFound => 'Не найдено песен';

  @override
  String get noAlbumsFound => 'Альбомы не найдены';

  @override
  String get noHomepageUrl => 'URL-адрес главной страницы не найден';

  @override
  String get copyStreamUrl => 'Копировать URL-адрес трансляции';

  @override
  String get failedToLoadRadioStations => 'Не удалось загрузить радиостанции';

  @override
  String get noRadioStations => 'Нет радиостанций';

  @override
  String get connectToServerSubtitle =>
      'Подключиться к вашему серверу Subsonic';

  @override
  String get pleaseEnterServerUrl => 'Пожалуйста, введите URL-адрес сервера';

  @override
  String get invalidUrlFormat =>
      'URL-адрес должен начинаться с http:// или https://';

  @override
  String get pleaseEnterUsername => 'Пожалуйста, введите имя пользователя';

  @override
  String get pleaseEnterPassword => 'Пожалуйста, введите пароль';

  @override
  String get legacyAuthentication => 'Устаревший метод аутентификации';

  @override
  String get legacyAuthSubtitle => 'Использовать для старых серверов Subsonic';

  @override
  String get allowSelfSignedCerts => 'Разрешить самоподписанные сертификаты';

  @override
  String get allowSelfSignedSubtitle =>
      'Для серверов с собственными TLS/SSL-сертификатами';

  @override
  String get advancedOptions => 'Дополнительные настройки';

  @override
  String get customTlsCertificate => 'Собственный TLS/SSL-сертификат';

  @override
  String get customCertificateSubtitle =>
      'Загрузите собственный сертификат для серверов с нестандартным центром сертификации (CA)';

  @override
  String get selectCertificateFile => 'Выбрать файл сертификата';

  @override
  String get clientCertificate => 'Сертификат клиента (mTLS)';

  @override
  String get clientCertificateSubtitle =>
      'Авторизовать клиент по сертификату (требуется сервер с поддержкой mTLS)';

  @override
  String get selectClientCertificate => 'Выбрать сертификат клиента';

  @override
  String get clientCertPassword => 'Пароль сертификата (необязательно)';

  @override
  String failedToSelectClientCert(String error) {
    return 'Не удалось выбрать сертификат клиента: $error';
  }

  @override
  String get connect => 'Подключиться';

  @override
  String get useLocalFiles => 'Использовать локальные файлы';

  @override
  String get startingScan => 'Запуск сканирования...';

  @override
  String get storagePermissionRequired =>
      'Для сканирования локальных файлов требуется разрешение на доступ к памяти';

  @override
  String get noMusicFilesFound =>
      'На вашем устройстве не найдено музыкальных файлов';

  @override
  String get remove => 'Удалить';

  @override
  String failedToSetRating(Object error) {
    return 'Не удалось задать оценку: $error';
  }

  @override
  String get home => 'Главная';

  @override
  String get collapse => 'Свернуть';

  @override
  String get expand => 'Развернуть';

  @override
  String get createPlaylist => 'Создать плейлист';

  @override
  String get checkForUpdates => 'Check for updates';

  @override
  String get checkingForUpdates => 'Checking for updates...';

  @override
  String get appUpToDate => 'Octave is up to date';

  @override
  String get updateAvailable => 'Доступно обновление';

  @override
  String get updateNow => 'Update now';

  @override
  String get openOnGitHub => 'Open on GitHub';

  @override
  String get skipThisVersion => 'Skip this version';

  @override
  String get localFilesModeBanner => 'Режим локальных файлов';

  @override
  String get offlineModeBanner => 'Автономный режим — только скачанная музыка';

  @override
  String get whatsNew => 'Что нового';

  @override
  String get remindLater => 'Позже';

  @override
  String get seeAll => 'Смотреть все';

  @override
  String get artistDataNotFound => 'Исполнитель не найден';

  @override
  String get addedArtistToQueue => 'Исполнитель добавлен в очередь';

  @override
  String get addedArtistToQueueError =>
      'Не удалось добавить исполнителя в очередь';

  @override
  String get casting => 'Трансляция';

  @override
  String get disconnect => 'Отключиться';

  @override
  String get removedFromLikedSongs => 'Удалено из понравившихся песен';

  @override
  String get addedToLikedSongs => 'Добавлено в понравившиеся песни';

  @override
  String get connecting => 'Подключение';

  @override
  String errorStartingDownload(Object error) {
    return 'Ошибка при запуске загрузки: $error';
  }

  @override
  String get errorLoadingGenres => 'Ошибка при загрузке жанров';

  @override
  String get noGenresFound => 'Жанры не найдены';

  @override
  String get noAlbumsInGenre => 'Нет альбомов в этом жанре';

  @override
  String genreTooltip(int songCount, int albumCount) {
    return '$songCount пес. • $albumCount альб.';
  }

  @override
  String get jukeboxMode => 'Режим муз. автомат';

  @override
  String get jukeboxClearQueue => 'Очистить очередь';

  @override
  String get jukeboxQueueEmpty => 'В очереди нет песен';

  @override
  String get playOnJukebox => 'Играть через муз. автомат';

  @override
  String get addToJukeboxQueue => 'Добавить в очередь муз. автомата';

  @override
  String get jukeboxNotSupported =>
      'Режим муз. автомата не поддерживается этим сервером. Включите его в конфигурации сервера (например, EnableJukebox = true в Navidrome).';

  @override
  String get musicFoldersHint =>
      'Оставьте всё включенным, чтобы использовать все папки (по умолчанию).';

  @override
  String get serverUnreachableTitle => 'Не удаётся подключиться к серверу';

  @override
  String get serverUnreachableSubtitle =>
      'Проверьте подключение или настройки сервера.';

  @override
  String get openOfflineMode => 'Открыть в автономном режиме';

  @override
  String get appearanceSection => 'Оформление';

  @override
  String get themeLabel => 'Тема оформления';

  @override
  String get accentColorLabel => 'Основной цвет';

  @override
  String get circularDesignLabel => 'Дизайн с круглыми элементами';

  @override
  String get circularDesignSubtitle =>
      'Интерфейс с плавающими, округлыми элементами и стеклянным размытием на плеере и панели.';

  @override
  String get themeModeSystem => 'Системная';

  @override
  String get themeModeLight => 'Светлая';

  @override
  String get themeModeDark => 'Тёмная';

  @override
  String get liveLabel => 'В ЭФИРЕ';

  @override
  String get sectionVolumeNormalization =>
      'ВЫРАВНИВАНИЕ ГРОМКОСТИ (REPLAYGAIN)';

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
  String get replayGainModeOff => 'Выкл';

  @override
  String get replayGainModeTrack => 'Трек';

  @override
  String get replayGainModeAlbum => 'Альбом';

  @override
  String replayGainPreamp(String value) {
    return 'Предварительное усиление: $value дБ';
  }

  @override
  String get replayGainPreventClipping => 'Предотвращать искажения звука';

  @override
  String replayGainFallbackGain(String value) {
    return 'Усиление по умолчанию: $value дБ';
  }

  @override
  String autoDjSongsToAdd(int count) {
    return 'Треков для добавления: $count';
  }

  @override
  String get transcodingEnable => 'Использовать перекодирование';

  @override
  String get transcodingEnableSubtitle =>
      'Экономия трафика за счёт снижения качества';

  @override
  String get smartTranscoding => 'Умное перекодирование';

  @override
  String get smartTranscodingSubtitle =>
      'Автоподбор качества по типу сети (Wi-Fi / мобильные данные)';

  @override
  String get smartTranscodingDetectedNetwork => 'Сеть обнаружена: ';

  @override
  String smartTranscodingActiveBitrate(String bitrate) {
    return 'Текущий битрейт: $bitrate';
  }

  @override
  String get transcodingWifiQuality => 'Качество Wi-Fi';

  @override
  String get transcodingWifiQualitySubtitleSmart =>
      'Автоматически используется в Wi-Fi сети';

  @override
  String get transcodingWifiQualitySubtitle => 'Битрейт в сети Wi-Fi';

  @override
  String get transcodingMobileQuality => 'Качество при мобильной сети';

  @override
  String get transcodingMobileQualitySubtitleSmart =>
      'Автоматически используется в мобильной сети';

  @override
  String get transcodingMobileQualitySubtitle =>
      'Битрейт при использовании мобильных данных';

  @override
  String get transcodingFormat => 'Формат';

  @override
  String get transcodingFormatSubtitle => 'Аудиокодек используется для вещания';

  @override
  String get transcodingBitrateOriginal => 'Оригинал (без перекодирования)';

  @override
  String get transcodingFormatOriginal => 'Оригинал';

  @override
  String get sectionAboutInformation => 'ИНФОРМАЦИЯ';

  @override
  String get sectionAboutDeveloper => 'РАЗРАБОТЧИК';

  @override
  String get sectionAboutLinks => 'ССЫЛКИ';

  @override
  String get aboutVersion => 'Версия';

  @override
  String get aboutPlatform => 'Платформа';

  @override
  String get aboutMadeBy => 'Сделано dddevid';

  @override
  String get aboutGitHub => 'github.com/dddevid';

  @override
  String get aboutLinkGitHub => 'GitHub репозиторий';

  @override
  String get aboutLinkChangelog => 'Список изменений';

  @override
  String get aboutLinkReportIssue => 'Сообщить о проблеме';

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
      'Не удалось начать воспроизведение — аудиофокус занят другим приложением';

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
