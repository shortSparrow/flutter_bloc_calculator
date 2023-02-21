import 'package:calclulator/calculator/logic/bloc/calculator_bloc.dart';
import 'package:calclulator/calculator/presentation/widjets/buttons.dart';
import 'package:calclulator/calculator/presentation/widjets/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalculatorBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Field(),
            Buttons(),
          ],
        ),
      ),
    );
  }
}
