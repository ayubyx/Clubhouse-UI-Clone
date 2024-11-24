import 'package:club_house_ui_2/data/data.dart';
import 'package:club_house_ui_2/widgets/room_card.dart';
import 'package:club_house_ui_2/widgets/user_profil_img.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 28,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.envelope_open,
                  size: 28,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.calendar, size: 28)),
            IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.bell, size: 28)),
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: UserProfilImage(imageUrl: currentUser.imageUrl, size: 35),
            )
          ],
        ),
        body: Stack(alignment: Alignment.center, children: [
          ListView(
              padding:
                  EdgeInsets.only(bottom: 20, left: 15, right: 15, top: 15),
              children: [...roomList.map((_room) => RoomCard(room: _room))]),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                  ])),
            ),
          ),
          Positioned(
              bottom: 40,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      backgroundColor: Theme.of(context).colorScheme.secondary),
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Start a room",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )))
        ]));
  }
}
