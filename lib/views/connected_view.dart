import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfc_sgc/constants/images.dart';
import 'package:pfc_sgc/constants/text_style.dart';
import 'package:pfc_sgc/enums/amplifier_circuit.dart';
import 'package:pfc_sgc/logic/ConnectivityCubit/connectivity_cubit.dart';

class ConnectedView extends StatelessWidget {
  const ConnectedView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectivityStateConnected) {
          return Container(
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          context.read<ConnectivityCubit>().changeCircuit(
                                circuit: AmplifierCircuit.weinAOP,
                              ),
                      child: Container(
                        width: size.width * 0.27,
                        height: size.width * 0.27,
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color:
                              state.amplifierCircuit == AmplifierCircuit.weinAOP
                                  ? Colors.blueAccent
                                  : Colors.grey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Wein avec AOP",
                            style: style(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          context.read<ConnectivityCubit>().changeCircuit(
                                circuit: AmplifierCircuit.colpittsAOP,
                              ),
                      child: Container(
                        width: size.width * 0.27,
                        height: size.width * 0.27,
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: state.amplifierCircuit ==
                                  AmplifierCircuit.colpittsAOP
                              ? Colors.blueAccent
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Colpitts avec AOP",
                            style: style(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          context.read<ConnectivityCubit>().changeCircuit(
                                circuit: AmplifierCircuit.colpittsTransistor,
                              ),
                      child: Container(
                        width: size.width * 0.27,
                        height: size.width * 0.27,
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: state.amplifierCircuit ==
                                  AmplifierCircuit.colpittsTransistor
                              ? Colors.blueAccent
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Colpitts avec transistor",
                            style: style(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Schema",
                  style: style(
                    bold: true,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Placeholder(
                  child: Image.asset(
                    AmplifierImage.getImage(state.amplifierCircuit),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
