// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:tute/widgets/text.dart';
import 'package:tute/widgets/text_icon_color.dart';

import '../widgets/dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  // for scaling while scrolling
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          height: 320,
          // color: Colors.red,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: Color(0xff5fc2b0),
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    ),

    SizedBox(height: Dimensions.height20,),

    Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.padding20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BigText(size: Dimensions.height20, text: 'Popular'),
          SizedBox(width: Dimensions.width10,),
          BigText(size: 15, text: '.', textColor: Colors.black38,),
          SizedBox(width: Dimensions.width10, ),
          BigText(size: 12, text: 'food pricing', textColor: Colors.black38,)
        ],
      ),
    ),


    Container(
      height: 2000,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return _listItems();
        }
        ),
    ),

      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTarns = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTarns, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index) * (1 - _scaleFactor);
      var currTarns = _height * (1 - currScale) / 2;
      // matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTarns, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTarns = _height * (1 - currScale) / 2;
      // matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTarns, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('images/food2.jpg'))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      size: 20,
                      text: 'Whatever it is',
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: Color(0xff5fc2b0),
                                    size: 20,
                                  )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        BigText(
                          size: 14,
                          text: '4.4',
                          textColor: Colors.black38,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        BigText(
                          size: 14,
                          text: '1287 comments',
                          textColor: Colors.black38,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextIconColor(
                            icon: Icons.circle_sharp,
                            iconColor: Color(0xffe3ab05),
                            text: 'Normal'),
                        
                        TextIconColor(
                            icon: Icons.location_on,
                            iconColor: Color(0xff5fc2b0),
                            text: '4.5km'),
                        
                        TextIconColor(
                            icon: Icons.access_time_rounded,
                            iconColor: Color(0xffd14f28),
                            text: '32min')
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _listItems(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
      // height: Dimensions.pageViewTextContainer,
      child: Row(
        children: [
         Container(
          width: 120,
          height: 120,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white38,
            image: DecorationImage(
              image: AssetImage('images/food2.jpg'),
              fit: BoxFit.cover
            )
          ),
         ),
        Container(
          height: 120,
          padding: EdgeInsets.only(top: 10, left: 10,bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               BigText(size: 20, text: 'Nutritious fruits meal..'),
               BigText(size: 15, text: 'Very nutritious to the body', textColor: Colors.black38,),

               Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextIconColor(
                            icon: Icons.circle_sharp,
                            iconColor: Color(0xffe3ab05),
                            text: 'Normal'),
                        
                        TextIconColor(
                            icon: Icons.location_on,
                            iconColor: Color(0xff5fc2b0),
                            text: '4.5km'),
                        
                        TextIconColor(
                            icon: Icons.access_time_rounded,
                            iconColor: Color(0xffd14f28),
                            text: '32min')
                      ],
                    )
            ],
          ),
        )
        ],
      ),
    );
  }

}
