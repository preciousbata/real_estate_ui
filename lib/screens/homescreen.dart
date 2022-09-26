import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/house_data.dart';
import '../model/house_model.dart';
import '../sizeConfig.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: buildHomeScreenBody(),
        ),
      ),
    );
  }

  Padding buildHomeScreenBody() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 8, 5, 163),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)),
            ),
            padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20), getProportionateScreenHeight(17), 0, 0),
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(20),),
                customHeader(bottom: 8, text: 'Location', size: 31, space: 0),
                customHeader(
                    bottom: 16, text: 'Liverpool, United States', size: 36, space: 0),
                customHeader(space: 1, bottom: 10, text: 'Hi Cahbagus,', size: 40),
                customHeader(
                    space: 1, bottom: 40, text: 'How can we can help you?', size: 36),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(12),
          ),
          SizedBox(
            height: getProportionateScreenHeight(50),
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                mysizedbox(
                    icon: const Icon(
                      Icons.home,
                      color: Color.fromARGB(255, 8, 5, 163),
                    ),
                    text: 'House'),
                mysizedbox(
                    icon: const Icon(
                      Icons.apartment_rounded,
                      color: Color.fromARGB(255, 8, 5, 163),
                    ),
                    text: 'Apartment'),
                mysizedbox(
                    icon: const Icon(
                      Icons.hotel_rounded,
                      color: Color.fromARGB(255, 8, 5, 163),
                    ),
                    text: 'Hotel')
              ],
            ),
          ),
           SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Near You',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 18.0),
                child: Text(
                  'View all',
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                ),
              )
            ],
          ),
           SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          SizedBox(
            height: getProportionateScreenHeight(265),
            width: double.infinity,
            child: ListView.builder(
                itemCount: Houses.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => houseCard(context, Houses[index])
                ),
          )
        ],
      ),
    );
  }

  Widget houseCard(BuildContext context, House houses) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Container(
        height: getProportionateScreenHeight(263),
        width: getProportionateScreenWidth(520),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: const Color.fromARGB(255, 8, 5, 163),
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage(houses.imageurl), fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 8),
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 8, 5, 163),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '\$${houses.price}/Month',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: Color.fromARGB(255, 8, 5, 163),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          houses.location,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        houses.name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Facilities',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.apartment,
                      size: 15,
                      color: Color.fromARGB(255, 8, 5, 163),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('1000 m'),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.bed,
                      size: 15,
                      color: Color.fromARGB(255, 8, 5, 163),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('3 Bedrooms'),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.bathtub_rounded,
                      size: 15,
                      color: Color.fromARGB(255, 8, 5, 163),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('2 Baths')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget mysizedbox({required icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: Colors.white),
        height: 50,
        width: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 6,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget customHeader(
      {required double bottom,
      required String text,
      required double size,
      required double space}) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: bottom,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(fontSize: getProportionateScreenWidth(size), letterSpacing: space, color: Colors.white),
        ),
      ),
    );
  }
}
