enum Environment { dev, prod }

class EnvironmentConfig {
  static Environment environment = Environment.dev;

  static void setEnvironment(Environment env) {
    environment = env;
  }
}
