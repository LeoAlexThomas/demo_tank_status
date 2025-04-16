import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_tank_status/models/tank.model.dart';
import 'package:demo_tank_status/services/firebase_database.dart';
import 'package:demo_tank_status/widgets/tankCard.dart';
import 'package:flutter/material.dart';

class TankList extends StatefulWidget {
  final VoidCallback onResetUserType;
  const TankList({super.key, required this.onResetUserType});

  @override
  State<TankList> createState() => _TankListState();
}

class _TankListState extends State<TankList> {
  late Stream<DocumentSnapshot<Map<String, dynamic>>> tankStream;
  @override
  void initState() {
    tankStream = FirebaseDatabase.getTankStreamData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: widget.onResetUserType,
          child: Text("Reset User"),
        ),
        const SizedBox(height: 20),
        StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: tankStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData && !snapshot.hasError) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            final snapshotData = snapshot.data;
            if (snapshotData == null) {
              return Center(child: Text("No Tank is availble"));
            }

            final tank = Tank.fromFirestore(snapshotData, SnapshotOptions());
            return TankCard(tank: tank);
          },
        ),
      ],
    );
  }
}
