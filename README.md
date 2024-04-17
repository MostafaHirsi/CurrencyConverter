# Currency Converter

An app to convert one currency to another

## Getting Started

This project is a starting point for a Flutter application that follows the
[bloc state management](https://bloclibrary.dev/).

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

# Currency Converter
To get started please make sure to have the following flutter requirements:
- Flutter v3.19.4
- Android SDK version 33.0.1
- Xcode 14.2
- Build runner: This'll be used to generate file, [link to install here](https://pub.dev/packages/build_runner#installation)

To make sure all the libraries are installed, please run:
flutter pub get

Next, you'll need an env file which'll be used to hold the api key for the currency api. In the root folder, create a .env file. Within the file, add a CURRENCY_API_KEY variable like below:
CURRENCY_API_KEY=fca_live_xeoYht2J4L0GSY7FCvPIkPp3eBNMIRAln54klO22


Then run the command below:
flutter pub run build_runner build

Using the [envie](https://pub.dev/packages/envied) library, it'll generate an env model which'll obfuscate the key (that'll stop your key from being caught via reverse engineering).

# Testing

I've added alot of tests to the project to try test as much functionality as possible. Below are the type of tests used:
- Bloc tests: tests the home and app bloc
- Unit tests: tests individual functions and components like the currency api provider
- Widget tests: tests widgets like the currency button 
- Integration tests: End to end tests for flows (haven't got round to making one yet)


# Screen Recordings

## iOS 
https://github.com/MostafaHirsi/CurrencyConverter/assets/18057776/dc16aa6d-24e2-4274-bdb5-cbf7a0d9e223


# Android
https://github.com/MostafaHirsi/CurrencyConverter/assets/18057776/fe815964-7f46-4469-8de9-e6bd1dda702f
