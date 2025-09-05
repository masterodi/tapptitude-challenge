import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:tapptitude/main_screen.dart';

void main() async {
  await dotenv.load();

  String apiKey = dotenv.get('GEMINI_API_KEY');

  Gemini.init(
    apiKey: apiKey,
    generationConfig: GenerationConfig.fromJson({
      "responseMimeType": "application/json",
    }),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainScreen(),
    );
  }
}
