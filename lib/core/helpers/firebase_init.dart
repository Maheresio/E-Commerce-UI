import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

import '../../firebase_options.dart';

Future<void> firebaseInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    await Wakelock.enable();

}
