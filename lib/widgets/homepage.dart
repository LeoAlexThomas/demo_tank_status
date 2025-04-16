import 'package:demo_tank_status/common.dart';
import 'package:demo_tank_status/widgets/selectUserType.dart';
import 'package:demo_tank_status/widgets/sendTankDetails.dart';
import 'package:demo_tank_status/widgets/tankList.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserType? userType;

  Widget getTankDetails() {
    if (userType == null) {
      return SelectUserType(
        onTypeSelect: (type) {
          setState(() {
            userType = type;
          });
        },
      );
    }
    if (userType == UserType.sender) {
      return SendTankDetails(
        onResetUserType:
            () => setState(() {
              userType = null;
            }),
      );
    }
    return TankList(
      onResetUserType:
          () => setState(() {
            userType = null;
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tank Data Control"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: getTankDetails(),
        // child: FutureBuilder<Tank>(
        //   future: FirebaseDatabase.getTankById(),
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData && !snapshot.hasError) {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //     if (snapshot.hasError) {
        //       return Center(child: Text(snapshot.error.toString()));
        //     }
        //     final tank = snapshot.data;
        //     if (tank == null) {
        //       return Center(child: Text("No Tank is availble"));
        //     }
        //     return TankCard(tank: tank);
        //   },
        // ),
      ),
    );
  }
}
