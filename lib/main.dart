import 'package:cafe_app_project/routes/routs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {




        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Ubuntu'),


         initialRoute:
          // FirebaseAuth.instance.currentUser != null ||
          //     GetStorage().read<bool>("auth") == true
          //     ?
          // Routes.tabel_number
         // :
          AppRoutes.welcome
         ,



          //  initialRoute: Routes.loginScreen,

          getPages: AppRoutes.routes,
          // initialBinding: AuthBinding(),
        );


  }
}
//
//
//     return Sizer(
//       child: GetMaterialApp(
//            title: 'shope',
//        debugShowCheckedModeBanner: false,
//
//           // locale: Locale(GetStorage().read<String>("lang").toString()),
//              // translations: LocaliztionApp(),
//            // fallbackLocale: Locale(ene),
//            //  theme: ThemesApp.light,
//            // darkTheme: ThemesApp.dark,
//          // themeMode: ThemeControler().themeDataGet,
//       //
//       //
//        initialRoute:AppRoutes.welcome,
//        // FirebaseAuth.instance.currentUser != null ||
//       //           // GetStorage().read<bool>('auth') == true ? AppRoutes.mainScreen : AppRoutes.welcome,
//            getPages: AppRoutes.routes
//
//
//         ),
//     );
//
//   }
// }



