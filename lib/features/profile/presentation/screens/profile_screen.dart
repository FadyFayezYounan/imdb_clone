import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ScrollController _scrollController;
  double? titleOpacity = 0.0;
  double _changeableImageHeight = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset <= 200) {
          setState(() {
            titleOpacity = (_scrollController.offset) / 200;
            //log('title opacity = $titleOpacity');
            log('image height = $_changeableImageHeight');
          });
        }
        if (_scrollController.offset <= 200) {
          setState(() {
            _changeableImageHeight = 200 - _scrollController.offset;
          });
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            collapsedHeight: 60,
            floating: false,
            pinned: true,
            //TODO: set your background here
            backgroundColor: Colors.blueGrey,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              collapseMode: CollapseMode.parallax,
              title: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: titleOpacity ?? 0.0,
                //TODO: set your titlt here.
                child: const Text(
                  "song title",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              background: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  Image.network(
                    "https://img.freepik.com/free-photo/front-view-girl-with-headphones_23-2148630908.jpg?w=900&t=st=1676214733~exp=1676215333~hmac=a5d3d0e7f2f94177c760b029d8c953c380574fbd63ce621a991d94c94f1fe720",
                    fit: BoxFit.cover,
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          //width: 50,
                          height: _changeableImageHeight,
                          duration: const Duration(milliseconds: 100),
                          child: Image.network(
                            "https://img.freepik.com/free-photo/front-view-girl-with-headphones_23-2148630908.jpg?w=900&t=st=1676214733~exp=1676215333~hmac=a5d3d0e7f2f94177c760b029d8c953c380574fbd63ce621a991d94c94f1fe720",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(height: 1000, color: Colors.teal),
                Container(height: 1000, color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// import 'dart:developer';

// import 'package:flutter/material.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   late ScrollController _scrollController;
//   double? titleOpacity = 0.0;
//   double _changeableImageHeight = 200.0;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController()
//       ..addListener(() {
//         if (_scrollController.offset <= 200) {
//           setState(() {
//             titleOpacity = (_scrollController.offset) / 200;
//             //log('title opacity = $titleOpacity');
//             log('image height = $_changeableImageHeight');
//           });
//         }
//         if (_scrollController.offset <= 200) {
//           setState(() {
//             _changeableImageHeight = 200 - _scrollController.offset;
//           });
//         }
//       });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 200.0,
//             collapsedHeight: 60,
//             floating: false,
//             pinned: true,
//             //TODO: set your background here
//             backgroundColor: Colors.blueGrey,
//             flexibleSpace: FlexibleSpaceBar(
//               centerTitle: false,
//               collapseMode: CollapseMode.parallax,
//               title: AnimatedOpacity(
//                 duration: const Duration(milliseconds: 100),
//                 opacity: titleOpacity ?? 0.0,
//                 //TODO: set your titlt here.
//                 child: const Text(
//                   "song title",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.0,
//                   ),
//                 ),
//               ),
//               background: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AnimatedContainer(
//                     //width: 50,
//                     height: _changeableImageHeight,
//                     duration: const Duration(milliseconds: 100),
//                     child: Image.network(
//                       "https://img.freepik.com/free-photo/front-view-girl-with-headphones_23-2148630908.jpg?w=900&t=st=1676214733~exp=1676215333~hmac=a5d3d0e7f2f94177c760b029d8c953c380574fbd63ce621a991d94c94f1fe720",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 Container(height: 1000, color: Colors.teal),
//                 Container(height: 1000, color: Colors.blue),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




//*****************************************************************************
// import 'dart:developer';

// import 'package:flutter/material.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   late ScrollController _scrollController;
//   double? titleOpacity = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController()
//       ..addListener(() {
//         //log("Current position: ${_scrollController.offset}");
//         if (_scrollController.offset <= 140) {
//           setState(() {
//             titleOpacity = (_scrollController.offset) / 140;
//             log('title opacity = $titleOpacity');
//           });
//         }
//       });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 200.0,
//             collapsedHeight: 60,
//             floating: false,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               centerTitle: false,
//               collapseMode: CollapseMode.parallax,
//               title: AnimatedOpacity(
//                 duration: const Duration(milliseconds: 400),
//                 opacity: titleOpacity ?? 0.0,
//                 child: const Text(
//                   "Collapsing Toolbar",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.0,
//                   ),
//                 ),
//               ),
//               background: Image.network(
//                 "https://img.freepik.com/premium-psd/3d-render-mobile-phone-scene-blue-microphone-headphones-mockup-concept-music-app_612350-165.jpg?w=1060",
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 Container(height: 1000, color: Colors.teal),
//                 Container(height: 1000, color: Colors.blue),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
