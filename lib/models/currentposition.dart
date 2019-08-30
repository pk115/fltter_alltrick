class CurrentPosition {
  String DeviceId;
  String Uuid;
  String Status;
  String Created;
  String Latitude;
  String Longitude;
  bool IsMoving;
  String Accuracy;
  String Activity;
  String Battery;
  bool IsCharging;
  Map<String, dynamic> toJson() => _itemToJson(this);
}

Map<String, dynamic> _itemToJson(CurrentPosition instance) {
  return <String, dynamic>{
    'DeviceId': instance.DeviceId,
    'Uuid': instance.Uuid,
    'Status': instance.Status,
    'Created': instance.Created,
    'Latitude': instance.Latitude,
    'Longitude': instance.Longitude,
    'IsMoving': instance.IsMoving,
    'Accuracy': instance.Accuracy,
    'Activity': instance.Activity,
    'Battery': instance.Battery,
    'IsCharging': instance.IsCharging,
  };
}
