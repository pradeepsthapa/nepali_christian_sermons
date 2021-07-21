import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black12,
          elevation: 0),
      body: Ink(decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColorLight
              ])),
        child: InkWell(
          onTap: (){},
          splashColor: Theme.of(context).primaryColor,
          child: Stack(
            children: <Widget>[
              Positioned(bottom: 0,
                  child: Image.asset('assets/images/background/aboutapp.png',height: 200)),
              Positioned(top: 100,left: 0,right: 0,
                child: Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Card(
                          color: Colors.black38,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                          child: InkWell(
                            onTap: (){},borderRadius: BorderRadius.circular(9),
                            splashColor: Colors.black87,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 50, 40, 40),
                              child: Column(children: <Widget>[
                                Text("About", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight:FontWeight.w500,decoration: TextDecoration.underline),),
                                Text("\nयस एपमा पूरानो र नयाँ करारका विभिन्न पुस्तकका पाठहरु नेपाली र अग्रेंजी भाषामा छन् । यदि तपाईंसँग कुनै प्रश्न वा सल्लाह छ भने कृपया मलाई निम्न ठेगानामा सम्पर्क गर्नुहोला । प्रभु येशू ख्रीष्टको अनुग्रह तपाईसँग रहोस् ।",
                                  textAlign: TextAlign.justify,style: TextStyle(color: Colors.white),),
                                Text("\nPradeep Thapa",style: TextStyle(color: Colors.white)),
                                Text("pradeepsthapa@gmail.com",style: TextStyle(color: Colors.white70,fontSize: 10)),
                              ],),
                            ),
                          ),),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
