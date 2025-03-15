import 'package:e_commerce/upload_test.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'data/repositries/authentication/authentication_repositry.dart';
import 'preferred_size_widgets/app.dart';
Future<void> main() async{
  // initialize firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  //
  ///widget binding
  final WidgetsBinding widgetsBinding= WidgetsFlutterBinding.ensureInitialized();

  ///Await splash until other item load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  ///initialize local storage
  await GetStorage.init();
  await Supabase.initialize(
    url: 'https://wnbyrajtmznlukhmgykj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InduYnlyYWp0bXpubHVraG1neWtqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg5MDg5OTEsImV4cCI6MjA1NDQ4NDk5MX0.0nWt1X6DwYq2jzGomFDoqOg-Y7PeK-DsQsm_mmF3brc',
  ).then((_) {
    Get.put(AuthenticationRepository());
  });

  print("✅ Supabase Initialized: ${Supabase.instance.client.auth.currentUser?.id}");



  runApp( const App());
}
