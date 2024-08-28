import 'package:flutter/material.dart'; // Importa el paquete de Flutter que contiene widgets y temas de Material Design.
import 'package:calculadora/Screens/Calculadora.dart'; // Importa el archivo que contiene la pantalla de la calculadora.

void main() {
  runApp(
      const CalculadoraApp()); // La función `main` es el punto de entrada de la aplicación. Ejecuta la aplicación llamando a `CalculadoraApp`.
}

class CalculadoraApp extends StatelessWidget {
  // Define una clase `CalculadoraApp` que extiende `StatelessWidget`, lo que significa que esta es una clase inmutable (su estado no cambia).
  const CalculadoraApp(
      {super.key}); // Constructor de la clase `CalculadoraApp`. `super.key` pasa la clave al constructor de la clase base `StatelessWidget`.

  @override
  Widget build(BuildContext context) {
    // El método `build` describe cómo construir el widget en términos de otros widgets más bajos.
    return MaterialApp(
      // `MaterialApp` es un widget de Flutter que configura la aplicación con un estilo visual basado en Material Design.
      title:
          'Calculadora', // Título de la aplicación, se puede usar en varios contextos, como en la barra de tareas.
      home:
          const Calculadora(), // `home` especifica el widget principal que se mostrará cuando la aplicación se inicie, en este caso, el widget `Calculadora`.
      theme: ThemeData.dark().copyWith(
        // Configura el tema de la aplicación. `ThemeData.dark()` establece un tema oscuro como base, y `copyWith` se usa para sobrescribir configuraciones específicas.
        scaffoldBackgroundColor: Colors
            .black, // Establece el color de fondo del scaffold (la estructura básica de la interfaz de usuario) a negro.
        textTheme: const TextTheme(
            // Configura el tema de texto. En este caso, está comentado, pero puede ser usado para definir el estilo del texto.
            //  bodyText2: TextStyle(color: Colors.white), // Ejemplo de cómo se podría personalizar el color del texto en la aplicación.
            ),
      ),
    );
  }
}
