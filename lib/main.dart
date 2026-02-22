import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:evoliving/app/evoliving.dart';
import 'package:evoliving/bootstrap.dart';
import 'package:evoliving/firebase_options.dart';

void main() {
  bootstrap(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    return const EvolivingApp();
  });
}
