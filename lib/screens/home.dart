import 'package:currency_converter/blocs/home/home_bloc.dart';
import 'package:currency_converter/models/currency/currency.dart';
import 'package:currency_converter/screens/settings.dart';
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
  TextEditingController baseValueController = TextEditingController();
  TextEditingController targeValueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = BlocProvider.of(context);
    Currency usdCurrency = Currency.fromJson({
      "symbol": "\$",
      "name": "US Dollar",
      "symbol_native": "\$",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "USD",
      "name_plural": "US dollars",
      "type": "fiat"
    });
    Currency gbpCurrency = Currency.fromJson({
      "symbol": "£",
      "name": "British Pound Sterling",
      "symbol_native": "£",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "GBP",
      "name_plural": "British pounds sterling",
      "type": "fiat"
    });
    return BlocBuilder(
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
                    currency: usdCurrency,
                    onPress: () async {
                      await showModalBottomSheet(
                        context: context,
                        enableDrag: false,
                        isScrollControlled: true,
                        useSafeArea: true,
                        anchorPoint: Offset.zero,
                        builder: (context) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(
                                  40,
                                ),
                              ),
                            ),
                            child: ListView.builder(
                              itemCount: homeBloc.currencies.length,
                              itemBuilder: (context, index) {
                                return ListTile();
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                NumberInput(
                  textEditingController: baseValueController,
                  symbol: usdCurrency.symbol,
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
                    currency: gbpCurrency,
                    onPress: () {},
                  ),
                ),
                NumberInput(
                  textEditingController: targeValueController,
                  symbol: gbpCurrency.symbol,
                  enabled: false,
                ),
                const Spacer(),
                Center(
                  child: PrimaryButton(
                    text: 'Convert',
                    onPress: () {},
                    isLoading: true,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
