import 'package:flutter_test/flutter_test.dart';
import 'package:myfirstapp/main.dart';

void main() {
  testWidgets('portfolio displays projects and filters the gallery', (
    tester,
  ) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump();

    expect(find.text('Des idées fortes,\nune identité juste.'), findsOneWidget);
    expect(find.text('NOVA'), findsOneWidget);
    expect(find.text('MONO'), findsOneWidget);

    await tester.tap(find.text('Digital'));
    await tester.pump();

    expect(find.text('MONO'), findsOneWidget);
    expect(find.text('NOVA'), findsNothing);
  });

  testWidgets('bottom navigation opens the about section', (tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump();

    await tester.tap(find.text('À propos'));
    await tester.pump();

    expect(find.text('Enchanté, moi c’est Philemon.'), findsOneWidget);
  });
}
