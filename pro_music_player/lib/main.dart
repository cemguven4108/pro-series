import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/pages/home/home_page.dart';
import 'package:pro_music_player/permission_page.dart';
import 'package:pro_music_player/providers/permission_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPermissionGranted = ref.watch(permissionProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isPermissionGranted.maybeWhen(
        data: (isGranted) {
          return isGranted ? const HomePage() : const PermissionPage();
        },
        orElse: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
