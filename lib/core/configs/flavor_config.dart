import 'package:palm_book/core/constants/flavor_type.dart';

class FlavorConfig {
  String appName = "";
  String baseUrl = "";
  FlavorType flavor = FlavorType.dev;

  static FlavorConfig shared = FlavorConfig.create();

  factory FlavorConfig.create({
    String appName = "",
    String baseUrl = "",
    FlavorType flavor = FlavorType.dev,
  }) {
    return shared = FlavorConfig(appName, baseUrl, flavor);
  }

  FlavorConfig(this.appName, this.baseUrl, this.flavor);
}
