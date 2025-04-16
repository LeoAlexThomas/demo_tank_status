import 'package:demo_tank_status/models/tank.model.dart';
import 'package:flutter/material.dart';

class TankCard extends StatelessWidget {
  final Tank tank;
  const TankCard({super.key, required this.tank});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [BoxShadow(color: Colors.black38)],
        color: Colors.white,
      ),
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Tank Status",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 20),
          DataView(title: "Serial Number", value: tank.serialNumber ?? "-"),
          const SizedBox(height: 12),
          DataView(
            title: "Water Level",
            value: tank.tankLevel?.toString() ?? "-",
          ),
          const SizedBox(height: 12),
          DataView(
            title: "Motor Status",
            value: tank.isMotorOn == true ? 'ON' : 'OFF',
          ),
          const SizedBox(height: 12),
          DataView(title: "Tank Type", value: tank.type ?? "-"),
        ],
      ),
    );
  }
}

class DataView extends StatelessWidget {
  final String title;
  final String value;
  const DataView({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 14,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(value, style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
