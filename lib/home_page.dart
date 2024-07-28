// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parallax/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController?.addListener(() {
      setState(() {
        pageOffset = pageController!.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            image: AssetImage("assets/dumbledore_fawell.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(50),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Dumbeldore's Farwell",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'timesBold',
                          fontSize: 40,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    Gap(10),
                    Text(
                      '30 March 1997',
                      style: TextStyle(
                        fontFamily: 'timesBold',
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Gap(10),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Everything was restored, presumably to its former glory. Minerva McGonagall became headmistress, and eventually Neville Longbottom took over Herbology from Professor Sprout",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'timesBold',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(50),

              //  Second part
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Highlight Paintings',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'timesBold',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 400,
                    padding: EdgeInsets.only(bottom: 30),
                    child: PageView.builder(
                        itemCount: paintings.length,
                        controller: pageController,
                        itemBuilder: (context, index) {
                          print(-pageOffset.abs());
                          return Transform.scale(
                            scale: 1,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                right: 30,
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      paintings[index]['image'],
                                      height: 370,
                                      width: 340,
                                      fit: BoxFit.cover,
                                      alignment: Alignment(-pageOffset.abs() + index, 0),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    bottom: 20,
                                    right: 10,
                                    child: Text(
                                      paintings[index]['name'],
                                      style: TextStyle(
                                        fontFamily: 'timesBold',
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
