import 'dart:convert';

import 'package:flutter/foundation.dart';

class Node {
  String id;
  String name;
  LatLng location;
  String description;
  List<int> listPump;
  bool status;
  List<List<Timing>> timing;
  Node({
    this.id,
    this.name,
    this.location,
    this.description,
    this.listPump,
    this.status,
    this.timing,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'location': location.toMap(),
      'description': description,
      'listPump': listPump,
      'status': status,
      'timing': [],
    };
  }

  factory Node.fromMap(Map<String, dynamic> map) {
    return Node(
      id: map['_id'],
      name: map['name'],
      location: LatLng.fromMap(map['location']),
      description: map['description'],
      listPump: List<int>.from(map['listPump']),
      status: map['status'],
      // timing: List<TimingList>.from(
      //     map['timing']?.map((x) => TimingList.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Node.fromJson(String source) => Node.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Node(id: $id, name: $name, location: $location, description: $description, listPump: $listPump, status: $status, timing: $timing)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Node &&
        other.id == id &&
        other.name == name &&
        other.location == location &&
        other.description == description &&
        listEquals(other.listPump, listPump) &&
        other.status == status &&
        listEquals(other.timing, timing);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        location.hashCode ^
        description.hashCode ^
        listPump.hashCode ^
        status.hashCode ^
        timing.hashCode;
  }
}

class LatLng {
  double lat;
  double lng;
  LatLng({
    this.lat,
    this.lng,
  });

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory LatLng.fromMap(Map<String, dynamic> map) {
    return LatLng(
      lat: double.parse(map['lat'].toString()),
      lng: double.parse(map['lng'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory LatLng.fromJson(String source) => LatLng.fromMap(json.decode(source));

  @override
  String toString() => 'LatLng(lat: $lat, lng: $lng)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LatLng && other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}

class Timing {
  int startTime;
  int endTime;
  Timing({
    this.startTime,
    this.endTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory Timing.fromMap(Map<String, dynamic> map) {
    return Timing(
      startTime: map['startTime'] == null ? 0 : map['startTime'],
      endTime: map['endTime'] == null ? 0 : map['endTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Timing.fromJson(String source) => Timing.fromMap(json.decode(source));

  @override
  String toString() => 'Timing(startTime: $startTime, endTime: $endTime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Timing &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode => startTime.hashCode ^ endTime.hashCode;
}

class TimingList {
  List<Timing> timing;
  TimingList({
    this.timing,
  });

  Map<String, dynamic> toMap() {
    return {
      'timing': timing?.map((x) => x.toMap())?.toList(),
    };
  }

  factory TimingList.fromMap(Map<String, dynamic> map) {
    return TimingList(
      timing: List<Timing>.from(map['timing']?.map((x) => Timing.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TimingList.fromJson(String source) =>
      TimingList.fromMap(json.decode(source));

  @override
  String toString() => 'TimingList(timing: $timing)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TimingList && listEquals(other.timing, timing);
  }

  @override
  int get hashCode => timing.hashCode;
}
