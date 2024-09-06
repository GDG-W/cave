enum Devfest2024Routes {
  onboardingHome('onboarding'),
  onboardingLogin('log-in'),
  home(''),
  profile('profile'),
  scanQrCode('qr-code'),
  search('map');

  const Devfest2024Routes(this.path);

  final String path;
}
