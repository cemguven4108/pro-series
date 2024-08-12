import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pro_music_player/presentation/pages/home/home_page.dart';
import 'package:pro_music_player/presentation/pages/permission/permission_page.dart';
import 'package:pro_music_player/presentation/state/providers/audio_player_provider/audio_player_provider.dart';

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
  bool _isPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());

    await _requestStoragePermission();
  }

  @override
  void dispose() {
    ref.read(audioPlayerNotifierProvider.notifier).dispose();
    super.dispose();
  }

  Future<void> _requestStoragePermission() async {
    final status = await Permission.audio.request();

    if (status.isGranted) {
      setState(() {
        _isPermissionGranted = true;
      });
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      ref.read(audioPlayerNotifierProvider.notifier).stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: _isPermissionGranted ? const HomePage() : const PermissionPage(),
      ),
    );
  }
}
