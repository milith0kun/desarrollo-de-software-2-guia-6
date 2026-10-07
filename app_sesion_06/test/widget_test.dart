import 'package:flutter_test/flutter_test.dart';
import 'package:app_sesion_06/main.dart';

void main() {
  testWidgets('Carga inicial del menu principal', (WidgetTester tester) async {
    await tester.pumpWidget(const AppSesion06());
    expect(find.text('Guía 06: Modelo de Restricciones'), findsOneWidget);
  });
}
