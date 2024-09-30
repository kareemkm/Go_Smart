import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
    required this.image,
  });
  final String image;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 314,
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(16),
                right: Radius.circular(16),
              ),
              backgroundBlendMode: BlendMode.clear),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 16,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xffFFFBFE),
            ),
          ),
        ),
      ],
    );
  }
}
