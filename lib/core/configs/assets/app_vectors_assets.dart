const _basePath = 'assets/vectors/';

class AppVectorsAssets {
  AppVectorsAssets._();
  static final instance = AppVectorsAssets._();
  factory AppVectorsAssets() => instance;
  static const format = '.svg';
  static const appLogo = '${_basePath}logo$format';
  static const emailSending = '${_basePath}email_sending$format';
  static const bag = '${_basePath}bag$format';
  static const search = '${_basePath}search$format';
  static const notFound = '${_basePath}not_found$format';
  static const cartBag = '${_basePath}cart_bag$format';
}
