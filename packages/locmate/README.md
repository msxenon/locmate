A visual editor for Application Resource Bundle (`.arb`) localization files, enabling rapid development. It is specifically designed to be used for Dart and Flutter projects using the [intl](https://pub.dev/packages/intl) package.

The editor runs locally on your machine, meaning you can use familiar versioning tools like Git and do not have to upload or download localization files.

**Warning:** This project is very early in development, use with extreme caution! Make sure you have all important changes committed before trying it out.

## Contents

* [Features](#features)
  * [Supprted](#supported)
  * [Planned](#planned)
* [Installation](#installation)
* [Usage](#usage)

## Features

### Supported

* Add and remove localization keys
* Add and remove languages
* Add, edit, and remove placeholder variables
* Edit the ICU value of a localization entry using a visual editor
  * Text blocks
  * Arguments
  * Select with branches
  * Plural with branches
    * Plural arguments

### Planned

* Dark theme
* A subscription service for automated machine translations (e.g. using DeepL)

## Installation

To install the Locmate launcher, run the command:
```bash
dart pub global activate locmate
```
Or, if you are using the Flutter CLI, run:
```bash
flutter pub global activate locmate
```

## Usage

Navigate to the directory containing the `l10n.yaml` file in your terminal.

Otherwise, with the Dart CLI, run:
```bash
dart pub global run locmate
```
Or, using the Flutter CLI, run:
```bash
flutter pub global run locmate
```
