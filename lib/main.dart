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
  ///initialize local storage]]
  await GetStorage.init();
  await Supabase.initialize(
    url: 'https://wnbyrajtmznlukhmgykj.supabase.co',
    anonKey: 'your_anon_key_here',
  ).then((_) {
    Get.put(AuthenticationRepository());
  });


  runApp(const App());
}
