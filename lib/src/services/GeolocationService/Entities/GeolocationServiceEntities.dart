
/// Entity with Position Info
class PositionEntity {
  /// Constructs an instance with the given values for testing. [Position]
  /// instances constructed this way won't actually reflect any real information
  /// from the platform, just whatever was passed in at construction time.
  PositionEntity({
    required this.longitude,
    required this.latitude,
    required this.timestamp,
    required this.accuracy,
    required this.altitude,
    required this.heading,
    required this.speed,
    required this.speedAccuracy,
    this.floor,
    this.isMocked = false,
  });

  /// The latitude of this position in degrees normalized to the interval -90.0
  /// to +90.0 (both inclusive).
  final double latitude;

  /// The longitude of the position in degrees normalized to the interval -180
  /// (exclusive) to +180 (inclusive).
  final double longitude;

  /// The time at which this position was determined.
  final DateTime? timestamp;

  /// The altitude of the device in meters.
  ///
  /// The altitude is not available on all devices. In these cases the returned
  /// value is 0.0.
  final double altitude;

  /// The estimated horizontal accuracy of the position in meters.
  ///
  /// The accuracy is not available on all devices. In these cases the value is
  /// 0.0.
  final double accuracy;

  /// The heading in which the device is traveling in degrees.
  ///
  /// The heading is not available on all devices. In these cases the value is
  /// 0.0.
  final double heading;

  /// The floor specifies the floor of the building on which the device is
  /// located.
  ///
  /// The floor property is only available on iOS and only when the information
  /// is available. In all other cases this value will be null.
  final int? floor;

  /// The speed at which the devices is traveling in meters per second over
  /// ground.
  ///
  /// The speed is not available on all devices. In these cases the value is
  /// 0.0.
  final double speed;

  /// The estimated speed accuracy of this position, in meters per second.
  ///
  /// The speedAccuracy is not available on all devices. In these cases the
  /// value is 0.0.
  final double speedAccuracy;

  /// Will be true on Android (starting from API lvl 18) when the location came
  /// from the mocked provider.
  ///
  /// On iOS this value will always be false.
  final bool isMocked;
}

/// Represent the possible location permissions.
enum LocationPermissionStatus {
  /// Permission to access the device's location is denied, the App should try
  /// to request permission using the `Geolocator.requestPermission()` method.
  denied,

  /// Permission to access the device's location is permenantly denied. When
  /// requestiong permissions the permission dialog will not been shown until
  /// the user updates the permission in the App settings.
  deniedForever,

  /// Permission to access the device's location is allowed.
  allowed
}