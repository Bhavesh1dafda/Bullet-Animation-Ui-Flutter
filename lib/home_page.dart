import 'package:bullet_app/side_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _bikeAnimation = Tween<Offset>(
    begin: Offset(0.6, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  ));
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  final List<IconData> icons = [
    Icons.settings,
    Icons.handyman,
    Icons.two_wheeler_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 74, 76, 63),
      body: Stack(
        children: [
          Row(
            children: [
              BikeCollectionSideBar(),
            ],
          ),
          Positioned(
              top: 110,
              left: 25,
              child: FadeTransition(
                opacity: _animation,
                child: Text(
                  "bikee \ncollections".toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white),
                ),
              )),
          appBarWidget(),
          BikeDetailsContainer(),
          BikeImage(),
          BikeListView(),
        ],
      ),
    );
  }

  Widget BikeListView() {
    return Positioned(
      bottom: 40,
      right: 30,
      child: Container(
        height: 60,
        width: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: icons.length,
          itemBuilder: (BuildContext context, int index) {
            final icon = icons[index];
            return ScaleTransition(
              scale: _animation,
              child: Container(
                width: 60,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 137, 140, 119),
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget BikeImage() {
    return Positioned(
      bottom: 205,
      right: 5,
      child: SlideTransition(
        position: _bikeAnimation,
        child: Container(
          height: 180,
          width: 250,
          child: Image.asset(
            "assets/bike.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget BikeDetailsContainer() {
    return Positioned(
      bottom: 140,
      right: 40,
      child: FadeTransition(
        opacity: _animation,
        child: Container(
          padding: EdgeInsets.all(10),
          height: 320,
          width: 185,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 137, 140, 119),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      RotationTransition(
                        turns: _animation,
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow.shade600,
                        ),
                      ),
                      Text(
                        "4.5",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "ALL BIKES\n\$5.560",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1.2, color: Colors.white),
                    ),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget appBarWidget() {
    return Positioned(
      top: 40,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.white,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
