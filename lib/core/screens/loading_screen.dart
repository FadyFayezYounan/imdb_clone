import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/utils.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key, this.isWidget = false});
  final bool isWidget;

  @override
  Widget build(BuildContext context) {
    if (isWidget) {
      return _buildLoadingIndicator();
    }
    return Scaffold(
      body: _buildLoadingIndicator(),
    );
  }

  Center _buildLoadingIndicator() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator.adaptive(),
          SizedBox(
            height: 16.0,
          ),
          Text(AppStrings.loading),
        ],
      ),
    );
  }
}


// class InfoBannerActionsFb1 extends StatelessWidget {
//   final Icon icon;
//   final Color primaryColor;
//   final List<TextButton> actions;
//   final String text;

//   const InfoBannerActionsFb1(
//       {required this.icon, required this.actions, required this.text, this.primaryColor = Colors.blue, Key? key})
//       : super(key: key) ;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: MaterialBanner(
//         content: Text(text, style: TextStyle(color: primaryColor),),
//         leading: CircleAvatar(child: icon,backgroundColor: primaryColor,),
//         actions: actions,
//       ),
//     );
//   }
// }