// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tute/home/food_page_body.dart';
import 'package:tute/widgets/text.dart';

class HomeFoodPage extends StatefulWidget {
  const HomeFoodPage({super.key});

  @override
  State<HomeFoodPage> createState() => _HomeFoodPageState();
}

class _HomeFoodPageState extends State<HomeFoodPage> {
  @override
  Widget build(BuildContext context) {
    // print('current width is' + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Column(
        children: [
          //header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 65, bottom: 15),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        size: 20,
                        text: 'Welcome',
                        textColor: Color(0xff5fc2b0),
                        fontWeight: FontWeight.w600,
                      ),
                      Row(
                        children: [
                          BigText(size: 13, text: 'Sammy', textColor: Color(0xff373837),),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Color(0xff5fc2b0),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Icon(Icons.search,color: Colors.white, size: 30,),
                    ),
                  )
                ],
              ),
            ),
          ),
       // body
        Expanded(child: SingleChildScrollView(
          child: FoodPageBody(),
        )),
        ],
      ),
    );
  }
}
