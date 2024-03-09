import 'dart:convert';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothService {
  BluetoothConnection? _bluetoothConnection;
  bool get isConnected => _bluetoothConnection?.isConnected ?? false;

  Future<bool> connect() async {
    _bluetoothConnection =
        await BluetoothConnection.toAddress("98:DA:50:02:45:71");
    if (isConnected) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> disconnect() async {
    if (_bluetoothConnection == null) return;
    await _bluetoothConnection!.finish();
  }

  Future<void> sendData(String data) async {
    if (_bluetoothConnection == null) return;
    _bluetoothConnection!.output.add(ascii.encode(data));
  }
}
