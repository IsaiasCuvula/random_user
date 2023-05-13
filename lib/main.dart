import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.DotEnv().load(fileName: "secrets.env");

  runApp(
    const ProviderScope(
      child: RandomUser(),
    ),
  );
}
