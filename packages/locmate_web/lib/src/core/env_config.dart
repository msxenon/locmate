enum EnvConfigEnum { sharedPrefs, server }

class EnvConfig {
  static EnvConfig _instance = EnvConfig._(
    EnvConfigEnum.values.firstWhere(
      (e) => e.name == _envConfigValue,
      orElse: () => EnvConfigEnum.server,
    ),
  );
  static EnvConfig get instance => _instance;
  EnvConfig._(this.env, [this.locmateUrl]);

  static void setTestInstance(EnvConfigEnum env, [String? locmateUrl]) {
    _instance = EnvConfig._(env, locmateUrl);
  }

  static const _envConfigValue = String.fromEnvironment('envConfig');
  final EnvConfigEnum env;
  //Used for patrol tests to connect to the locmate server
  final String? locmateUrl;

  String getFullUrl(String path) {
    if (locmateUrl != null) {
      return '$locmateUrl$path';
    }
    return path;
  }
}
