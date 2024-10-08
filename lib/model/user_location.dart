class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinates coordinates;
  final LocationTimezoneCoordinates timezones;
  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezones,
  });
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({
    required this.number,
    required this.name,
  });
}

class LocationCoordinates {
  final String latitude;
  final String longitude;
  LocationCoordinates({
    required this.latitude,
    required this.longitude,
  });
}

class LocationTimezoneCoordinates {
  final String offset;
  final String description;
  LocationTimezoneCoordinates({
    required this.offset,
    required this.description,
  });
}
