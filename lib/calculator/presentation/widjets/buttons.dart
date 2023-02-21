import 'package:calclulator/calculator/logic/bloc/calculator_bloc.dart';
import 'package:calclulator/calculator/presentation/widjets/button.dart';
import 'package:flutter/material.dart';

import '../models/button.dart';

final buttons = [
  [
    OperationButton(
      value: 'AC',
      operation: Operations.deleteAll,
      size: ButtonSize.two,
    ),
    OperationButton(value: 'Del', operation: Operations.delete),
    CalculationOperationButton(operationSymbol: CalculationOperations.divide),
  ],
  [
    NumberButton(value: 1),
    NumberButton(value: 2),
    NumberButton(value: 3),
    CalculationOperationButton(operationSymbol: CalculationOperations.plus),
  ],
  [
    NumberButton(value: 4),
    NumberButton(value: 5),
    NumberButton(value: 6),
    CalculationOperationButton(operationSymbol: CalculationOperations.minus),
  ],
  [
    NumberButton(value: 7),
    NumberButton(value: 8),
    NumberButton(value: 9),
    CalculationOperationButton(operationSymbol: CalculationOperations.multiple),
  ],
  [
    NumberButton(value: 0, size: ButtonSize.two),
    SpecialSymbolButton(value: Symbols.point),
    OperationButton(value: '=', operation: Operations.equals),
  ],
];

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buttons
          .map(
            (buttonRow) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  buttonRow.map((button) => Button(button: button)).toList(),
            ),
          )
          .toList(),
    );
  }
}
