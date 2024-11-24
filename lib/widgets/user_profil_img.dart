import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserProfilImage extends StatelessWidget {
  String imageUrl;
  double size;

   UserProfilImage({
    required this.imageUrl, required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size/2 - size/10),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
}