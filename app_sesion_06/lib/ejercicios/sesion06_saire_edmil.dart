import 'package:flutter/material.dart';

/// ============================================================================
/// UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD DEL CUSCO
/// Facultad de Ingeniería Eléctrica, Electrónica, Informática y Mecánica
/// Escuela Profesional de Ingeniería Informática y de Sistemas
///
/// ASIGNATURA: Desarrollo de Software II (IF616AIN) — Semestre 2026-II
/// DOCENTE:    Mtro. Ing. Yover Collantes Valer
/// ESTUDIANTE: Edmil Jampier Saire Bustamante (Código: 174449)
///
/// SESIÓN 06: EL MODELO DE RESTRICCIONES (CONSTRAINTS GO DOWN, SIZES GO UP)
/// ARCHIVO OFICIAL: sesion06_saire_edmil.dart
///
/// Principios aplicados:
/// 1. Layout jerárquico basado en SingleChildScrollView para prevenir overflow vertical.
/// 2. Cabecera con Row + Expanded + TextOverflow.ellipsis para evitar RenderFlex overflow.
/// 3. Secciones modulares extraídas a métodos privados con nombres descriptivos.
/// 4. Zonas táctiles accesibles (mínimo 48x48 dp) mediante Padding en elementos interactivos.
/// 5. Uso consistente de constantes de espaciado y colores institucionales de la UNSAAC.
/// ============================================================================

const Color kColorPrimarioUnsaac = Color(0xFF7A1F2B); // Guinda institucional
const Color kColorDoradoUnsaac = Color(0xFFC9971F);   // Dorado institucional
const Color kColorFondo = Color(0xFFF8FAFC);
const double kEspaciadoBase = 8.0;

class Sesion06SaireEdmilScreen extends StatelessWidget {
  const Sesion06SaireEdmilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorFondo,
      appBar: AppBar(
        backgroundColor: kColorPrimarioUnsaac,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Column(
          children: [
            Text('UNSAAC · IF616AIN', style: TextStyle(fontSize: 12, letterSpacing: 1.1)),
            Text('Perfil Profesional & Modelo de Restricciones', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      // Sesión 6, Caso 3: Toda la pantalla está protegida con SingleChildScrollView
      // para prevenir cualquier overflow vertical ante diferentes pantallas o fuentes del sistema.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kEspaciadoBase * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTarjetaCabecera(),
            const SizedBox(height: kEspaciadoBase * 2),
            _buildTarjetaMetricas(),
            const SizedBox(height: kEspaciadoBase * 2),
            _buildTarjetaCompetencias(),
            const SizedBox(height: kEspaciadoBase * 2),
            _buildTarjetaContacto(),
            const SizedBox(height: kEspaciadoBase * 2),
            _buildFilaAcciones(),
            const SizedBox(height: kEspaciadoBase * 3),
          ],
        ),
      ),
    );
  }

  /// 1. Cabecera protegida con Expanded y Ellipsis para nombres extensos
  Widget _buildTarjetaCabecera() {
    return Container(
      padding: const EdgeInsets.all(kEspaciadoBase * 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar con borde institucional
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kColorDoradoUnsaac, width: 2.5),
            ),
            child: const CircleAvatar(
              radius: 36,
              backgroundColor: kColorPrimarioUnsaac,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
          ),
          const SizedBox(width: kEspaciadoBase * 2),
          // Bloque de texto envuelto en Expanded (impone ancho tight y evita overflow horizontal)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edmil Jampier Saire Bustamante',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Ingeniería Informática y de Sistemas',
                  style: TextStyle(fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: kColorPrimarioUnsaac.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.school, size: 14, color: kColorPrimarioUnsaac),
                      SizedBox(width: 4),
                      Text('Código: 174449 · VII Ciclo', style: TextStyle(fontSize: 11, color: kColorPrimarioUnsaac, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 2. Métricas de rendimiento con reparto proporcional (Expanded)
  Widget _buildTarjetaMetricas() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: _buildMetricaItem('8', 'Guías Resueltas', Icons.task_alt, Colors.teal)),
          _buildDivisorVertical(),
          Expanded(flex: 1, child: _buildMetricaItem('22', 'Créditos Aprob.', Icons.verified, Colors.indigo)),
          _buildDivisorVertical(),
          Expanded(flex: 1, child: _buildMetricaItem('100%', 'Cumplimiento', Icons.emoji_events, kColorDoradoUnsaac)),
        ],
      ),
    );
  }

  Widget _buildMetricaItem(String valor, String etiqueta, IconData icono, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icono, color: color, size: 22),
        const SizedBox(height: 4),
        Text(valor, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
        Text(etiqueta, style: const TextStyle(fontSize: 11, color: Colors.black54), textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildDivisorVertical() {
    return Container(height: 36, width: 1, color: Colors.grey.shade200);
  }

  /// 3. Competencias y habilidades con Wrap auto-ajustable
  Widget _buildTarjetaCompetencias() {
    final List<String> habilidades = [
      'Flutter 3.41',
      'Dart Declarativo',
      'BoxConstraints',
      'Layout Flexible',
      'RenderFlex Debugging',
      'Git & GitHub',
      'SingleChildScrollView',
      'Expanded & Flexible',
    ];

    return Container(
      padding: const EdgeInsets.all(kEspaciadoBase * 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.workspace_premium, color: kColorPrimarioUnsaac, size: 20),
              SizedBox(width: 8),
              Text('Competencias en Layout & Restricciones', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: habilidades.map((h) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: kColorPrimarioUnsaac.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kColorPrimarioUnsaac.withValues(alpha: 0.2)),
                ),
                child: Text(h, style: const TextStyle(fontSize: 12, color: kColorPrimarioUnsaac, fontWeight: FontWeight.w600)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// 4. Contacto con zona táctil accesible (> 48x48)
  Widget _buildTarjetaContacto() {
    return Container(
      padding: const EdgeInsets.all(kEspaciadoBase * 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Canales de Comunicación', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 10),
          _buildFilaContactoAccesible(Icons.email, '174449@unsaac.edu.pe', 'Correo Institucional'),
          const Divider(height: 16),
          _buildFilaContactoAccesible(Icons.code, 'github.com/milith0kun', 'Repositorio Oficial'),
          const Divider(height: 16),
          _buildFilaContactoAccesible(Icons.location_city, 'Cusco, Perú (UNSAAC - Pabellón Informática)', 'Ubicación Académica'),
        ],
      ),
    );
  }

  Widget _buildFilaContactoAccesible(IconData icono, String texto, String subtitulo) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: kColorPrimarioUnsaac.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(icono, color: kColorPrimarioUnsaac, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(texto, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
                  Text(subtitulo, style: const TextStyle(fontSize: 11, color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 5. Fila de botones con reparto equitativo con Expanded
  Widget _buildFilaAcciones() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download, size: 18),
            label: const Text('Descargar Informe'),
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorPrimarioUnsaac,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.share, size: 18),
            label: const Text('Compartir'),
            style: OutlinedButton.styleFrom(
              foregroundColor: kColorPrimarioUnsaac,
              side: const BorderSide(color: kColorPrimarioUnsaac),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
