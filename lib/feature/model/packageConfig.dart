class PackageConfig {
  List<String> duration;
  List<String> package;

  PackageConfig({
    required this.duration,
    required this.package,
  });

  factory PackageConfig.empty() {
    return PackageConfig(
      duration: [],
      package: [],
    );
  }
}