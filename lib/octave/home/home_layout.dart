import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/player_ui_settings_service.dart';

/// Rows of the home screen, in their default order.
enum HomeSection {
  quickAccess,
  favoritePlaylists,
  jumpBackIn,

  /// Mixes and radios made by the server (Octo) for this account.
  serverMixes,
  madeForYou,
  listenAgain,
  topHits,
  playlists,
  mixes,
  artists,
}

/// Order of the home rows and the ones the user hid ("Customize home").
///
/// The favorite playlists row keeps its own setting, also set by the
/// guided setup.
class HomeLayout extends ChangeNotifier {
  HomeLayout._();
  static final HomeLayout instance = HomeLayout._();

  static const _orderKey = 'octave_home_order';
  static const _hiddenKey = 'octave_home_hidden';

  List<HomeSection> _order = HomeSection.values.toList();
  Set<HomeSection> _hidden = {};

  List<HomeSection> get order => List.unmodifiable(_order);

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _order = _parse(prefs.getStringList(_orderKey));
    // Rows added in later versions go at the end.
    for (final section in HomeSection.values) {
      if (!_order.contains(section)) _order.add(section);
    }
    _hidden = _parse(prefs.getStringList(_hiddenKey)).toSet();
    notifyListeners();
  }

  bool isVisible(HomeSection section) =>
      section == HomeSection.favoritePlaylists
          ? PlayerUiSettingsService().showFavoritePlaylistsOnHomeNotifier.value
          : !_hidden.contains(section);

  Future<void> setVisible(HomeSection section, bool visible) async {
    if (section == HomeSection.favoritePlaylists) {
      await PlayerUiSettingsService().setShowFavoritePlaylistsOnHome(visible);
    } else if (visible) {
      _hidden.remove(section);
    } else {
      _hidden.add(section);
    }
    await _save();
  }

  /// Moves a row; [newIndex] is its index once removed from [oldIndex],
  /// as ReorderableListView.onReorderItem reports it.
  Future<void> move(int oldIndex, int newIndex) async {
    final section = _order.removeAt(oldIndex);
    _order.insert(newIndex, section);
    await _save();
  }

  Future<void> reset() async {
    _order = HomeSection.values.toList();
    _hidden = {};
    await PlayerUiSettingsService().setShowFavoritePlaylistsOnHome(false);
    await _save();
  }

  Future<void> _save() async {
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_orderKey, _order.map((s) => s.name).toList());
    await prefs.setStringList(_hiddenKey, _hidden.map((s) => s.name).toList());
  }

  static List<HomeSection> _parse(List<String>? names) => [
        for (final name in names ?? const <String>[])
          ...HomeSection.values.where((s) => s.name == name),
      ];
}
