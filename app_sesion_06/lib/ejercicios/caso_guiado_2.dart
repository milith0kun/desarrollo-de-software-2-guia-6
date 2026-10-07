import 'package:flutter/material.dart';

/// ============================================================================
/// CASO GUIADO 2 — RESTRICCIONES INFINITAS DENTRO DE UN SCROLL
///
/// Error inicial: SingleChildScrollView -> Column -> Expanded -> Container
/// Consola: "RenderFlex children have non-zero flex but incoming height constraints are unbounded."
///
/// Razonamiento: SingleChildScrollView da altura infinita. Expanded necesita repartir
/// un espacio finito, por lo que una porción de infinito es indefinible matemáticamente.
///
/// Corrección: Eliminar Expanded y fijar tamaño finito en el widget hijo (height: 200).
/// ============================================================================

class CasoGuiado2Screen extends StatelessWidget {
  const CasoGuiado2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caso Guiado 2 · Restricciones Infinitas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildExplicacionCard(),
            const SizedBox(height: 20),

            Text(
              'Demostración de la Solución Correcta (Altura finita dentro de Scroll):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green.shade800),
            ),
            const SizedBox(height: 10),

            Container(
              height: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7A1F2B).withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Encabezado de la Pantalla con Scroll',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF7A1F2B)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade600,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Contenedor con altura explícita (height: 200)\n¡Sin Expanded dentro de Scroll!',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Contenido adicional desplazable sin colapsos de layout.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExplicacionCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Caso Guiado 2: Expanded vs. Scroll',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF7A1F2B)),
            ),
            const SizedBox(height: 10),
            const Text(
              '1. Error: "RenderFlex children have non-zero flex but incoming height constraints are unbounded".\n'
              '2. Razonamiento: Expanded exige alto finito. En SingleChildScrollView el alto es infinito.\n'
              '3. Solución: Eliminar Expanded y dar tamaño explícito (height: 200).',
              style: TextStyle(fontSize: 13, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
