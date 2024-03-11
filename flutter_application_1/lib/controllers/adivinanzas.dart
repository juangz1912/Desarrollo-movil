import 'dart:io';
import 'dart:math';

class Adivinanza {
  String pregunta;
  String respuesta;

  Adivinanza(this.pregunta, this.respuesta);
}

Adivinanza generarAdivinanza() {
  List<Adivinanza> adivinanzas = [
    Adivinanza("¿Qué cosa es que cuanto más le quitas más grande es?", "Un agujero"),
    Adivinanza("¿Qué es lo que se hace de noche, que no se puede hacer de día?", "Trasnocharse"),
    Adivinanza("Van siempre en la sopa, pero nunca has de comerlos.", "El plato y la cuchara"),
    Adivinanza("No muerde ni ladra, pero tiene dientes y la casa guarda. ¿Qué es?", "La llave"),
  ];

  Random random = Random();
  int index = random.nextInt(adivinanzas.length);

  return adivinanzas[index];
}

String pedirRespuesta() {
  stdout.write("Tu respuesta: ");
  return stdin.readLineSync()!.trim();
}

bool evaluarRespuesta(String respuestaUsuario, Adivinanza adivinanza) {
  return respuestaUsuario.toLowerCase() == adivinanza.respuesta.toLowerCase();
}

void main() {
  try {
    Adivinanza adivinanza = generarAdivinanza();
    
    print("Adivinanza: ${adivinanza.pregunta}");

    String respuestaUsuario = pedirRespuesta();

    if (evaluarRespuesta(respuestaUsuario, adivinanza)) {
      print("¡Correcto! Has adivinado la respuesta.");
    } else {
      print("Incorrecto. La respuesta correcta es: ${adivinanza.respuesta}");
    }
  } catch (e) {
    print("Ocurrió un error: $e");
  }
}
