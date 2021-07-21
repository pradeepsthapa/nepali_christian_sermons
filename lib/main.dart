import 'package:audio_service/audio_service.dart';
import 'package:ccbclibrary/presentation/screens/homepage.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logics/providers.dart';

void main() async {
  await FlutterDownloader.initialize(debug: true);
  await GetStorage.init();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FacebookAudienceNetwork.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = watch(themeStateProvider);

    return MaterialApp(
      themeMode: theme.getThemeMode(),
      darkTheme: ThemeData.dark().copyWith(
          accentColor: theme.swatchColor[200],
          primaryTextTheme: GoogleFonts.montserratTextTheme().copyWith(
              headline6: TextStyle(color: Colors.white,fontFamily: GoogleFonts.montserrat().fontFamily)),
          textTheme: GoogleFonts.montserratTextTheme().copyWith(
            bodyText2: TextStyle(color: Colors.white,fontFamily: GoogleFonts.montserrat().fontFamily),
            bodyText1: TextStyle(color: Colors.white,fontFamily: GoogleFonts.montserrat().fontFamily),
            subtitle1:  TextStyle(color: Colors.white,fontFamily: GoogleFonts.montserrat().fontFamily),
            caption:TextStyle(color: Colors.white,),
          )
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme(),
        primarySwatch: theme.swatchColor,
      ),
      home: AudioServiceWidget(child: HomePage()),
    );
  }
}
