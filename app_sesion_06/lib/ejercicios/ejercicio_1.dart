import 'package:flutter/material.dart';

/// ============================================================================
/// EJERCICIO GUIADO 1 — PREDICCIÓN DE TAMAÑO EN EL MODELO DE RESTRICCIONES
///
/// Principio: "Constraints go down, sizes go up, parent sets position"
///
/// Análisis:
/// 1. Center recibe restricciones tight de la pantalla y pasa restricciones LOOSE
///    (minWidth: 0, maxWidth: screenW, minHeight: 0, maxHeight: screenH) al Container rojo.
/// 2. El Container rojo pide width: 200, height: 200. Como está dentro del rango loose,
///    su tamaño es de 200x200 y pasa restricciones TIGHT (exactamente 200x200) a su hijo.
/// 3. El Container verde interno pide width: 400, height: 50, pero como recibe
///    restricciones tight (200x200) de su padre, queda obligado a medir exactamente 200x200.
/// 4. Resultado final visible: Un único cuadro verde de 200x200 que cubre completamente al rojo.
/// ============================================================================

class Ejercicio1Screen extends StatelessWidget {
  const Ejercicio1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 1 · Predecir Tamaño'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tarjeta explicativa
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF7A1F2B).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.psychology, color: Color(0xFF7A1F2B)),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Enunciado del Ejercicio 1',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Código analizado:\n'
                      'Center(\n'
                      '  child: Container(\n'
                      '    width: 200, height: 200, color: Colors.red,\n'
                      '    child: Container(color: Colors.green, width: 400, height: 50),\n'
                      '  ),\n'
                      ')',
                      style: TextStyle(fontFamily: 'monospace', fontSize: 12),
                    ),
                    const Divider(height: 24),
                    const Text(
                      '¿Por qué el Container verde mide 200x200 y tapa al rojo?\n'
                      '1. Center transforma las restricciones tight de la pantalla en loose.\n'
                      '2. El Container rojo asume 200x200 y transmite restricciones TIGHT (200x200) a su child.\n'
                      '3. El child verde pide 400x50, pero las restricciones tight del padre ganan siempre.',
                      style: TextStyle(fontSize: 13, height: 1.4, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Demostración visual en vivo:',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Container(
              height: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.green,
                    width: 400,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: const Center(
                      child: Text(
                        'Container Verde\n(Pide 400x50 -> Mide 200x200)',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11.5),
                      ),
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
}
