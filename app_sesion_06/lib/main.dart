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
/// Facultad de Ingeniería Eléctrica, Electrónica, Informática y Mecánica
/// Escuela Profesional de Ingeniería Informática y de Sistemas
///
/// ASIGNATURA: Desarrollo de Software II (IF616AIN) — Semestre 2026-II
/// DOCENTE:    Mtro. Ing. Yover Collantes Valer
/// ESTUDIANTE: Edmil Jampier Saire Bustamante (Código: 174449)
///
/// GUÍA 06: EL MODELO DE RESTRICCIONES (CONSTRAINTS GO DOWN, SIZES GO UP)
/// APLICACIÓN OFICIAL: app_sesion_06
/// ============================================================================

void main() {
  runApp(const AppSesion06());
}

/// Widget raíz con diseño institucional UNSAAC (Granate, Dorado y Azul)
class AppSesion06 extends StatelessWidget {
  const AppSesion06({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNSAAC · Guía 06 - Modelo de Restricciones',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7A1F2B), // Granate institucional UNSAAC
          primary: const Color(0xFF7A1F2B),
          secondary: const Color(0xFFC9971F), // Dorado institucional UNSAAC
          surface: const Color(0xFFF8FAFC),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF7A1F2B),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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

/// Menú interactivo central para navegación de toda la Sesión 6
class MenuPrincipalGuia6 extends StatelessWidget {
  const MenuPrincipalGuia6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'UNSAAC · EPIIS',
              style: TextStyle(fontSize: 13, letterSpacing: 1.2, fontWeight: FontWeight.w400),
            ),
            Text(
              'Guía 06: Modelo de Restricciones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEncabezadoInstitucional(context),
            const SizedBox(height: 24),

            // Sección destacada: Guía de Aplicación 03
            _buildTituloSeccion(
              icono: Icons.star_rounded,
              color: const Color(0xFFC9971F),
              titulo: 'Actividad Evaluable (Guía de Aplicación 03)',
              subtitulo: 'Diagnóstico y corrección de 4 casos de error (20 pts)',
            ),
            const SizedBox(height: 12),
            _buildTarjetaDestacada(
              context: context,
              titulo: 'Laboratorio de Diagnóstico de Errores',
              subtitulo: 'Fichas técnicas con simulador de errores vs. soluciones',
              etiqueta: 'CALIFICADO 20 PTS',
              ruta: '/guia_03',
              icono: Icons.bug_report_rounded,
              colorFondo: const Color(0xFF7A1F2B),
            ),
            const SizedBox(height: 10),
            _buildTarjetaDestacada(
              context: context,
              titulo: 'Pantalla de Perfil Optimizada',
              subtitulo: 'sesion06_saire_edmil.dart (Prevención de overflow)',
              etiqueta: 'ENTREGABLE DART',
              ruta: '/perfil_saire',
              icono: Icons.person_pin_rounded,
              colorFondo: const Color(0xFF1E293B),
            ),

            const SizedBox(height: 28),

            // Sección: Casos Guiados Oficiales
            _buildTituloSeccion(
              icono: Icons.menu_book_rounded,
              color: const Color(0xFF7A1F2B),
              titulo: 'Casos Guiados Oficiales (Teoría Aplicada)',
              subtitulo: '3 diagnósticos guiados paso a paso',
            ),
            const SizedBox(height: 12),
            _buildItemNavegacion(
              context: context,
              numero: 'CG1',
              titulo: 'Caso 1: Overflow Horizontal en Fila',
              subtitulo: 'Row con CircleAvatar + Text sin acotar -> Expanded + ellipsis',
              ruta: '/caso_guiado_1',
              icono: Icons.swap_horiz_rounded,
            ),
            _buildItemNavegacion(
              context: context,
              numero: 'CG2',
              titulo: 'Caso 2: Restricciones Infinitas en Scroll',
              subtitulo: 'SingleChildScrollView + Column + Expanded -> Altura fija',
              ruta: '/caso_guiado_2',
              icono: Icons.all_inclusive_rounded,
            ),
            _buildItemNavegacion(
              context: context,
              numero: 'CG3',
              titulo: 'Caso 3: Overflow Vertical por Contenido',
              subtitulo: 'Column con muchas tareas acumuladas -> SingleChildScrollView',
              ruta: '/caso_guiado_3',
              icono: Icons.swap_vert_rounded,
            ),

            const SizedBox(height: 28),

            // Sección: Ejercicios Guiados 1 al 7
            _buildTituloSeccion(
              icono: Icons.code_rounded,
              color: Colors.indigo,
              titulo: 'Ejercicios Guiados (1 al 7)',
              subtitulo: 'Laboratorios de predicción, clasificación y refactorización',
            ),
            const SizedBox(height: 12),
            _buildItemNavegacion(
              context: context,
              numero: 'E1',
              titulo: 'Ejercicio 1: Predecir el Tamaño',
              subtitulo: 'Center + Container(200x200) con hijo verde (400x50)',
              ruta: '/ejercicio_1',
              icono: Icons.aspect_ratio_rounded,
            ),
            _buildItemNavegacion(
              context: context,
              numero: 'E2',
              titulo: 'Ejercicio 2: Tight vs. Loose Constraints',
              subtitulo: 'Efecto sobre un hijo de 50x50 en 3 tipos de restricciones',
              ruta: '/ejercicio_2',
              icono: Icons.compare_arrows_rounded,
            ),
            _buildItemNavegacion(
              context: context,
              numero: 'E3',
              titulo: 'Ejercicio 3: Diagnosticar Overflow Horizontal',
              subtitulo: 'Row con carrito de compras y texto de precio total',
              ruta: '/ejercicio_3',
              icono: Icons.shopping_cart_outlined,
            ),
            _buildItemNavegacion(
              context: context,
              numero: 'E4',
              titulo: 'Ejercicio 4: Restricciones Infinitas en ListView',
              subtitulo: 'ListView horizontal con ListView vertical anidado',
              ruta: '/ejercicio_4',
              icono: Icons.view_column_outlined,
            ),
            _buildItemNavegacion(
              context: context,
              numero: 'E5',
              titulo: 'Ejercicio 5: Elegir la Herramienta Correcta',
              subtitulo: 'Matriz de decisión Expanded vs. SingleChildScrollView',
              ruta: '/ejercicio_5',
              icono: Icons.rule_folder_outlined,
            ),
            _buildItemNavegacion(
              context: context,
              numero: 'E6',
              titulo: 'Ejercicio 6: Decodificar Error de Consola',
              subtitulo: 'Análisis detallado de logs de RenderFlex overflowed',
              ruta: '/ejercicio_6',
              icono: Icons.terminal_rounded,
            ),
            _buildItemNavegacion(
              context: context,
              numero: 'E7',
              titulo: 'Ejercicio 7: Refactorización Preventiva de Perfil',
              subtitulo: 'Protección contra nombres largos y overflow en producción',
              ruta: '/ejercicio_7',
              icono: Icons.security_rounded,
            ),

            const SizedBox(height: 28),

            // Sección: Autoevaluación
            _buildTituloSeccion(
              icono: Icons.quiz_rounded,
              color: Colors.teal,
              titulo: 'Autoevaluación del Modelo de Restricciones',
              subtitulo: '10 preguntas de opción múltiple con calificación inmediata',
            ),
            const SizedBox(height: 12),
            _buildItemNavegacion(
              context: context,
              numero: 'TEST',
              titulo: 'Cuestionario Teórico-Práctico (10 preguntas)',
              subtitulo: 'Comprueba tu dominio sobre constraints go down, sizes go up',
              ruta: '/autoevaluacion',
              icono: Icons.checklist_rtl_rounded,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildEncabezadoInstitucional(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF7A1F2B).withValues(alpha: 0.2)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFF7A1F2B),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.account_balance, color: Color(0xFFC9971F), size: 26),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD DEL CUSCO',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF7A1F2B)),
                    ),
                    Text(
                      'Escuela Profesional de Ingeniería Informática y de Sistemas',
                      style: TextStyle(fontSize: 11, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 20),
          const Text(
            'Estudiante: Edmil Jampier Saire Bustamante · Código: 174449',
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

  Widget _buildTituloSeccion({
    required IconData icono,
    required Color color,
    required String titulo,
    required String subtitulo,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(8)),
          child: Icon(icono, color: color, size: 20),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
              Text(subtitulo, style: const TextStyle(fontSize: 11, color: Colors.black54)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTarjetaDestacada({
    required BuildContext context,
    required String titulo,
    required String subtitulo,
    required String etiqueta,
    required String ruta,
    required IconData icono,
    required Color colorFondo,
  }) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, ruta),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorFondo,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icono, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC9971F),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(etiqueta, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black87)),
                    ),
                    const SizedBox(height: 6),
                    Text(titulo, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(subtitulo, style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 11)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemNavegacion({
    required BuildContext context,
    required String numero,
    required String titulo,
    required String subtitulo,
    required String ruta,
    required IconData icono,
  }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, ruta),
        leading: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xFF7A1F2B).withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(numero, style: const TextStyle(color: Color(0xFF7A1F2B), fontWeight: FontWeight.bold, fontSize: 11)),
          ),
        ),
        title: Text(titulo, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        subtitle: Text(subtitulo, style: const TextStyle(fontSize: 11, color: Colors.black54), maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: Icon(icono, color: Colors.grey.shade600, size: 18),
      ),
    );
  }
}
