import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfc_sgc/logic/ConnectivityCubit/connectivity_cubit.dart';

class ConnectedView extends StatelessWidget {
  const ConnectedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            context.read<ConnectivityCubit>().sendData("1");
          },
          child: const Text("ON"),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<ConnectivityCubit>().sendData("0");
          },
          child: const Text("OFF"),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<ConnectivityCubit>().disconnect();
          },
          child: const Text("Disconnect"),
        ),
      ],
    ));
  }
}
