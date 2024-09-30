import 'package:flutter/material.dart';

class CityCard extends StatefulWidget {
  const CityCard({
    super.key,
  });

  @override
  State<CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'CategoryDetailsScreen');
      },
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 171,
              height: 153.2,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset('assets/images/image 1.jpg', fit: BoxFit.fill),
            ),
          ),
          const Positioned(
            top: 120,
            child: Center(
              child: SizedBox(
                height: 25,
                width: 171,
                child: Center(
                  child: Text(
                    'Giza',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      letterSpacing: .64,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
