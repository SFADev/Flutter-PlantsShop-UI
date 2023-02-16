import 'package:flutter/material.dart';

postShape(String plantName, plantPrice, plantAsset, plantType) {
  return Container(
    height: 243,
    width: 178,
    decoration: BoxDecoration(
      color: const Color(0x12193E46),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            plantAsset,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    plantName,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'PoppinsSemiBold',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    plantType,
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'PoppinsSemiBold',
                      color: Color(0x4C000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 6.0,
            right: 21.0,
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              plantPrice,
              style: const TextStyle(
                fontSize: 13.0,
                fontFamily: 'PoppinsSemiBold',
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
