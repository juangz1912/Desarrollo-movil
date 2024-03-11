import 'dart:io';

void main() {
  var pacientes = [];

  print("Ingrese la cantidad de pacientes: ");
  int cantidadPacientes = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < cantidadPacientes; i++) {
    print("Ingrese el sexo (1. Hombre, 2. Mujer): ");
    int sexo = int.parse(stdin.readLineSync()!);

    print("Ingrese el estado civil (1. Soltero, 2. Casado, 3. Viudo): ");
    int estadoCivil = int.parse(stdin.readLineSync()!);

    print("Ingrese la edad: ");
    int edad = int.parse(stdin.readLineSync()!);

    pacientes.add({'sexo': sexo, 'estadoCivil': estadoCivil, 'edad': edad});
  }

  var hombres = pacientes.where((p) => p['sexo'] == 1);
  var solteros = pacientes.where((p) => p['estadoCivil'] == 1);
  var hombresSolteros = hombres.where((p) => p['estadoCivil'] == 1);
  var hombresCasados = hombres.where((p) => p['estadoCivil'] == 2);
  var mujeresSolteras = solteros.where((p) => p['sexo'] == 2);

  double porcentajeHombresSolteros = (hombresSolteros.length / hombres.length) * 100;
  double edadPromedioHombresCasados = hombresCasados.isNotEmpty ? hombresCasados.map((p) => p['edad']).reduce((a, b) => a + b) / hombresCasados.length : 0;
  double porcentajeMujeresSolteras = (mujeresSolteras.length / solteros.length) * 100;

  print("\nResultados:");
  print("Porcentaje de hombres solteros: $porcentajeHombresSolteros%");
  print("Edad promedio de hombres casados: $edadPromedioHombresCasados años");
  print("Porcentaje de mujeres solteras: $porcentajeMujeresSolteras%");
}
