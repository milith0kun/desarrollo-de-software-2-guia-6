import 'package:flutter/material.dart';
import 'ejercicios/caso_guiado_1.dart';
import 'ejercicios/caso_guiado_2.dart';
import 'ejercicios/caso_guiado_3.dart';
import 'ejercicios/ejercicio_1.dart';
import 'ejercicios/ejercicio_2.dart';
import 'ejercicios/ejercicio_3.dart';
import 'ejercicios/ejercicio_4.dart';
import 'ejercicios/ejercicio_5.dart';
import 'ejercicios/ejercicio_6.dart';
import 'ejercicios/ejercicio_7.dart';
import 'ejercicios/guia_aplicacion_03.dart';
import 'ejercicios/autoevaluacion_sesion_06.dart';
import 'ejercicios/sesion06_saire_edmil.dart';

/// ============================================================================
/// UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD DEL CUSCO
/// Escuela Profesional de Ingeniería Informática y de Sistemas
///
/// ASIGNATURA: Desarrollo de Software II (IF616AIN) — Semestre 2026-II
/// DOCENTE:    Mtro. Ing. Yover Collantes Valer
/// ESTUDIANTE: Edmil Jampier Saire Bustamante (Código: 174449)
///
/// GUÍA 06: EL MODELO DE RESTRICCIONES EN FLUTTER
/// ============================================================================

void main() {
  runApp(const AppSesion06());
}

class AppSesion06 extends StatelessWidget {
  const AppSesion06({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNSAAC · Guía 06',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7A1F2B),
          primary: const Color(0xFF7A1F2B),
          secondary: const Color(0xFFC9971F),
          surface: const Color(0xFFF8FAFC),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF7A1F2B),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
        ),
        cardTheme: CardThemeData(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const MenuPrincipalGuia6(),
        '/guia_03': (_) => const GuiaAplicacion03Screen(),
        '/perfil_saire': (_) => const Sesion06SaireEdmilScreen(),
        '/caso_guiado_1': (_) => const CasoGuiado1Screen(),
        '/caso_guiado_2': (_) => const CasoGuiado2Screen(),
        '/caso_guiado_3': (_) => const CasoGuiado3Screen(),
        '/ejercicio_1': (_) => const Ejercicio1Screen(),
        '/ejercicio_2': (_) => const Ejercicio2Screen(),
        '/ejercicio_3': (_) => const Ejercicio3Screen(),
        '/ejercicio_4': (_) => const Ejercicio4Screen(),
        '/ejercicio_5': (_) => const Ejercicio5Screen(),
        '/ejercicio_6': (_) => const Ejercicio6Screen(),
        '/ejercicio_7': (_) => const Ejercicio7Screen(),
        '/autoevaluacion': (_) => const AutoevaluacionSesion06Screen(),
      },
    );
  }
}

class MenuPrincipalGuia6 extends StatelessWidget {
  const MenuPrincipalGuia6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Guía 06: Modelo de Restricciones',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEncabezadoEstudiante(),
            const SizedBox(height: 18),

            // Actividad Principal
            _buildSeccionTitulo('Actividad de Aprendizaje'),
            const SizedBox(height: 8),
            _buildTarjetaPrincipal(
              context: context,
              titulo: 'Guía de Aplicación 03',
              subtitulo: 'Diagnóstico y corrección de 4 casos de layout',
              ruta: '/guia_03',
              icono: Icons.analytics_outlined,
              color: const Color(0xFF7A1F2B),
            ),
            const SizedBox(height: 8),
            _buildTarjetaPrincipal(
              context: context,
              titulo: 'Perfil Profesional del Estudiante',
              subtitulo: 'Pantalla optimizada con modelo de restricciones',
              ruta: '/perfil_saire',
              icono: Icons.person_outline,
              color: const Color(0xFF1E293B),
            ),

            const SizedBox(height: 20),

            // Casos Guiados
            _buildSeccionTitulo('Casos Guiados'),
            const SizedBox(height: 8),
            _buildItem(context, '1', 'Caso 1: Overflow Horizontal', 'Row con ancho acotado mediante Expanded', '/caso_guiado_1'),
            _buildItem(context, '2', 'Caso 2: Restricciones Infinitas', 'SingleChildScrollView con altura explícita', '/caso_guiado_2'),
            _buildItem(context, '3', 'Caso 3: Overflow Vertical', 'Column con desplazamiento vertical', '/caso_guiado_3'),

            const SizedBox(height: 20),

            // Ejercicios Guiados
            _buildSeccionTitulo('Ejercicios Guiados (1 al 7)'),
            const SizedBox(height: 8),
            _buildItem(context, 'E1', 'Ejercicio 1: Predecir Tamaño', 'Restricciones tight transmitidas por Container', '/ejercicio_1'),
            _buildItem(context, 'E2', 'Ejercicio 2: Tight vs. Loose', 'Comportamiento de BoxConstraints en widget hijo', '/ejercicio_2'),
            _buildItem(context, 'E3', 'Ejercicio 3: Overflow en Fila', 'Fila de precio corregida con Expanded', '/ejercicio_3'),
            _buildItem(context, 'E4', 'Ejercicio 4: ListView Anidado', 'Delimitación de ancho en scroll horizontal', '/ejercicio_4'),
            _buildItem(context, 'E5', 'Ejercicio 5: Matriz de Decisión', 'Expanded vs. SingleChildScrollView', '/ejercicio_5'),
            _buildItem(context, 'E6', 'Ejercicio 6: Análisis de Logs', 'Decodificación de errores RenderFlex de consola', '/ejercicio_6'),
            _buildItem(context, 'E7', 'Ejercicio 7: Prevención de Desbordes', 'Protección de perfil ante textos extensos', '/ejercicio_7'),

            const SizedBox(height: 20),

            // Autoevaluación
            _buildSeccionTitulo('Autoevaluación'),
            const SizedBox(height: 8),
            _buildItem(context, '✓', 'Cuestionario de Autoevaluación', '10 preguntas teórico-prácticas justificadas', '/autoevaluacion'),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildEncabezadoEstudiante() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF7A1F2B).withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFF7A1F2B),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.school, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD DEL CUSCO',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF7A1F2B)),
                    ),
                    Text(
                      'Ingeniería Informática y de Sistemas',
                      style: TextStyle(fontSize: 11, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 16),
          const Text(
            'Estudiante: Edmil Jampier Saire Bustamante (Código: 174449)',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Docente: Mtro. Ing. Yover Collantes Valer · Semestre 2026-II',
            style: TextStyle(fontSize: 11, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildSeccionTitulo(String titulo) {
    return Text(
      titulo,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
    );
  }

  Widget _buildTarjetaPrincipal({
    required BuildContext context,
    required String titulo,
    required String subtitulo,
    required String ruta,
    required IconData icono,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, ruta),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: color),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icono, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(titulo, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 2),
                    Text(subtitulo, style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 11)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 14),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, String tag, String titulo, String subtitulo, String ruta) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 6),
      child: ListTile(
        dense: true,
        onTap: () => Navigator.pushNamed(context, ruta),
        leading: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFF7A1F2B).withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(tag, style: const TextStyle(color: Color(0xFF7A1F2B), fontWeight: FontWeight.bold, fontSize: 11)),
          ),
        ),
        title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        subtitle: Text(subtitulo, style: const TextStyle(fontSize: 11, color: Colors.black54), maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black26),
      ),
    );
  }
}
