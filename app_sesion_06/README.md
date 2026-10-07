# 📱 Guía de Ejecución en Emulador Android — Flutter App Sesión 06

**Universidad Nacional de San Antonio Abad del Cusco (UNSAAC)**  
**Facultad de Ingeniería Eléctrica, Electrónica, Informática y Mecánica**  
**Escuela Profesional de Ingeniería Informática y de Sistemas**  
* **Asignatura:** Desarrollo de Software II (IF616AIN / IF616BIN)  
* **Estudiante:** Edmil Jampier Saire Bustamante (Código: 174449)  
* **Docente:** Mtro. Ing. Yover Collantes Valer  
* **Repositorio:** [https://github.com/milith0kun/desarrollo-de-software-2](https://github.com/milith0kun/desarrollo-de-software-2)

---

## 🎯 Emuladores Android Disponibles en el Sistema

Actualmente tienes configurados los siguientes emuladores de Android:
1. **`Medium_Phone_2`** (Android AVD)
2. **`Medium_Phone_API_36.1`** (Android AVD)

---

## 🚀 Pasos para Ejecutar la Aplicación

### Paso 1. Abrir la terminal de PowerShell en la carpeta del proyecto
Asegúrate de estar ubicado en la carpeta del proyecto Flutter:
```powershell
cd "d:\Proyectos\Desarrollo de Sotfware 2\guia 6\app_sesion_06"
```

---

### Paso 2. Iniciar el Emulador de Android
Para encender el emulador desde la terminal sin necesidad de abrir Android Studio, ejecuta:

```powershell
flutter emulators --launch Medium_Phone_2
```
*(O si prefieres el otro emulador: `flutter emulators --launch Medium_Phone_API_36.1`)*

> ⏳ **Nota:** Espera unos segundos a que el emulador de Android termine de arrancar completamente hasta ver la pantalla de inicio del teléfono.

---

### Paso 3. Verificar que el Emulador esté Conectado
Comprueba que Flutter detecta el emulador en ejecución:
```powershell
flutter devices
```
Verás una salida similar a:
```text
Found connected devices:
  emulator-5554 (mobile) • emulator-5554 • android-x86 • Android 14/15
```

---

### Paso 4. Ejecutar la Aplicación en el Emulador
Lanza la aplicación con el comando `flutter run`:
```powershell
flutter run
```

Si tienes varios dispositivos conectados al mismo tiempo (ej. Windows, Chrome y el emulador), puedes especificar directamente el dispositivo con el flag `-d`:
```powershell
flutter run -d emulator-5554
```
o indicando android:
```powershell
flutter run -d android
```

---

## ⚡ Comandos Rápidos durante la Ejecución (Hot Reload / Restart)

Una vez que la aplicación esté corriendo en el emulador, puedes usar los atajos de teclado interactivos en la terminal:
* Presiona **`r`** para hacer **Hot Reload** (recarga instantánea de cambios en la UI sin perder el estado).
* Presiona **`R`** (mayúscula) para hacer **Hot Restart** (reinicia la aplicación desde cero).
* Presiona **`p`** para mostrar las líneas de depuración de layout (**debugPaintSizeEnabled** / visor de constraints).
* Presiona **`q`** para detener la aplicación.

---

## 💻 Alternativa: Ejecución Rápida en Windows o Chrome

Si deseas probar la aplicación de forma inmediata sin encender el emulador de Android:

* **En Windows Desktop:**
  ```powershell
  flutter run -d windows
  ```

* **En Google Chrome (Web):**
  ```powershell
  flutter run -d chrome
  ```

---

## 🧪 Verificación de Calidad y Análisis Estático

Para comprobar que todo el código cumple con las reglas de linting y no tiene advertencias ni errores:
```powershell
flutter analyze
```
*(Salida esperada: `No issues found!`)*

---

## 📂 Estructura de Módulos de la Aplicación

Dentro del menú principal podrás acceder a:
1. 🌟 **Guía de Aplicación 03 (Calificado 20 pts):** Visor interactivo comparativo con los 4 casos de error diagnosticados (*RenderFlex overflowed* y restricciones *unbounded*).
2. 👤 **Perfil Profesional Oficial:** `sesion06_saire_edmil.dart` protegido contra cualquier desbordamiento.
3. 📖 **Casos Guiados (1 al 3):** Diagnóstico guiado paso a paso.
4. 🛠️ **Ejercicios Guiados (1 al 7):** Laboratorios de *Tight vs Loose*, *ListView anidado*, matrices de decisión y análisis de stacktraces.
5. 📝 **Autoevaluación:** Cuestionario de 10 preguntas con retroalimentación y justificación técnica en vivo.
