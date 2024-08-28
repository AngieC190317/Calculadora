import 'package:flutter/material.dart'; // Importa el paquete de Flutter para usar widgets de Material Design.

class Calculadora extends StatefulWidget {
  // Declara la clase `Calculadora` que extiende `StatefulWidget`, lo que indica que esta pantalla tendrá un estado mutable.
  const Calculadora(
      {super.key}); // Constructor de la clase `Calculadora`, utiliza `super.key` para pasar la clave al widget base.

  @override
  State<Calculadora> createState() => _CalculadoraState();
  // Crea una instancia del estado `_CalculadoraState` que controla la lógica de la interfaz de usuario y la funcionalidad de la calculadora.
}

class _CalculadoraState extends State<Calculadora> {
  // Define la clase `_CalculadoraState` que maneja el estado de la calculadora.

  String output =
      "0"; // Variable que almacena el valor que se muestra en la pantalla de la calculadora.
  String _output =
      "0"; // Variable interna que se usa para realizar cálculos y actualizar `output`.
  int num1 = 0; // Almacena el primer número ingresado para la operación.
  int num2 = 0; // Almacena el segundo número ingresado para la operación.
  String operand = ""; // Almacena el operador actual (+, -, *, /).

  // Función que maneja la lógica cuando se presiona un botón.
  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      // Si el botón presionado es "C", reinicia la calculadora.
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "÷" ||
        buttonText == "x") {
      // Si se presiona un operador (+, -, *, /), guarda el primer número y el operador.
      num1 = int.parse(output); // Convierte el texto en un número entero.
      operand = buttonText; // Guarda el operador presionado.
      // _output = "0"; // Reinicia la pantalla para ingresar el segundo número.
      _output = "$output $operand "; // Muestra el primer número y el operador
    } else if (buttonText == "=") {
      // Si se presiona "=", realiza la operación aritmética correspondiente.
      //num2 = int.parse(output); // Convierte el segundo número ingresado.
      num2 = int.parse(output
          .split(" ")
          .last); // Toma el segundo número después del operador
      if (operand == "+") {
        _output = (num1 + num2).toString(); // Realiza la suma.
      } else if (operand == "-") {
        _output = (num1 - num2).toString(); // Realiza la resta.
      } else if (operand == "x") {
        _output = (num1 * num2).toString(); // Realiza la multiplicación.
      } else if (operand == "÷") {
        _output = (num1 ~/ num2).toString();
        // Realiza la división entera para mantener el resultado como un entero.
      }
      // Reinicia las variables para la siguiente operación.
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      // Si se presiona un número, lo agrega al valor actual.
      _output = _output == "0" ? buttonText : _output + buttonText;
    }

    setState(() {
      output =
          _output; // Actualiza la pantalla de la calculadora con el nuevo valor.
    });
  }

  // Función que construye un botón de la calculadora.
  Widget buildButton(String buttonText,
      {Color color = const Color.fromARGB(255, 61, 58, 58)}) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0), // Espacio alrededor de cada botón
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(23.0), // Configura el tamaño del botón.
          backgroundColor: color, // Configura el color de fondo del botón.
        ),
        child: Text(
          buttonText, // Muestra el texto del botón (número u operador).
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          // Configura el estilo del texto (tamaño y grosor).
        ),
        onPressed: () => buttonPressed(
            buttonText), // Llama a `buttonPressed` cuando se presiona el botón.
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // El método `build` construye la interfaz de la calculadora.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Calculadora"), // Título en la barra superior de la calculadora.
        backgroundColor:
            Colors.black, // Color de fondo de la barra de la aplicación.
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment
                .centerRight, // Alinea el texto de la pantalla a la derecha.
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
            // Configura el espaciado interno del contenedor de la pantalla.
            child: Text(
              output, // Muestra el valor actual de `output`.
              style: const TextStyle(
                  fontSize: 50.0, color: Color.fromARGB(255, 245, 243, 243)),
              // Estilo del texto en la pantalla (tamaño grande y color blanco).
            ),
          ),
          const Expanded(
            child:
                Divider(), // Añade una línea divisoria para separar la pantalla de los botones.
          ),
          // Columnas y filas que organizan los botones de la calculadora.
          Column(
            children: [
              Row(
                children: <Widget>[
                  buildButton("AC", color: Colors.grey),
                  buildButton("+/-", color: Colors.grey),
                  buildButton("%", color: Colors.grey),
                  buildButton("÷",
                      color: Colors
                          .orange), // Botón de la división con color naranja.
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("7"), // Botón del número 7.
                  buildButton("8"), // Botón del número 8.
                  buildButton("9"), // Botón del número 9.
                  buildButton("x",
                      color: Colors
                          .orange), // Botón de la división con color naranja.
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4"), // Botón del número 4.
                  buildButton("5"), // Botón del número 5.
                  buildButton("6"), // Botón del número 6.
                  buildButton("-",
                      color: Colors
                          .orange), // Botón de la multiplicación con color naranja.
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1"), // Botón del número 1.
                  buildButton("2"), // Botón del número 2.
                  buildButton("3"), // Botón del número 3.
                  buildButton("+",
                      color: Colors
                          .orange), // Botón de la resta con color naranja.
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2, // Este botón ocupará el doble de espacio.
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(23.0),
                          backgroundColor:
                              const Color.fromARGB(255, 61, 58, 58),
                        ),
                        child: const Text(
                          "0",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => buttonPressed("0"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(23.0),
                          backgroundColor:
                              const Color.fromARGB(255, 61, 58, 58),
                        ),
                        child: const Text(
                          ",",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => buttonPressed(","),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(23.0),
                          backgroundColor: Colors.orange,
                        ),
                        child: const Text(
                          "=",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => buttonPressed("="),
                      ),
                    ),
                  ), // Botón de la suma con color naranja.
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
