// import 'package:flutter/material.dart';

// class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
//   final double height;

//   CustomAppBar({required this.height});

//   @override
//   _CustomAppBarState createState() => _CustomAppBarState();

//   @override
//   Size get preferredSize => Size.fromHeight(height);
// }

// class _CustomAppBarState extends State<CustomAppBar> {
//   ScrollController _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blueAccent,
//       // height: widget.height,
//       child: ListView.builder(
//         controller: _scrollController,
//         scrollDirection: Axis.horizontal,
//         itemCount: 5, // replace with the number of items in your app bar
//         itemBuilder: (BuildContext context, int index) {
//           // return GestureDetector(
//           //     onTap: () {
//           //       // handle tap on the item
//           //     },
//           //     onHorizontalDragUpdate: (details) {
//           //       // update scroll position on horizontal drag
//           //       _scrollController.jumpTo(
//           //         _scrollController.position.pixels - details.delta.dx,
//           //       );
//           //     },
//           //     child: Container(
//           //         color: Colors.amber,
//           //         width: MediaQuery.of(context).size.width * 0.5, // replace with the width of your item
//           //         child: Text("slkdjfklsjfklsjk")));

//           return Container(
//             // height: 20,
//             // width: 10,
//             color: Colors.amber,
//             child: Text("data"),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class CustomAppbar extends StatefulWidget {
//   const CustomAppbar({super.key});

//   @override
//   State<CustomAppbar> createState() => _CustomAppbarState();
// }

// class _CustomAppbarState extends State<CustomAppbar> {
//   ScrollController _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(

//         onHorizontalDragUpdate: (details) {
//           print('details');
//         },
//         child: Container(
//           padding: const EdgeInsets.only(top: 80.0),
//           child: ListView.builder(
//               controller: _scrollController,
//               scrollDirection: Axis.horizontal,
//               itemCount: 10,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   margin: EdgeInsets.only(left: 10),
//                   height: 20,
//                   decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//                   padding: EdgeInsets.all(20),
//                   child: Text("data"),
//                 );
//               }),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
//   final double height;

//   CustomAppBar({required this.height});

//   @override
//   _CustomAppBarState createState() => _CustomAppBarState();

//   @override
//   Size get preferredSize => Size.fromHeight(height);
// }

// class _CustomAppBarState extends State<CustomAppBar> {
//   final ScrollController _scrollController = ScrollController();
//   final List<GlobalKey> _itemKeys = List.generate(
//     5, // replace with the number of items in your app bar
//     (_) => GlobalKey(),
//   );

//   int _selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance!.addPostFrameCallback((_) {
//       _scrollToSelected();
//     });
//     _scrollController.addListener(() {
//       int newIndex = _calculateNewIndex();
//       if (newIndex != _selectedIndex) {
//         setState(() {
//           _selectedIndex = newIndex;
//         });
//       }
//     });
//   }

//   int _calculateNewIndex() {
//     int newIndex = 0;
//     double minDistance = double.infinity;
//     for (int i = 0; i < _itemKeys.length; i++) {
//       RenderBox itemBox = _itemKeys[i].currentContext!.findRenderObject() as RenderBox;
//       Offset itemPosition = itemBox.localToGlobal(Offset.zero);
//       double distance = (itemPosition.dx - _scrollController.offset).abs();
//       if (distance < minDistance) {
//         minDistance = distance;
//         newIndex = i;
//       }
//     }
//     return newIndex;
//   }

//   void _scrollToSelected() {
//     final RenderBox selectedBox = _itemKeys[_selectedIndex].currentContext!.findRenderObject() as RenderBox;
//     final double selectedLeft = selectedBox.localToGlobal(Offset.zero).dx;
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenCenter = screenWidth / 2;
//     final double scrollOffset = selectedLeft - screenCenter;
//     _scrollController.jumpTo(scrollOffset);
//     print(_scrollController);
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(_scrollController);
//     return Container(
//       height: widget.height,
//       child: ListView.builder(
//         controller: _scrollController,
//         scrollDirection: Axis.horizontal,
//         itemCount: 5, // replace with the number of items in your app bar
//         itemBuilder: (BuildContext context, int index) {
//           final bool isSelected = index == _selectedIndex;
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 _selectedIndex = index;
//               });
//               _scrollToSelected();
//               // handle tap on the item
//             },
//             key: _itemKeys[index],
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.5, // replace with the width of your item
//               decoration: BoxDecoration(
//                 border: isSelected
//                     ? Border(
//                         bottom: BorderSide(
//                           width: 2,
//                           color: Colors.blue, // replace with your selected item color
//                         ),
//                       )
//                     : null,
//               ),
//               child: Center(
//                 child: Text(
//                   'Item $index', // replace with your item content
//                   style: TextStyle(
//                     color: isSelected ? Colors.blue : Colors.grey, // replace with your item color
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// // working
// import 'package:flutter/material.dart';

// class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
//   final double height;

//   CustomAppBar({required this.height});

//   @override
//   _CustomAppBarState createState() => _CustomAppBarState();

//   @override
//   Size get preferredSize => Size.fromHeight(height);
// }

// class _CustomAppBarState extends State<CustomAppBar> {
//   final ScrollController _scrollController = ScrollController();
//   final List<GlobalKey> _itemKeys = List.generate(
//     5, // replace with the number of items in your app bar
//     (_) => GlobalKey(),
//   );

//   int _selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _scrollToSelected();
//     });
//     _scrollController.addListener(() {
//       print(_scrollController);
//       int newIndex = _calculateNewIndex();
//       if (newIndex != _selectedIndex) {
//         setState(() {
//           _selectedIndex = newIndex;
//         });
//       }
//     });
//   }

//   int _calculateNewIndex() {
//     int newIndex = 0;
//     double minDistance = double.infinity;
//     for (int i = 0; i < _itemKeys.length; i++) {
//       RenderBox itemBox = _itemKeys[i].currentContext!.findRenderObject() as RenderBox;
//       Offset itemPosition = itemBox.localToGlobal(Offset.zero);
//       double distance = (itemPosition.dx - _scrollController.offset).abs();
//       if (distance < minDistance) {
//         minDistance = distance;
//         newIndex = i;
//       }
//     }
//     return newIndex;
//   }

//   void _scrollToSelected() {
//     final RenderBox selectedBox = _itemKeys[_selectedIndex].currentContext!.findRenderObject() as RenderBox;
//     final double selectedLeft = selectedBox.localToGlobal(Offset.zero).dx;
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenCenter = screenWidth / 2;
//     final double scrollOffset = selectedLeft - screenCenter;
//     _scrollController.jumpTo(scrollOffset);
//     print(_scrollController);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.height,
//       child: ListView.builder(
//         controller: _scrollController,
//         scrollDirection: Axis.horizontal,
//         itemCount: 5, // replace with the number of items in your app bar
//         itemBuilder: (BuildContext context, int index) {
//           final bool isSelected = index == _selectedIndex;
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 _selectedIndex = index;
//               });
//               _scrollToSelected();
//               // handle tap on the item
//             },
//             key: _itemKeys[index],
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.5, // replace with the width of your item
//               decoration: BoxDecoration(
//                 border: isSelected
//                     ? Border(
//                         bottom: BorderSide(
//                           width: 2,
//                           color: Colors.blue, // replace with your selected item color
//                         ),
//                       )
//                     : null,
//               ),
//               child: Center(
//                 child: Text(
//                   'Item $index', // replace with your item content
//                   style: TextStyle(
//                     color: isSelected ? Colors.blue : Colors.grey, // replace with your item color
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:flutter/material.dart';

// class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
//   final double height;

//   CustomAppBar({required this.height});

//   @override
//   _CustomAppBarState createState() => _CustomAppBarState();

//   @override
//   Size get preferredSize => Size.fromHeight(height);
// }

// class _CustomAppBarState extends State<CustomAppBar> {
//   final ScrollController _scrollController = ScrollController();
//   final List<GlobalKey> _itemKeys = List.generate(
//     5, // replace with the number of items in your app bar
//     (_) => GlobalKey(),
//   );

//   int _selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance!.addPostFrameCallback((_) {
//       _scrollToSelected();
//     });
//     _scrollController.addListener(() {
//       int newIndex = _calculateNewIndex();
//       if (newIndex != _selectedIndex) {
//         setState(() {
//           _selectedIndex = newIndex;
//         });
//       }
//     });
//   }

//   int _calculateNewIndex() {
//     int newIndex = _selectedIndex;
//     double minDistance = double.infinity;
//     for (int i = 0; i < _itemKeys.length; i++) {
//       RenderBox itemBox = _itemKeys[i].currentContext!.findRenderObject() as RenderBox;
//       Offset itemPosition = itemBox.localToGlobal(Offset.zero);
//       double distance = (itemPosition.dx - _scrollController.offset).abs();
//       if (distance < minDistance) {
//         minDistance = distance;
//         newIndex = i;
//       }
//     }
//     return newIndex;
//   }

//   void _scrollToSelected() {
//     final RenderBox selectedBox = _itemKeys[_selectedIndex].currentContext!.findRenderObject() as RenderBox;
//     final double selectedLeft = selectedBox.localToGlobal(Offset.zero).dx;
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenCenter = screenWidth / 2;
//     final double scrollOffset = selectedLeft - screenCenter;
//     _scrollController.jumpTo(scrollOffset);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.height,
//       child: ListView.builder(
//         controller: _scrollController,
//         scrollDirection: Axis.horizontal,
//         itemCount: 5, // replace with the number of items in your app bar
//         itemBuilder: (BuildContext context, int index) {
//           final bool isSelected = index == _selectedIndex;
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 _selectedIndex = index;
//               });
//               _scrollToSelected();
//               // handle tap on the item
//             },
//             key: _itemKeys[index],
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.5, // replace with the width of your item
//               decoration: BoxDecoration(
//                 border: isSelected
//                     ? const Border(
//                         bottom: BorderSide(
//                           width: 2,
//                           color: Colors.blue, // replace with your selected item color
//                         ),
//                       )
//                     : null,
//               ),
//               child: Center(
//                 child: Text(
//                   'Item $index', // replace with your item content
//                   style: TextStyle(
//                     color: isSelected ? Colors.blue : Colors.grey, // replace with your item color
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   final _pageController = PageController(initialPage: 0);
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Horizontal scroll
//           SizedBox(
//             height: 150,
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: 5,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _selectedIndex = index;
//                       _pageController.animateToPage(
//                         _selectedIndex,
//                         duration: Duration(milliseconds: 500),
//                         curve: Curves.easeInOut,
//                       );
//                     });
//                   },
//                   child: Container(
//                     width: 100,
//                     margin: EdgeInsets.symmetric(horizontal: 10),
//                     decoration: BoxDecoration(
//                       color: _selectedIndex == index ? Colors.blue : Colors.grey,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'Container $index',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           // Selected container animation
//           AnimatedContainer(
//             duration: Duration(milliseconds: 500),
//             curve: Curves.easeInOut,
//             transform: Matrix4.translationValues(
//               _selectedIndex * -120.0, // Container width + margin
//               0,
//               0,
//             ),
//             child: Container(
//               width: 100,
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   'Selected',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyWidget11 extends StatefulWidget {
//   const MyWidget11({super.key});

//   @override
//   State<MyWidget11> createState() => _MyWidget11State();
// }

// class _MyWidget11State extends State<MyWidget11> {
//   bool showFirstContainer = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       children: [
//         SizedBox(height: 140),
//         Stack(
//           children: [
//             showFirstContainer
//                 ? Container(
//                     // First container content
//                     width: 200,
//                     height: 100,
//                     color: Colors.blue,
//                     child: AppText(title: "onee", fontSize: 20),
//                   )
//                 : Container(
//                     color: Colors.brown,
//                     // Second container content
//                     width: 200,
//                     height: 100,
//                     child: AppText(title: "secondddd 111", fontSize: 20),
//                   ),
//             AnimatedPositioned(
//               duration: Duration(milliseconds: 300),
//               left: showFirstContainer ? MediaQuery.of(context).size.width : 0,
//               child: Container(
//                   // // Second container content
//                   // width: 200,
//                   // color: Colors.orange,
//                   // height: 100,
//                   // child: AppText(title: "three", fontSize: 20),
//                   ),
//             ),
//           ],
//         ),
//         GestureDetector(
//           onTap: () {
//             print("object");
//             setState(() {
//               showFirstContainer = !showFirstContainer;
//               print(showFirstContainer);
//             });
//           },
//           child: Center(
//             child: Container(
//               // Button content
//               height: 200,
//               color: Colors.amber,
//               child: AppText(title: "bttttt", fontSize: 20),
//             ),
//           ),
//         )
//       ],
//     ));
//   }
// }

// class MYappp extends StatefulWidget {
//   const MYappp({super.key});

//   @override
//   State<MYappp> createState() => _MYapppState();
// }

// class _MYapppState extends State<MYappp> {
//   bool isSelected = true;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 200,
//         ),
//         isSelected
//             ? Container(
//                 height: 150,
//                 width: double.infinity,
//                 color: Colors.amber,
//                 child: AppText(title: "title", fontSize: 20),
//               )
//             : Container(
//                 height: 150,
//                 width: double.infinity,
//                 color: Colors.red,
//                 child: AppText(title: "title2", fontSize: 20),
//               ),
//         ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 isSelected = !isSelected;
//               });
//             },
//             child: AppText(title: 'btttt', fontSize: 20))
//       ],
//     );
//   }
// }

class MYappp extends StatefulWidget {
  const MYappp({super.key});

  @override
  State<MYappp> createState() => _MYapppState();
}

class _MYapppState extends State<MYappp> {
  bool isSelected = true;
  double _slideValue = 0.0;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
      _slideValue = isSelected ? 0.0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 200),
        Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(
                MediaQuery.of(context).size.width * (_slideValue - 1),
                0,
                0,
              ),
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.amber,
                child: const AppText(title: "title", fontSize: 20),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(
                MediaQuery.of(context).size.width * _slideValue,
                0,
                0,
              ),
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.red,
                child: const AppText(title: "title2", fontSize: 20),
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: _toggleSelection,
          child: const AppText(title: 'btttt', fontSize: 20),
        ),
      ],
    );
  }
}
