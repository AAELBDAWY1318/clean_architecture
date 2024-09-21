import 'package:flutter/material.dart';
import 'package:male_app/features/user/presentation/widgets/custom_container.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Clean Archicture",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
           CustomContainer(text: "ABDULLAH AWAD"),
           
          ],
        ),
      ),
    );
  }
}
