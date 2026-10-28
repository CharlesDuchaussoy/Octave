import 'package:flutter_test/flutter_test.dart';
import 'package:musly/octave/setup/setup_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('a new install has not done the setup', () async {
    expect(await SetupProgress.isDone(), isFalse);
    expect(await SetupProgress.savedStep(), isNull);
  });

  test('the current step is kept to resume after closing the app', () async {
    await SetupProgress.saveStep('quality');
    expect(await SetupProgress.savedStep(), 'quality');
    expect(await SetupProgress.isDone(), isFalse);
  });

  test('finishing marks the setup done and forgets the step', () async {
    await SetupProgress.saveStep('done');
    await SetupProgress.saveFurthest('done');
    await SetupProgress.markDone();
    expect(await SetupProgress.isDone(), isTrue);
    expect(await SetupProgress.savedStep(), isNull);
    expect(await SetupProgress.furthestStep(), isNull);
  });
}
