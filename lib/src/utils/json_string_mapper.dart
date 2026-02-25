import 'dart:convert';

class JsonStringMapper {
  static String mapToString(Map<String, dynamic> content) {
    return JsonEncoder.withIndent("  ").convert(content);
  }
}
