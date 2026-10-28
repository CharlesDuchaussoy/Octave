import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:musly/models/models.dart';
import 'package:musly/providers/library_provider.dart';
import 'package:musly/providers/player_provider.dart';
import 'package:musly/providers/auth_provider.dart';
import 'package:musly/services/subsonic_service.dart';
import 'package:musly/services/recommendation_service.dart';
import 'package:musly/services/offline_service.dart';
import 'package:musly/services/favorite_playlists_service.dart';
import 'package:musly/services/player_ui_settings_service.dart';
import 'package:musly/octave/widgets/octave_icon_art.dart';
import 'package:musly/theme/app_theme.dart';
import 'package:musly/utils/navigation_helper.dart';
import 'package:musly/widgets/widgets.dart';
import 'package:musly/screens/detail/album_screen.dart';
import 'package:musly/screens/detail/playlist_screen.dart';
import 'package:musly/screens/detail/artist_screen.dart';
import 'package:musly/screens/media/song_collection_screen.dart';
import 'package:musly/screens/media/favorites_screen.dart';
import 'package:musly/screens/settings/settings_screen.dart';
import 'package:musly/screens/wrapped/wrapped_screen.dart';
import 'package:musly/services/wrapped_service.dart';
import 'package:musly/l10n/app_localizations.dart';
import 'package:musly/octave/home/home_layout.dart';
import 'package:musly/octave/home/home_layout_screen.dart';
import '../../octave/home/resume_banner.dart';
import '../../octave/server/queue_handoff.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  Map<String, List<Song>> _cachedMixes = const {};
  List<Song> _cachedPersonalized = const [];
  List<Song> _cachedListenAgain = const [];
  List<Song> _cachedTopHits = const [];
  String _lastRandomKey = '';
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    HomeLayout.instance.addListener(_onLayoutChanged);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkQueueOffer());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    HomeLayout.instance.removeListener(_onLayoutChanged);
    super.dispose();
  }

  // Back in Octave, maybe after listening on another device.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _checkQueueOffer();
  }

  /// Offers the queue another device or app left on the server.
  void _checkQueueOffer() {
    if (!mounted) return;
    QueueHandoff.instance.checkOffer(
      Provider.of<SubsonicService>(context, listen: false),
      playing: Provider.of<PlayerProvider>(context, listen: false).currentSong,
    );
  }

  void _onLayoutChanged() {
    if (mounted) setState(() {});
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return AppLocalizations.of(context)?.goodMorning ?? 'Good morning';
    }
    if (hour < 17) {
      return AppLocalizations.of(context)?.goodAfternoon ?? 'Good afternoon';
    }
    return AppLocalizations.of(context)?.goodEvening ?? 'Good evening';
  }

  String _computeRandomKey(List<Song> songs, RecommendationService rec) {
    if (songs.isEmpty) return '';
    final lastPlayed =
        rec.recentlyPlayed.isNotEmpty ? rec.recentlyPlayed.first : '';
    return '${songs.length}_${songs.first.id}_${songs.last.id}_${rec.profiles.length}_${rec.recentlyPlayed.length}_$lastPlayed';
  }

  bool get _isDesktop =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;

  void _openAlbum(BuildContext context, String albumId) {
    NavigationHelper.push(
      context,
      AlbumScreen(albumId: albumId),
    );
  }

  void _openPlaylist(BuildContext context, Playlist playlist) {
    NavigationHelper.push(
      context,
      PlaylistScreen(playlistId: playlist.id, playlistName: playlist.name),
    );
  }

  void _openArtist(BuildContext context, String artistId) {
    NavigationHelper.push(
      context,
      ArtistScreen(artistId: artistId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = _isDesktop;
    final hPad = isDesktop ? 32.0 : 16.0;
    final authProvider = Provider.of<AuthProvider>(context);
    final subsonicService = Provider.of<SubsonicService>(context);

    return Scaffold(
      backgroundColor:
          context.octave.background,
      body: RefreshIndicator(
        color: Theme.of(context).colorScheme.primary,
        onRefresh: () async {
          final libraryProvider =
              Provider.of<LibraryProvider>(context, listen: false);
          await libraryProvider.refresh();
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              expandedHeight: 110,
              backgroundColor:
                  context.octave.background,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: hPad, bottom: 48),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _getGreeting(),
                      style: TextStyle(
                        fontSize: isDesktop ? 24 : 20,
                        fontWeight: FontWeight.bold,
                        color: context.octave.text1,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    CupertinoIcons.clock,
                    color: context.octave.text1,
                    size: 22,
                  ),
                  tooltip: AppLocalizations.of(context)!.history,
                  onPressed: () =>
                      NavigationHelper.push(context, const HistoryScreen()),
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.gear_alt,
                    color: context.octave.text1,
                    size: 22,
                  ),
                  tooltip: AppLocalizations.of(context)!.settings,
                  onPressed: () =>
                      NavigationHelper.push(context, const SettingsScreen()),
                ),
                if (isDesktop) const SizedBox(width: 12),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: hPad),
                    child: Row(
                      children: [
                        _buildCategoryChip('All', AppLocalizations.of(context)!.filterAll, isDark),
                        const SizedBox(width: 8),
                        _buildCategoryChip('Music', AppLocalizations.of(context)!.filterMusic, isDark),
                        const SizedBox(width: 8),
                        _buildCategoryChip(
                            'MadeForYou', AppLocalizations.of(context)!.madeForYou, isDark),
                        const SizedBox(width: 8),
                        _buildCategoryChip('Playlists', AppLocalizations.of(context)!.filterPlaylists, isDark),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Consumer2<LibraryProvider, RecommendationService>(
                builder: (context, libraryProvider, recommendationService, _) {
                  if (libraryProvider.isLoading &&
                      !libraryProvider.isInitialized) {
                    return _buildLoadingState(isDesktop, hPad);
                  }

                  final allSongs = libraryProvider.cachedAllSongs.isNotEmpty
                      ? libraryProvider.cachedAllSongs
                      : libraryProvider.randomSongs;
                  final key =
                      _computeRandomKey(allSongs, recommendationService);

                  if (recommendationService.enabled && key.isNotEmpty) {
                    if (key != _lastRandomKey) {
                      _cachedMixes = recommendationService.generateMixes(
                        allSongs,
                        l10n: AppLocalizations.of(context)!,
                      );
                      _cachedPersonalized = recommendationService
                          .getPersonalizedFeed(allSongs, limit: 12);
                      _cachedListenAgain = recommendationService
                          .getListenAgain(allSongs, limit: 10);
                      _cachedTopHits =
                          recommendationService.getTopHits(allSongs, limit: 10);
                      _lastRandomKey = key;
                    }
                  } else {
                    _cachedMixes = const {};
                    _cachedPersonalized = const [];
                    _cachedListenAgain = const [];
                    _cachedTopHits = const [];
                    _lastRandomKey = '';
                  }

                  var mixes = _cachedMixes;
                  var personalizedFeed = _cachedPersonalized;
                  var listenAgain = _cachedListenAgain;
                  var topHits = _cachedTopHits;
                  var recentAlbums = libraryProvider.recentAlbums;
                  var playlists = libraryProvider.playlists;
                  var artists = libraryProvider.artists;

                  if (artists.isEmpty && recommendationService.enabled) {
                    final topNames =
                        recommendationService.getRecommendedArtists(limit: 10);
                    if (topNames.isNotEmpty) {
                      artists = topNames
                          .map((name) => Artist(id: 'yt-$name', name: name))
                          .toList();
                    }
                  }

                  final isOffline = authProvider.state == AuthState.offlineMode;
                  final offlineService = OfflineService();

                  if (isOffline) {
                    final downloadedIds =
                        offlineService.getDownloadedSongIds().toSet();
                    final downloadedPlaylistIds =
                        offlineService.downloadedPlaylistIds.value.toSet();
                    final allSongs = libraryProvider.cachedAllSongs;
                    final Set<String> downloadedAlbumIds = {};
                    for (final song in allSongs) {
                      if (downloadedIds.contains(song.id) &&
                          song.albumId != null) {
                        downloadedAlbumIds.add(song.albumId!);
                      }
                    }

                    recentAlbums = recentAlbums
                        .where((a) => downloadedAlbumIds.contains(a.id))
                        .toList();
                    playlists = playlists
                        .where((p) => downloadedPlaylistIds.contains(p.id))
                        .toList();

                    final Map<String, List<Song>> offlineMixes = {};
                    for (final entry in mixes.entries) {
                      final filtered = entry.value
                          .where((s) => downloadedIds.contains(s.id))
                          .toList();
                      if (filtered.isNotEmpty) {
                        offlineMixes[entry.key] = filtered;
                      }
                    }
                    mixes = offlineMixes;

                    personalizedFeed = personalizedFeed
                        .where((s) => downloadedIds.contains(s.id))
                        .toList();
                    listenAgain = listenAgain
                        .where((s) => downloadedIds.contains(s.id))
                        .toList();
                    topHits = topHits
                        .where((s) => downloadedIds.contains(s.id))
                        .toList();
                  }

                  // Octo's mixes and radios get their own row; "Your
                  // playlists" keeps the account's playlists.
                  final serverMixes =
                      playlists.where((p) => p.isOctoMix).toList();
                  playlists =
                      playlists.where((p) => !p.isOctoMix).toList();

                  final layout = HomeLayout.instance;
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: 40 + MediaQuery.paddingOf(context).bottom),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isOffline)
                          ResumeQueueBanner(horizontalPadding: hPad),
                        if (!isDesktop && WrappedService.isWrappedSeason()) ...[
                          _buildWrappedBanner(context, hPad, isDesktop),
                          const SizedBox(height: 12),
                        ],
                        // Rows in the order the user chose ("Customize home").
                        for (final section in layout.order)
                          if (layout.isVisible(section))
                            ...?<HomeSection, List<Widget>>{
                          HomeSection.quickAccess: [
                          if (_selectedCategory == 'All' ||
                              _selectedCategory == 'Music') ...[
                            const SizedBox(height: 8),
                            _buildSpotifyTopGrid(
                              context,
                              recentAlbums: recentAlbums,
                              playlists: playlists,
                              mixes: mixes,
                              subsonicService: subsonicService,
                              isDesktop: isDesktop,
                              hPad: hPad,
                            ),
                            const SizedBox(height: 24),
                          ],
                          ],
                          HomeSection.favoritePlaylists: [
                          if (_selectedCategory == 'All' ||
                              _selectedCategory == 'Playlists')
                            _buildFavoritePlaylistRows(
                              context,
                              playlists: playlists,
                              isDesktop: isDesktop,
                              hPad: hPad,
                            ),
                          ],
                          HomeSection.jumpBackIn: [
                          if ((_selectedCategory == 'All' ||
                                  _selectedCategory == 'Music') &&
                              recentAlbums.isNotEmpty) ...[
                            HorizontalScrollSection(
                              title: AppLocalizations.of(context)!.homeJumpBackIn,
                              padding: EdgeInsets.symmetric(horizontal: hPad),
                              cardSize: isDesktop ? 180 : 155,
                              children: recentAlbums.take(12).map((album) {
                                return MediaCard(
                                  title: album.name,
                                  subtitle: album.artist,
                                  coverArt: album.coverArt,
                                  size: isDesktop ? 180 : 155,
                                  onTap: () => _openAlbum(context, album.id),
                                  onPlayPressed: () =>
                                      _playAlbum(context, album.id),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 28),
                          ],
                          ],
                          HomeSection.madeForYou: [
                          if ((_selectedCategory == 'All' ||
                                  _selectedCategory == 'MadeForYou') &&
                              recommendationService.enabled &&
                              personalizedFeed.isNotEmpty) ...[
                            _buildMixSection(
                              context: context,
                              title: AppLocalizations.of(context)!.madeForYou,
                              icon: Icons.auto_awesome,
                              songs: personalizedFeed,
                              isDesktop: isDesktop,
                              hPad: hPad,
                            ),
                            const SizedBox(height: 28),
                          ],
                          ],
                          HomeSection.listenAgain: [
                          if ((_selectedCategory == 'All' ||
                                  _selectedCategory == 'Music') &&
                              listenAgain.isNotEmpty) ...[
                            _buildMixSection(
                              context: context,
                              title: AppLocalizations.of(context)!.homeListenAgain,
                              icon: Icons.history_rounded,
                              songs: listenAgain,
                              isDesktop: isDesktop,
                              hPad: hPad,
                            ),
                            const SizedBox(height: 28),
                          ],
                          ],
                          HomeSection.topHits: [
                          if ((_selectedCategory == 'All' ||
                                  _selectedCategory == 'MadeForYou') &&
                              topHits.isNotEmpty) ...[
                            _buildMixSection(
                              context: context,
                              title: AppLocalizations.of(context)!.homeTopHits,
                              icon: Icons.favorite_rounded,
                              songs: topHits,
                              isDesktop: isDesktop,
                              hPad: hPad,
                            ),
                            const SizedBox(height: 28),
                          ],
                          ],
                          HomeSection.serverMixes: [
                          if ((_selectedCategory == 'All' ||
                                  _selectedCategory == 'MadeForYou') &&
                              serverMixes.isNotEmpty) ...[
                            HorizontalScrollSection(
                              title: AppLocalizations.of(context)!.homeServerMixes,
                              padding: EdgeInsets.symmetric(horizontal: hPad),
                              cardSize: isDesktop ? 180 : 155,
                              children: serverMixes.map((playlist) {
                                final cardSize = isDesktop ? 180.0 : 155.0;
                                return MediaCard(
                                  title: playlist.name,
                                  subtitle: AppLocalizations.of(context)!
                                      .songsCount(playlist.songCount ?? 0),
                                  coverArt: playlist.coverArt,
                                  artwork: PlaylistArtwork(
                                    playlist: playlist,
                                    size: cardSize - 24,
                                    borderRadius: 4,
                                  ),
                                  size: cardSize,
                                  onTap: () => _openPlaylist(context, playlist),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 28),
                          ],
                          ],
                          HomeSection.playlists: [
                          if ((_selectedCategory == 'All' ||
                                  _selectedCategory == 'Playlists') &&
                              playlists.isNotEmpty) ...[
                            HorizontalScrollSection(
                              title: AppLocalizations.of(context)!.yourPlaylists,
                              padding: EdgeInsets.symmetric(horizontal: hPad),
                              cardSize: isDesktop ? 180 : 155,
                              children: playlists.take(12).map((playlist) {
                                final cardSize = isDesktop ? 180.0 : 155.0;
                                return MediaCard(
                                  title: playlist.name,
                                  subtitle: AppLocalizations.of(context)!.playlist,
                                  coverArt: playlist.coverArt,
                                  artwork: PlaylistArtwork(
                                    playlist: playlist,
                                    size: cardSize - 24,
                                    borderRadius: 4,
                                  ),
                                  size: cardSize,
                                  onTap: () => _openPlaylist(context, playlist),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 28),
                          ],
                          ],
                          // Mixes computed on the phone, only when the server
                          // makes none (no Octo).
                          HomeSection.mixes: [
                          if ((_selectedCategory == 'All' ||
                                  _selectedCategory == 'MadeForYou') &&
                              serverMixes.isEmpty) ...[
                            for (final entry in mixes.entries.take(4))
                              Padding(
                                padding: const EdgeInsets.only(bottom: 28),
                                child: _buildMixSection(
                                  context: context,
                                  title: entry.key,
                                  icon: Icons.graphic_eq_rounded,
                                  songs: entry.value,
                                  isDesktop: isDesktop,
                                  hPad: hPad,
                                ),
                              ),
                          ],
                          ],
                          HomeSection.artists: [
                          if ((_selectedCategory == 'All' ||
                                  _selectedCategory == 'Music') &&
                              artists.isNotEmpty) ...[
                            HorizontalScrollSection(
                              title: AppLocalizations.of(context)!.homeArtistsYouLove,
                              padding: EdgeInsets.symmetric(horizontal: hPad),
                              cardSize: isDesktop ? 160 : 140,
                              children: artists.take(10).map((artist) {
                                final coverArt = artist.coverArt ??
                                    artist.artistImageUrl ??
                                    (artist.id.isNotEmpty
                                        ? 'ar-${artist.id}'
                                        : null);
                                return MediaCard(
                                  title: artist.name,
                                  subtitle: AppLocalizations.of(context)!.artistSingular,
                                  coverArt: coverArt,
                                  isRound: true,
                                  size: isDesktop ? 160 : 140,
                                  onTap: () => _openArtist(context, artist.id),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 20),
                          ],
                          ],
                            }[section],
                        Center(
                          child: TextButton.icon(
                            onPressed: () => NavigationHelper.push(
                                context, const HomeLayoutScreen()),
                            icon: const Icon(CupertinoIcons.slider_horizontal_3,
                                size: 18),
                            label: Text(
                                AppLocalizations.of(context)!.customizeHome),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String key, String label, bool isDark) {
    final isSelected = _selectedCategory == key;
    final primary = Theme.of(context).colorScheme.primary;
    final onPrimary = context.octave.onAccent;

    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = key),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected
              ? primary
              : (context.octave.surface3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isSelected
                ? onPrimary
                : (context.octave.text1),
          ),
        ),
      ),
    );
  }

  Widget _buildSpotifyTopGrid(
    BuildContext context, {
    required List<Album> recentAlbums,
    required List<Playlist> playlists,
    required Map<String, List<Song>> mixes,
    required SubsonicService subsonicService,
    required bool isDesktop,
    required double hPad,
  }) {
    final cols = isDesktop ? 4 : 2;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final spacing = 8.0;
          final totalSpacing = spacing * (cols - 1);
          final cardWidth = (constraints.maxWidth - totalSpacing) / cols;

          return Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: [
              SizedBox(
                width: cardWidth,
                child: QuickAccessTile(
                  title: AppLocalizations.of(context)!.likedSongs,
                  customArtwork: const OctaveIconArt(
                    icon: CupertinoIcons.heart_fill,
                    iconSize: 22,
                  ),
                  onTap: () =>
                      NavigationHelper.push(context, const FavoritesScreen()),
                ),
              ),
              ...playlists.take(2).map((playlist) {
                return SizedBox(
                  width: cardWidth,
                  child: QuickAccessTile(
                    title: playlist.name,
                    imageUrl: playlist.coverArt,
                    onTap: () => _openPlaylist(context, playlist),
                  ),
                );
              }),
              if (recentAlbums.isNotEmpty)
                ...recentAlbums.take(cols == 4 ? 5 : 3).map((album) {
                  return SizedBox(
                    width: cardWidth,
                    child: QuickAccessTile(
                      title: album.name,
                      imageUrl: album.coverArt,
                      onTap: () => _openAlbum(context, album.id),
                      onPlayPressed: () => _playAlbum(context, album.id),
                    ),
                  );
                })
              else
                ...mixes.entries.take(cols == 4 ? 5 : 3).map((entry) {
                  final songs = entry.value;
                  final firstCover =
                      songs.isNotEmpty ? songs.first.coverArt : null;
                  return SizedBox(
                    width: cardWidth,
                    child: QuickAccessTile(
                      title: entry.key,
                      imageUrl: firstCover,
                      onTap: () {
                        if (songs.isNotEmpty) {
                          _playSong(context, songs.first, songs);
                        }
                      },
                      onPlayPressed: () {
                        if (songs.isNotEmpty) {
                          _playSong(context, songs.first, songs);
                        }
                      },
                    ),
                  );
                }),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMixSection({
    required BuildContext context,
    required String title,
    required IconData icon,
    required List<Song> songs,
    required bool isDesktop,
    required double hPad,
  }) {
    final cardSize = isDesktop ? 180.0 : 155.0;

    return HorizontalScrollSection(
      title: title,
      padding: EdgeInsets.symmetric(horizontal: hPad),
      cardSize: cardSize,
      children: songs.take(12).map((song) {
        return MediaCard(
          title: song.title,
          subtitle: song.artist,
          coverArt: song.coverArt,
          size: cardSize,
          onTap: () => _playSong(context, song, songs),
          onPlayPressed: () => _playSong(context, song, songs),
        );
      }).toList(),
    );
  }

  Widget _buildFavoritePlaylistRows(
    BuildContext context, {
    required List<Playlist> playlists,
    required bool isDesktop,
    required double hPad,
  }) {
    final enabledNotifier =
        PlayerUiSettingsService().showFavoritePlaylistsOnHomeNotifier;
    final favoritesService = FavoritePlaylistsService();

    return ListenableBuilder(
      listenable: Listenable.merge([enabledNotifier, favoritesService]),
      builder: (context, _) {
        if (!enabledNotifier.value || !favoritesService.hasFavorites) {
          return const SizedBox.shrink();
        }

        final favoriteIds = favoritesService.getFavoriteIds().toSet();
        final favorites =
            playlists.where((p) => favoriteIds.contains(p.id)).toList()
              // Most recently updated playlists first.
              ..sort((a, b) => _lastUpdate(b).compareTo(_lastUpdate(a)));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final playlist in favorites)
              _FavoritePlaylistRow(
                key: ValueKey('favorite_playlist_${playlist.id}'),
                playlist: playlist,
                isDesktop: isDesktop,
                hPad: hPad,
                onOpen: () => _openPlaylist(context, playlist),
                onPlaySong: (song, songs) => _playSong(context, song, songs),
              ),
          ],
        );
      },
    );
  }

  static final DateTime _epoch = DateTime.fromMillisecondsSinceEpoch(0);

  static DateTime _lastUpdate(Playlist playlist) =>
      playlist.changed ?? playlist.created ?? _epoch;

  Future<void> _playSong(
      BuildContext context, Song song, List<Song> queue) async {
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    final idx = queue.indexOf(song);
    await playerProvider.playSong(song,
        playlist: queue, startIndex: idx >= 0 ? idx : 0);
  }

  Future<void> _playAlbum(BuildContext context, String albumId) async {
    try {
      final subsonicService =
          Provider.of<SubsonicService>(context, listen: false);
      final playerProvider =
          Provider.of<PlayerProvider>(context, listen: false);
      final songs = await subsonicService.getAlbumSongs(albumId);
      if (songs.isNotEmpty) {
        await playerProvider.playSong(songs.first,
            playlist: songs, startIndex: 0);
      }
    } catch (e) {
      debugPrint('Error playing album: $e');
    }
  }

  Widget _buildLoadingState(bool isDesktop, double hPad) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            width: 140,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, __) => Container(
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWrappedBanner(
      BuildContext context, double hPad, bool isDesktop) {
    final year = WrappedService.getWrappedYear();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            NavigationHelper.push(context, const WrappedScreen());
          },
          borderRadius: BorderRadius.circular(18),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [context.octave.accent, context.octave.accent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: context.octave.accent.withValues(alpha: 0.35),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(CupertinoIcons.sparkles,
                      color: Colors.white, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#OctavePlayback $year',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)?.yourYearInReviewIsReady ??
                            'Your Year in Review is ready!',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(CupertinoIcons.chevron_forward,
                    color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FavoritePlaylistRow extends StatefulWidget {
  final Playlist playlist;
  final bool isDesktop;
  final double hPad;
  final VoidCallback onOpen;
  final void Function(Song song, List<Song> songs) onPlaySong;

  const _FavoritePlaylistRow({
    super.key,
    required this.playlist,
    required this.isDesktop,
    required this.hPad,
    required this.onOpen,
    required this.onPlaySong,
  });

  @override
  State<_FavoritePlaylistRow> createState() => _FavoritePlaylistRowState();
}

class _FavoritePlaylistRowState extends State<_FavoritePlaylistRow> {
  /// Last successfully fetched version of each playlist, shared across rows
  /// so a playlist is fetched once per app session and again only when the
  /// server reports a newer `changed` timestamp.
  static final Map<String, Playlist> _fetched = {};
  static final Set<String> _inFlight = {};

  @override
  void initState() {
    super.initState();
    _refreshSongsIfStale();
  }

  @override
  void didUpdateWidget(covariant _FavoritePlaylistRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    _refreshSongsIfStale();
  }

  void _refreshSongsIfStale() {
    final playlist = widget.playlist;
    final fetched = _fetched[playlist.id];
    if (_inFlight.contains(playlist.id) ||
        (fetched != null && fetched.changed == playlist.changed)) {
      return;
    }
    _inFlight.add(playlist.id);

    // Playlists from getPlaylists() carry no entries, and cached entries may
    // be outdated. Fetching stores the songs in the LibraryProvider, which
    // rebuilds this row with them. A failed fetch is retried on next rebuild.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        if (!mounted) return;
        final fetched =
            await Provider.of<LibraryProvider>(context, listen: false)
                .getPlaylist(playlist.id);
        _fetched[playlist.id] = fetched;
        if (mounted) setState(() {});
      } catch (e) {
        debugPrint('Error loading favorite playlist: $e');
      } finally {
        _inFlight.remove(playlist.id);
      }
    });
  }

  /// The provider may hand back a summary without entries (e.g. right after a
  /// library refresh); fall back to the fetched songs of the same version.
  List<Song> _songs() {
    final playlist = widget.playlist;
    final songs = playlist.songs;
    if (songs != null && songs.isNotEmpty) return songs;
    final fetched = _fetched[playlist.id];
    if (fetched != null && fetched.changed == playlist.changed) {
      return fetched.songs ?? const <Song>[];
    }
    return const <Song>[];
  }

  @override
  Widget build(BuildContext context) {
    final songs = _songs();
    if (songs.isEmpty) return const SizedBox.shrink();

    final cardSize = widget.isDesktop ? 180.0 : 155.0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: HorizontalScrollSection(
        title: widget.playlist.name,
        padding: EdgeInsets.symmetric(horizontal: widget.hPad),
        cardSize: cardSize,
        onSeeAllTap: widget.onOpen,
        children: songs.take(12).map((song) {
          return MediaCard(
            title: song.title,
            subtitle: song.artist,
            coverArt: song.coverArt,
            size: cardSize,
            onTap: () => widget.onPlaySong(song, songs),
            onPlayPressed: () => widget.onPlaySong(song, songs),
          );
        }).toList(),
      ),
    );
  }
}

