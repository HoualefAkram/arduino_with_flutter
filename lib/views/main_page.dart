import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfc_sgc/helpers/loading/loading_screen.dart';
import 'package:pfc_sgc/logic/ConnectivityCubit/connectivity_cubit.dart';
import 'package:pfc_sgc/utilities/dialogs/app_info_dialog.dart';
import 'package:pfc_sgc/views/connected_view.dart';
import 'package:pfc_sgc/views/disconnected_view.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    context.read<ConnectivityCubit>().initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BlocConsumer<ConnectivityCubit, ConnectivityState>(
              listener: (context, state) {
                if (state.isLoading) {
                  LoadingScreen()
                      .show(context: context, text: "connexion en cours");
                } else {
                  LoadingScreen().hide();
                }
              },
              builder: (context, connectivityState) {
                if (connectivityState is ConnectivityStateDisconnected) {
                  return const DisconnectedView();
                } else if (connectivityState is ConnectivityStateConnected) {
                  return const ConnectedView();
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.all(8),
              child: FloatingActionButton(
                mini: true,
                tooltip: "info",
                onPressed: () {
                  showAppInfoDialog(context);
                },
                child: const Icon(
                  Icons.help_outline_sharp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
