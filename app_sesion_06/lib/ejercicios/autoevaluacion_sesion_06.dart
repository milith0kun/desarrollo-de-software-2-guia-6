import 'package:flutter/material.dart';

/// ============================================================================
/// AUTOEVALUACIÓN OFICIAL — SESIÓN 06 (MODELO DE RESTRICCIONES)
/// 10 preguntas de opción múltiple con justificación técnica detallada.
/// ============================================================================

class AutoevaluacionSesion06Screen extends StatefulWidget {
  const AutoevaluacionSesion06Screen({super.key});

  @override
  State<AutoevaluacionSesion06Screen> createState() => _AutoevaluacionSesion06ScreenState();
}

class _AutoevaluacionSesion06ScreenState extends State<AutoevaluacionSesion06Screen> {
  final Map<int, int> _respuestasSeleccionadas = {};
  bool _mostrarResultados = false;

  final List<Map<String, dynamic>> _preguntas = [
    {
      'pregunta': '1. Según la regla fundamental de Flutter, ¿en qué orden ocurre el proceso de layout?',
      'opciones': [
        'Los tamaños bajan, las restricciones suben.',
        'Las restricciones bajan (padre → hijo), los tamaños suben (hijo → padre), y el padre fija la posición.',
        'El hijo decide su posición y se la comunica al padre.',
        'Todos los widgets calculan su tamaño de forma independiente y simultánea.',
      ],
      'correcta': 1,
      'justificacion': 'Regla de oro de Flutter: "Constraints go down, sizes go up, parent sets position". El árbol se resuelve en una sola pasada ordenada.',
    },
    {
      'pregunta': '2. ¿Qué son, técnicamente, las "constraints" (restricciones) en Flutter?',
      'opciones': [
        'Un color y un estilo de fuente.',
        'Un conjunto de 4 valores: ancho mínimo, ancho máximo, alto mínimo y alto máximo.',
        'La posición x, y de un widget.',
        'El número de hijos que puede tener un widget.',
      ],
      'correcta': 1,
      'justificacion': 'BoxConstraints encapsula exactamente 4 números flotantes: minWidth, maxWidth, minHeight y maxHeight.',
    },
    {
      'pregunta': '3. Una restricción con minWidth = maxWidth y minHeight = maxHeight se denomina:',
      'opciones': [
        'Loose (flexible)',
        'Unbounded (no acotada)',
        'Tight (ajustada)',
        'Nula',
      ],
      'correcta': 2,
      'justificacion': 'Una restricción tight ofrece una única opción dimensional exacta para el hijo.',
    },
    {
      'pregunta': '4. ¿Por qué Center "soluciona" que un Container con width fijo pegado a la pantalla no respete su tamaño?',
      'opciones': [
        'Porque Center ignora las restricciones del padre.',
        'Porque Center transforma las restricciones tight que recibe en restricciones loose para su hijo.',
        'Porque Center fuerza un tamaño infinito.',
        'Center no tiene ningún efecto sobre las restricciones.',
      ],
      'correcta': 1,
      'justificacion': 'Center relaja el minWidth y minHeight a 0 (restricciones loose), permitiendo que el Container elija su propio tamaño.',
    },
    {
      'pregunta': '5. ¿Qué mensaje de error es típico de un problema de restricciones no acotadas (unbounded)?',
      'opciones': [
        'A RenderFlex overflowed by 42 pixels.',
        'BoxConstraints forces an infinite width.',
        'Null check operator used on a null value.',
        'Type String is not a subtype of type int.',
      ],
      'correcta': 1,
      'justificacion': '"BoxConstraints forces an infinite width / height" indica que un widget intentó ser tan grande como fuera posible frente a una dimensión infinita.',
    },
    {
      'pregunta': '6. ¿Qué ocurre si se usa Expanded como hijo directo de una Column dentro de un SingleChildScrollView?',
      'opciones': [
        'Funciona igual que fuera del scroll.',
        'Se produce una excepción, porque Expanded necesita un espacio finito y el scroll ofrece un alto no acotado.',
        'El widget se oculta automáticamente.',
        'El scroll deja de funcionar, pero no hay error.',
      ],
      'correcta': 1,
      'justificacion': 'Expanded calcula una fracción de espacio finito. Una porción de infinity no tiene valor numérico posible.',
    },
    {
      'pregunta': '7. En una Row con un Icon y un Text muy largo que produce overflow horizontal, ¿cuál es la corrección más apropiada?',
      'opciones': [
        'Envolver toda la Row en un Center.',
        'Envolver el Text en un Expanded (opcionalmente con TextOverflow.ellipsis).',
        'Eliminar el Icon.',
        'Cambiar la Row por un Container.',
      ],
      'correcta': 1,
      'justificacion': 'Expanded le impone al Text una restricción tight con el ancho restante exacto disponible en la Row.',
    },
    {
      'pregunta': '8. ¿Qué le ocurre exactamente a un ConstrainedBox si su propio padre ya le impuso restricciones tight?',
      'opciones': [
        'Sus límites min/max se aplican siempre, sin excepción.',
        'Sus límites min/max se ignoran, porque la restricción tight del padre ya fija un único tamaño posible.',
        'Provoca un error de compilación.',
        'Convierte automáticamente la restricción en loose.',
      ],
      'correcta': 1,
      'justificacion': 'ConstrainedBox solo añade restricciones adicionales; no puede relajar o sustituir restricciones tight ya fijadas por ancestros superiores.',
    },
    {
      'pregunta': '9. ¿Cuál es una de las 3 categorías de widgets según cómo manejan sus restricciones?',
      'opciones': [
        'Los que ignoran completamente sus restricciones.',
        'Los que intentan ser lo más grandes posible (por ejemplo, Center o ListView).',
        'Los que solo funcionan dentro de un Scaffold.',
        'Los que requieren estado mutable.',
      ],
      'correcta': 1,
      'justificacion': 'Las 3 categorías oficiales son: 1) Los que intentan ser lo más grande posible, 2) Los que adoptan el tamaño de su hijo, y 3) Los que buscan un tamaño particular.',
    },
    {
      'pregunta': '10. Si el contenido de una Column crece dinámicamente y excede la pantalla, ¿cuál es la solución más apropiada?',
      'opciones': [
        'Envolver la Column en Expanded.',
        'Envolver la Column en SingleChildScrollView.',
        'Fijar una altura máxima arbitraria y recortar el contenido.',
        'No hacer nada, Flutter lo resuelve automáticamente.',
      ],
      'correcta': 1,
      'justificacion': 'SingleChildScrollView permite que el contenido crezca verticalmente sin límite mientras el usuario se desplaza cómodamente.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    int aciertos = 0;
    if (_mostrarResultados) {
      for (int i = 0; i < _preguntas.length; i++) {
        if (_respuestasSeleccionadas[i] == _preguntas[i]['correcta']) {
          aciertos++;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Autoevaluación · Sesión 06'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_mostrarResultados)
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: aciertos >= 8 ? Colors.green.shade50 : Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: aciertos >= 8 ? Colors.green : Colors.amber),
                ),
                child: Row(
                  children: [
                    Icon(aciertos >= 8 ? Icons.emoji_events : Icons.info, color: aciertos >= 8 ? Colors.green : Colors.amber.shade900, size: 36),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Resultado: $aciertos / 10 correctas (${(aciertos * 2)}/20 pts)', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(aciertos >= 8 ? '¡Excelente dominio del modelo de restricciones!' : 'Revisa las justificaciones técnicas para reforzar.', style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),

            ...List.generate(_preguntas.length, (index) {
              final item = _preguntas[index];
              final int? seleccion = _respuestasSeleccionadas[index];
              final int correcta = item['correcta'] as int;

              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['pregunta'] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF7A1F2B)),
                      ),
                      const SizedBox(height: 10),
                      ...List.generate((item['opciones'] as List<String>).length, (opcIndex) {
                        final String opcion = item['opciones'][opcIndex];
                        Color? btnColor;
                        if (_mostrarResultados) {
                          if (opcIndex == correcta) {
                            btnColor = Colors.green.shade100;
                          } else if (seleccion == opcIndex) {
                            btnColor = Colors.red.shade100;
                          }
                        }

                        final String letra = String.fromCharCode(97 + opcIndex);

                        return InkWell(
                          onTap: () {
                            setState(() {
                              _respuestasSeleccionadas[index] = opcIndex;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: btnColor ?? (seleccion == opcIndex ? const Color(0xFF7A1F2B).withValues(alpha: 0.08) : Colors.transparent),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: seleccion == opcIndex ? const Color(0xFF7A1F2B) : Colors.grey.shade300,
                                width: seleccion == opcIndex ? 1.5 : 1.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '$letra) ',
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                                Expanded(child: Text(opcion, style: const TextStyle(fontSize: 13))),
                                if (_mostrarResultados && opcIndex == correcta)
                                  const Icon(Icons.check_circle, color: Colors.green, size: 18),
                              ],
                            ),
                          ),
                        );
                      }),
                      if (_mostrarResultados) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '💡 Justificación: ${item['justificacion']}',
                            style: TextStyle(fontSize: 11, color: Colors.blue.shade900),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),

            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _mostrarResultados = true;
                });
              },
              icon: const Icon(Icons.grading),
              label: const Text('Calificar y Ver Justificaciones'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7A1F2B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
