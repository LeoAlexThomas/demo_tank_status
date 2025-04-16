import 'package:demo_tank_status/common.dart';
import 'package:flutter/material.dart';

class SelectUserType extends StatelessWidget {
  final Function(UserType) onTypeSelect;
  const SelectUserType({super.key, required this.onTypeSelect});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Select User Action",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => onTypeSelect(UserType.sender),
              child: Text("Sender"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => onTypeSelect(UserType.receiver),
              child: Text("Receiver"),
            ),
          ],
        ),
      ),
    );
  }
}
