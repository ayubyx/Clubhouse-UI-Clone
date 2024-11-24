import 'package:club_house_ui_2/models/room.dart';
import 'package:club_house_ui_2/screens/room_screen.dart';
import 'package:club_house_ui_2/widgets/user_profil_img.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoomCard extends StatelessWidget {
  Room room;
  RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RoomScreen(
                  room: room,
                ))),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${room.club} 🏠"),
                Text(
                  "${room.name}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 100,
                      child: Stack(
                        children: [
                          UserProfilImage(
                              imageUrl: room.speakers[0].imageUrl, size: 50),
                          Positioned(
                            left: 5,
                            top: 5,
                            child: UserProfilImage(
                                imageUrl: room.speakers[1].imageUrl, size: 50),
                          )
                        ],
                      ),
                    )),
                    Expanded(
                      flex: 2,
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...room.speakers.map((name) => RichText(
                                text: TextSpan(
                                    text: "${name.firstName} ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                    children: [
                                      TextSpan(
                                        text: "${name.lastName} 💬",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ]),
                              ))
                        ],
                      )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
