import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_tank_status/models/tank.model.dart';

class FirebaseDatabase {
  static final db = FirebaseFirestore.instance;
  static final options = SnapshotOptions();
  static Future<Tank> getTankById() async {
    try {
      // final tank = db.collection("Tanks").withConverter<Tank>(fromFirestore: Tank.fromFirestore, toFirestore: toFirestore);
      final tankDocRef = db.collection("Tanks").doc("tank_2");
      final DocumentSnapshot<Map<String, dynamic>> tankSnapshot =
          await tankDocRef.get();
      final tankInfo = Tank.fromFirestore(tankSnapshot, options);
      print("Tank Info: $tankInfo - ${tankInfo.serialNumber}");
      return tankInfo;
    } catch (e) {
      log("Error in reading tank info: ${e.toString()}");
      throw Exception(e);
    }
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getTankStreamData() {
    final tankDocRef = db.collection("Tanks").doc("tank_2");
    return tankDocRef.snapshots();
  }

  static Future<bool> updateTankDetails(int level) async {
    try {
      final tankDocRef = db.collection("Tanks").doc("tank_2");
      await tankDocRef.update({"tankLevel": level});
      return true;
    } catch (e) {
      log("Error in updating Tank: $e");
      throw Exception(e);
    }
  }
}
