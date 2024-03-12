import 'package:pfc_sgc/enums/amplifier_circuit.dart';

class AmplifierImage {
  static const String _weinAOP = "assets/images/circuits/weinAOP.png";
  static const String _colpittsAOP = "assets/images/circuits/colpittsAOP.png";
  static const String _colpittsTransistor =
      "assets/images/circuits/colpittsTransistor.png";

  static String getImage(AmplifierCircuit amplifierCircuit) {
    switch (amplifierCircuit) {
      case AmplifierCircuit.weinAOP:
        return _weinAOP;
      case AmplifierCircuit.colpittsAOP:
        return _colpittsAOP;
      case AmplifierCircuit.colpittsTransistor:
        return _colpittsTransistor;
    }
  }
}
