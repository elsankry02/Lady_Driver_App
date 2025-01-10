import 'package:flutter/material.dart';

class CirclerImage extends StatelessWidget {
  const CirclerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/image/medo.png'),
            radius: 56,
          ),
        ),
        Positioned(
          top: 75,
          left: 220,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffe9efed),
            ),
            alignment: Alignment.center,
            child: const Icon(
              size: 20,
              Icons.camera_alt_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
