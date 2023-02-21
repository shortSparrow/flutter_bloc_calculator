import '../../logic/bloc/calculator_bloc.dart';

enum ButtonSize { one, two }

class BaseButton {
  final ButtonSize size;

  BaseButton([ButtonSize? size]) : size = size ?? ButtonSize.one;
}

class NumberButton extends BaseButton {
  final num value;

  NumberButton({required this.value, ButtonSize? size}) : super(size);
}

class CalculationOperationButton extends BaseButton {
  final CalculationOperations operationSymbol;

  CalculationOperationButton({required this.operationSymbol, ButtonSize? size})
      : super(size);
}

class OperationButton extends BaseButton {
  final String value;
  final Operations operation;

  OperationButton(
      {required this.value, required this.operation, ButtonSize? size})
      : super(size);
}

class SpecialSymbolButton extends BaseButton {
  final Symbols value;
  String get srtValue {
    switch (value) {
      case Symbols.point:
        return '.';
      default:
        return '';
    }
  }

  SpecialSymbolButton({required this.value, ButtonSize? size}) : super(size);
}
