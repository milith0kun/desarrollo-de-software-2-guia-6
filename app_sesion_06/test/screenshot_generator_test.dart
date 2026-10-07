import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
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

Future<void> _cargarFuentesReales() async {
  // 1. Cargar MaterialIcons para glifos e iconos
  final iconFile = File(r'C:\Users\PC\flutter\bin\cache\artifacts\material_fonts\materialicons-regular.otf');
  if (iconFile.existsSync()) {
    final fontLoader = FontLoader('MaterialIcons');
    fontLoader.addFont(Future.value(ByteData.sublistView(iconFile.readAsBytesSync())));
    await fontLoader.load();
  }

  // 2. Cargar fuente tipográfica del sistema (Segoe UI) mapeada a la fuente por defecto
  final fontFile = File(r'C:\Windows\Fonts\segoeui.ttf');
  if (fontFile.existsSync()) {
    final fontLoader = FontLoader('Roboto');
    fontLoader.addFont(Future.value(ByteData.sublistView(fontFile.readAsBytesSync())));
    await fontLoader.load();

    final sansLoader = FontLoader('sans-serif');
    sansLoader.addFont(Future.value(ByteData.sublistView(fontFile.readAsBytesSync())));
    await sansLoader.load();
  }

  // Cargar negrita para títulos
  final boldFile = File(r'C:\Windows\Fonts\segoeuib.ttf');
  if (boldFile.existsSync()) {
    final fontLoader = FontLoader('Roboto');
    fontLoader.addFont(Future.value(ByteData.sublistView(boldFile.readAsBytesSync())));
    await fontLoader.load();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await _cargarFuentesReales();
  });

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
      final originalOnError = FlutterError.onError;
      FlutterError.onError = (FlutterErrorDetails details) {};

      tester.view.physicalSize = const Size(1080, 2340);
      tester.view.devicePixelRatio = 2.75;

      final GlobalKey key = GlobalKey();

      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Roboto',
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

      await tester.pump(const Duration(milliseconds: 600));

      await tester.runAsync(() async {
        final boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
        if (boundary != null) {
          final ui.Image image = await boundary.toImage(pixelRatio: 2.0); // Mayor resolución y nitidez
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
