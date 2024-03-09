import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfc_sgc/enums/amplifier_circuit.dart';
import 'package:pfc_sgc/services/bluetooth_service.dart';
part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityStateUninitialized());
  final BluetoothService bluetoothService = BluetoothService();
  Future<void> initialize() async {
    emit(
      ConnectivityStateDisconnected(),
    );
  }

  Future<void> connect() async {
    if (bluetoothService.isConnected) return;
    final bool connect = await bluetoothService.connect();
    log("connect: $connect");
    if (connect) {
      emit(
        ConnectivityStateConnected(
          amplifierCircuit: AmplifierCircuit.weinAOP,
        ),
      );
    }
  }

  Future<void> sendData(String data) async {
    await bluetoothService.sendData(data);
  }

  Future<void> changeCircuit({
    required AmplifierCircuit amplifierCircuit,
  }) async {
    // TODO: Change circuit

    //  emit new state
    emit(
      ConnectivityStateConnected(
        amplifierCircuit: amplifierCircuit,
      ),
    );
  }
}
