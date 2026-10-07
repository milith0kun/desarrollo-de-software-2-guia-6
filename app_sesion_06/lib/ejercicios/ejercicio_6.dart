import 'package:flutter/material.dart';

/// ============================================================================
/// EJERCICIO GUIADO 6 — DECODIFICACIÓN DE MENSAJES DE ERROR DE CONSOLA DE FLUTTER
///
/// Componentes clave de un mensaje de RenderFlex:
/// 1. Tipo de RenderBox: RenderFlex (maneja Row, Column y Flex).
/// 2. Orientación del overflow: Axis.horizontal (Row) o Axis.vertical (Column).
/// 3. Cantidad exacta de píxeles desbordados: p. ej. "by 42 pixels".
/// 4. Ubicación en el código: Archivo, clase y número de línea.
/// ============================================================================

class Ejercicio6Screen extends StatelessWidget {
  const Ejercicio6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 6 · Análisis de Error'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Anatomía de un Mensaje de Error en Flutter',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF7A1F2B)),
            ),
            const SizedBox(height: 6),
            const Text(
              'Aprender a leer el stacktrace y los logs de Flutter ahorra horas de depuración.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 14),

            // Visor de consola simulado
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.amber.shade700, width: 1.5),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.terminal, color: Colors.amber, size: 18),
                      SizedBox(width: 8),
                      Text('Flutter Console Log (Error Real)', style: TextStyle(color: Colors.amber, fontFamily: 'monospace', fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                  Divider(color: Colors.white24, height: 16),
                  Text(
                    'EXCEPTION CAUGHT BY RENDERING LIBRARY\n'
                    'A RenderFlex overflowed by 48.0 pixels on the right.\n'
                    '\n'
                    'The relevant error-causing widget was:\n'
                    '  Row lib/pantalla_perfil.dart:45:12\n'
                    '\n'
                    'The overflowing RenderFlex has an orientation of Axis.horizontal.\n'
                    'The edge of the RenderFlex that is overflowing has an offset of 48.0 pixels.',
                    style: TextStyle(color: Color(0xFFE5E7EB), fontFamily: 'monospace', fontSize: 11, height: 1.35),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            const Text(
              'Desglose y Decodificación de Partes:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            _buildItemAnalisis(
              etiqueta: '1. Tipo de RenderObject',
              valor: 'RenderFlex',
              significado: 'El objeto interno responsable del layout de Row, Column o Flex.',
              color: Colors.cyan,
            ),
            const SizedBox(height: 8),

            _buildItemAnalisis(
              etiqueta: '2. Orientación del desborde',
              valor: 'Axis.horizontal (on the right)',
              significado: 'El contenido excedió el ancho horizontal permitido en el lado derecho.',
              color: Colors.amber,
            ),
            const SizedBox(height: 8),

            _buildItemAnalisis(
              etiqueta: '3. Magnitud del error',
              valor: '48.0 pixels',
              significado: 'El widget hijo pidió 48 píxeles más de lo que el padre tenía disponible.',
              color: Colors.orange,
            ),
            const SizedBox(height: 8),

            _buildItemAnalisis(
              etiqueta: '4. Archivo y Línea',
              valor: 'Row en lib/pantalla_perfil.dart:45',
              significado: 'Señala exactamente el widget padre y la línea donde ocurrió la falla.',
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemAnalisis({
    required String etiqueta,
    required String valor,
    required String significado,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 4,
            children: [
              Text(etiqueta, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(4)),
                child: Text(valor, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 11, fontFamily: 'monospace')),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(significado, style: const TextStyle(fontSize: 11, color: Colors.black54)),
        ],
      ),
    );
  }
}
