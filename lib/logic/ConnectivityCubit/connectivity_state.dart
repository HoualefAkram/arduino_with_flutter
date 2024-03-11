part of 'connectivity_cubit.dart';

class ConnectivityState {
  final bool isLoading;

  ConnectivityState({required this.isLoading});
}

class ConnectivityStateUninitialized extends ConnectivityState {
  ConnectivityStateUninitialized({required super.isLoading});
}

class ConnectivityStateConnected extends ConnectivityState {
  final AmplifierCircuit amplifierCircuit;

  ConnectivityStateConnected({
    required this.amplifierCircuit,
    required super.isLoading,
  });
}

class ConnectivityStateDisconnected extends ConnectivityState {
  ConnectivityStateDisconnected({required super.isLoading});
}
