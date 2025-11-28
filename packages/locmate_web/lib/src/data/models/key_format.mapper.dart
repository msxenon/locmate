// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'key_format.dart';

class KeyFormatMapper extends EnumMapper<KeyFormat> {
  KeyFormatMapper._();

  static KeyFormatMapper? _instance;
  static KeyFormatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KeyFormatMapper._());
    }
    return _instance!;
  }

  static KeyFormat fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  KeyFormat decode(dynamic value) {
    switch (value) {
      case r'camelCase':
        return KeyFormat.camelCase;
      case r'snakeCase':
        return KeyFormat.snakeCase;
      case r'pascalCase':
        return KeyFormat.pascalCase;
      case r'none':
        return KeyFormat.none;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(KeyFormat self) {
    switch (self) {
      case KeyFormat.camelCase:
        return r'camelCase';
      case KeyFormat.snakeCase:
        return r'snakeCase';
      case KeyFormat.pascalCase:
        return r'pascalCase';
      case KeyFormat.none:
        return r'none';
    }
  }
}

extension KeyFormatMapperExtension on KeyFormat {
  String toValue() {
    KeyFormatMapper.ensureInitialized();
    return MapperContainer.globals.toValue<KeyFormat>(this) as String;
  }
}
