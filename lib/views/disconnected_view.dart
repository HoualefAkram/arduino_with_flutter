import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:pfc_sgc/logic/ConnectivityCubit/connectivity_cubit.dart';

class DisconnectedView extends StatefulWidget {
  const DisconnectedView({super.key});

  @override
  State<DisconnectedView> createState() => _DisconnectedViewState();
}

class _DisconnectedViewState extends State<DisconnectedView> {
  BluetoothConnection? connection;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              context.read<ConnectivityCubit>().connect();
            },
            child: const Text("connect"),
          ),
        ],
      ),
    );
  }
}
