
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainLoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: SpinKitCircle(
        size: 70,
        duration: const Duration(milliseconds: 700),
        itemBuilder: (_, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark?Colors.white:Theme.of(context).primaryColor,
              // color: Colors.accents[index],
            ),
          );
        },
      ),
    );
  }
}

class SearchLoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: SpinKitCubeGrid(
          duration: const Duration(milliseconds: 700),
          itemBuilder: (_, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: isDark?Colors.white:Theme.of(context).primaryColor,
                // color: Colors.accents[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ImageLoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: SpinKitRipple(
          duration: const Duration(milliseconds: 1000),
          itemBuilder: (_, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark?Colors.white:Theme.of(context).primaryColor,
              ),
            );
          }
      ),
    );
  }
}


class DetailsImageLoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRing(
        size: 100,
        duration: const Duration(milliseconds: 500),
        color: Colors.white,

      ),
    );
  }
}
