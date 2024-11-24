import 'package:club_house_ui_2/widgets/user_profil_img.dart';
import 'package:flutter/material.dart';

class RoomUserProfil extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final double size;
  final bool isNew;
  final bool isMuted;
  RoomUserProfil({
    super.key,
    this.isNew = false,
    this.isMuted = false,
    required this.imageUrl,
    required this.size,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            UserProfilImage(imageUrl: imageUrl, size: size),
            if (isNew)
              Positioned(
                  left: 10,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Text(
                      '🎉',
                      style: TextStyle(fontSize: 14),
                    ),
                  )),
            if (isMuted)
              Positioned(
                  right: 10,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.mic_off),
                  ))
          ],
        ),
        Flexible(
            child: Text(
          userName,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ))
      ],
    );
  }
}
