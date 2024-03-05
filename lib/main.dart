import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfc_sgc/logic/ConnectivityCubit/connectivity_cubit.dart';
import 'package:pfc_sgc/views/main_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ConnectivityCubit(),
      child: MaterialApp(
        title: 'PFC SGC',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true,
        ),
        home: const Main(),
      ),
    ),
  );
}
