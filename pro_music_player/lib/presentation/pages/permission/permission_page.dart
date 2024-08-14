import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pro_music_player/presentation/pages/home/home_page.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({
    super.key,
  });

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  bool _canOpen = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                if (await Permission.audio.isGranted) {
                  _goHome();
                  return;
                }

                final result = await openAppSettings();

                if (!result) {
                  setState(() {
                    _canOpen = false;
                  });
                }
              },
              child: const Text('Refresh'),
            ),
            const SizedBox(height: 20),
            if (_canOpen == false)
              SizedBox(
                width: size.width * 0.8,
                child: Text(
                  'Please allow the app to access your storage to continue.',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _goHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const HomePage(),
      ),
    );
  }
}
