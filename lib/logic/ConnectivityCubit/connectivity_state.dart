part of 'connectivity_cubit.dart';

class ConnectivityState {}

class ConnectivityStateUninitialized extends ConnectivityState {}

class ConnectivityStateConnected extends ConnectivityState {
  final AmplifierCircuit amplifierCircuit;

  ConnectivityStateConnected({required this.amplifierCircuit});
}

class ConnectivityStateDisconnected extends ConnectivityState {}
