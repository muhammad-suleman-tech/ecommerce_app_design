import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List productList = [
    {
      "id": 1,
      "image_path": "assets/images/product1.png",
      "category": "Category1",
      "itemName": "Item Name Here"
    },
    {
      "id": 2,
      "image_path": "assets/images/product2.png",
      "category": "Category2",
      "itemName": "Item Name Here"
    },
    {
      "id": 3,
      "image_path": "assets/images/product3.png",
      "category": "Category3",
      "itemName": "Item Name Here"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
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
                                  productList[index]["image_path"].toString(),
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productList[index]["category"].toString(),
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                productList[index]["itemName"].toString(),
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
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 330,
                  height: 110,
                  child: ListTile(
                    leading: Container(
                      height: 90,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage(
                              productList[index]["image_path"].toString()),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    title: Text(
                      productList[index]["category"].toString(),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      productList[index]["itemName"].toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffB9202B)),
                      child: const Text("Button"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}
