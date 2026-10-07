import 'package:flutter/material.dart';

/// ============================================================================
/// EJERCICIO GUIADO 5 — ELEGIR LA HERRAMIENTA CORRECTA
///
/// Matriz de decisión técnica:
/// 1. Lista de comentarios que puede crecer indefinidamente:
///    -> SingleChildScrollView o ListView (contenido dinámico sin límite predecible).
/// 2. Fila con ícono fijo y texto variable que debe truncarse:
///    -> Expanded / Flexible + TextOverflow.ellipsis (reparto en espacio finito horizontal).
/// 3. Pantalla de formulario con 15 campos:
///    -> SingleChildScrollView (evita overflow vertical en teclados abiertos o pantallas chicas).
/// 4. Dos botones que se reparten el ancho en partes iguales:
///    -> Row con 2 Expanded(flex: 1) (reparto proporcional exacto).
/// ============================================================================

class Ejercicio5Screen extends StatelessWidget {
  const Ejercicio5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 5 · Selección de Herramienta'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Matriz de Decisión: Expanded/Flexible vs. Scroll',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF7A1F2B)),
            ),
            const SizedBox(height: 12),

            _buildEscenarioCard(
              numero: '1',
              titulo: 'Lista de comentarios que crece indefinidamente',
              herramienta: 'SingleChildScrollView / ListView',
              razon: 'El número de ítems es desconocido y excede el alto de cualquier pantalla física. Se requiere scroll para permitir navegación sin límites.',
              color: Colors.blue.shade700,
              icono: Icons.forum_outlined,
            ),
            const SizedBox(height: 12),

            _buildEscenarioCard(
              numero: '2',
              titulo: 'Fila con ícono y texto variable a truncar',
              herramienta: 'Expanded (o Flexible) + Ellipsis',
              razon: 'El espacio horizontal es finito. Se debe imponer una restricción tight al texto para que calcule su límite y active el truncado con puntos suspensivos.',
              color: Colors.green.shade700,
              icono: Icons.short_text_rounded,
            ),
            const SizedBox(height: 12),

            _buildEscenarioCard(
              numero: '3',
              titulo: 'Formulario con 15 campos de entrada',
              herramienta: 'SingleChildScrollView',
              razon: '15 campos superan la altura de la mayoría de teléfonos y se solapan al abrir el teclado virtual (soft keyboard). El scroll previene el desbordamiento vertical.',
              color: Colors.orange.shade800,
              icono: Icons.dynamic_form_outlined,
            ),
            const SizedBox(height: 12),

            _buildEscenarioCard(
              numero: '4',
              titulo: 'Dos botones que comparten ancho equitativamente',
              herramienta: 'Row con dos Expanded (flex: 1)',
              razon: 'Los dos botones son elementos fijos y se requiere división exacta del 50% del ancho horizontal disponible.',
              color: Colors.purple.shade700,
              icono: Icons.view_column_rounded,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEscenarioCard({
    required String numero,
    required String titulo,
    required String herramienta,
    required String razon,
    required Color color,
    required IconData icono,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: color,
                  child: Text(numero, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    titulo,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                Icon(icono, color: color),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Herramienta recomendada: $herramienta',
                style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 12),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              razon,
              style: const TextStyle(fontSize: 12, color: Colors.black87, height: 1.35),
            ),
          ],
        ),
      ),
    );
  }
}
