import 'package:dart_mappable/dart_mappable.dart';
part 'server_response.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorKey: 'type')
sealed class OpResponse with OpResponseMappable {
  const OpResponse();
}

@MappableClass(ignoreNull: true, discriminatorValue: 'list')
class ListOpResponse extends OpResponse with ListOpResponseMappable {
  final List<String> response;
  const ListOpResponse({required this.response});
}

@MappableClass(ignoreNull: true, discriminatorValue: 'string')
class StringOpResponse extends OpResponse with StringOpResponseMappable {
  final String response;
  const StringOpResponse({required this.response});
}

@MappableClass(ignoreNull: true, discriminatorValue: 'void')
class VoidOpResponse extends OpResponse with VoidOpResponseMappable {
  const VoidOpResponse();
}
