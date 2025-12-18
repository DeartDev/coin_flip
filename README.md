# Yes No App

Una aplicación Flutter de chat interactivo estilo Yes/No con temas personalizables.

## 📱 Descripción

Yes No App es una aplicación Flutter de chat interactivo que simula conversaciones con un asistente virtual. Implementa un sistema de temas dinámicos utilizando Material 3 y presenta una interfaz de chat moderna con burbujas de mensajes personalizadas y avatar.

## ✨ Características

- 🎨 Sistema de temas personalizables con 8 colores diferentes
- 📱 Diseño Material 3
- 🔄 Selección dinámica de temas
- 💬 Interfaz de chat con burbujas de mensajes estilizadas
- 🤖 Chat con asistente virtual "Anny"
- 🎯 Arquitectura limpia con separación de Screens y Widgets
- 📝 ListView con scroll para múltiples mensajes
- 🎭 Avatar personalizado con imágenes de red
- 🖼️ Soporte para mensajes con imágenes GIF
- 📖 **Código completamente comentado para aprendizaje**

## 🎨 Temas Disponibles

La aplicación incluye 8 esquemas de color:
- Custom Color (0xFF123456)
- Blue
- Red
- Teal
- Orange
- Yellow
- Purple
- Green

## 🚀 Instalación

```bash
# Clonar el repositorio
git clone https://github.com/DeartDev/dart-y-flutter.git

# Navegar al directorio
cd yes_no_app

# Instalar dependencias
flutter pub get

# Ejecutar la aplicación
flutter run
```

## 📦 Dependencias

- Flutter SDK: ^3.5.1
- cupertino_icons: ^1.0.8

## 🏗️ Estructura del Proyecto

```
lib/
├── main.dart                              # Punto de entrada de la aplicación
├── config/
│   └── themes/
│       └── app_theme.dart                 # Configuración de temas
├── domain/
│   └── entities/
│       └── message.dart                   # Entidad de mensaje del dominio
└── presentation/
    ├── Screens/
    │   └── chat/
    │       └── chat_screen.dart           # Pantalla principal de chat
    └── widgets/
        ├── chat/
        │   ├── my_message_bubble.dart     # Burbuja de mensaje del usuario
        │   └── her_message_bubble.dart    # Burbuja de mensaje recibido
        └── shared/
            └── message_field_box.dart     # Campo de entrada de texto
```

## 📚 Guía de Aprendizaje

Este proyecto está completamente comentado como recurso educativo. Cada archivo incluye:

### Comentarios Descriptivos

- **¿Qué hace cada widget?** - Explicación del propósito de cada widget
- **¿Por qué se usa?** - Razones para elegir ese widget específico
- **¿Para qué sirve?** - Casos de uso y funcionalidad

### Widgets Principales Utilizados

| Widget | Ubicación | Propósito |
|--------|-----------|-----------|
| `MaterialApp` | main.dart | Widget raíz que configura la aplicación Material Design |
| `Scaffold` | chat_screen.dart | Estructura básica de la pantalla con AppBar y body |
| `AppBar` | chat_screen.dart | Barra superior con título y avatar |
| `ListView.builder` | chat_screen.dart | Lista optimizada para muchos mensajes |
| `Column` | Burbujas de mensaje | Organiza widgets verticalmente |
| `Container` | Burbujas de mensaje | Contenedor con decoración y estilo |
| `ClipRRect` | her_message_bubble.dart | Recorta imágenes con bordes redondeados |
| `SafeArea` | chat_screen.dart | Evita superposición con áreas del sistema |
| `Expanded` | chat_screen.dart | Expande widgets para llenar espacio disponible |
| `TextFormField` | message_field_box.dart | Campo de texto para entrada de mensajes |
| `TextEditingController` | message_field_box.dart | Controla el contenido del campo de texto |
| `FocusNode` | message_field_box.dart | Gestiona el foco del teclado |

## 💻 Uso

### Cambiar Tema

La aplicación utiliza la clase `AppTheme` para gestionar los temas. Para cambiar el tema, modifica el parámetro `selectColor` en `main.dart`:

```dart
theme: AppTheme(selectColor: 2).theme(), // Cambia el número (0-7)
```

### Componentes Principales

- **Message**: Entidad del dominio que representa un mensaje con texto, imagen opcional y remitente
- **FromWho**: Enumeración que identifica el origen del mensaje (usuario o asistente)
- **ChatScreen**: Pantalla principal que muestra la interfaz de chat con AppBar y ListView
- **MyMessageBubble**: Widget reutilizable para las burbujas de mensajes del usuario
- **HerMessageBubble**: Widget para mensajes recibidos con soporte de imágenes
- **MessageFieldBox**: Campo de entrada de texto con botón de envío y gestión de foco
- **AppTheme**: Sistema de temas que utiliza `colorSchemeSeed` para generar paletas completas

## 🎓 Recursos de Aprendizaje

### Conceptos Flutter Cubiertos

1. **Arquitectura y Modelado de Datos**
   - Separación de capas: domain, presentation
   - Entidades del dominio
   - Enumeraciones (enum) para tipos seguros
   - Clases inmutables con final

2. **StatelessWidget vs StatefulWidget**
   - Cuándo usar cada uno
   - Diferencias en manejo de estado

3. **Layouts en Flutter**
   - Column, Row, Expanded
   - ListView.builder para listas eficientes
   - SafeArea y Padding

4. **Diseño Material**
   - Scaffold y AppBar
   - Material 3 y ThemeData
   - ColorScheme y temas dinámicos

5. **Widgets de Imagen**
   - NetworkImage para cargar desde internet
   - ClipRRect para bordes redondeados
   - BoxFit para ajuste de imágenes

6. **Entrada de Texto y Formularios**
   - TextFormField para entrada de datos
   - TextEditingController para control de texto
   - FocusNode para gestión de teclado
   - InputDecoration para estilizado
   - Callbacks onFieldSubmitted y onTapOutside

7. **Mejores Prácticas**
   - Separación de componentes
   - Widgets privados (_)
   - Organización de carpetas
   - Arquitectura limpia (Clean Architecture)
   - BoxFit para ajuste de imágenes
Entrada de Texto y Formularios**
   - TextFormField para entrada de datos
   - TextEditingController para control de texto
   - FocusNode para gestión de teclado
   - InputDecoration para estilizado
   - Callbacks onFieldSubmitted y onTapOutside

6. **
5. **Mejores Prácticas**
   - Separación de componentes
   - Widgets privados (_)
   - Organización de carpetas

## 🛠️ Tecnologías

- **Flutter**: Framework de desarrollo multiplataforma
- **Material 3**: Sistema de diseño de Google
- **Dart**: Lenguaje de programación

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

## 👨‍💻 Autor

DeartDev

---

Para más información sobre Flutter, visita:
- [Documentación oficial de Flutter](https://docs.flutter.dev/)
- [Cookbook de Flutter](https://docs.flutter.dev/cookbook)
