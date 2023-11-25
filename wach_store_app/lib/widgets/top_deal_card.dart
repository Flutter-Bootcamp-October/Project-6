import 'package:flutter/material.dart';

class TopDealCard extends StatelessWidget {
  const TopDealCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 139,
          width: 335,
          color: Color(0xff223b66),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Unisex Casio\nVintage\n\$8690',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Crimson',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Image.asset(
                'lib/assets/images/casio.png',
                height: 170,
                width: 170,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
