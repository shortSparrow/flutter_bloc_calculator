// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'calculator_bloc.dart';

enum Operations { equals, delete, deleteAll }

enum Symbols { point }

extension SymbolsExtension on Symbols {
  String get name {
    switch (this) {
      case Symbols.point:
        return '.';
    }
  }
}

enum CalculationOperations { multiple, divide, plus, minus }

extension CalculationOperationsExtension on CalculationOperations {
  String get name {
    switch (this) {
      case CalculationOperations.multiple:
        return '*';
      case CalculationOperations.divide:
        return '/';
      case CalculationOperations.plus:
        return '+';
      case CalculationOperations.minus:
        return '-';
    }
  }
}

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class PressedNumber extends CalculatorEvent {
  final num number;

  const PressedNumber(this.number);
}

class PressedCalculationOperation extends CalculatorEvent {
  final CalculationOperations operation;

  const PressedCalculationOperation({
    required this.operation,
  });
}

class PressedOperation extends CalculatorEvent {
  final Operations operation;

  const PressedOperation({
    required this.operation,
  });
}

class PressedSymbol extends CalculatorEvent {
  final Symbols symbol;

  const PressedSymbol({required this.symbol});
}
