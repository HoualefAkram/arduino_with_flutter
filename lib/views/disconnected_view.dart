import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:pfc_sgc/constants/text_style.dart';
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
          Text(
            "l'application n'est pas connectée au circuit",
            style: style(
              bold: true,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () => context
                .read<ConnectivityCubit>()
                .connect(address: "98:DA:50:02:45:71"),
            child: const Text("connecter"),
          )
        ],
      ),
    );
  }
}
