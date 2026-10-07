import 'package:flutter/material.dart';

/// ============================================================================
/// EJERCICIO GUIADO 4 — DIAGNOSTICAR RESTRICCIONES INFINITAS (UNBOUNDED)
///
/// Código con error:
/// ListView(
///   scrollDirection: Axis.horizontal,
///   children: [
///     ListView(
///       children: const [Text('A'), Text('B'), Text('C')],
///     ),
///   ],
/// )
///
/// Causa raíz:
/// El ListView horizontal externo ofrece a sus hijos un ancho infinito (unbounded)
/// en su eje de scroll (horizontal). El ListView interno (por defecto vertical) intenta
/// expandirse al ancho máximo disponible para llenar el espacio transversal del padre.
/// Como el ancho disponible es infinito, el ListView interno intenta medir ancho infinito,
/// lo cual viola las reglas del motor de renderizado y produce:
/// "BoxConstraints forces an infinite width / RenderBox was not laid out".
///
/// Corrección más simple:
/// Darle al ListView interno una restricción finita y explícita (por ejemplo, envolverlo
/// en un SizedBox con width: 120) o usar `shrinkWrap: true` y dimensiones acotadas.
/// ============================================================================

class Ejercicio4Screen extends StatelessWidget {
  const Ejercicio4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 4 · Restricciones Infinitas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Diagnóstico: ListView dentro de ListView Horizontal',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF7A1F2B)),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '• Mensaje de error típico: "BoxConstraints forces an infinite width" o "Vertical viewport was given unbounded width".\n'
                      '• Causa: El ListView externo tiene scroll horizontal (ancho infinito), y el hijo ListView intenta ocupar todo el ancho disponible.\n'
                      '• Solución: Acotar el ancho del widget hijo con SizedBox(width: ...) o Container con dimensión fija.',
                      style: TextStyle(fontSize: 13, height: 1.4),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Demostración del Layout Corregido con Dimensiones Acotadas:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.indigo),
            ),
            const SizedBox(height: 10),

            // Contenedor seguro
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(12),
                children: [
                  _buildColumnaItem('Módulo 1', ['A: Widgets', 'B: Layout', 'C: Constraints'], Colors.blue.shade50, Colors.blue.shade900),
                  const SizedBox(width: 12),
                  _buildColumnaItem('Módulo 2', ['D: State', 'E: Providers', 'F: Forms'], Colors.amber.shade50, Colors.amber.shade900),
                  const SizedBox(width: 12),
                  _buildColumnaItem('Módulo 3', ['G: SQLite', 'H: HTTP APIs', 'I: Clean Arch'], Colors.purple.shade50, Colors.purple.shade900),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColumnaItem(String titulo, List<String> items, Color bgColor, Color textColor) {
    return SizedBox(
      width: 115,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: textColor.withValues(alpha: 0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: TextStyle(fontWeight: FontWeight.bold, color: textColor, fontSize: 13),
            ),
            const Divider(height: 12),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.5),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline, size: 13, color: textColor),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(item, style: const TextStyle(fontSize: 10.5)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
