
class Weather {
  String type;
  int dayTemp;
  int nightTemp;

  Weather(this.type, this.dayTemp, this.nightTemp);

  static Weather getDefault() {
    return new Weather('', 0, 0);
  }

  static int toFahrenheit(int c) => ((c * (9/5)) + 32).round();
}