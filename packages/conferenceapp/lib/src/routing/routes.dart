enum Devfest2024Routes {
  onboardingHome('onboarding'),
  onboardingLogin('log-in'),
  onboardingSignature('signature'),
  dashboard(''),
  speakerDetails('speaker-details'),
  scheduleDetails('schedule-details'),
  profile('profile'),
  myQrCode('qr-code'),
  venueMap('map');

  const Devfest2024Routes(this.path);

  final String path;
}
