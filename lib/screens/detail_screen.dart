import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.plantImagePath,
      required this.plantName,
      required this.plantPrice,
      required this.plantType,
      required this.plantAbout});
  final String plantImagePath;
  final String plantName;
  final String plantPrice;
  final String plantType;
  final String plantAbout;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int counter = 0;
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image,favorite,backbutton,number of products moved to cart
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 377,
                    decoration: const BoxDecoration(
                      color: Color(0x12193E46),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(41.0)),
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 300,
                        width: 295,
                        child: Image.asset(
                          widget.plantImagePath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  //back button
                  BackButton(
                    onPressed: () => Navigator.pop(context),
                  ),
                  // favorite button
                  Positioned(
                    right: 10,
                    child: IconButton(
                      icon: isPressed
                          ? const Icon(Icons.favorite_rounded, size: 30, color: Colors.red)
                          : const Icon(Icons.favorite_border_outlined, size: 30),
                      splashRadius: 1.0,
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                    ),
                  ),
                  // number of plants u want to buy
                  Positioned(
                    top: 330,
                    left: 130,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 24,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF193E46),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 25,
                            ),
                            onPressed: () {
                              counter++;
                              setState(
                                () {
                                  counter;
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            counter.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'PoppinsSemiBold',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF193E46),
                              ),
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 25,
                            ),
                            onPressed: () {
                              if (counter != 0) {
                                counter--;
                                setState(
                                  () {
                                    counter;
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 23.0,
                  left: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.plantName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'PoppinsSemiBold',
                      ),
                    ),
                    Text(
                      widget.plantType,
                      style: const TextStyle(
                        color: Color(0x4C000000),
                        fontSize: 17,
                        fontFamily: 'PoppinsSemiBold',
                      ),
                    ),
                  ],
                ),
              ),
              // Price
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 39,
                  width: 79,
                  padding: const EdgeInsets.only(
                    right: 14.0,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF193E46),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.plantPrice,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'PoppinsSemiBold',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              // Divider
              const Center(
                child: SizedBox(
                  width: 388,
                  child: Divider(
                    color: Color(0x4C000000),
                  ),
                ),
              ),
              // About Text
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 19.0,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'PoppinsBold',
                      ),
                    ),
                    // information of plant
                    Text(
                      widget.plantAbout,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'PoppinsRegular',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // cart button and buy button
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 64,
              width: 90,
              child: FloatingActionButton(
                heroTag: 'cart',
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0.0,
                backgroundColor: const Color(0xFFD9D9D9),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xFF193E46),
                ),
                onPressed: () {
                  // open cart page
                },
              ),
            ),
            Container(
              height: 64,
              width: 277,
              padding: const EdgeInsets.only(left: 26.0),
              child: FloatingActionButton(
                heroTag: 'buy',
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0.0,
                backgroundColor: const Color(0xFF193E46),
                child: const Text(
                  'Buy Now',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'PoppinsBold',
                  ),
                ),
                onPressed: () {
                  // buy
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
