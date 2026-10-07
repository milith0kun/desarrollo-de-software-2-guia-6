import 'package:flutter/material.dart';

/// ============================================================================
/// CASO GUIADO 3 — OVERFLOW VERTICAL POR CONTENIDO DINÁMICO
///
/// Error inicial: Column con muchos elementos que exceden la altura de pantalla.
/// Consola: "A RenderFlex overflowed by 68 pixels on the bottom. The relevant error-causing widget was Column."
///
/// Razonamiento: Ningún hijo individual es culpable. La SUMA total excede el alto físico.
/// Corrección: Envolver la Column en un SingleChildScrollView para permitir desplazamiento.
/// ============================================================================

class CasoGuiado3Screen extends StatelessWidget {
  const CasoGuiado3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caso Guiado 3 · Overflow Vertical'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildExplicacionCard(),
            const SizedBox(height: 20),

            Text(
              'Lista de Tareas Desplazable (Corregida con SingleChildScrollView):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green.shade800),
            ),
            const SizedBox(height: 10),

            Container(
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.checklist, color: Color(0xFF7A1F2B)),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Mis Tareas Pendientes (Semestre 2026-II)',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    _buildTaskItem('1. Revisar sílabo de Desarrollo de Software II', true),
                    _buildTaskItem('2. Configurar Flutter SDK 3.41.4 & VS Code', true),
                    _buildTaskItem('3. Resolver ejercicios de Dart declarativo', true),
                    _buildTaskItem('4. Diagramar árbol de widgets y modelo de caja', true),
                    _buildTaskItem('5. Dominar modelo de restricciones (Sesión 6)', true),
                    _buildTaskItem('6. Construir interfaces con Row, Column y Expanded', false),
                    _buildTaskItem('7. Implementar diseño adaptativo con LayoutBuilder', false),
                    _buildTaskItem('8. Entregar producto de Primera Unidad (Hola Mundo Móvil)', false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem(String texto, bool completada) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(
            completada ? Icons.check_circle : Icons.radio_button_unchecked,
            color: completada ? Colors.green : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              texto,
              style: TextStyle(
                fontSize: 13,
                decoration: completada ? TextDecoration.lineThrough : null,
                color: completada ? Colors.black54 : Colors.black87,
              ),
            ),
          ),
        ],
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
              'Caso Guiado 3: Overflow por Suma de Elementos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF7A1F2B)),
            ),
            const SizedBox(height: 10),
            const Text(
              '1. Error: "A RenderFlex overflowed by NN pixels on the bottom... widget was Column".\n'
              '2. Razonamiento: La suma total de alturas excede la pantalla física.\n'
              '3. Solución: Envolver en SingleChildScrollView para permitir scroll natural.',
              style: TextStyle(fontSize: 13, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
