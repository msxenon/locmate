import 'package:dart_mappable/dart_mappable.dart';
part 'op_content.mapper.dart';

@MappableClass(discriminatorKey: 'type')
sealed class OpContent with OpContentMappable {
  const OpContent();
}

@MappableClass(discriminatorValue: 'string')
class StringOpContent extends OpContent with StringOpContentMappable {
  final String value;
  const StringOpContent(this.value);
}

@MappableClass(discriminatorValue: 'map')
class MapOpContent extends OpContent with MapOpContentMappable {
  final Map<String, dynamic> value;
  const MapOpContent(this.value);
}
