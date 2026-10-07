import 'package:flutter/material.dart';

/// ============================================================================
/// EJERCICIO GUIADO 7 — REFACTORIZACIÓN PREVENTIVA DE PANTALLA DE PERFIL
///
/// Principio preventivo:
/// "Un error de layout que no aparece con datos de prueba cortos puede aparecer
/// en producción con datos reales más largos. Anticipar estos casos es la marca
/// de un desarrollador profesional."
///
/// Puntos prevenidos:
/// 1. Nombre extenso o títulos académicos largos (envuelto en Expanded + TextOverflow.ellipsis).
/// 2. Biografía o múltiples datos de contacto (pantalla envuelta en SingleChildScrollView).
/// 3. Fila de insignias o habilidades (envuelta en Wrap o Flexible).
/// ============================================================================

class Ejercicio7Screen extends StatelessWidget {
  const Ejercicio7Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 7 · Prevención de Overflow'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.shield_outlined, color: Color(0xFF7A1F2B)),
                        const SizedBox(width: 8),
                        const Text(
                          'Refactorización Preventiva Aplicada',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Esta tarjeta demuestra cómo la pantalla resiste nombres reales largos '
                      'sin romper el layout gracias a Expanded y TextOverflow.ellipsis:',
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tarjeta de perfil con datos extremadamente largos de prueba
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Fila de cabecera protegida con Expanded
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 32,
                        backgroundColor: Color(0xFF7A1F2B),
                        child: Icon(Icons.person, color: Colors.white, size: 36),
                      ),
                      const SizedBox(width: 16),
                      // PROTECCIÓN: Expanded acota el ancho y ellipsis trunca si excede
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Edmil Jampier Saire Bustamante (Ingeniería Informática y de Sistemas)',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Desarrollador Flutter & Especialista en Arquitecturas Móviles',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 28),

                  // Fila de etiquetas de contacto protegidas
                  _buildContactoFila(Icons.email, 'edmil.saire.bustamante.unsaac.epis@unsaac.edu.pe'),
                  const SizedBox(height: 8),
                  _buildContactoFila(Icons.location_on, 'Campus Universitario Perayoc - Pabellón Informática, Cusco, Perú'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactoFila(IconData icono, String texto) {
    return Row(
      children: [
        Icon(icono, size: 18, color: const Color(0xFF7A1F2B)),
        const SizedBox(width: 10),
        // PROTEGIDO con Flexible para ajustarse sin causar overflow horizontal
        Flexible(
          child: Text(
            texto,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
