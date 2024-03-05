import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfc_sgc/enums/amplifier_circuit.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityStateUninitialized());

  Future<void> initialize() async {
    // TODO: check if app is connected

    // TODO: check selected type

    // Initialize
    emit(
      ConnectivityStateDisconnected(),
    );
  }

  Future<void> connect() async {}

  Future<void> changeCircuit({
    required AmplifierCircuit amplifierCircuit,
  }) async {
    // TODO: Change circuit

    // TODO: emit new state
    emit(ConnectivityStateConnected(
      amplifierCircuit: amplifierCircuit,
    ));
  }
}
