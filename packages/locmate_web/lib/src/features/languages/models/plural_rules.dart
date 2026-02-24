// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:math' as math;

import 'package:intl/intl.dart';

enum PluralCase { zero, one, two, few, many, other }

class PluralRuleMapper {
  PluralCase _default_rule() => PluralCase.other;

  void startRuleEvaluation(num howMany, [int? precision = 0]) {
    _n = howMany;
    _precision = precision;
    _i = _n.round();
    _updateVF(_n);
    _updateWT(_v, _f);
  }

  num _n = 0;

  /// The integer part of [_n]
  int _i = 0;
  int? _precision;

  /// Returns the number of digits in the fractional part of a number
  /// (3.1416 => 4)
  ///
  /// Takes the item count [n] and uses [_precision].
  /// That's because a just looking at the value of a number is not enough to
  /// decide the plural form. For example "1 dollar" vs "1.00 dollars", the
  /// value is 1, but how it is formatted also matters.
  int _decimals(num n) {
    var str = _precision == null ? '$n' : n.toStringAsFixed(_precision!);
    var result = str.indexOf('.');
    return (result == -1) ? 0 : str.length - result - 1;
  }

  /// Calculates and sets the _v and _f as per CLDR plural rules.
  ///
  /// The short names for parameters / return match the CLDR syntax and UTS #35
  ///     (https://unicode.org/reports/tr35/tr35-numbers.html#Plural_rules_syntax)
  /// Takes the item count [n] and a [precision].
  void _updateVF(num n) {
    var defaultDigits = 3;

    _v = _precision ?? math.min(_decimals(n), defaultDigits);

    var base = math.pow(10, _v) as int;
    _f = (n * base).floor() % base;
  }

  /// Calculates and sets _w and _t as per CLDR plural rules.
  ///
  /// The short names for parameters / return match the CLDR syntax and UTS #35
  ///     (https://unicode.org/reports/tr35/tr35-numbers.html#Plural_rules_syntax)
  /// @param v Calculated previously.
  /// @param f Calculated previously.
  void _updateWT(int v, int f) {
    if (f == 0) {
      // Unused, for now _w = 0;
      _t = 0;
      return;
    }

    while ((f % 10) == 0) {
      f = (f / 10).floor();
      v--;
    }

    // Unused, for now _w = v;
    _t = f;
  }

  /// Number of visible fraction digits.
  int _v = 0;

  /// Number of visible fraction digits without trailing zeros.
  // Unused, for now int _w = 0;

  /// The visible fraction digits in n, with trailing zeros.
  int _f = 0;

  /// The visible fraction digits in n, without trailing zeros.
  int _t = 0;

  // An example, for precision n = 3.1415 and precision = 7)
  //   n  : 3.1415
  // str n: 3.1415000 (the "formatted" n, 7 fractional digits)
  //   i  : 3         (the integer part of n)
  //   f  :   1415000 (the fractional part of n)
  //   v  : 7         (how many digits in f)
  //   t  :   1415    (f, without trailing 0s)
  //   w  : 4         (how many digits in t)

  PluralCase _ast_rule() {
    if ((_i == 1) && (_v == 0)) {
      return PluralCase.one;
    }
    return PluralCase.other;
  }

  PluralCase _af_rule() {
    if (_n == 1) {
      return PluralCase.one;
    }
    return PluralCase.other;
  }

  PluralCase _am_rule() {
    if ((_i == 0) || (_n == 1)) {
      return PluralCase.one;
    }
    return PluralCase.other;
  }

  PluralCase _ar_rule() {
    if (_n == 0) {
      return PluralCase.zero;
    }
    if (_n == 1) {
      return PluralCase.one;
    }
    if (_n == 2) {
      return PluralCase.two;
    }
    if ([3, 4, 5, 6, 7, 8, 9, 10].contains(_n % 100)) {
      return PluralCase.few;
    }
    if (List.generate(89, (i) => i + 11).contains(_n % 100)) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _be_rule() {
    if ((_n % 10 == 1) && !(_n % 100 == 11)) {
      return PluralCase.one;
    }
    if ((_n % 10 == 2 || _n % 10 == 3 || _n % 10 == 4) &&
        !(_n % 100 == 12 || _n % 100 == 13 || _n % 100 == 14)) {
      return PluralCase.few;
    }
    if ((_n % 10 == 0) ||
        (_n % 10 == 5 ||
            _n % 10 == 6 ||
            _n % 10 == 7 ||
            _n % 10 == 8 ||
            _n % 10 == 9) ||
        (_n % 100 == 11 ||
            _n % 100 == 12 ||
            _n % 100 == 13 ||
            _n % 100 == 14)) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _br_rule() {
    if ((_n % 10 == 1) &&
        !(_n % 100 == 11 || _n % 100 == 71 || _n % 100 == 91)) {
      return PluralCase.one;
    }
    if ((_n % 10 == 2) &&
        !(_n % 100 == 12 || _n % 100 == 72 || _n % 100 == 92)) {
      return PluralCase.two;
    }
    if ((_n % 10 == 3 || _n % 10 == 4 || _n % 10 == 9) &&
        !([10, 11, 12, 13, 14, 15, 16, 17, 18, 19].contains(_n % 100) ||
            [70, 71, 72, 73, 74, 75, 76, 77, 78, 79].contains(_n % 100) ||
            [90, 91, 92, 93, 94, 95, 96, 97, 98, 99].contains(_n % 100))) {
      return PluralCase.few;
    }
    if (!(_n == 0) && (_n % 1000000 == 0)) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _bs_rule() {
    if ((_v == 0) && (_i % 10 == 1) && !(_i % 100 == 11) ||
        (_f % 10 == 1) && !(_f % 100 == 11)) {
      return PluralCase.one;
    }
    if ((_v == 0) &&
            (_i % 10 == 2 || _i % 10 == 3 || _i % 10 == 4) &&
            !(_i % 100 == 12 || _i % 100 == 13 || _i % 100 == 14) ||
        (_f % 10 == 2 || _f % 10 == 3 || _f % 10 == 4) &&
            !(_f % 100 == 12 || _f % 100 == 13 || _f % 100 == 14)) {
      return PluralCase.few;
    }
    return PluralCase.other;
  }

  PluralCase _ca_rule() {
    if ((_i == 1) && (_v == 0)) {
      return PluralCase.one;
    }
    if (!(_i == 0) && (_i % 1000000 == 0) && (_v == 0)) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _cs_rule() {
    if ((_i == 1) && (_v == 0)) {
      return PluralCase.one;
    }
    if ((_i == 2 || _i == 3 || _i == 4) && (_v == 0)) {
      return PluralCase.few;
    }
    if (!(_v == 0)) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _cy_rule() {
    if (_n == 0) {
      return PluralCase.zero;
    }
    if (_n == 1) {
      return PluralCase.one;
    }
    if (_n == 2) {
      return PluralCase.two;
    }
    if (_n == 3) {
      return PluralCase.few;
    }
    if (_n == 6) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _da_rule() {
    if ((_n == 1) || !(_t == 0) && (_i == 0 || _i == 1)) {
      return PluralCase.one;
    }
    return PluralCase.other;
  }

  PluralCase _es_rule() {
    if (_n == 1) {
      return PluralCase.one;
    }
    if (!(_i == 0) && (_i % 1000000 == 0) && (_v == 0)) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _ceb_rule() {
    if ((_v == 0) && (_i == 1 || _i == 2 || _i == 3) ||
        (_v == 0) && !(_i % 10 == 4 || _i % 10 == 6 || _i % 10 == 9) ||
        !(_v == 0) && !(_f % 10 == 4 || _f % 10 == 6 || _f % 10 == 9)) {
      return PluralCase.one;
    }
    return PluralCase.other;
  }

  PluralCase _fr_rule() {
    if (_i == 0 || _i == 1) {
      return PluralCase.one;
    }
    if (!(_i == 0) && (_i % 1000000 == 0) && (_v == 0)) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _ga_rule() {
    if (_n == 1) {
      return PluralCase.one;
    }
    if (_n == 2) {
      return PluralCase.two;
    }
    if (_n == 3 || _n == 4 || _n == 5 || _n == 6) {
      return PluralCase.few;
    }
    if (_n == 7 || _n == 8 || _n == 9 || _n == 10) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _he_rule() {
    if ((_i == 1) && (_v == 0) || (_i == 0) && !(_v == 0)) {
      return PluralCase.one;
    }
    if ((_i == 2) && (_v == 0)) {
      return PluralCase.two;
    }
    return PluralCase.other;
  }

  PluralCase _ff_rule() {
    if (_i == 0 || _i == 1) {
      return PluralCase.one;
    }
    return PluralCase.other;
  }

  PluralCase _is_rule() {
    if ((_t == 0) && (_i % 10 == 1) && !(_i % 100 == 11) ||
        (_t % 10 == 1) && !(_t % 100 == 11)) {
      return PluralCase.one;
    }
    return PluralCase.other;
  }

  PluralCase _ak_rule() {
    if (_n == 0 || _n == 1) {
      return PluralCase.one;
    }
    return PluralCase.other;
  }

  PluralCase _lt_rule() {
    if ((_n % 10 == 1) &&
        ![11, 12, 13, 14, 15, 16, 17, 18, 19].contains(_n % 100)) {
      return PluralCase.one;
    }
    if (([2, 3, 4, 5, 6, 7, 8, 9].contains(_n % 10)) &&
        ![11, 12, 13, 14, 15, 16, 17, 18, 19].contains(_n % 100)) {
      return PluralCase.few;
    }
    if (!(_f == 0)) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _lv_rule() {
    if ((_n % 10 == 0) ||
        ([11, 12, 13, 14, 15, 16, 17, 18, 19].contains(_n % 100)) ||
        (_v == 2) &&
            ([11, 12, 13, 14, 15, 16, 17, 18, 19].contains(_f % 100))) {
      return PluralCase.zero;
    }
    if ((_n % 10 == 1) && !(_n % 100 == 11) ||
        (_v == 2) && (_f % 10 == 1) && !(_f % 100 == 11) ||
        !(_v == 2) && (_f % 10 == 1)) {
      return PluralCase.one;
    }
    return PluralCase.other;
  }

  PluralCase _mk_rule() {
    if ((_v == 0) && (_i % 10 == 1) && !(_i % 100 == 11) ||
        (_f % 10 == 1) && !(_f % 100 == 11)) {
      return PluralCase.one;
    }
    return PluralCase.other;
  }

  PluralCase _mt_rule() {
    if (_n == 1) {
      return PluralCase.one;
    }
    if (_n == 2) {
      return PluralCase.two;
    }
    if ((_n == 0) || ([3, 4, 5, 6, 7, 8, 9, 10].contains(_n % 100))) {
      return PluralCase.few;
    }
    if ([11, 12, 13, 14, 15, 16, 17, 18, 19].contains(_n % 100)) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _pl_rule() {
    if ((_i == 1) && (_v == 0)) {
      return PluralCase.one;
    }
    if ((_v == 0) &&
        (_i % 10 == 2 || _i % 10 == 3 || _i % 10 == 4) &&
        !(_i % 100 == 12 || _i % 100 == 13 || _i % 100 == 14)) {
      return PluralCase.few;
    }
    if ((_v == 0) && !(_i == 1) && (_i % 10 == 0 || _i % 10 == 1) ||
        (_v == 0) &&
            (_i % 10 == 5 ||
                _i % 10 == 6 ||
                _i % 10 == 7 ||
                _i % 10 == 8 ||
                _i % 10 == 9) ||
        (_v == 0) && (_i % 100 == 12 || _i % 100 == 13 || _i % 100 == 14)) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _pt_rule() {
    if (_i == 0 || _i == 1) {
      return PluralCase.one;
    }
    if (!(_i == 0) && (_i % 1000000 == 0) && (_v == 0)) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _mo_rule() {
    if ((_i == 1) && (_v == 0)) {
      return PluralCase.one;
    }
    if (!(_v == 0) ||
        (_n == 0) ||
        !(_n == 1) && (List.generate(19, (i) => i + 1).contains(_n % 100))) {
      return PluralCase.few;
    }
    return PluralCase.other;
  }

  PluralCase _ru_rule() {
    if ((_v == 0) && (_i % 10 == 1) && !(_i % 100 == 11)) {
      return PluralCase.one;
    }
    if ((_v == 0) &&
        (_i % 10 == 2 || _i % 10 == 3 || _i % 10 == 4) &&
        !(_i % 100 == 12 || _i % 100 == 13 || _i % 100 == 14)) {
      return PluralCase.few;
    }
    if ((_v == 0) && (_i % 10 == 0) ||
        (_v == 0) &&
            (_i % 10 == 5 ||
                _i % 10 == 6 ||
                _i % 10 == 7 ||
                _i % 10 == 8 ||
                _i % 10 == 9) ||
        (_v == 0) &&
            (_i % 100 == 11 ||
                _i % 100 == 12 ||
                _i % 100 == 13 ||
                _i % 100 == 14)) {
      return PluralCase.many;
    }
    return PluralCase.other;
  }

  PluralCase _si_rule() {
    if ((_n == 0 || _n == 1) || (_i == 0) && (_f == 1)) {
      return PluralCase.one;
    }
    return PluralCase.other;
  }

  PluralCase _sl_rule() {
    if ((_v == 0) && (_i % 100 == 1)) {
      return PluralCase.one;
    }
    if ((_v == 0) && (_i % 100 == 2)) {
      return PluralCase.two;
    }
    if ((_v == 0) && (_i % 100 == 3 || _i % 100 == 4) || !(_v == 0)) {
      return PluralCase.few;
    }
    return PluralCase.other;
  }

  late final pluralRules = {
    'en_ISO': _ast_rule,
    'af': _af_rule,
    'am': _am_rule,
    'ar': _ar_rule,
    'ar_DZ': _ar_rule,
    'ar_EG': _ar_rule,
    'as': _am_rule,
    'az': _af_rule,
    'be': _be_rule,
    'bg': _af_rule,
    'bm': _default_rule,
    'bn': _am_rule,
    'br': _br_rule,
    'bs': _bs_rule,
    'ca': _ca_rule,
    'chr': _af_rule,
    'cs': _cs_rule,
    'cy': _cy_rule,
    'da': _da_rule,
    'de': _ast_rule,
    'de_AT': _ast_rule,
    'de_CH': _ast_rule,
    'el': _af_rule,
    'en': _ast_rule,
    'en_AU': _ast_rule,
    'en_CA': _ast_rule,
    'en_GB': _ast_rule,
    'en_IE': _ast_rule,
    'en_IN': _ast_rule,
    'en_MY': _ast_rule,
    'en_NZ': _ast_rule,
    'en_SG': _ast_rule,
    'en_US': _ast_rule,
    'en_ZA': _ast_rule,
    'es': _es_rule,
    'es_419': _es_rule,
    'es_ES': _es_rule,
    'es_MX': _es_rule,
    'es_US': _es_rule,
    'et': _ast_rule,
    'eu': _af_rule,
    'fa': _am_rule,
    'fi': _ast_rule,
    'fil': _ceb_rule,
    'fr': _fr_rule,
    'fr_CA': _fr_rule,
    'fr_CH': _fr_rule,
    'fur': _af_rule,
    'ga': _ga_rule,
    'gl': _ast_rule,
    'gsw': _af_rule,
    'gu': _am_rule,
    'haw': _af_rule,
    'he': _he_rule,
    'hi': _am_rule,
    'hr': _bs_rule,
    'hu': _af_rule,
    'hy': _ff_rule,
    'id': _default_rule,
    'in': _default_rule,
    'is': _is_rule,
    'it': _ca_rule,
    'it_CH': _ca_rule,
    'iw': _he_rule,
    'ja': _default_rule,
    'ka': _af_rule,
    'kk': _af_rule,
    'km': _default_rule,
    'kn': _am_rule,
    'ko': _default_rule,
    'ky': _af_rule,
    'ln': _ak_rule,
    'lo': _default_rule,
    'lt': _lt_rule,
    'lv': _lv_rule,
    'mg': _ak_rule,
    'mk': _mk_rule,
    'ml': _af_rule,
    'mn': _af_rule,
    'mr': _af_rule,
    'ms': _default_rule,
    'mt': _mt_rule,
    'my': _default_rule,
    'nb': _af_rule,
    'ne': _af_rule,
    'nl': _ast_rule,
    'no': _af_rule,
    'no_NO': _af_rule,
    'nyn': _af_rule,
    'or': _af_rule,
    'pa': _ak_rule,
    'pl': _pl_rule,
    'ps': _af_rule,
    'pt': _pt_rule,
    'pt_BR': _pt_rule,
    'pt_PT': _ca_rule,
    'ro': _mo_rule,
    'ru': _ru_rule,
    'si': _si_rule,
    'sk': _cs_rule,
    'sl': _sl_rule,
    'sq': _af_rule,
    'sr': _bs_rule,
    'sr_Latn': _bs_rule,
    'sv': _ast_rule,
    'sw': _ast_rule,
    'ta': _af_rule,
    'te': _af_rule,
    'th': _default_rule,
    'tl': _ceb_rule,
    'tr': _af_rule,
    'uk': _ru_rule,
    'ur': _ast_rule,
    'uz': _af_rule,
    'vi': _default_rule,
    'zh': _default_rule,
    'zh_CN': _default_rule,
    'zh_HK': _default_rule,
    'zh_TW': _default_rule,
    'zu': _am_rule,
    'default': _default_rule,
  };
  bool localeHasPluralRules(String locale) => pluralRules.containsKey(locale);

  PluralCase call(num num, String locale) {
    startRuleEvaluation(num);
    var verifiedLocale = Intl.verifiedLocale(
      locale,
      localeHasPluralRules,
      onFailure: (locale) => 'default',
    );
    return pluralRules[verifiedLocale]!.call();
  }
}
