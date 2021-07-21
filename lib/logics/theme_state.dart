import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_storage/get_storage.dart';

class MainTheme extends ChangeNotifier{

  MainTheme(){
    loadInitial();
  }

  final _box = GetStorage();
  bool _isDark = false;
  int _colorIndex = 0;
  Brightness get platformBrightness => SchedulerBinding.instance!.window.platformBrightness;

  final List<MaterialColor> primaries = <MaterialColor>[Colors.red, Colors.pink, Colors.purple, Colors.deepPurple, Colors.indigo, Colors.blue, Colors.lightBlue, Colors.cyan, Colors.teal, Colors.green, Colors.lightGreen, Colors.lime, Colors.yellow, Colors.amber, Colors.orange, Colors.deepOrange, Colors.brown, Colors.blueGrey,];


  void loadInitial(){
    _box.writeIfNull('darkMode', false);
    _box.writeIfNull('colorIndex', 0);
    _isDark = _box.read('darkMode');
    _colorIndex = _box.read('colorIndex');
    notifyListeners();
  }

  ThemeMode getThemeMode(){
    if(platformBrightness==Brightness.dark) return ThemeMode.dark;
    else {
      if(isDark) return ThemeMode.dark;
      else return ThemeMode.light;
    }
  }

  void toggleDarkMode(){
    _isDark =! isDark;
    _box.write('darkMode', _isDark);
    notifyListeners();
  }


  void changeColor({@required colorIndex}){
    _colorIndex = colorIndex;
    _box.write('colorIndex', _colorIndex);
    notifyListeners();
  }

  bool get isDark => _isDark;
  int get currentColor => _colorIndex;
  MaterialColor get swatchColor => primaries[currentColor];

}