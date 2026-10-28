import 'package:flutter_test/flutter_test.dart';
import 'package:musly/octave/home/home_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await HomeLayout.instance.reset();
  });

  test('starts with every row in the default order', () async {
    await HomeLayout.instance.load();
    expect(HomeLayout.instance.order, HomeSection.values);
    expect(HomeLayout.instance.isVisible(HomeSection.artists), isTrue);
  });

  test('moves a row and keeps the change after a reload', () async {
    final layout = HomeLayout.instance;
    await layout.move(HomeSection.artists.index, 0);
    expect(layout.order.first, HomeSection.artists);
    await layout.load();
    expect(layout.order.first, HomeSection.artists);
    expect(layout.order.length, HomeSection.values.length);
  });

  test('hides and shows a row', () async {
    final layout = HomeLayout.instance;
    await layout.setVisible(HomeSection.topHits, false);
    await layout.load();
    expect(layout.isVisible(HomeSection.topHits), isFalse);
    await layout.setVisible(HomeSection.topHits, true);
    expect(layout.isVisible(HomeSection.topHits), isTrue);
  });

  test('ignores unknown saved rows and adds new ones at the end', () async {
    SharedPreferences.setMockInitialValues({
      'octave_home_order': ['artists', 'hologram', 'quickAccess'],
    });
    await HomeLayout.instance.load();
    final order = HomeLayout.instance.order;
    expect(order.take(2), [HomeSection.artists, HomeSection.quickAccess]);
    expect(order.toSet(), HomeSection.values.toSet());
  });
}
