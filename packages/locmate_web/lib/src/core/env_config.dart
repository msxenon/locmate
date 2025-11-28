enum EnvConfigEnum { sharedPrefs, server }

class EnvConfig {
  static final EnvConfig _instance = EnvConfig._();
  static EnvConfig get instance => _instance;
  EnvConfig._()
      : env = EnvConfigEnum.values.firstWhere(
          (e) => e.name == _envConfigValue,
          orElse: () => EnvConfigEnum.server,
        );
  static const _envConfigValue = String.fromEnvironment('envConfig');
  final EnvConfigEnum env;
}
