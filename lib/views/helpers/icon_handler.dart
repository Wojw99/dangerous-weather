/*
01d.png 	01n.png 	clear sky
02d.png 	02n.png 	few clouds
03d.png 	03n.png 	scattered clouds
04d.png 	04n.png 	broken clouds
09d.png 	09n.png 	shower rain
10d.png 	10n.png 	rain
11d.png 	11n.png 	thunderstorm
13d.png 	13n.png 	snow
50d.png
* */

class IconHandler {
  static const Map<String, String> _iconPaths = {
    /// DAY
    '01d': 'assets/n_clear_sky.png',
    '02d': 'assets/n_few_clouds.png',
    '03d': 'assets/n_scattered_clouds.png',
    '04d': 'assets/n_broken_clouds.png',
    '09d': 'assets/n_shower_rain.png',
    '10d': 'assets/n_rain.png',
    '11d': 'assets/n_thunderstorm.png',
    '13d': 'assets/n_snow.png',
    '50d': 'assets/n_mist.png',

    /// NIGHT
    '01n': 'assets/n_clear_sky_m.png',
    '02n': 'assets/n_few_clouds_m.png',
    '03n': 'assets/n_scattered_clouds.png',
    '04n': 'assets/n_broken_clouds.png',
    '09n': 'assets/n_shower_rain.png',
    '10n': 'assets/n_rain.png_m',
    '11n': 'assets/n_thunderstorm.png',
    '13n': 'assets/n_snow.png',
    '50n': 'assets/n_mist.png',
  };

  /// Return icon path if exists, else return path of the default icon.
  String getIconPath(String iconCode) {
    if (_iconPaths.containsKey(iconCode)) {
      return _iconPaths[iconCode];
    }
    return 'assets/n_few_clouds.png';
  }
}
