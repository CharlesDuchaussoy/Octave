import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/models/models.dart';
import 'package:musly/providers/player_provider.dart';
import 'package:musly/services/audio_handler.dart';
import 'package:musly/services/services.dart';
import 'package:musly/services/transcoding_service.dart';
import 'package:musly/widgets/navigation/mini_player.dart';
import '../bootstrap.dart';
import '../test_helpers.dart';

class PositionStreamPlayerProvider extends PlayerProvider {
  final StreamController<Duration> _mockPositionController =
      StreamController<Duration>.broadcast(sync: true);
  Duration _mockDuration = Duration.zero;
  Duration _mockPosition = Duration.zero;
  bool _mockIsRadio = false;

  PositionStreamPlayerProvider(
    super.subsonicService,
    super.storageService,
    super.castService,
    super.upnpService,
    super.audioHandler,
    super.jukeboxService,
    super.transcodingService,
  );

  @override
  Stream<Duration> get positionStream => _mockPositionController.stream;

  @override
  Duration get duration => _mockDuration;

  @override
  Duration get position => _mockPosition;

  @override
  bool get isPlayingRadio => _mockIsRadio;

  @override
  Song? get currentSong => Song(
        id: 's1',
        title: 'Song 1',
        artist: 'Artist 1',
        album: 'Album 1',
        duration: 100,
      );

  void setMockDuration(Duration d) {
    _mockDuration = d;
    notifyListeners();
  }

  void emitMockPosition(Duration p) {
    _mockPosition = p;
    _mockPositionController.add(p);
  }

  void setMockIsRadio(bool isRadio) {
    _mockIsRadio = isRadio;
    notifyListeners();
  }

  @override
  void dispose() {
    _mockPositionController.close();
    super.dispose();
  }
}

void main() {
  initializeTestEnvironment();

  testWidgets(
      '_MiniPlayerProgressBar updates progress when positionStream emits events without notifyListeners',
      (tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final service = SubsonicService();
    final storage = StorageService();
    final player = PositionStreamPlayerProvider(
      service,
      storage,
      FakeCastService(),
      UpnpService(),
      MuslyAudioHandler(),
      JukeboxService(),
      TranscodingService(),
    );
    player.setMockDuration(const Duration(seconds: 100));

    await tester.pumpWidget(
      createTestApp(
        playerProvider: player,
        child: const Scaffold(
          body: MiniPlayer(),
        ),
      ),
    );
    await tester.pump();

    // Find FractionallySizedBox inside MiniPlayer
    FractionallySizedBox sizedBox =
        tester.widget(find.byType(FractionallySizedBox));
    expect(sizedBox.widthFactor, equals(0.0));

    // Emit 50 seconds (50% progress) on positionStream WITHOUT notifyListeners()
    player.emitMockPosition(const Duration(seconds: 50));
    await tester.pump();

    sizedBox = tester.widget(find.byType(FractionallySizedBox));
    expect(sizedBox.widthFactor, closeTo(0.5, 0.001));

    // Emit 75 seconds (75% progress)
    player.emitMockPosition(const Duration(seconds: 75));
    await tester.pump();

    sizedBox = tester.widget(find.byType(FractionallySizedBox));
    expect(sizedBox.widthFactor, closeTo(0.75, 0.001));
  });
}
