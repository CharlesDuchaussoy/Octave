import 'package:flutter_test/flutter_test.dart';
import 'package:musly/octave/server/library_actions.dart';

void main() {
  test('reads the answer of getLibraryActions', () {
    final actions = LibraryActions.fromJson({
      'enabled': true,
      'allowed': true,
      'dryRun': false,
      'actions': ['remove', 'upgrade'],
      'keepDays': 30,
    });
    expect(actions.canRemove, isTrue);
    expect(actions.canUpgrade, isTrue);
    expect(actions.keepDays, 30);
  });

  test('offers nothing to an account off the allow list', () {
    // What the test account gets on our server.
    final actions = LibraryActions.fromJson({
      'enabled': true,
      'allowed': false,
      'actions': ['remove', 'upgrade'],
    });
    expect(actions.canRemove, isFalse);
    expect(actions.canUpgrade, isFalse);
  });

  test('offers only the actions the server lists, when enabled', () {
    final upgradeOnly = LibraryActions.fromJson({
      'enabled': true,
      'allowed': true,
      'actions': ['upgrade'],
    });
    expect(upgradeOnly.canRemove, isFalse);
    expect(upgradeOnly.canUpgrade, isTrue);

    final off = LibraryActions.fromJson({
      'enabled': false,
      'allowed': true,
      'actions': ['remove', 'upgrade'],
    });
    expect(off.canRemove, isFalse);
    expect(off.canUpgrade, isFalse);
  });
}
