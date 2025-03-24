import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBLoJ2gBgPSh1WBB5cQ99AMIOMuf_rOivU",
            authDomain: "responsive-kanban-board-gcc9ro.firebaseapp.com",
            projectId: "responsive-kanban-board-gcc9ro",
            storageBucket: "responsive-kanban-board-gcc9ro.firebasestorage.app",
            messagingSenderId: "394430265221",
            appId: "1:394430265221:web:8dbc2f8bad130e94ccf6ec"));
  } else {
    await Firebase.initializeApp();
  }
}
