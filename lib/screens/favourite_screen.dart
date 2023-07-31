import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: 200,
            color: Colors.amber,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: SizedBox(
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: 160,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/pic1.png"),
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
                          Positioned(
                            bottom: 10,
                            right: 5,
                            child: Container(
                              height: 30,
                              width: 40,
                              child: const Icon(
                                Icons.favorite_outline,
                                color: Color.fromARGB(255, 148, 19, 10),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    "Category",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "Item Name Here",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
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
              );
            },
          ))
        ],
      ),
    );
  }
}
