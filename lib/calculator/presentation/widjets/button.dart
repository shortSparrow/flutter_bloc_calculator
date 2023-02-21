// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calclulator/calculator/logic/bloc/calculator_bloc.dart';
import 'package:calclulator/calculator/presentation/models/button.dart';

class Button extends StatelessWidget {
  final dynamic button;
  const Button({
    super.key,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          final calculator = context.read<CalculatorBloc>();
    
          if (button is NumberButton) {
            final currentButton = (button as NumberButton);
            return ButtonWrapper(
              size: currentButton.size,
              child: FloatingActionButton.extended(
                onPressed: () => calculator.add(PressedNumber(currentButton.value)),
                label: Text(currentButton.value.toString()),
              ),
            );
          }
    
          if (button is CalculationOperationButton) {
            final currentButton = (button as CalculationOperationButton);
            return ButtonWrapper(
              size: currentButton.size,
              child: FloatingActionButton.extended(
                onPressed: () =>
                    calculator.add(PressedCalculationOperation(operation: currentButton.operationSymbol)),
                label: Text(currentButton.operationSymbol.name),
              ),
            );
          }
    
          if (button is OperationButton) {
            final currentButton = (button as OperationButton);
            return ButtonWrapper(
              size: currentButton.size,
              child: FloatingActionButton.extended(
                onPressed: () => calculator
                    .add(PressedOperation(operation: currentButton.operation)),
                label: Text(currentButton.value),
              ),
            );
          }
    
          if (button is SpecialSymbolButton) {
            final currentButton = (button as SpecialSymbolButton);
    
            return ButtonWrapper(
              size: currentButton.size,
              child: FloatingActionButton.extended(
                onPressed: () =>
                    calculator.add(PressedSymbol(symbol: currentButton.value)),
                label: Text(currentButton.srtValue),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class ButtonWrapper extends StatelessWidget {
  final ButtonSize size;
  final Widget? child;

  const ButtonWrapper({
    Key? key,
    required this.size,
    this.child,
  }) : super(key: key);

  double _getButtonWidth() {
    switch (size) {
      case ButtonSize.one:
        return 50;
      case ButtonSize.two:
        return 100;

      default:
        return 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getButtonWidth(),
      height: 50,
      child: child,
    );
  }
}
