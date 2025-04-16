import 'package:cloud_firestore/cloud_firestore.dart';

class Tank {
  final String? serialNumber;
  final String? type;
  final bool? isMotorOn;
  final int? tankLevel;

  Tank({this.serialNumber, this.type, this.tankLevel, this.isMotorOn});

  factory Tank.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions options,
  ) {
    final data = snapshot.data();
    return Tank(
      serialNumber: data?['serialNumber'],
      type: data?['type'],
      tankLevel: data?['tankLevel'],
      isMotorOn: data?['isMotorOn'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (serialNumber != null) "serialNumber": serialNumber,
      if (type != null) "type": type,
      if (tankLevel != null) "tankLevel": tankLevel,
      if (isMotorOn != null) "isMotorOn": isMotorOn,
    };
  }
}
