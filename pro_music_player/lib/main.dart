import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pro_music_player/presentation/pages/home/home_page.dart';
import 'package:pro_music_player/presentation/pages/permission/permission_page.dart';
import 'package:pro_music_player/presentation/state/riverpod/initializer_provider/initializer_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _requestStoragePermission() async {
    final status = await Permission.audio.request();

    if (status.isGranted) {
      return true;
    }
    return false;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {}
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(initializationProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: _requestStoragePermission(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return const HomePage();
          } else if (snapshot.data == false) {
            return const PermissionPage();
          } else {
            return const Scaffold();
          }
        },
      ),
    );
  }
}
