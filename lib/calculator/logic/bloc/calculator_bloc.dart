import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  String firstNum = '';
  String secondNum = '';
  CalculationOperations? calculationOperation;

  String get expression {
    final operationValue =
        calculationOperation != null ? calculationOperation!.name : '';

    return '$firstNum $operationValue $secondNum';
  }

  CalculatorBloc() : super(const CalculationExpression('')) {
    on<PressedNumber>(_handlePressNumber);
    on<PressedCalculationOperation>(_handlePressCalculationOperation);
    on<PressedOperation>(_handlePressOperation);
    on<PressedSymbol>(_handlePressSymbol);
  }

  void _handlePressNumber(PressedNumber event, Emitter<CalculatorState> emit) {
    _setNumbers(event.number);
    emit(CalculationExpression(expression));
  }

  void _handlePressCalculationOperation(
      PressedCalculationOperation event, Emitter<CalculatorState> emit) {
    calculationOperation = event.operation;
    emit(CalculationExpression(expression));
  }

  void _handlePressOperation(
      PressedOperation event, Emitter<CalculatorState> emit) {
    switch (event.operation) {
      case Operations.equals:
        _handleCalculate();
        break;
      case Operations.delete:
        _handleDeleteOneCharacter();
        break;
      case Operations.deleteAll:
        _handleDeleteAll();
        break;
    }
  }

  void _handleCalculate() {
    num result = 0;
    switch (calculationOperation) {
      case CalculationOperations.multiple:
        result = double.parse(firstNum) + double.parse(secondNum);
        break;
      case CalculationOperations.divide:
        result = double.parse(firstNum) / double.parse(secondNum);
        break;
      case CalculationOperations.plus:
        result = double.parse(firstNum) + double.parse(secondNum);
        break;
      case CalculationOperations.minus:
        result = double.parse(firstNum) - double.parse(secondNum);
        break;
      default:
        break;
    }

    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    final parsedResult = result.toString().replaceAll(regex, '');

    firstNum = parsedResult;
    calculationOperation = null;
    secondNum = '';
    emit(CalculationResult(parsedResult));
  }

  void _handleDeleteOneCharacter() {
    if (secondNum.isNotEmpty) {
      secondNum = secondNum.substring(0, secondNum.length - 1);
    } else if (calculationOperation != null) {
      calculationOperation = null;
    } else if (firstNum.isNotEmpty) {
      firstNum = firstNum.substring(0, firstNum.length - 1);
    }
    emit(CalculationExpression(expression));
  }

  void _handleDeleteAll() {
    firstNum = '';
    secondNum = '';
    calculationOperation = null;
    emit(CalculationExpression(expression));
  }

  void _handlePressSymbol(PressedSymbol event, Emitter<CalculatorState> emit) {
    switch (event.symbol) {
      case Symbols.point:
        if (!firstNum.contains(event.symbol.name) ||
            (calculationOperation != null &&
                !secondNum.contains(event.symbol.name))) {
          _setNumbers(event.symbol.name);
        }
        break;
    }
    emit(CalculationExpression(expression));
  }

  void _setNumbers(dynamic value) {
    if (calculationOperation == null) {
      firstNum = firstNum + value.toString();
    } else {
      secondNum = secondNum + value.toString();
    }
  }
}
