import 'package:flutter/material.dart';
import 'package:waliamarket/model/user_detail.dart';
import 'package:waliamarket/utils/constants.dart';
import 'package:waliamarket/widget/ads_banner.dart';
import 'package:waliamarket/widget/catagory.dart';
import 'package:waliamarket/widget/product_List.dart';

import 'package:waliamarket/widget/search_bar.dart';
import 'package:waliamarket/widget/simple_product.dart';
import 'package:waliamarket/widget/user_detail.dart';

class HomeScreen extends StatefulWidget {
  final double offset = 0;

  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const SearchBarWidget(
          isReadOnly: true,
          hasBackButton: false,
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.grey[200], // Set the background color of the HomeScreen to grey
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                     SizedBox(height: 13,),
                    const CategoryHorizontalView(), 
                    // Ensure this widget is correctly defined
                    
                    const AdBannerWidget(), // Ensure this widget is correctly defined
                    ProductsShowcaseListView(title: "Upto 70% off", children: [
                      SimpleProductWidget(url: largeAds[0]),
                    ]),
                    ProductsShowcaseListView(title: "Upto 60% off", children: [
                      SimpleProductWidget(url: largeAds[0]),
                    ]),
                    ProductsShowcaseListView(title: "Upto 50% off", children: [
                      SimpleProductWidget(url: largeAds[0]),
                    ]),
                    ProductsShowcaseListView(title: "Explore", children: [
                      SimpleProductWidget(url: largeAds[0]),
                    ]),
                  ],
                ),
              ),
            ),
            UserDetail(offset: offset, user:User(name:'Binimose', address:"Addis Abeba")), // Removed const since offset is dynamic
          ],
        ),
      ),
    );
  }
}
