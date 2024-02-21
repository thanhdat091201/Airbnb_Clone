import 'package:front_end/data/data.dart';
import 'package:front_end/infrastructure/providers/provider_registration.dart';
import 'package:front_end/infrastructure/utills/route_constants.dart';
import 'package:front_end/model/room.dart';
import 'package:front_end/ui/commons/text_widget/app_text.dart';
import 'package:front_end/ui/screens/home/screens/widgets/drag_handle_bottom_sheet.dart';
import 'package:front_end/ui/screens/home/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeBottomSheet extends ConsumerStatefulWidget {
  final ScrollController controller;
  final PanelController panelController;

  const HomeBottomSheet({super.key, required this.controller, required this.panelController});

  @override
  ConsumerState<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends ConsumerState<HomeBottomSheet> {

  List<Room> rooms = [];

  @override
  void initState() {
    super.initState();
    fetchRooms();
  }

  Future<void> fetchRooms() async {
    try {
      final fetchedRooms = await ReadData().fetchRoomsByCategory("1"); 
      setState(() {
        rooms = fetchedRooms;
      });
    } catch (error) {
      print('Đã xảy ra lỗi: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // margin: const EdgeInsets.only(bottom: 100),
          child: ListView(
            controller: widget.controller,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const DragHandleBottomSheet(),
              GestureDetector(
                onTap: () {
                  widget.panelController.open();
                },
                child: Container(
                    padding: const EdgeInsets.only(top: 21, bottom: 21),
                    child: const AppText(
                        title: "565 countryside homes",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        titleTextAlign: TextAlign.center)),
              ),
              for (var i = 0; i < rooms.length; i++)
                HomeCard(
                  displayImage: rooms[i].displayImage,
                  cardName: rooms[i].cardName,
                  cardDistance: rooms[i].cardDistance,
                  cardDate: rooms[i].cardDate,
                  cardPrice: rooms[i].cardPrice,
                  cardRating: rooms[i].cardRating,
                  addToFavorites: () {
                  // final roomId = rooms[i].roomId;
                  // addToFavorites(room);
                  },
                  onTap: () {
                    ref.read(homeProvider).recentData = i;
                    Navigator.pushNamed(context, RouteConstants.detailsScreen);
                  },
                  
                ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }
}

const data = [
  {
    "category" : "1",
    "displayImage":
        "https://a0.muscache.com/im/pictures/miso/Hosting-605371928419351152/original/c8f48e8b-091d-47ea-85ac-b31bc2604bbb.jpeg?im_w=720",
    "cardName": "Pimplad Nasik, India",
    "cardDistance": "134 kilometres away",
    "cardDate": "12–19 Jun",
    "cardPrice": "20,69 ",
    "cardrating": "6"
  },
  {
    "category" : "1",
    "displayImage": "https://a0.muscache.com/im/pictures/82e3a044-9e2a-4555-9bee-608a862b3c59.jpg?im_w=720",
    "cardName": "Baa Atoll, Maldies",
    "cardDistance": "767 kilometres away",
    "cardDate": "20–29 Jun",
    "cardPrice": "15,55 ",
    "cardrating": "6"
  },
  {
    "category" : "1",
    "displayImage": "https://a0.muscache.com/im/pictures/3f6b83e1-694f-4fcf-a522-53746fcdf5fe.jpg?im_w=720",
    "cardName": "South Athol Maldives",
    "cardDistance": "990 kilometres away",
    "cardDate": "19-24 Jun",
    "cardPrice": "82,55 ",
    "cardrating": "6"
  },
  {
    "category" : "1",
    "displayImage":
        "https://a0.muscache.com/im/pictures/miso/Hosting-636070119680439851/original/26c46614-4bea-4f2b-9e9d-e09c51b35764.jpeg?im_w=720",
    "cardName": "Olhuveli, Maldives",
    "cardDistance": "883 kilometres away",
    "cardDate": "18–23 Jun",
    "cardPrice": "14,13 ",
    "cardrating": "8"
  }
];
