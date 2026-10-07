import 'package:flutter/material.dart';

/// ============================================================================
/// EJERCICIO GUIADO 2 — TIGHT VS. LOOSE CONSTRAINTS
///
/// Comparación y efectos sobre un widget hijo que "quiere" medir 50x50:
///
/// Caso A: BoxConstraints(minW: 100, maxW: 100, minH: 100, maxH: 100) -> TIGHT
///         Efecto: Fuerza al hijo a medir exactamente 100x100 (ignora sus 50x50).
///
/// Caso B: BoxConstraints(minW: 0, maxW: 300, minH: 0, maxH: 300) -> LOOSE
///         Efecto: Permite al hijo medir sus 50x50 deseados libremente.
///
/// Caso C: BoxConstraints(minW: 50, maxW: 50, minH: 0, maxH: 200) -> MIXTO
///         Efecto: Ancho tight (fuerza 50) y alto loose (permite 50). Mide 50x50.
/// ============================================================================

class Ejercicio2Screen extends StatelessWidget {
  const Ejercicio2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 2 · Tight vs Loose'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Laboratorio de Restricciones (Tight vs. Loose)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF7A1F2B)),
            ),
            const SizedBox(height: 8),
            const Text(
              'Observa cómo el mismo Container que pide 50x50 reacciona según las restricciones del padre:',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 16),

            _buildConstraintCard(
              title: 'Caso A: Restricción TIGHT (100x100)',
              constraintsDesc: 'minW=100, maxW=100, minH=100, maxH=100',
              effectDesc: 'Fuerza al hijo a ser 100x100 exactamente. Ignora su petición de 50x50.',
              tagColor: Colors.red.shade700,
              badgeText: 'TIGHT',
              childWidget: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 100,
                  maxWidth: 100,
                  minHeight: 100,
                  maxHeight: 100,
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.indigo,
                  child: const Center(
                    child: Text(
                      'Pide 50x50\nMide 100x100',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            _buildConstraintCard(
              title: 'Caso B: Restricción LOOSE (0 a 300)',
              constraintsDesc: 'minW=0, maxW=300, minH=0, maxH=300',
              effectDesc: 'El hijo puede elegir cualquier tamaño entre 0 y 300. Respeta sus 50x50.',
              tagColor: Colors.green.shade700,
              badgeText: 'LOOSE',
              childWidget: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 0,
                  maxWidth: 300,
                  minHeight: 0,
                  maxHeight: 300,
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.teal,
                  child: const Center(
                    child: Text(
                      '50x50',
                      style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            _buildConstraintCard(
              title: 'Caso C: Restricción MIXTA',
              constraintsDesc: 'minW=50, maxW=50 (tight) · minH=0, maxH=200 (loose)',
              effectDesc: 'Ancho forzado exactamente a 50. Alto flexible (toma 50 por su petición).',
              tagColor: Colors.orange.shade800,
              badgeText: 'MIXTO',
              childWidget: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 50,
                  maxWidth: 50,
                  minHeight: 0,
                  maxHeight: 200,
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.deepOrange,
                  child: const Center(
                    child: Text(
                      '50x50',
                      style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildConstraintCard({
    required String title,
    required String constraintsDesc,
    required String effectDesc,
    required Color tagColor,
    required String badgeText,
    required Widget childWidget,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: tagColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: tagColor, width: 1),
                  ),
                  child: Text(
                    badgeText,
                    style: TextStyle(color: tagColor, fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(constraintsDesc, style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Colors.black87)),
            const SizedBox(height: 6),
            Text(effectDesc, style: const TextStyle(fontSize: 12, color: Colors.black54)),
            const SizedBox(height: 12),
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Center(child: childWidget),
            ),
          ],
        ),
      ),
    );
  }
}
