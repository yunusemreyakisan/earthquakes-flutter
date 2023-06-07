
class Earthquake {
  String? _iD;
  String? _mapImage;
  String? _time;
  double? _magnitude;
  String? _magnitudeType;
  String? _latitude;
  String? _longitude;
  int? _depth;
  String? _region;
  String? _aM;
  String? _lastUpdate;

  Earthquake(
      {String? iD,
      String? mapImage,
      String? time,
      double? magnitude,
      String? magnitudeType,
      String? latitude,
      String? longitude,
      int? depth,
      String? region,
      String? aM,
      String? lastUpdate}) {
    if (iD != null) {
      _iD = iD;
    }
    if (mapImage != null) {
      _mapImage = mapImage;
    }
    if (time != null) {
      _time = time;
    }
    if (magnitude != null) {
      _magnitude = magnitude;
    }
    if (magnitudeType != null) {
      _magnitudeType = magnitudeType;
    }
    if (latitude != null) {
      _latitude = latitude;
    }
    if (longitude != null) {
      _longitude = longitude;
    }
    if (depth != null) {
      _depth = depth;
    }
    if (region != null) {
      _region = region;
    }
    if (aM != null) {
      _aM = aM;
    }
    if (lastUpdate != null) {
      _lastUpdate = lastUpdate;
    }
  }

  String? get iD => _iD;
  set iD(String? iD) => _iD = iD;
  String? get mapImage => _mapImage;
  set mapImage(String? mapImage) => _mapImage = mapImage;
  String? get time => _time;
  set time(String? time) => _time = time;
  double? get magnitude => _magnitude;
  set magnitude(double? magnitude) => _magnitude = magnitude;
  String? get magnitudeType => _magnitudeType;
  set magnitudeType(String? magnitudeType) => _magnitudeType = magnitudeType;
  String? get latitude => _latitude;
  set latitude(String? latitude) => _latitude = latitude;
  String? get longitude => _longitude;
  set longitude(String? longitude) => _longitude = longitude;
  int? get depth => _depth;
  set depth(int? depth) => _depth = depth;
  String? get region => _region;
  set region(String? region) => _region = region;
  String? get aM => _aM;
  set aM(String? aM) => _aM = aM;
  String? get lastUpdate => _lastUpdate;
  set lastUpdate(String? lastUpdate) => _lastUpdate = lastUpdate;

  Earthquake.fromJson(Map<String, dynamic> json) {
    _iD = json['ID'];
    _mapImage = json['MapImage'];
    _time = json['Time'];
    _magnitude = json['Magnitude'];
    _magnitudeType = json['MagnitudeType'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    _depth = json['Depth'];
    _region = json['Region'];
    _aM = json['AM'];
    _lastUpdate = json['LastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = _iD;
    data['MapImage'] = _mapImage;
    data['Time'] = _time;
    data['Magnitude'] = _magnitude;
    data['MagnitudeType'] = _magnitudeType;
    data['Latitude'] = _latitude;
    data['Longitude'] = _longitude;
    data['Depth'] = _depth;
    data['Region'] = _region;
    data['AM'] = _aM;
    data['LastUpdate'] = _lastUpdate;
    return data;
  }
}
