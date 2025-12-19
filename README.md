# Yes No App 💬

Una aplicación Flutter de chat interactivo con temas personalizables y arquitectura limpia, ideal para aprender desarrollo Flutter.

## 📱 Descripción

Yes No App es una aplicación Flutter de chat interactivo que simula conversaciones con un asistente virtual. Implementa un sistema de temas dinámicos utilizando Material 3, gestión de estado con Provider, y presenta una interfaz de chat moderna con burbujas de mensajes personalizadas y avatares.

## ✨ Características

- 🎨 Sistema de temas personalizables con 8 esquemas de color diferentes
- 📱 Diseño Material 3 moderno
- 🔄 Gestión de estado con Provider
- 💬 Interfaz de chat con burbujas de mensajes estilizadas
- 🤖 Chat interactivo con asistente virtual "Anny"
- 🏗️ Arquitectura limpia con separación de capas (domain, presentation)
- 📝 ListView.builder optimizado para múltiples mensajes
- 🎭 Avatar personalizado con imágenes de red
- 🖼️ Soporte para mensajes con imágenes GIF
- ⌨️ Control de foco del teclado y entrada de texto
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
cd yes_no_app

# Instalar dependencias
flutter pub get

# Ejecutar la aplicación
flutter run
```

## 📦 Dependencias

- **Flutter SDK**: ^3.5.1
- **cupertino_icons**: ^1.0.8 - Iconos estilo iOS
- **provider**: ^6.1.5+1 - Gestión de estado

## 🏗️ Estructura del Proyecto

```
lib/
├── main.dart                              # Punto de entrada de la aplicación
├── config/
│   └── themes/
│       └── app_theme.dart                 # Configuración de temas personalizados
├── domain/
│   └── entities/
│       └── message.dart                   # Entidad Message y enum FromWho
└── presentation/
    ├── providers/
    │   └── chat_provider.dart             # Provider para gestión de estado del chat
    ├── Screens/
    │   └── chat/
    │       └── chat_screen.dart           # Pantalla principal de chat
    └── widgets/
        ├── chat/
        │   ├── my_message_bubble.dart     # Burbuja de mensaje del usuario
        │   └── her_message_bubble.dart    # Burbuja de mensaje recibido con imagen
        └── shared/
            └── message_field_box.dart     # Campo de entrada de texto con control de foco
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

### Enviar Mensajes

1. Escribe tu mensaje en el campo de texto en la parte inferior
2. Presiona Enter o el botón de envío
3. El mensaje aparecerá en la burbuja azul (usuario)
4. Los mensajes de respuesta aparecerán en burbujas grises con avatar

### Cambiar Tema

Para cambiar el tema de la aplicación, modifica el parámetro `selectColor` en [main.dart](lib/main.dart):

```dart
theme: AppTheme(selectColor: 2).theme(), // Cambia el número (0-7)
```

### Componentes Principales

| Componente | Descripción |
|------------|-------------|
| **Message** | Entidad del dominio que representa un mensaje con texto, imagen opcional y remitente |
| **FromWho** | Enumeración que identifica el origen del mensaje (`me` o `hers`) |
| **ChatProvider** | Provider que gestiona el estado y la lista de mensajes |
| **ChatScreen** | Pantalla principal con AppBar, ListView y campo de entrada |
| **MyMessageBubble** | Widget para burbujas de mensajes del usuario (azules) |
| **HerMessageBubble** | Widget para mensajes recibidos con soporte de imágenes |
| **MessageFieldBox** | Campo de entrada con gestión de foco y validación |
| **AppTheme** | Sistema de temas con `colorSchemeSeed` para paletas completas |

## 🎓 Recursos de Aprendizaje

### Conceptos Flutter Cubiertos

#### 1. **Arquitectura y Gestión de Estado**
   - Separación en capas: domain, config, presentation
   - Entidades del dominio (Message)
   - Enumeraciones (enum) para tipos seguros (FromWho)
   - Provider para gestión de estado reactivo
   - ChangeNotifier y notifyListeners()
   - Clases inmutables con final

#### 2. **StatelessWidget vs StatefulWidget**
   - Diferencias conceptuales y de rendimiento
   - Cuándo usar cada uno
   - Ciclo de vida de StatefulWidget
   - Gestión de estado local

#### 3. **Layouts en Flutter**
   - Column y Row para organización
   - Expanded y Flexible para distribución de espacio
   - ListView.builder para listas eficientes y optimizadas
   - SafeArea para evitar zonas del sistema
   - Padding y margin para espaciado

#### 4. **Material Design 3**
   - Scaffold como estructura base
   - AppBar personalizada con avatar
   - ThemeData y ColorScheme
   - ColorSchemeSeed para paletas automáticas
   - Componentes Material adaptables

#### 5. **Widgets de Imagen**
   - NetworkImage para cargar desde internet
   - ClipRRect para bordes redondeados
   - BoxFit para ajuste responsivo
   - Manejo de carga asíncrona de imágenes

#### 6. **Entrada de Texto y Formularios**
   - TextFormField para entrada de datos
   - TextEditingController para control programático
   - FocusNode para gestión del teclado
   - InputDecoration para estilizado personalizado
   - Callbacks: onFieldSubmitted, onTapOutside
   - Validación de entrada

#### 7. **Mejores Prácticas**
   - Separación de responsabilidades
   - Widgets privados con prefijo (_)
   - Organización modular de carpetas
   - Arquitectura limpia (Clean Architecture)
   - Reutilización de componentes
   - Comentarios descriptivos y educativos

## 🛠️ Tecnologías

- **Flutter** ^3.5.1 - Framework de desarrollo multiplataforma
- **Dart** - Lenguaje de programación orientado a objetos
- **Material 3** - Sistema de diseño de Google
- **Provider** - Solución de gestión de estado recomendada por Flutter

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
