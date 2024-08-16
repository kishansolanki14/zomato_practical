import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/screens/components/menu.dart';
import 'package:zomato_clone/screens/details_screen.dart';
import 'package:zomato_clone/static_data.dart';

class DeliveryScreen extends StatelessWidget {
  DeliveryScreen({super.key});

  final List<String> options = ["Jain Food", "Rating: 4.0+", "Pure Veg", "Gourment", "Cuisines"];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset("asset/zomato_bg.png"),
              Column(
                children: [
                  header(size),
                  searchBar(size),
                  SizedBox(
                    height: size.height / 4.8,
                  ),
                  const Text(
                    "EXPLORE",
                    style: TextStyle(letterSpacing: 4),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  explore(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "WHAT'S ON YOUR MIND?",
                    style: TextStyle(letterSpacing: 3),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  itemsList(size),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: optionsAvailable(size),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Center(
                    child: Text(
                      "69 restaurants delivering to you",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        //fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      "Featured",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                  restaurantsAvailable(size),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget restaurantsAvailable(Size size) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: restaurantList.length,
      itemBuilder: (context, index) {
        return itemBuilder(size, index, context);
      },
    );
  }

  Widget itemBuilder(Size size, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
      child: GestureDetector(
        onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DetailsScreen())),
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(18),
          child: SizedBox(
            height: size.height / 2.5,
            width: size.width / 1.1,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: size.height / 4,
                      width: size.width / 1.1,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                        image: DecorationImage(image: NetworkImage(restaurantList[index].imageUrl ?? ""), fit: BoxFit.cover),
                      ),
                    ),
                    const Positioned(
                      right: 10,
                      top: 5,
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 24,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.visibility_off,
                            size: 24,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height / 12,
                  width: size.width / 1.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurantList[index].title ?? "",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        height: size.height / 28,
                        width: size.width / 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${restaurantList[index].rating ?? ""} ★",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width / 1.2,
                  child: Text(
                    "${restaurantList[index].locations}   \t\t\t\t\t\t\t\t\t\t\t\t\t\t  ${restaurantList[index].price} for one",
                    style: const TextStyle(
                      fontSize: 12.9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemsList(Size size) {
    return SizedBox(
      height: size.height / 3.25,
      width: size.width,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: foodItemList.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            childAspectRatio: 1.7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DetailsScreen())),
              child: SizedBox(
                height: size.height / 3,
                width: size.width / 5,
                child: Column(
                  children: [
                    Container(
                      height: size.height / 10,
                      width: size.height / 10,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            foodItemList[index].imageUrl ?? "",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      foodItemList[index].name ?? "",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget optionsAvailable(Size size) {
    return SizedBox(
      height: size.height / 15,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: options.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height / 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    )),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(options[index]),
              ),
            );
          }),
    );
  }

  Widget searchBar(Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Container(
              height: size.height / 15,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width / 40,
                  ),
                  const Icon(Icons.search, color: Colors.red),
                  SizedBox(
                    width: size.width / 20,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: InputBorder.none, hintText: "search"),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'VEG',
                      style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w900),
                      children: <TextSpan>[
                        TextSpan(text: '\nMODE', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 10,
                width: 15,
                child: Transform.scale(
                  scale: 0.5,
                  child: Switch(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: false,
                    onChanged: (val) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget header(Size size) {
    return SizedBox(
      height: size.height / 10,
      width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.location_on,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Add Your Location Here",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                image: ExactAssetImage('asset/language.png'),
                fit: BoxFit.cover,
              ),
            ),
            height: 35,
            width: 35,
          ),
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 18,
            child: TextButton(
              onPressed: () {},
              child: const Center(
                  child: Text(
                "K",
                style: TextStyle(fontSize: 16),
              )),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget explore() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: exploreItemsList.length,
          padding: const EdgeInsets.only(left: 15),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DetailsScreen())),
              child: Padding(
                padding: const EdgeInsets.only(right: 6),
                child: SizedBox(
                  height: 110,
                  width: 100,
                  child: Card(
                    surfaceTintColor: Colors.white,
                    color: Colors.white,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  exploreItemsList[index].imageUrl ?? "",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            exploreItemsList[index].title ?? "",
                            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                          Text(
                            exploreItemsList[index].subTitle ?? "",
                            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 8),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
