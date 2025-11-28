import 'package:dart_mappable/dart_mappable.dart';
part 'key_format.mapper.dart';

@MappableEnum()
enum KeyFormat {
  camelCase('keyFormat'),
  snakeCase('key_format'),
  pascalCase('KeyFormat'),
  none('');

  final String example;
  const KeyFormat(this.example);
}
