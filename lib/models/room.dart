import 'package:club_house_ui_2/models/user.dart';

class Room {
  String club;
  String name;
  List<User> speakers;
  List<User> followedBySpeakers;
  List<User> others;
  Room(
      {required this.club,
      required this.name,
      this.speakers = const[],
       this.followedBySpeakers = const[],
       this.others = const[],
});
}
