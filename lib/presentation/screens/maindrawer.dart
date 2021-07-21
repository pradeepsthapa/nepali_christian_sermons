import 'dart:ui';
import 'package:ccbclibrary/logics/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'aboutapp.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = context.read(themeStateProvider);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountEmail: Text("pradeepsthapa@gmail.com", style: TextStyle(color: Colors.grey, fontSize: 12)),
            accountName: Text("Nepali Christian Teachings",
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
            currentAccountPicture: CircleAvatar(backgroundColor: Colors.transparent,
              child: Image.asset('assets/images/background/doveblue.png', height: 70, width: 70,),),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/background/drawerheader.png'), fit: BoxFit.cover),),
          ),
          ExpansionTile(
            leading: Icon(CupertinoIcons.color_filter),
            title: Text("App Color",style: TextStyle(fontSize: 12),),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 12),
                child: Wrap(
                    children: Colors.primaries.map((e) =>
                        InkWell(
                          borderRadius: BorderRadius.circular(5),
                          splashFactory: InkRipple.splashFactory,
                          onTap: ()=>theme.changeColor(colorIndex: theme.primaries.indexOf(e)),
                          child: Container(
                            padding: EdgeInsets.all(1),
                            height: 30,width: 30,
                            decoration:BoxDecoration(
                                border: theme.currentColor==theme.primaries.indexOf(e)?Border.all(width: 2,color: e):null),
                            child: Container(color: e,),),
                        )).toList()),
              )],
          ),
          SwitchListTile(title:Text('Dark Mode'),
              dense: true,
              secondary: Icon(CupertinoIcons.sun_min),
              value: theme.isDark, onChanged: (bool value)=>theme.toggleDarkMode()),
          Divider(indent: 12,endIndent: 12,thickness: 1),
          ListTile(
            dense: true,
            leading: Icon(CupertinoIcons.app),
            title: Text("More Apps"),
            onTap: ()async{
              const url = 'https://play.google.com/store/apps/developer?id=pTech';
              if(await canLaunch(url)){
                await launch(url);
              }
              else{
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(leading: Icon(CupertinoIcons.person_2),
            dense: true,
            title: Text("About"),
            onTap: ()=>Navigator.push(context, CupertinoPageRoute(builder: (_)=>AboutApp())),
          ),
          ListTile(leading: Icon(CupertinoIcons.multiply_circle),
            dense: true,
            title: Text("Exit"),
            onTap: ()=>SystemNavigator.pop(),
          ),
        ],
      ),
    );
  }
}
