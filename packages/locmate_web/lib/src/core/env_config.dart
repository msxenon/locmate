enum EnvConfigEnum { sharedPrefs, server }

class EnvConfig {
  static EnvConfig _instance = EnvConfig._(EnvConfigEnum.values.firstWhere(
    (e) => e.name == _envConfigValue,
    orElse: () => EnvConfigEnum.server,
  ));
  static EnvConfig get instance => _instance;
  EnvConfig._(this.env);

  static void setTestInstance(EnvConfigEnum env) {
    _instance = EnvConfig._(env);
  }

  static const _envConfigValue = String.fromEnvironment('envConfig');
  final EnvConfigEnum env;
}
