class Settings {
  static const int defaultDotMs = 150;
  static const double defaultBeepVolume = 1.0;

  static int dotMs = defaultDotMs;

  static int get dashMs => dotMs * 3;
  static int get symbolGapMs => dotMs;
  static int get letterGapMs => dotMs * 3;
  static int get wordGapMs => dotMs * 7;

  static double beepVolume = 1.0;

  static void reset() {
    dotMs = defaultDotMs;
    beepVolume = defaultBeepVolume;
  }
}