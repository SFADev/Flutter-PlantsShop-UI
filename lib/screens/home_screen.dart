import 'package:flutter/material.dart';
import 'package:plant_app_ui/widgets/post_widget.dart';
import 'package:plant_app_ui/screens/screens_export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List listOfPosts = [
    {
      'name': 'Dragon Tree',
      'price': '150\$',
      'type': 'indoor',
      'image': 'assets/Plant1.png',
      'about': 'Coming sooon',
    },
    {
      'name': 'Aloe Vera',
      'price': '40\$',
      'type': 'indoor',
      'image': 'assets/Plant2.png',
      'about': 'Coming sooon',
    },
    {
      'name': 'Cacti',
      'price': '200\$',
      'type': 'indoor',
      'image': 'assets/Plant3.png',
      'about': 'Coming sooon',
    },
    {
      'name': 'Sweetheart ',
      'price': '35\$',
      'type': 'outdoor',
      'image': 'assets/Plant4.png',
      'about': 'Coming sooon',
    },
  ];

  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: Center(
            child: SizedBox(
              height: 250,
              width: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      'assets/plant-pattern.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Text(
                    'This is a drawer :D',
                    style: TextStyle(fontSize: 16, fontFamily: 'PoppinsRegular'),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            size: 30,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                height: 36,
                width: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.asset('assets/profile-pic.png'),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 15.0,
                    left: 15.0,
                    bottom: 80.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // text
                      const SizedBox(
                        width: 157,
                        height: 76,
                        child: Text(
                          "Let's find your plants!",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 25, fontFamily: 'PoppinsSemiBold'),
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      // serch and button
                      Row(
                        children: [
                          Container(
                            height: 65,
                            width: 264,
                            padding: const EdgeInsets.only(
                              right: 14.0,
                              left: 14.0,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              children: const [
                                SizedBox(
                                  width: 14,
                                ),
                                Icon(
                                  Icons.search,
                                  color: Color(0x7F000000),
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 9,
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search plants...',
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'PoppinsRegular',
                                      color: Color(0x7F000000),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 39,
                          ),
                          Container(
                            height: 65,
                            width: 76,
                            decoration: BoxDecoration(
                              color: const Color(0xff193E46),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Icon(
                              Icons.menu_open_rounded,
                              size: 33.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // Posts
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listOfPosts.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: postShape(
                              listOfPosts[index]["name"],
                              listOfPosts[index]["price"],
                              listOfPosts[index]["image"],
                              listOfPosts[index]["type"],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    plantName: listOfPosts[index]["name"],
                                    plantPrice: listOfPosts[index]["price"],
                                    plantImagePath: listOfPosts[index]["image"],
                                    plantType: listOfPosts[index]["type"],
                                    plantAbout: listOfPosts[index]["about"],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            // bottom navigation bar
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: size.width,
                height: 80,
                child: Stack(
                  // overflow: Overflow.visible,
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomShape(),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(
                          backgroundColor: const Color(0xFF193E46),
                          elevation: 0.1,
                          onPressed: () {},
                          child: const Icon(Icons.document_scanner_outlined)),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            splashColor: Colors.transparent,
                            icon: Icon(
                              Icons.home_filled,
                              color: currentIndex == 0 ? const Color(0xFF193E46) : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(0);
                            },
                          ),
                          IconButton(
                              splashColor: Colors.transparent,
                              icon: Icon(
                                Icons.favorite_rounded,
                                color: currentIndex == 1 ? const Color(0xFF193E46) : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(1);
                              }),
                          Container(
                            width: size.width * 0.20,
                          ),
                          IconButton(
                              splashColor: Colors.transparent,
                              icon: Icon(
                                Icons.shopping_cart_rounded,
                                color: currentIndex == 2 ? const Color(0xFF193E46) : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(2);
                              }),
                          IconButton(
                              splashColor: Colors.transparent,
                              icon: Icon(
                                Icons.person_3_rounded,
                                color: currentIndex == 3 ? const Color(0xFF193E46) : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(3);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// custom shape for bottom navigation bar
class BNBCustomShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start
    path.quadraticBezierTo(size.width * 0.20, 25, size.width * 0.35, 25);
    path.quadraticBezierTo(size.width * 0.60, 25, size.width * 0.65, 25);
    path.quadraticBezierTo(size.width * 0.80, 20, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
