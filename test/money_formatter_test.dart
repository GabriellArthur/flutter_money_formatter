// import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:money_formatter/money_formatter.dart';

void main() {
  group('MoneyFormatter', () {
    test('constructor sets amount and settings', () {
      final formatter =
          MoneyFormatter(amount: 100.0, settings: MoneyFormatterSettings(symbol: 'USD'));
      expect(formatter.amount, 100.0);
      expect(formatter.settings?.symbol, 'USD');
    });

    test('fastCalc performs addition', () {
      final formatter = MoneyFormatter(amount: 100.0);
      formatter.fastCalc(type: FastCalcType.addition, amount: 50.0);
      expect(formatter.amount, 150.0);
    });

    test('fastCalc performs substraction', () {
      final formatter = MoneyFormatter(amount: 100.0);
      formatter.fastCalc(type: FastCalcType.substraction, amount: 50.0);
      expect(formatter.amount, 50.0);
    });

    test('compactSymbolOnLeft returns compact format number without currency symbol', () {
      final formatter = MoneyFormatter(
          amount: 1234.482374827384723, settings: MoneyFormatterSettings(symbol: 'USD'));
      final compactNonSymbol = formatter.output.compactSymbolOnLeft;
      expect(compactNonSymbol, 'USD 1.23K'); // assuming the compact format for 1000000 is '1M'
    });

    test('copyWith creates a new instance with updated values', () {
      final formatter =
          MoneyFormatter(amount: 100.0, settings: MoneyFormatterSettings(symbol: 'USD'));
      final copiedFormatter = formatter.copyWith(amount: 200.0, symbol: 'EUR');
      expect(copiedFormatter.amount, 200.0);
      expect(copiedFormatter.settings?.symbol, 'EUR');
      expect(formatter.amount, 100.0); // original instance is not modified
      expect(formatter.settings?.symbol, 'USD');
    });
  });
}
