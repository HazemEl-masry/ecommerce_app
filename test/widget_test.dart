// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/providers/products_provider.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final productsProvider = ProductsProvider();
    await productsProvider.initDatabase();
    
    await tester.pumpWidget(MyApp(
      productsProvider: productsProvider,
      isDarkMode: false,
    ));
    expect(find.text('Shop App'), findsOneWidget);
  });
}
