import 'package:flutter/material.dart';

import 'package:flutter/src/material/navigation_rail.dart';

class BikeCollectionSideBar extends StatefulWidget {
  const BikeCollectionSideBar({Key? key}) : super(key: key);

  @override
  State<BikeCollectionSideBar> createState() => _BikeCollectionSideBarState();
}

class _BikeCollectionSideBarState extends State<BikeCollectionSideBar> {
  int _selectedindex = 1;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: NavigationRail(
          selectedIndex: _selectedindex,
          backgroundColor: const Color.fromARGB(255, 137, 140, 119),
          selectedLabelTextStyle: const TextStyle(color: Colors.white),
          unselectedLabelTextStyle: const TextStyle(color: Colors.white60),
          labelType: NavigationRailLabelType.all,
          groupAlignment: 0.4,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedindex = index;
            });
          },
          destinations: const [
            NavigationRailDestination(
              icon: Icon(null),
              label: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  "Best Sale",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            NavigationRailDestination(
              icon: Icon(null),
              label: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  "Popular",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            NavigationRailDestination(
              icon: Icon(null),
              label: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  "New Arrival",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ]),
    );
  }
}
