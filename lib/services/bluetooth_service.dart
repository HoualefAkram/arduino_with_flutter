import 'dart:async';
import 'dart:convert';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothService {
  BluetoothConnection? _bluetoothConnection;
  bool get isConnected => _bluetoothConnection?.isConnected ?? false;
  final StreamController<bool> _streamController = StreamController<bool>();
  Stream<bool> get connectivityStream => _streamController.stream;

  Future<bool> connect({required String address}) async {
    _bluetoothConnection = await BluetoothConnection.toAddress(address);
    final bool isConnected = _bluetoothConnection?.isConnected ?? false;
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

  Future<void> startListening() async {
    while (true) {
      final bool isConnected = _bluetoothConnection?.isConnected ?? false;
      _streamController.add(isConnected);
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
