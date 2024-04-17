import 'package:currency_converter/blocs/home/home_bloc.dart';
import 'package:currency_converter/modals/currencies_list.dart';
import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/screens/settings.dart';
import 'package:currency_converter/utils/debouncer.dart';
import 'package:currency_converter/utils/string_to_double.dart';
import 'package:currency_converter/widgets/currency_button.dart';
import 'package:currency_converter/widgets/flip_button.dart';
import 'package:currency_converter/widgets/number_input.dart';
import 'package:currency_converter/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';

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
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  GlobalKey<NavigatorState> navigatorKey =
                      Injector.appInstance.get();
                  navigatorKey.currentState!.pushNamed(Settings.routeName);
                },
                icon: const Icon(
                  Icons.settings,
                ),
              )
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: CurrencyButton(
                    currency: state.baseCurrency,
                    onPress: () async {
                      Currency? selectedCurrency =
                          await showModalBottomSheet<Currency?>(
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        builder: (context) => CurrenciesListModal(
                            currencies: homeBloc.currencies),
                      );
                      if (selectedCurrency != null) {
                        homeBloc.add(
                          SwitchCurrency(
                            baseCurrency: selectedCurrency,
                            targetCurrency: state.targetCurrency,
                          ),
                        );
                      }
                    },
                  ),
                ),
                NumberInput(
                  symbol: state.baseCurrency.symbolNative,
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
                  value: state.baseValue,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 24,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Divider(),
                      FlipButton(
                        onPress: () {},
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: CurrencyButton(
                    currency: state.targetCurrency,
                    onPress: () async {
                      Currency? selectedCurrency =
                          await showModalBottomSheet<Currency?>(
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        builder: (context) => CurrenciesListModal(
                            currencies: homeBloc.currencies),
                      );
                      if (selectedCurrency != null) {
                        homeBloc.add(
                          SwitchCurrency(
                            baseCurrency: state.baseCurrency,
                            targetCurrency: selectedCurrency,
                          ),
                        );
                      }
                    },
                  ),
                ),
                NumberInput(
                  value: state.targetValue,
                  symbol: state.targetCurrency.symbolNative,
                  enabled: false,
                ),
                const Spacer(),
                // Center(
                //   child: PrimaryButton(
                //     text: 'Convert',
                //     onPress: () {
                //       homeBloc.add(
                //         ConvertCurrency(
                //           baseCurrency: state.baseCurrency,
                //           targetCurrency: state.targetCurrency,
                //           baseValue: stringToDouble(baseValueController.text),
                //         ),
                //       );
                //     },
                //     isEnabled: stringToDouble(baseValueController.text) > 0,
                //     isLoading: state is HomeLoading,
                //   ),
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
