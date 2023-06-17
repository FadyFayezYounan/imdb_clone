import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const constImageHeight = 200.0;

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late ScrollController _scrollController;
  double? imageOpacity = 0.0;
  double imageWidth = 0.64.sw;
  double _changeableImageHeight = 200.0;
  // double imageWidth = 0.64.sw;
  // double imageHeight = 0.24.sh;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        //log('position = ${_scrollController.position.maxScrollExtent}');
        if (_scrollController.offset <=
                _scrollController.position.minScrollExtent &&
            !_scrollController.position.outOfRange) {
          log('i am at the top!');
        }
        if (_scrollController.offset <= constImageHeight) {
          setState(() {
            //imageOpacity = (_scrollController.offset) / 140;
            _changeableImageHeight =
                constImageHeight - _scrollController.offset;
            //log('imageHeight = $_changeableImageHeight');
            //log('position = ${_scrollController.position}');
            //_scrollController.position;
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
      body: Container(),
    );
  }
}
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:movies_app/config/routes/app_navigator.dart';
// import 'package:movies_app/config/routes/app_routes.dart';
// import 'package:search_choices/search_choices.dart';

// class VideosScreen extends StatefulWidget {
//   const VideosScreen({super.key});

//   @override
//   State<VideosScreen> createState() => _VideosScreenState();
// }

// class _VideosScreenState extends State<VideosScreen> {
//   String? selectedValue;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(32.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 DropdownSearch<String>(
//                   popupProps: PopupProps.menu(
//                     showSelectedItems: true,
//                     disabledItemFn: (String s) => s.startsWith('I'),
//                   ),
//                   items: const [
//                     "Brazil",
//                     "Italia (Disabled)",
//                     "Tunisia",
//                     'Canada'
//                   ],
//                   dropdownDecoratorProps: const DropDownDecoratorProps(
//                     dropdownSearchDecoration: InputDecoration(
//                       labelText: "Menu mode",
//                       hintText: "country in menu mode",
//                     ),
//                   ),
//                   onChanged: print,
//                   selectedItem: "Brazil",
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 DropdownSearch(
//                   items: ["Brazil", "France", "Tunisia", "Canada"],
//                   //dropdownSearchDecoration: const InputDecoration(labelText: "Name"),
//                   onChanged: print,

//                   selectedItem: "Tunisia",
//                   validator: (String? item) {
//                     if (item == null) {
//                       return "Required field";
//                     } else if (item == "Brazil") {
//                       return "Invalid item";
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 const Text("[simple examples for single and multi selection]"),
//                 const Divider(),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: DropdownSearch<int>(
//                         items: const [1, 2, 3, 4, 5, 6, 7],
//                         popupProps: const PopupProps.menu(
//                           showSearchBox: true,
//                           title: Text('With fit to loose and no constraints'),
//                           fit: FlexFit.loose,
//                           //comment this if you want that the items do not takes all available height
//                           constraints: BoxConstraints.tightFor(),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 const Text('New type'),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 SearchChoices.single(
//                   items: const [
//                     DropdownMenuItem(child: Text('1')),
//                     DropdownMenuItem(child: Text('2')),
//                     DropdownMenuItem(child: Text('3')),
//                     DropdownMenuItem(child: Text('4')),
//                     DropdownMenuItem(child: Text('5')),
//                   ],
//                   value: selectedValue,
//                   hint: "Select one",
//                   searchHint: null,
//                   onChanged: (value) {
//                     setState(() {
//                       selectedValue = value;
//                     });
//                   },
//                   dialogBox: false,
//                   isExpanded: true,
//                   menuConstraints:
//                       BoxConstraints.tight(const Size.fromHeight(350)),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // AppNavigator.navigateNamedTo(
//                     //     context, AppRoutesName.searchScreen);
//                   },
//                   child: const Text('go to search screen'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
