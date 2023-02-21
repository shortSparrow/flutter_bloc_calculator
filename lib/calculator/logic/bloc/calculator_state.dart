part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object> get props => [];
}

class CalculationExpression extends CalculatorState {
  final String expression;

  const CalculationExpression(this.expression);

  @override
  String toString() => 'CalculationExpression(expression: $expression)';

  @override
  List<Object> get props => [expression];
}

class CalculationResult extends CalculatorState {
  final String result;

  const CalculationResult(this.result);

  @override
  String toString() => 'CalculationResult(result: $result)';

  @override
  List<Object> get props => [result];
}
