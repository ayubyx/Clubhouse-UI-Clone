import 'dart:math';

import 'package:club_house_ui_2/data/data.dart';
import 'package:club_house_ui_2/models/room.dart';
import 'package:club_house_ui_2/widgets/room_user_profil.dart';
import 'package:club_house_ui_2/widgets/user_profil_img.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoomScreen extends StatelessWidget {
  Room room;
  RoomScreen({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: Row(
          children: [
            IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  CupertinoIcons.chevron_down,
                  size: 28,
                )),
            Text(
              "Hallway",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.doc,
                size: 28,
              )),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: UserProfilImage(imageUrl: currentUser.imageUrl, size: 35),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${room.club}"),
                        Icon(CupertinoIcons.ellipsis)
                      ],
                    ),
                    Text(
                      "${room.name}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                sliver: SliverGrid.count(
                  crossAxisCount: 3,
                  children: [
                    ...room.speakers.map((speaker) => RoomUserProfil(
                        isNew: Random().nextBool(),
                        isMuted: Random().nextBool(),
                        userName: speaker.firstName,
                        imageUrl: speaker.imageUrl,
                        size: 60))
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  "Followed By Speakers",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                sliver: SliverGrid.count(
                  mainAxisSpacing: 10,
                  crossAxisCount: 4,
                  children: [
                    ...room.followedBySpeakers.map((e) => RoomUserProfil(
                        isNew: Random().nextBool(),
                        isMuted: Random().nextBool(),
                        userName: e.firstName,
                        imageUrl: e.imageUrl,
                        size: 60))
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  "Others in room",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                sliver: SliverGrid.count(
                  mainAxisSpacing: 10,
                  crossAxisCount: 4,
                  children: [
                    ...room.others.map((e) => RoomUserProfil(
                        isNew: Random().nextBool(),
                        isMuted: Random().nextBool(),
                        userName: e.firstName,
                        imageUrl: e.imageUrl,
                        size: 60))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
       bottomSheet: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        height: 90,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('✌ Leave quitly',
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
              style: TextButton.styleFrom(backgroundColor: Colors.grey[300]),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                  ),
                  style:
                      IconButton.styleFrom(backgroundColor: Colors.grey[300]),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.hand_raised,
                  ),
                  style:
                      IconButton.styleFrom(backgroundColor: Colors.grey[300]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
