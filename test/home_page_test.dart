import 'package:flutter_test/flutter_test.dart';
import 'package:random_user/app.dart';
import 'package:random_user/home_page.dart';

void main() {
  testWidgets('testing HomePage shows up', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RandomUser());

    final homePageFinder = find.byType(HomePage);

    expect(homePageFinder, findsOneWidget);
  });
}
