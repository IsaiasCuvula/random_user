import 'package:flutter_test/flutter_test.dart';
import 'package:random_user/home_page.dart';
import 'package:random_user/main.dart';

void main() {
  testWidgets('testing HomePage shows up', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    final homePageFinder = find.byType(HomePage);

    expect(homePageFinder, findsOneWidget);
  });
}
