# Coin Flip App 💬

Una aplicación Flutter de chat interactivo con temas personalizables y arquitectura limpia, ideal para aprender desarrollo Flutter.

## 📱 Descripción

Coin Flip App es una aplicación Flutter de chat interactivo que simula conversaciones con un asistente virtual. Implementa un sistema de temas dinámicos utilizando Material 3, gestión de estado con Provider, y presenta una interfaz de chat moderna con burbujas de mensajes personalizadas y avatares.

## ✨ Características

- 🎨 Sistema de temas personalizables con 8 esquemas de color diferentes
- � Cambio de tema dinámico mediante menú desplegable en AppBar
- 📱 Diseño Material 3 moderno
- 🔄 Gestión de estado reactiva con Provider (ChatProvider y ThemeProvider)
- 💬 Interfaz de chat con burbujas de mensajes estilizadas
- 🤖 Chat interactivo con asistente virtual "Coin"
- 🌐 Integración con API externa para respuestas automáticas
- 🔄 Respuestas automáticas cuando el mensaje termina en "?"
- 📜 Scroll automático al último mensaje con animación suave
- ✨ **Animaciones de entrada fluidas** para burbujas de mensajes (slide + fade, 400ms)
- ⌨️ **Indicador "Escribiendo..."** animado mientras Coin prepara su respuesta
- 📊 **Panel de estadísticas** con métricas del chat (preguntas, respuestas, porcentajes, racha)
- 🎨 **Mejoras visuales** con gradientes de color, sombras y fondo con gradiente
- 🏗️ Arquitectura limpia con separación de capas (domain, infrastructure, presentation, config)
- 📝 ListView.builder optimizado para múltiples mensajes
- 🎭 Avatar personalizado con imágenes de red
- 🖼️ Soporte para mensajes con imágenes GIF desde API
- ⏳ Indicador de carga animado (CircularProgressIndicator) mientras se cargan las imágenes
- ⌨️ Control de foco del teclado y entrada de texto
- 🔌 Peticiones HTTP con Dio
- 📖 **Código completamente comentado para aprendizaje**

## 🎨 Temas Disponibles

La aplicación incluye 8 esquemas de color predefinidos:
- 🎨 Custom Color (0xFF123456)
- 🔵 Blue
- 🔴 Red
- 🟢 Teal
- 🟠 Orange
- 🟡 Yellow
- 🟣 Purple
- 🟢 Green

## 🚀 Instalación

```bash
# Clonar el repositorio
git clone https://github.com/DeartDev/dart-y-flutter.git

# Navegar al directorio
cd coin_flip_app

# Instalar dependencias
flutter pub get

# Ejecutar la aplicación
flutter run
```

## 📦 Dependencias

- **Flutter SDK**: ^3.5.1
- **cupertino_icons**: ^1.0.8 - Iconos estilo iOS
- **provider**: ^6.1.5+1 - Gestión de estado
- **dio**: ^5.9.0 - Cliente HTTP para peticiones a la API

## 🏗️ Estructura del Proyecto

```
lib/
├── main.dart                              # Punto de entrada de la aplicación
├── config/
│   ├── helpers/
│   │   └── get_yes_no_answer.dart         # Helper para peticiones a la API externa
│   └── themes/
│       └── app_theme.dart                 # Configuración de temas personalizados
├── domain/
│   └── entities/
│       └── message.dart                   # Entidad Message y enum FromWho
├── infrastructure/
│   └── models/
│       └── yes_no_model.dart              # Modelo para mapear respuestas de la API
└── presentation/
    ├── providers/
    │   ├── chat_provider.dart             # Provider para gestión de estado del chat y estadísticas
    │   └── theme_provider.dart            # Provider para gestión de temas dinámicos
    ├── Screens/
    │   └── chat/
    │       └── chat_screen.dart           # Pantalla principal de chat con menú de temas y estadísticas
    └── widgets/
        ├── chat/
        │   ├── my_message_bubble.dart     # Burbuja de mensaje del usuario con animación y gradiente
        │   ├── her_message_bubble.dart    # Burbuja de mensaje recibido con animación, imagen y gradiente
        │   ├── typing_indicator.dart      # Indicador animado "Escribiendo..."
        │   └── statistics_drawer.dart     # Drawer con estadísticas del chat
        └── shared/
            └── message_field_box.dart     # Campo de entrada de texto con control de foco
```

## 📚 Guía de Aprendizaje

Este proyecto está completamente comentado como recurso educativo. Cada archivo sigue una estructura optimizada de documentación:

### Estructura de Comentarios

Los comentarios están organizados de manera profesional para facilitar el aprendizaje:

1. **Bloque de documentación al inicio** (usando `///`)
   - Descripción del widget o clase
   - Lista de widgets utilizados y su configuración
   - Propiedades y parámetros
   - Lógica y funcionalidad principal

2. **Código limpio sin interrupciones**
   - El código fluye naturalmente sin comentarios intercalados
   - Fácil de leer y comprender la estructura
   - Nombres descriptivos de variables y métodos

Esta organización permite:
- **Consultar la documentación** antes de leer el código
- **Leer el código limpio** sin distracciones
- **Aprender patrones** de documentación profesional en Flutter

### Widgets Principales Utilizados

| Widget | Ubicación | Propósito |
|--------|-----------|-----------|
| `MaterialApp` | main.dart | Widget raíz que configura la aplicación Material Design |
| `Scaffold` | chat_screen.dart | Estructura básica de la pantalla con AppBar y body |
| `AppBar` | chat_screen.dart | Barra superior con título, menú de temas y botón de estadísticas |
| `PopupMenuButton` | chat_screen.dart | Menú desplegable para selección de temas |
| `Drawer` | statistics_drawer.dart | Panel lateral para mostrar estadísticas del chat |
| `ListView.builder` | chat_screen.dart | Lista optimizada para muchos mensajes |
| `TweenAnimationBuilder` | Burbujas de mensaje | Animaciones automáticas (slide + fade) |
| `Column` | Burbujas de mensaje | Organiza widgets verticalmente |
| `Container` | Burbujas de mensaje, chat_screen | Contenedor con decoración, gradiente y estilo |
| `LinearGradient` | Burbujas, chat_screen | Gradientes de color para fondos |
| `BoxShadow` | Burbujas de mensaje | Sombras para efecto de profundidad |
| `CircularProgressIndicator` | typing_indicator, her_message_bubble | Indicador de carga y animación de escritura |
| `ClipRRect` | her_message_bubble.dart | Recorta imágenes con bordes redondeados |
| `SafeArea` | chat_screen.dart | Evita superposición con áreas del sistema |
| `Expanded` | chat_screen.dart | Expande widgets para llenar espacio disponible |
| `TextFormField` | message_field_box.dart | Campo de texto para entrada de mensajes |
| `TextEditingController` | message_field_box.dart | Controla el contenido del campo de texto |
| `FocusNode` | message_field_box.dart | Gestiona el foco del teclado |

## 💻 Uso

### Mensajes de Bienvenida

Cuando abres la app, Coin te da la bienvenida con tres mensajes iniciales:
1. "Hola, soy Coin 👋"
2. "Estoy aquí para ayudarte a responder tus preguntas de forma simple y directa."
3. "Te responderé únicamente con "Sí" o "No". Nada más, nada menos 😉."

### Enviar Mensajes

1. Escribe tu mensaje en el campo de texto en la parte inferior
2. Presiona Enter o el botón de envío
3. El mensaje aparecerá con una **animación de entrada** (slide + fade) en la burbuja azul
4. Si tu mensaje termina en "?", aparecerá el **indicador "Escribiendo..."**
5. Coin responderá automáticamente después de 1 segundo
6. Las respuestas apareceán con **animación** en burbujas grises con texto e imagen GIF
7. El chat se desplaza automáticamente al último mensaje

### Ver Estadísticas

1. Toca el icono de **estadísticas** (📊) en la esquina superior derecha del AppBar
2. Se abrirá un drawer lateral con:
   - Total de preguntas realizadas
   - Total de respuestas de Coin
   - Porcentaje de respuestas "Sí" (con barra verde)
   - Porcentaje de respuestas "No" (con barra roja)
   - Racha actual de preguntas
3. Las estadísticas se actualizan en tiempo real

### Cambiar Tema

La aplicación permite cambiar el tema de dos formas:

**1. Desde la interfaz de usuario (Recomendado)**:
- Haz clic en el icono de paleta (🎨) en el AppBar (esquina superior derecha)
- Selecciona el color deseado del menú desplegable
- El tema se aplicará inmediatamente en toda la aplicación

**2. Modificando el código (solo desarrollo)**:
Puedes cambiar el tema inicial modificando el valor en [lib/presentation/providers/theme_provider.dart](lib/presentation/providers/theme_provider.dart):

```dart
int _currentThemeIndex = 2; // Cambia el número (0-7)
```

### Componentes Principales

| Componente | Descripción |
|------------|-------------|
| **Message** | Entidad del dominio que representa un mensaje con texto, imagen opcional y remitente |
| **FromWho** | Enumeración que identifica el origen del mensaje (`me` o `hers`) |
| **YesNoModel** | Modelo de infrastructure que mapea las respuestas JSON de la API |
| **GetYesNoAnswer** | Helper que realiza peticiones HTTP a la API externa con Dio |
| **ChatProvider** | Provider que gestiona el estado, mensajes, scroll automático, indicador de escritura y estadísticas |
| **ThemeProvider** | Provider que gestiona el tema dinámico de la aplicación |
| **ChatScreen** | Pantalla principal con AppBar, menú de temas, botón de estadísticas, ListView y campo de entrada |
| **MyMessageBubble** | Widget para burbujas de mensajes del usuario con animación de entrada, gradiente y sombra |
| **HerMessageBubble** | Widget para mensajes recibidos con animación, gradiente, sombra e imágenes dinámicas |
| **TypingIndicator** | Indicador animado con tres puntos que muestra cuando Coin está "escribiendo" |
| **StatisticsDrawer** | Drawer lateral con estadísticas detalladas del chat (preguntas, respuestas, porcentajes) |
| **MessageFieldBox** | Campo de entrada con gestión de foco y validación |
| **AppTheme** | Sistema de temas con `colorSchemeSeed` para paletas completas |

## 🎓 Recursos de Aprendizaje

### Conceptos Flutter Cubiertos

#### 1. **Arquitectura y Gestión de Estado**
   - Separación en capas: domain, infrastructure, config, presentation
   - Entidades del dominio (Message)
   - Modelos de infrastructure (YesNoModel)
   - Enumeraciones (enum) para tipos seguros (FromWho)
   - Provider para gestión de estado reactivo
   - ChangeNotifier y notifyListeners()
   - Clases inmutables con final
   - Helpers para lógica reutilizable

#### 2. **Peticiones HTTP y APIs**
   - Integración con API REST externa
   - Uso de Dio para peticiones HTTP
   - Mapeo de JSON a modelos Dart
   - Conversión de modelos a entidades del dominio
   - Manejo asíncrono con async/await
   - Future y programación asíncrona

#### 3. **StatelessWidget vs StatefulWidget**
   - Diferencias conceptuales y de rendimiento
   - Cuándo usar cada uno
   - Ciclo de vida de StatefulWidget
   - Gestión de estado local

#### 4. **Layouts y Animaciones**
   - Column y Row para organización
   - Expanded y Flexible para distribución de espacio
   - ListView.builder para listas eficientes y optimizadas
   - ScrollController para control programático de scroll
   - Animaciones con animateTo() y curvas de animación
   - **TweenAnimationBuilder para animaciones automáticas**
   - **Transform.translate para efectos de desplazamiento**
   - **AnimationController y Animation para animaciones complejas**
   - **TweenSequence para animaciones secuenciales**
   - SafeArea para evitar zonas del sistema
   - Padding y margin para espaciado

#### 5. **Material Design 3**
   - Scaffold como estructura base
   - AppBar personalizada con avatar, menú de temas y botón de estadísticas
   - Drawer para panel lateral con estadísticas del chat
   - PopupMenuButton para selector de temas con 8 opciones
   - ThemeData y ColorScheme
   - ColorSchemeSeed para paletas automáticas
   - **LinearGradient para gradientes de color** en burbujas y fondo
   - **BoxShadow para efectos de profundidad** en todas las burbujas
   - Componentes Material adaptables
   - Iconos Material (Icons.palette, Icons.send_outlined, Icons.check, Icons.analytics)
   - Card y ListTile para presentación de estadísticas
   - LinearProgressIndicator para visualizar porcentajes

#### 6. **Widgets de Imagen**
   - NetworkImage para cargar desde internet
   - ClipRRect para bordes redondeados
   - BoxFit para ajuste responsivo
   - Manejo de carga asíncrona de imágenes
   - CircularProgressIndicator para estado de carga
   - loadingBuilder para feedback visual durante la descarga
   - **Sombras en imágenes para destacar contenido**

#### 7. **Entrada de Texto y Formularios**
   - TextFormField para entrada de datos
   - TextEditingController para control programático
   - FocusNode para gestión del teclado
   - InputDecoration para estilizado personalizado
   - Callbacks: onFieldSubmitted, onTapOutside
   - Validación de entrada

#### 8. **Mejores Prácticas**
   - Separación de responsabilidades
   - Widgets privados con prefijo (_)
   - Organización modular de carpetas
   - Arquitectura limpia (Clean Architecture)
   - Reutilización de componentes
   - Comentarios descriptivos y educativos
   - Modelos de datos vs Entidades del dominio
   - Renderizado condicional de widgets (if en listas)
   - Manejo seguro de valores opcionales (null safety)
   - **Animaciones con TweenAnimationBuilder** para transiciones suaves y simples
   - **Uso de gradientes (LinearGradient) y sombras (BoxShadow)** para mejor UX
   - **Feedback visual con indicadores de estado** (TypingIndicator, CircularProgressIndicator)
   - **Delays estratégicos** con Future.delayed para simular respuestas naturales
   - **Estadísticas en tiempo real** calculadas dinámicamente desde el estado
   - **MultiProvider** para gestión de múltiples providers (ChatProvider, ThemeProvider)
   - **Consumer** para reconstrucción selectiva de widgets cuando cambia el estado

## 🛠️ Tecnologías

- **Flutter** ^3.5.1 - Framework de desarrollo multiplataforma
- **Dart** - Lenguaje de programación orientado a objetos
- **Material 3** - Sistema de diseño de Google
- **Provider** - Solución de gestión de estado recomendada por Flutter
- **Dio** ^5.9.0 - Cliente HTTP potente para peticiones REST

## 📸 Capturas de Pantalla

_[Aquí puedes agregar capturas de pantalla de tu aplicación]_

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Si encuentras algún error o tienes sugerencias de mejora:

1. Haz un Fork del proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

## 👨‍💻 Autor

**DeartDev**

## 📚 Recursos Adicionales

Para profundizar en Flutter y Dart:

- 📖 [Documentación oficial de Flutter](https://docs.flutter.dev/)
- 🍳 [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- 🎯 [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- 🎨 [Material 3 Design](https://m3.material.io/)
- 📦 [Pub.dev - Paquetes de Dart](https://pub.dev/)

---

⭐ Si este proyecto te ha sido útil para aprender Flutter, no olvides darle una estrella

Hecho con ❤️ para la comunidad Flutter hispanohablante
