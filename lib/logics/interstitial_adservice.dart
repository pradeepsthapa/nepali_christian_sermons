import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:flutter/services.dart';

class AdService{

  bool _adLoaded = false;
  get adLoaded => _adLoaded;

  int _adCount = 0;
  int get adCount => _adCount;



  void showExitAd(){
    if(adLoaded) {
      FacebookInterstitialAd.showInterstitialAd();
    }
    else SystemNavigator.pop();
  }


  void showMainAds(){
    if (adLoaded) {
      FacebookInterstitialAd.showInterstitialAd();
    }
    else if(adCount<=5) {
      print("display count is $adCount");
      loadInterstitial();
    }
  }


  void loadInterstitial(){
    FacebookInterstitialAd.loadInterstitialAd(
        placementId: "1039226436550834_1039238373216307",
        // placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
        listener: (state,args){
          switch(state){
            case InterstitialAdResult.DISPLAYED:
              _adLoaded = false;
              break;
            case InterstitialAdResult.DISMISSED:
              _adLoaded = false;
              break;
            case InterstitialAdResult.ERROR:
              print("error$args");
              break;
            case InterstitialAdResult.LOADED:
              _adLoaded = true;
              _adCount ++;
              break;
            case InterstitialAdResult.CLICKED:
              _adLoaded = false;
              break;
            case InterstitialAdResult.LOGGING_IMPRESSION:
              break;
          }
        }
    );
  }

}