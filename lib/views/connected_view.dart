import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfc_sgc/enums/amplifier_circuit.dart';
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
            context
                .read<ConnectivityCubit>()
                .changeCircuit(amplifierCircuit: AmplifierCircuit.weinAOP);
          },
          child: const Text("weinAOP"),
        ),
        ElevatedButton(
          onPressed: () async {
            context
                .read<ConnectivityCubit>()
                .changeCircuit(amplifierCircuit: AmplifierCircuit.colpittsAOP);
          },
          child: const Text("colpittsAOP"),
        ),
        ElevatedButton(
          onPressed: () async {
            context.read<ConnectivityCubit>().changeCircuit(
                  amplifierCircuit: AmplifierCircuit.colpittsTransistor,
                );
          },
          child: const Text("colpittsTransistor"),
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
