import 'package:front_end/infrastructure/commons/constants/image_constants.dart';
import 'package:front_end/infrastructure/providers/provider_registration.dart';
import 'package:front_end/ui/commons/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:front_end/ui/screens/home/screens/explore_screen.dart';
import 'package:front_end/ui/screens/home/screens/inbox_screen.dart';
import 'package:front_end/ui/screens/home/screens/profile_screen.dart';
import 'package:front_end/ui/screens/home/screens/trips_screen.dart';
import 'package:front_end/ui/screens/home/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const ExploreScreen(),
    const WishlistScreen(),
    const TripsScreen(),
    const InboxScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // void _onItemTapped(int index) {
    //   setState(() {
    //     _selectedIndex = index;
    //   });
    // }

    final authProviderWatch = ref.watch(authProvider);
    final homeProviderWatch = ref.watch(homeProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(),
      // body: Container(
      //     margin: const EdgeInsets.only(top: 60),
      //     padding: const EdgeInsets.symmetric(horizontal: 24),
      //     child: Stack(
      //       children: [
      //         // homeProviderWatch.isBottomBarVisible
      //         //     ? ListView(
      //         //         children: [
      //         //           Column(
      //         //             children: const [
      //         //               SizedBox(height: 30),
      //         //               HomeCard(
      //         //                 displayImage:
      //         //                     'https://a0.muscache.com/im/pictures/miso/Hosting-605371928419351152/original/c8f48e8b-091d-47ea-85ac-b31bc2604bbb.jpeg?im_w=720',
      //         //                 cardName: "Pimplad Nasik, India",
      //         //                 cardDistance: "134 kilometres away",
      //         //                 cardDate: "12–19 Mar",
      //         //                 cardPrice: "₹20,697 ",
      //         //                 cardrating: '6',
      //         //               ),
      //         //               HomeCard(
      //         //                 displayImage:
      //         //                     'https://a0.muscache.com/im/pictures/miso/Hosting-605371928419351152/original/c8f48e8b-091d-47ea-85ac-b31bc2604bbb.jpeg?im_w=720',
      //         //                 cardName: "Pimplad Nasik, India",
      //         //                 cardDistance: "134 kilometres away",
      //         //                 cardDate: "12–19 Mar",
      //         //                 cardPrice: "₹20,697 ",
      //         //                 cardrating: '6',
      //         //               ),
      //         //             ],
      //         //           ),
      //         //         ],
      //         //       )
      //         //     : const SizedBox.shrink(),
      //         const SearchWidget(),
      //       ],
      //     )

      // SingleChildScrollView(
      //   child:
      //    Column(
      //     children: [
      //       Stack(
      //         children: [
      //           SearchWidget(),
      //         ],
      //       ),
      //       SizedBox(height: 20),
      //       SizedBox(height: 20),
      //       const HomeCard(
      //         displayImage:
      //             'https://a0.muscache.com/im/pictures/miso/Hosting-605371928419351152/original/c8f48e8b-091d-47ea-85ac-b31bc2604bbb.jpeg?im_w=720',
      //         cardName: "Pimplad Nasik, India",
      //         cardDistance: "134 kilometres away",
      //         cardDate: "12–19 Mar",
      //         cardPrice: "₹20,697 ",
      //         cardrating: '6',
      //       ),
      //     ],
      //   ),
      // ),
      // ),

      // body: _widgetOptions[_selectedIndex],

      body: Stack(
        children: [
          _widgetOptions[homeProviderWatch.isIndex],
          if (!homeProviderWatch.isSearchDestination && !authProviderWatch.isLoginClicked)
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationbar(),
            ),
          if (!homeProviderWatch.isBottomBarVisible && !homeProviderWatch.isSearchDestination)
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomSearchClearWidget(),
            ),
        ],
      ),

      // bottomNavigationBar: homeProviderWatch.isBottomBarVisible
      //     ? BottomNavigationBar(
      //         unselectedItemColor: const Color(0xFF222222),
      //         selectedFontSize: 10,
      //         selectedItemColor: const Color(0xFF000000),
      //         unselectedFontSize: 10,
      //         elevation: 0,
      //         onTap: _onItemTapped,
      //         currentIndex: _selectedIndex,
      //         type: BottomNavigationBarType.fixed,
      //         items: [
      //           BottomNavigationBarItem(
      //             icon: SvgPicture.asset(
      //               ImageConstants.exploreIcon,
      //               color: const Color(0xFFB0B0B0),
      //               width: 24,
      //               height: 24,
      //             ),
      //             activeIcon: SvgPicture.asset(
      //               ImageConstants.exploreIcon,
      //               color: const Color(0xFFFF385C),
      //               width: 24,
      //               height: 24,
      //             ),
      //             label: 'Explore',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: SvgPicture.asset(
      //               ImageConstants.wishlistsIcon,
      //               color: const Color(0xFFB0B0B0),
      //               width: 24,
      //               height: 24,
      //             ),
      //             activeIcon: SvgPicture.asset(
      //               ImageConstants.wishlistsIcon,
      //               color: const Color(0xFFFF385C),
      //               width: 24,
      //               height: 24,
      //             ),
      //             label: 'Wishlists',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: SvgPicture.asset(
      //               ImageConstants.tripsIcon,
      //               color: const Color(0xFFB0B0B0),
      //               width: 24,
      //               height: 24,
      //             ),
      //             activeIcon: SvgPicture.asset(
      //               ImageConstants.tripsIcon,
      //               color: const Color(0xFFFF385C),
      //               width: 24,
      //               height: 24,
      //             ),
      //             label: 'Trips',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: SvgPicture.asset(
      //               ImageConstants.inboxIcon,
      //               color: const Color(0xFFB0B0B0),
      //               width: 24,
      //               height: 24,
      //             ),
      //             activeIcon: SvgPicture.asset(
      //               ImageConstants.inboxIcon,
      //               color: const Color(0xFFFF385C),
      //               width: 24,
      //               height: 24,
      //             ),
      //             label: 'Inbox',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: SvgPicture.asset(
      //               ImageConstants.profileIcon,
      //               color: const Color(0xFFB0B0B0),
      //               width: 24,
      //               height: 24,
      //             ),
      //             activeIcon: SvgPicture.asset(
      //               ImageConstants.profileIcon,
      //               color: const Color(0xFFFF385C),
      //               width: 24,
      //               height: 24,
      //             ),
      //             label: 'Profile',
      //           ),
      //         ],
      //       )
      //     : homeProviderWatch.isSearchDestination
      //         ? SizedBox.shrink()
      //         : Container(
      //             padding: const EdgeInsets.all(24),
      //             decoration: const BoxDecoration(
      //               border: Border(
      //                 top: BorderSide(width: 1.0, color: Color.fromARGB(255, 201, 201, 201)),
      //               ),
      //             ),
      //             // height: 100,
      //             // color: Colors.amberAccent,
      //             child: Row(
      //               children: [
      //                 const AppText(title: "Clear all", fontSize: 16, fontWeight: FontWeight.w500),
      //                 const Spacer(),
      //                 Container(
      //                   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      //                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xFFD90E65)),
      //                   child: Row(
      //                     children: [
      //                       SvgPicture.asset(
      //                         ImageConstants.exploreIcon,
      //                         width: 14,
      //                         height: 14,
      //                         color: const Color(0xFFFFFFFF),
      //                       ),
      //                       const SizedBox(width: 8),
      //                       const AppText(
      //                         title: "Search",
      //                         fontSize: 16,
      //                         lineHeight: 1,
      //                         titleColor: Color(0xFFFFFFFF),
      //                       )
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
    );
  }
}

class BottomSearchClearWidget extends StatefulWidget {
  const BottomSearchClearWidget({super.key});

  @override
  State<BottomSearchClearWidget> createState() => _BottomSearchClearWidgetState();
}

class _BottomSearchClearWidgetState extends State<BottomSearchClearWidget> {
  bool hasBottomNotch = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final padding = MediaQuery.of(context).padding;
      if (padding.bottom > 0) {
        setState(() {
          hasBottomNotch = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: hasBottomNotch ? 70 : 60,
      decoration: const BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border(
          top: BorderSide(width: 1.0, color: Color.fromARGB(255, 201, 201, 201)),
        ),
      ),
      // height: 100,
      // color: Colors.amberAccent,
      child: Row(
        children: [
          const AppText(title: "Clear all", fontSize: 16, fontWeight: FontWeight.w500),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 190, 26, 31)),
            child: Row(
              children: [
                SvgPicture.asset(
                  ImageConstants.exploreIcon,
                  width: 14,
                  height: 14,
                  color: const Color(0xFFFFFFFF),
                ),
                const SizedBox(width: 8),
                const AppText(
                  title: "Search",
                  fontSize: 16,
                  lineHeight: 1,
                  titleColor: Color(0xFFFFFFFF),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
