import 'package:flutter_test/flutter_test.dart';

import 'package:quiz_app/main.dart';

void main() {
  testWidgets('Start screen shows the quiz intro and validates the name field', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Learn Flutter the Fun way!'), findsOneWidget);
    expect(find.text('Start Quiz'), findsOneWidget);

    // Submitting without a name shows the validation error instead of navigating.
    await tester.tap(find.text('Start Quiz'));
    await tester.pump();

    expect(find.text('Please enter your name first'), findsOneWidget);
  });
}
