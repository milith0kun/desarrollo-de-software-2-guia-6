import 'package:flutter/material.dart';

/// ============================================================================
/// GUÍA DE APLICACIÓN 03 — DIAGNÓSTICO Y CORRECCIÓN DE 4 CASOS DE ERROR DE LAYOUT
/// (Evaluación sobre 20 puntos — Primera Unidad Didáctica)
///
/// Estudiante: Edmil Jampier Saire Bustamante (Código: 174449)
/// Asignatura: Desarrollo de Software II (IF616AIN) — UNSAAC
/// ============================================================================

class GuiaAplicacion03Screen extends StatefulWidget {
  const GuiaAplicacion03Screen({super.key});

  @override
  State<GuiaAplicacion03Screen> createState() => _GuiaAplicacion03ScreenState();
}

class _GuiaAplicacion03ScreenState extends State<GuiaAplicacion03Screen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('UNSAAC · Guía de Aplicación 03', style: TextStyle(fontSize: 13)),
            Text('Diagnóstico de Restricciones (20 pts)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: const Color(0xFFC9971F),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Caso 1: Overflow Horiz.', icon: Icon(Icons.arrow_right_alt)),
            Tab(text: 'Caso 2: Expanded en Scroll', icon: Icon(Icons.all_inclusive)),
            Tab(text: 'Caso 3: Overflow Vert.', icon: Icon(Icons.arrow_downward)),
            Tab(text: 'Caso 4: ListView Anidado', icon: Icon(Icons.view_stream)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCaso1Tab(),
          _buildCaso2Tab(),
          _buildCaso3Tab(),
          _buildCaso4Tab(),
        ],
      ),
    );
  }

  // --------------------------------------------------------------------------
  // CASO 1: OVERFLOW HORIZONTAL EN ROW
  // --------------------------------------------------------------------------
  Widget _buildCaso1Tab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildFichaDiagnosticoCard(
            numero: '1',
            titulo: 'Overflow Horizontal en Fila de Destino',
            mensajeError: 'A RenderFlex overflowed by 54.0 pixels on the right.\nThe relevant error-causing widget was: Row',
            clasificacion: 'Overflow por contenido más ancho que el espacio disponible de su padre.',
            explicacionRestricciones: 'La Row recibe de la pantalla un ancho finito (ej. 360px), pero transmite restricciones no acotadas (minW=0, maxW=infinity) a sus hijos. El Text solicita 314px y el Icon 48px más espaciados. La suma (362px + márgenes) excede los 360px disponibles, provocando el desbordamiento.',
            solucionJustificada: 'Se envuelve el Text en un widget Expanded(child: Text(..., overflow: TextOverflow.ellipsis)). Expanded convierte la restricción horizontal del Text en tight con el espacio sobrante exacto de la Row, truncando elegantemente si el texto no cabe.',
          ),
          const SizedBox(height: 16),
          _buildComparadorVisual(
            tituloAntes: 'Antes (Simulación con Desborde):',
            widgetAntes: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: const Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xFF7A1F2B), size: 28),
                  SizedBox(width: 8),
                  Text('Circuito Turístico Valle Sagrado de los Incas - Pisac, Ollantaytambo y Chinchero', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            mostrarOverflowBand: true,
            tituloDespues: 'Después (Corregido con Expanded + Ellipsis):',
            widgetDespues: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xFF7A1F2B), size: 28),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Circuito Turístico Valle Sagrado de los Incas - Pisac, Ollantaytambo y Chinchero',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------------------------------
  // CASO 2: EXPANDED DENTRO DE SCROLL (RESTRICCIONES INFINITAS)
  // --------------------------------------------------------------------------
  Widget _buildCaso2Tab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildFichaDiagnosticoCard(
            numero: '2',
            titulo: 'Restricciones Infinitas (Expanded en SingleChildScrollView)',
            mensajeError: 'RenderFlex children have non-zero flex but incoming height constraints are unbounded.\nThe relevant error-causing widget was: Column',
            clasificacion: 'Restricciones no acotadas (unbounded) mal combinadas con Expanded.',
            explicacionRestricciones: 'SingleChildScrollView impone restricciones de altura no acotadas (maxHeight = double.infinity) para permitir desplazamiento. Al colocar un Expanded dentro de la Column, Expanded intenta calcular qué fracción de infinity le corresponde. Al ser matemáticamente indefinido, Flutter arroja una excepción en tiempo de layout.',
            solucionJustificada: 'Se elimina el widget Expanded dentro del scroll y se asigna una altura explícita finita (ej. height: 180 o SizedBox con dimensión definida) o se permite al hijo adoptar su tamaño intrínseco.',
          ),
          const SizedBox(height: 16),
          _buildComparadorVisual(
            tituloAntes: 'Código Erróneo:',
            widgetAntes: Container(
              padding: const EdgeInsets.all(12),
              color: Colors.red.shade100,
              child: const Text(
                'SingleChildScrollView(\n  child: Column(\n    children: [\n      Expanded(child: Container(color: Colors.blue))\n    ]\n  )\n)',
                style: TextStyle(fontFamily: 'monospace', fontSize: 11),
              ),
            ),
            mostrarOverflowBand: false,
            tituloDespues: 'Después (Solución con Altura Explícita):',
            widgetDespues: Container(
              height: 140,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.indigo.shade300),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 28),
                    const SizedBox(height: 6),
                    Text('Container(height: 140, color: Colors.indigo)', style: TextStyle(color: Colors.indigo.shade900, fontWeight: FontWeight.bold, fontSize: 13)),
                    const Text('Layout acotado y estable dentro del scroll', style: TextStyle(fontSize: 11, color: Colors.black54)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------------------------------
  // CASO 3: OVERFLOW VERTICAL EN COLUMN
  // --------------------------------------------------------------------------
  Widget _buildCaso3Tab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildFichaDiagnosticoCard(
            numero: '3',
            titulo: 'Overflow Vertical por Acumulación de Elementos',
            mensajeError: 'A RenderFlex overflowed by 72.0 pixels on the bottom.\nThe relevant error-causing widget was: Column',
            clasificacion: 'Overflow por contenido más alto que la pantalla del dispositivo.',
            explicacionRestricciones: 'La Column recibe un maxHeight acotado por la pantalla física (ej. 600px). Sus hijos solicitan individualmente tamaños legítimos (tarjetas, textos, botones), pero la SUMATORIA acumulada excede la altura visible. No hay un hijo individual culpable para usar Expanded.',
            solucionJustificada: 'Envolver la Column (o su contenedor padre) en un SingleChildScrollView para transformar la restricción vertical en unbounded permisiva de scroll, garantizando que el usuario pueda acceder a todo el contenido.',
          ),
          const SizedBox(height: 16),
          _buildComparadorVisual(
            tituloAntes: 'Antes: Column Rígida (Desborde en pantalla corta):',
            widgetAntes: Container(
              height: 90,
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Registro de Matrícula UNSAAC', style: TextStyle(fontSize: 12)),
                  Text('2. Pago de Tasas Educativas', style: TextStyle(fontSize: 12)),
                  Text('3. Validación de Horario Académico', style: TextStyle(fontSize: 12)),
                  Text('4. Confirmación de Cursos', style: TextStyle(fontSize: 12)),
                  Text('5. Generación de Constancia', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            mostrarOverflowBand: true,
            tituloDespues: 'Después: Column envuelta en SingleChildScrollView:',
            widgetDespues: Container(
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('1. Registro de Matrícula UNSAAC', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    Divider(height: 12),
                    Text('2. Pago de Tasas Educativas', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    Divider(height: 12),
                    Text('3. Validación de Horario Académico', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    Divider(height: 12),
                    Text('4. Confirmación de Cursos Semestre 2026-II', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------------------------------
  // CASO 4: LISTVIEW HORIZONTAL CON HIJO LISTVIEW NO ACOTADO
  // --------------------------------------------------------------------------
  Widget _buildCaso4Tab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildFichaDiagnosticoCard(
            numero: '4',
            titulo: 'Restricción Infinita en ListView Anidado',
            mensajeError: 'BoxConstraints forces an infinite width / Vertical viewport was given unbounded width.\nThe relevant error-causing widget was: ListView',
            clasificacion: 'Restricciones no acotadas (unbounded) en dirección transversal/scroll.',
            explicacionRestricciones: 'Un ListView horizontal le otorga ancho infinito a sus hijos. Al colocar otro ListView vertical anidado adentro, este último intenta tomar todo el ancho disponible del padre (infinito). El motor de Flutter no puede dibujar un widget con ancho infinito.',
            solucionJustificada: 'Acotar el ancho del widget interno usando SizedBox(width: ...) o Container con width fijo (ej. width: 160), o estructurarlo con Column/Card delimitadas.',
          ),
          const SizedBox(height: 16),
          _buildComparadorVisual(
            tituloAntes: 'Código Erróneo (ListView sin ancho dentro de ListView horiz.):',
            widgetAntes: Container(
              padding: const EdgeInsets.all(12),
              color: Colors.red.shade100,
              child: const Text(
                'ListView(scrollDirection: Axis.horizontal,\n  children: [\n    ListView(children: [...]) // ERROR: Ancho infinito\n  ]\n)',
                style: TextStyle(fontFamily: 'monospace', fontSize: 11),
              ),
            ),
            mostrarOverflowBand: false,
            tituloDespues: 'Después: Cada columna delimitada con SizedBox(width: 150):',
            widgetDespues: Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                children: [
                  _buildMiniCard('Columna 1', Colors.teal),
                  const SizedBox(width: 8),
                  _buildMiniCard('Columna 2', Colors.blue),
                  const SizedBox(width: 8),
                  _buildMiniCard('Columna 3', Colors.indigo),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniCard(String titulo, Color color) {
    return SizedBox(
      width: 140,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(titulo, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 12)),
            const Text('Ancho acotado: 140px', style: TextStyle(fontSize: 10, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  Widget _buildFichaDiagnosticoCard({
    required String numero,
    required String titulo,
    required String mensajeError,
    required String clasificacion,
    required String explicacionRestricciones,
    required String solucionJustificada,
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
                  radius: 14,
                  backgroundColor: const Color(0xFF7A1F2B),
                  child: Text(numero, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    titulo,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF7A1F2B)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                mensajeError,
                style: const TextStyle(color: Color(0xFFEF4444), fontFamily: 'monospace', fontSize: 11, height: 1.3),
              ),
            ),
            const SizedBox(height: 12),

            _buildCampoFicha('Clasificación Causa Raíz:', clasificacion, Colors.amber.shade900),
            const SizedBox(height: 8),
            _buildCampoFicha('Explicación (Constraints go down, sizes go up):', explicacionRestricciones, Colors.black87),
            const SizedBox(height: 8),
            _buildCampoFicha('Corrección Técnica Aplicada:', solucionJustificada, Colors.green.shade800),
          ],
        ),
      ),
    );
  }

  Widget _buildCampoFicha(String subtitulo, String texto, Color colorTexto) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(subtitulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black54)),
        const SizedBox(height: 2),
        Text(texto, style: TextStyle(fontSize: 12, color: colorTexto, height: 1.35)),
      ],
    );
  }

  Widget _buildComparadorVisual({
    required String tituloAntes,
    required Widget widgetAntes,
    required bool mostrarOverflowBand,
    required String tituloDespues,
    required Widget widgetDespues,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tituloAntes, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.red)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red.shade200),
          ),
          child: Stack(
            children: [
              widgetAntes,
              if (mostrarOverflowBand)
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
        const SizedBox(height: 14),
        Text(tituloDespues, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.green.shade800)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green.shade200),
          ),
          child: widgetDespues,
        ),
      ],
    );
  }
}
