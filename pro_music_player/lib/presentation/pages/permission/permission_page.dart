import 'package:flutter/material.dart';

class PermissionPage extends StatelessWidget {
  const PermissionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size.width * 0.7,
          child: const Text(
            "Please grant permission from app settings to access the storage",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
