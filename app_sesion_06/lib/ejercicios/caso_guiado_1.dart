import 'package:flutter/material.dart';

/// ============================================================================
/// CASO GUIADO 1 — OVERFLOW HORIZONTAL EN UNA FILA DE PERFIL
///
/// Error inicial: Row con CircleAvatar y Text largo sin acotar.
/// Consola: "A RenderFlex overflowed by 42 pixels on the right. The relevant error-causing widget was Row."
///
/// Razonamiento: La Row le da ancho unbounded a sus hijos. La suma supera la pantalla.
/// Corrección: Envolver Text en Expanded con TextOverflow.ellipsis.
/// ============================================================================

class CasoGuiado1Screen extends StatelessWidget {
  const CasoGuiado1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caso Guiado 1 · Overflow Horizontal'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildExplicacionCard(),
            const SizedBox(height: 20),

            const Text('Vista Antes (Error Simulado en ancho 260px):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.red)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.white,
                          child: OverflowBox(
                            minWidth: 0,
                            maxWidth: 600,
                            alignment: Alignment.centerLeft,
                            child: const Row(
                              children: [
                                CircleAvatar(radius: 20, backgroundColor: Color(0xFF7A1F2B), child: Icon(Icons.person, color: Colors.white, size: 20)),
                                SizedBox(width: 8),
                                Text('Ana Quispe Huamán - Ingeniería de Sistemas y Computación UNSAAC', style: TextStyle(fontSize: 13, color: Colors.black87)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 14,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.black, Colors.yellow, Colors.black],
                              stops: [0.0, 0.25, 0.5, 0.75],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text('Vista Después (Corregido con Expanded + Ellipsis):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green.shade800)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFF7A1F2B),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Ana Quispe Huamán - Ingeniería de Sistemas',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
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

  Widget _buildExplicacionCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Caso Guiado 1: Diagnóstico en 3 Pasos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF7A1F2B)),
            ),
            const SizedBox(height: 10),
            const Text(
              '1. Leer error: "A RenderFlex overflowed by 42 pixels on the right... widget was Row".\n'
              '2. Razonar: Row da ancho no acotado; el Text pide más de lo que sobra.\n'
              '3. Corregir causa: Envolver Text en Expanded para imponerle un ancho tight finito.',
              style: TextStyle(fontSize: 13, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
