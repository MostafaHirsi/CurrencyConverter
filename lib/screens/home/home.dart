import 'package:currency_converter/blocs/home/home_bloc.dart';
import 'package:currency_converter/modals/currencies_list.dart';
import 'package:currency_converter/modals/quotes.dart';
import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/models/exchange_rate/exchange_rate.dart';
import 'package:currency_converter/models/quote/quote.dart';
import 'package:currency_converter/screens/home/app_bar.dart';
import 'package:currency_converter/utils/colors.dart';
import 'package:currency_converter/utils/debouncer.dart';
import 'package:currency_converter/utils/string_to_double.dart';
import 'package:currency_converter/widgets/currency_button.dart';
import 'package:currency_converter/widgets/flip_button.dart';
import 'package:currency_converter/widgets/number_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = BlocProvider.of(context);
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: homeBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: HomeAppBar(),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.history),
            onPressed: () async {
              Quote? quote = await showModalBottomSheet<Quote?>(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                showDragHandle: true,
                builder: (context) => const QuotesModal(),
              );
              if (quote != null) {
                Currency baseCurrency = homeBloc.currencies.firstWhere(
                    (currency) => currency.code == quote.baseCurrencyCode);
                Currency targetCurrency = homeBloc.currencies.firstWhere(
                    (currency) => currency.code == quote.targetCurrencyCode);
                homeBloc.add(ChangeCurrency(
                    baseCurrency: baseCurrency,
                    targetCurrency: targetCurrency));
              }
            },
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCurrencyButton(context, homeBloc),
                buildNumberInput(homeBloc),
                buildDivider(homeBloc),
                buildCurrencyButton(context, homeBloc, isBase: false),
                buildNumberInput(homeBloc, isBaseInput: false),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }

  NumberInput buildNumberInput(HomeBloc homeBloc, {bool isBaseInput = true}) {
    HomeState state = homeBloc.state;
    Currency currency = isBaseInput ? state.baseCurrency : state.targetCurrency;
    double value = isBaseInput ? state.baseValue : state.targetValue;
    return NumberInput(
      symbol: currency.symbolNative,
      onChanged: (value) {
        _debouncer.run(
          () => homeBloc.add(
            ConvertCurrency(
              baseCurrency: state.baseCurrency,
              targetCurrency: state.targetCurrency,
              baseValue: stringToDouble(value),
            ),
          ),
        );
      },
      value: value,
      enabled: isBaseInput,
    );
  }

  Container buildDivider(HomeBloc homeBloc) {
    HomeState state = homeBloc.state;
    return Container(
      margin: const EdgeInsets.only(
        bottom: 24,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Divider(),
          FlipButton(
            onPress: () {
              homeBloc.add(
                FlipCurrency(
                  state.baseValue,
                  state.targetValue,
                  baseCurrency: state.baseCurrency,
                  targetCurrency: state.targetCurrency,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  CurrencyButton buildCurrencyButton(BuildContext context, HomeBloc homeBloc,
      {bool isBase = true}) {
    HomeState state = homeBloc.state;
    return CurrencyButton(
      currency: isBase ? state.baseCurrency : state.targetCurrency,
      onPress: () async {
        Currency? selectedCurrency = await showModalBottomSheet<Currency?>(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          showDragHandle: true,
          builder: (context) => CurrenciesListModal(
            currencies: homeBloc.currencies,
          ),
        );
        if (selectedCurrency != null) {
          homeBloc.add(
            ChangeCurrency(
              baseCurrency: isBase ? selectedCurrency : state.baseCurrency,
              targetCurrency: isBase ? state.targetCurrency : selectedCurrency,
            ),
          );
        }
      },
    );
  }
}
