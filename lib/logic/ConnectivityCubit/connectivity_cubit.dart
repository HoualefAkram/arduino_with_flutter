import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfc_sgc/enums/amplifier_circuit.dart';
import 'package:pfc_sgc/services/bluetooth_service.dart';
part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit()
      : super(ConnectivityStateUninitialized(
          isLoading: false,
        ));
  final BluetoothService _bluetoothService = BluetoothService();
  Future<void> initialize() async {
    _bluetoothService.startListening();
    _bluetoothService.connectivityStream.listen(
      (bool isConnected) {
        log("connection: $isConnected");
        if (!isConnected) {
          emit(ConnectivityStateDisconnected(
            isLoading: state.isLoading,
          ));
        }
      },
    );
  }

  Future<void> connect({required address}) async {
    try {
      if (_bluetoothService.isConnected) return;
      emit(
        ConnectivityStateDisconnected(
          isLoading: true,
        ),
      );
      final bool connect = await _bluetoothService.connect(address: address);
      log("connect: $connect");
      if (connect) {
        await _bluetoothService.sendData("1");
        emit(
          ConnectivityStateConnected(
            amplifierCircuit: AmplifierCircuit.weinAOP,
            isLoading: false,
          ),
        );
      } else {
        emit(
          ConnectivityStateDisconnected(
            isLoading: false,
          ),
        );
      }
    } catch (_) {
      emit(
        ConnectivityStateDisconnected(
          isLoading: false,
        ),
      );
    }
  }

  Future<void> disconnect() async {
    try {
      await _bluetoothService.disconnect();
    } catch (_) {}
  }

  String circuitName(AmplifierCircuit circuit) {
    switch (circuit) {
      case AmplifierCircuit.weinAOP:
        return "Wein avec AOP";
      case AmplifierCircuit.colpittsAOP:
        return "Colpitts avec AOP";
      case AmplifierCircuit.colpittsTransistor:
        return "Colpitts avec transistor";
    }
  }

  Future<void> changeCircuit({
    required AmplifierCircuit circuit,
  }) async {
    try {
      switch (circuit) {
        case AmplifierCircuit.weinAOP:
          await _bluetoothService.sendData("1");
          break;

        case AmplifierCircuit.colpittsAOP:
          await _bluetoothService.sendData("2");
          break;

        case AmplifierCircuit.colpittsTransistor:
          await _bluetoothService.sendData("3");
          break;
      }
      //  emit new state
      emit(
        ConnectivityStateConnected(
          amplifierCircuit: circuit,
          isLoading: state.isLoading,
        ),
      );
    } catch (_) {}
  }
}
