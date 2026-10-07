import 'dart:io';
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

Future<void> _cargarFuentesCompletas() async {
  final iconFile = File(r'C:\Users\PC\flutter\bin\cache\artifacts\material_fonts\materialicons-regular.otf');
  if (iconFile.existsSync()) {
    final fontLoader = FontLoader('MaterialIcons');
    fontLoader.addFont(Future.value(ByteData.sublistView(iconFile.readAsBytesSync())));
    await fontLoader.load();
  }

  final segoeFile = File(r'C:\Windows\Fonts\segoeui.ttf');
  if (segoeFile.existsSync()) {
    final bytes = segoeFile.readAsBytesSync();
    final fontLoader = FontLoader('Roboto');
    fontLoader.addFont(Future.value(ByteData.sublistView(bytes)));
    await fontLoader.load();

    final sansLoader = FontLoader('sans-serif');
    sansLoader.addFont(Future.value(ByteData.sublistView(bytes)));
    await sansLoader.load();
  }

  final segoeBold = File(r'C:\Windows\Fonts\segoeuib.ttf');
  if (segoeBold.existsSync()) {
    final bytes = segoeBold.readAsBytesSync();
    final fontLoader = FontLoader('Roboto');
    fontLoader.addFont(Future.value(ByteData.sublistView(bytes)));
    await fontLoader.load();
  }

  final consolaFile = File(r'C:\Windows\Fonts\consola.ttf');
  if (consolaFile.existsSync()) {
    final bytes = consolaFile.readAsBytesSync();

    final monoLoader = FontLoader('monospace');
    monoLoader.addFont(Future.value(ByteData.sublistView(bytes)));
    await monoLoader.load();

    final consolasLoader = FontLoader('Consolas');
    consolasLoader.addFont(Future.value(ByteData.sublistView(bytes)));
    await consolasLoader.load();

    final courierLoader = FontLoader('Courier');
    courierLoader.addFont(Future.value(ByteData.sublistView(bytes)));
    await courierLoader.load();

    final courierNewLoader = FontLoader('Courier New');
    courierNewLoader.addFont(Future.value(ByteData.sublistView(bytes)));
    await courierNewLoader.load();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await _cargarFuentesCompletas();
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
      tester.view.devicePixelRatio = 2.625;

      final GlobalKey key = GlobalKey();

      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            platform: TargetPlatform.android,
            fontFamily: 'Roboto',
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF7A1F2B),
              primary: const Color(0xFF7A1F2B),
              secondary: const Color(0xFFC9971F),
            ),
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xFFF1F5F9),
            scrollbarTheme: const ScrollbarThemeData(
              thumbVisibility: WidgetStatePropertyAll(false),
              trackVisibility: WidgetStatePropertyAll(false),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF7A1F2B),
              foregroundColor: Colors.white,
            ),
          ),
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: const MaterialScrollBehavior().copyWith(scrollbars: false),
              child: child!,
            );
          },
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
          final ui.Image image = await boundary.toImage(pixelRatio: 2.0);
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
