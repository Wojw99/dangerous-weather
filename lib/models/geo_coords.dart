class GeoCoords {
  final double lat;
  final double lon;

  GeoCoords({this.lat, this.lon});

  factory GeoCoords.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> coord = json['coord'];
    return GeoCoords(
      lat: coord['lat'],
      lon: coord['lon'],
    );
  }
}
