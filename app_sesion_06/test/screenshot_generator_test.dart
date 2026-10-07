import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_sesion_06/main.dart';
import 'package:app_sesion_06/ejercicios/guia_aplicacion_03.dart';
import 'package:app_sesion_06/ejercicios/sesion06_saire_edmil.dart';
import 'package:app_sesion_06/ejercicios/caso_guiado_1.dart';
import 'package:app_sesion_06/ejercicios/caso_guiado_2.dart';
import 'package:app_sesion_06/ejercicios/caso_guiado_3.dart';
import 'package:app_sesion_06/ejercicios/ejercicio_1.dart';
import 'package:app_sesion_06/ejercicios/ejercicio_2.dart';
import 'package:app_sesion_06/ejercicios/ejercicio_3.dart';
import 'package:app_sesion_06/ejercicios/ejercicio_4.dart';
import 'package:app_sesion_06/ejercicios/ejercicio_5.dart';
import 'package:app_sesion_06/ejercicios/ejercicio_6.dart';
import 'package:app_sesion_06/ejercicios/ejercicio_7.dart';
import 'package:app_sesion_06/ejercicios/autoevaluacion_sesion_06.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final List<Map<String, dynamic>> screensToCapture = [
    {'name': 'captura_menu_principal.png', 'widget': const MenuPrincipalGuia6()},
    {'name': 'captura_guia_aplicacion_03.png', 'widget': const GuiaAplicacion03Screen()},
    {'name': 'captura_perfil_saire.png', 'widget': const Sesion06SaireEdmilScreen()},
    {'name': 'captura_caso_guiado_1.png', 'widget': const CasoGuiado1Screen()},
    {'name': 'captura_caso_guiado_2.png', 'widget': const CasoGuiado2Screen()},
    {'name': 'captura_caso_guiado_3.png', 'widget': const CasoGuiado3Screen()},
    {'name': 'captura_ejercicio_1.png', 'widget': const Ejercicio1Screen()},
    {'name': 'captura_ejercicio_2.png', 'widget': const Ejercicio2Screen()},
    {'name': 'captura_ejercicio_3.png', 'widget': const Ejercicio3Screen()},
    {'name': 'captura_ejercicio_4.png', 'widget': const Ejercicio4Screen()},
    {'name': 'captura_ejercicio_5.png', 'widget': const Ejercicio5Screen()},
    {'name': 'captura_ejercicio_6.png', 'widget': const Ejercicio6Screen()},
    {'name': 'captura_ejercicio_7.png', 'widget': const Ejercicio7Screen()},
    {'name': 'captura_autoevaluacion.png', 'widget': const AutoevaluacionSesion06Screen()},
  ];

  for (final screen in screensToCapture) {
    testWidgets('Generar captura real de ${screen['name']}', (WidgetTester tester) async {
      // Ignorar errores intencionales de layout durante la simulación de errores
      final originalOnError = FlutterError.onError;
      FlutterError.onError = (FlutterErrorDetails details) {
        // Silenciar RenderFlex overflow intencionales de los ejercicios de muestra
      };

      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.75;

      final GlobalKey key = GlobalKey();

      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF7A1F2B),
              primary: const Color(0xFF7A1F2B),
              secondary: const Color(0xFFC9971F),
            ),
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xFFF1F5F9),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF7A1F2B),
              foregroundColor: Colors.white,
            ),
          ),
          home: RepaintBoundary(
            key: key,
            child: screen['widget'] as Widget,
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 500));

      await tester.runAsync(() async {
        final boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
        if (boundary != null) {
          final ui.Image image = await boundary.toImage(pixelRatio: 1.0);
          final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
          if (byteData != null) {
            final buffer = byteData.buffer.asUint8List();
            final outputDir = Directory('../informe/imagenes');
            if (!outputDir.existsSync()) {
              outputDir.createSync(recursive: true);
            }
            final file = File('../informe/imagenes/${screen['name']}');
            await file.writeAsBytes(buffer);
          }
        }
      });

      FlutterError.onError = originalOnError;
    });
  }
}
