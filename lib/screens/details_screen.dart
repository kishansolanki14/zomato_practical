import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController controller = TextEditingController();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "search here",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.red,
                  ),
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                      print(selectedIndex);
                    });
                  },
                  child: Text(
                    "Restaurants",
                    style: TextStyle(
                      fontSize: selectedIndex == 0 ? 18 : 14,
                      color: selectedIndex == 0 ? Colors.red : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                      print(selectedIndex);
                    });
                  },
                  child: Text(
                    "Dishes",
                    style: TextStyle(
                      fontSize: selectedIndex == 1 ? 18 : 14,
                      color: selectedIndex == 1 ? Colors.red : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return selectedIndex == 1 ? customDishes() : customCard();
              },
            ))
          ],
        ),
      ),
    );
  }

  Widget customCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Outer padding for the card
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.network(
                "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=1024x1024&w=is&k=20&c=faq73viCFGvfpKxcBuHcOI8kyT99B-p-jScipke-VuQ=",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Text and Info Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                // Restaurant Name
                const Text(
                  'Eat Healthy',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                // Restaurant Description
                Text(
                  'Healthy food',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8.0),
                // Additional Info
                const Text(
                  'Zomato funds environmental projects to offset delivery carbon footprint',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 16.0),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget customDishes() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(shape: BoxShape.rectangle, color: const Color.fromARGB(255, 242, 231, 244), borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Burn To Hell Pizza",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star_border, size: 16),
                              SizedBox(width: 5),
                              Text("(24)", style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "view details >",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=1024x1024&w=is&k=20&c=faq73viCFGvfpKxcBuHcOI8kyT99B-p-jScipke-VuQ=",
                        height: 100,
                        width: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "₹286",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "customizable",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
