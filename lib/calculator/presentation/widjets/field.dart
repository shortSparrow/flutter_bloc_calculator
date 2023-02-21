import 'package:calclulator/calculator/logic/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Field extends StatelessWidget {
  const Field({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((CalculatorBloc bloc) => bloc.state);

    if (state is CalculationResult) {
      return Text(state.result,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20));
    }
    if (state is CalculationExpression) {
      return Text(
        state.expression,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
      );
    }
    return Container();
  }
}
