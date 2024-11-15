import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          FirebaseAuth.instance.signOut();
        },
        child: Icon(Icons.logout));
  }
}
