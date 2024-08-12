import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_web_toon/firebase_options.dart';
import 'package:pro_web_toon/pages/originals/originals_page.dart';
import 'package:pro_web_toon/service/webtoon_service.dart';
import 'package:pro_web_toon/state/webtoon_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WebtoonBloc(WebtoonService.instance()),
        ),
      ],
      child: const MaterialApp(
        home: OriginalsPage(),
      ),
    );
  }
}
