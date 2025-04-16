import 'dart:math';

import 'package:demo_tank_status/services/firebase_database.dart';
import 'package:flutter/material.dart';

class SendTankDetails extends StatefulWidget {
  final VoidCallback onResetUserType;

  const SendTankDetails({super.key, required this.onResetUserType});

  @override
  State<SendTankDetails> createState() => _SendTankDetailsState();
}

class _SendTankDetailsState extends State<SendTankDetails> {
  void handleUpdate() async {
    await FirebaseDatabase.updateTankDetails(Random().nextInt(101));
    SnackBar(content: Text("Updated tank level successfully"));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Text("Sender Data"),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: handleUpdate, child: Text("Update Data")),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: widget.onResetUserType,
              child: Text("Reset User"),
            ),
          ],
        ),
      ),
    );
  }
}
