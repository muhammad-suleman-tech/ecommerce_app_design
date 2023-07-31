import 'package:ecommerce_app/Widgets/myContainer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imageList = [
    {"id": 1, "image_path": "assets/images/slider.png"},
    {"id": 2, "image_path": "assets/images/slider.png"},
    {"id": 3, "image_path": "assets/images/slider.png"},
  ];
  List productList = [
    {
      "image_path": "assets/images/product1.png",
      "category": "Category1",
      "itemName": "Item Name Here"
    },
    {
      "image_path": "assets/images/product2.png",
      "category": "Category2",
      "itemName": "Item Name Here"
    },
    {
      "image_path": "assets/images/product3.png",
      "category": "Category3",
      "itemName": "Item Name Here"
    },
  ];
  List bestSellerProducts = [
    {
      "imagePath": "assets/images/pic1.png",
      "category": "Category1",
      "itemName": "Item Name Here",
      "fullPrice": "0.00",
      "discountPrice": "0.00"
    },
    {
      "imagePath": "assets/images/pic2.png",
      "category": "Category2",
      "itemName": "Item Name Here",
      "fullPrice": "0.00",
      "discountPrice": "0.00"
    },
    {
      "imagePath": "assets/images/pic3.png",
      "category": "Category3",
      "itemName": "Item Name Here",
      "fullPrice": "0.00",
      "discountPrice": "0.00"
    },
    {
      "imagePath": "assets/images/pic4.png",
      "category": "Category3",
      "itemName": "Item Name Here",
      "fullPrice": "0.00",
      "discountPrice": "0.00"
    },
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  int price = 5;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                // Logo Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF0F6F8),
                          borderRadius: BorderRadius.circular(8)),
                      height: 40,
                      width: 40,
                      child: const Icon(
                        Icons.menu,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo2.png"),
                          // fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF0F6F8),
                          borderRadius: BorderRadius.circular(8)),
                      height: 40,
                      width: 40,
                      child: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 3,
                ),
                const Divider(color: Colors.grey),
                const SizedBox(
                  height: 5,
                ),
                // Tags
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MyContainer(
                        text: "    All   ",
                      ),
                      MyContainer(
                        text: "Clothing",
                      ),
                      MyContainer(
                        text: "Accessories",
                      ),
                      MyContainer(
                        text: "Hats",
                      ),
                      MyContainer(
                        text: "Furnitures",
                      ),
                      MyContainer(
                        text: "Beauty Items",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Divider(color: Colors.grey),
                const SizedBox(
                  height: 5,
                ),

                Stack(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: CarouselSlider(
                          items: imageList
                              .map(
                                (item) => Image.asset(
                                  item['image_path'],
                                  fit: BoxFit.fitWidth,
                                  // width: double.infinity,
                                ),
                              )
                              .toList(),
                          carouselController: carouselController,
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            // height: MediaQuery.of(context).size.height / 3.5,
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            aspectRatio: 2,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Container(
                              height: 4.0,
                              width: 20.0,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 3.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentIndex == entry.key
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),

                const Row(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text(
                      "Best Seller",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // Best Seller Products
                SizedBox(
                  height: 280,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: bestSellerProducts.length,
                    itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Stack(
                            children: [
                              Container(
                                height: 200,
                                width: 160,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        bestSellerProducts[index]
                                                ["imagePath"]
                                            .toString()),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 7,
                                left: 7,
                                child: Container(
                                  height: 21,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.circular(3)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text( "\$ ${bestSellerProducts[index]
                                                  ["discountPrice"]}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 10,
                                right: 5,
                                child: SizedBox(
                                  height: 30,
                                  width: 40,
                                  child: Icon(
                                    Icons.favorite_outline,
                                    color: Color.fromARGB(255, 148, 19, 10),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          bestSellerProducts[index]["category"].toString(),
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          bestSellerProducts[index]["itemName"].toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Text(
                                "\$${bestSellerProducts[index]["fullPrice"]}",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                                "\$${bestSellerProducts[index]
                                            ["discountPrice"]}",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 156, 29, 19),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600))
                          ],
                        )
                      ],
                    ),
                  );
                    },
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Arrival",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          color: Color.fromARGB(255, 173, 37, 27),
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 15,
                ),
        // New Arrival Products
                SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: bestSellerProducts.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.66,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              // height: 280,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 190,
                                    // width: 370,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(bestSellerProducts[index]["imagePath"].toString()),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 7,
                                    left: 7,
                                    child: Container(
                                      height: 21,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(3)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          "-\$0.00",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    bottom: 10,
                                    right: 5,
                                    child: SizedBox(
                                      height: 30,
                                      width: 40,
                                      child: Icon(
                                        Icons.favorite_outline,
                                        color: Color.fromARGB(255, 148, 19, 10),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 3,),
                            const Text(
                              "Category",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 3,),
                            const Text(
                              "Item Name Here",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 3,),
                            const Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            const Row(
                              children: [
                                Text("\$0.00",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("\$0.00",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 156, 29, 19),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600))
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 80,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xff17A2B8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 30,
                        width: 60,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/shipping.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Free Shipping Over \$0",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                          Text("Free Return and Exchange",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "What's Trending",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    Text(
                      "View All >",
                      style: TextStyle(
                          color: Color.fromARGB(255, 173, 37, 27),
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                // Slider products
                SizedBox(
                  height: 70,
                  width: 340,
                  // alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: productList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: SizedBox(
                          height: 60,
                          width: 330,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          productList[index]["image_path"]
                                              .toString(),
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productList[index]["category"]
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        productList[index]["itemName"]
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffB9202B)),
                                child: const Text("Button"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                // News Letter
                Container(
                  height: 260,
                  width: double.infinity,
                  color: const Color(0xFFF0F6F8),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "GRAB OUR NEWSLETTER",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Get the latest fashion trend on your inbox!",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Enter Your Email",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff89999F), width: 1))),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffB9202B)),
                          child: const Text("SUBSCRIBE"),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "By clicking on subscribe button you agree to accept",
                        style: TextStyle(
                            color: Color(0xff89999F),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "to accept",
                            style: TextStyle(
                                color: Color(0xff89999F),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Privacy Policy!",
                            style: TextStyle(
                                color: Color(0xffB9202B),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
