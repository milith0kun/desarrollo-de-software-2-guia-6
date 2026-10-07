import 'package:flutter/material.dart';

/// ============================================================================
/// EJERCICIO GUIADO 3 — DIAGNOSTICAR Y CORREGIR UN OVERFLOW HORIZONTAL
///
/// Código con error:
/// Row(
///   children: [
///     Icon(Icons.shopping_cart, size: 32),
///     Text('Precio total: S/ 1,250.00 (incluye IGV y descuentos)'),
///   ],
/// )
///
/// Causa raíz:
/// En una Row, los hijos reciben restricciones de ancho no acotadas (unbounded).
/// El widget Text pide el ancho que necesita según su texto. Si la suma excede el ancho
/// disponible en pantalla (ej. 320dp o 360dp), se produce un RenderFlex overflowed.
///
/// Corrección:
/// Envolver el Text en un Expanded (que convierte las restricciones a tight por el espacio restante)
/// y añadir TextOverflow.ellipsis para truncar elegantemente si no cabe en pantallas muy angostas.
/// ============================================================================

class Ejercicio3Screen extends StatelessWidget {
  const Ejercicio3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 3 · Overflow Horizontal'),
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
                      'Diagnóstico Técnico de Overflow Horizontal',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF7A1F2B)),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '• Error: RenderFlex overflowed by N pixels on the right.\n'
                      '• Widget causante: Row sin restricciones acotadas en su hijo Text.\n'
                      '• Solución: Envolver Text en Expanded con TextOverflow.ellipsis.',
                      style: TextStyle(fontSize: 13, height: 1.4),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              '1. Versión con Error Simulado (Espacio reducido a 220px sin Expanded):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                border: Border.all(color: Colors.red.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Simulación de pantalla angosta (220px):', style: TextStyle(fontSize: 11, color: Colors.red)),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 220,
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.white,
                          child: const Row(
                            children: [
                              Icon(Icons.shopping_cart, size: 32, color: Colors.blueGrey),
                              SizedBox(width: 8),
                              Text('Precio total: S/ 1,250.00 (incluye IGV y desc.)'),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          top: 0,
                          child: Container(
                            width: 14,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.yellow, Colors.black, Colors.yellow, Colors.black],
                                stops: [0.0, 0.25, 0.5, 0.75],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Text(
              '2. Versión Corregida con Expanded y Ellipsis:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green.shade800),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                border: Border.all(color: Colors.green.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Resultado corregido (seguro en cualquier ancho):', style: TextStyle(fontSize: 11, color: Colors.green)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.shopping_cart, size: 32, color: Color(0xFF7A1F2B)),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Precio total: S/ 1,250.00 (incluye IGV y descuentos)',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
