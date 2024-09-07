import 'package:flutter/material.dart';
import 'package:waliamarket/model/user_detail.dart';
import 'package:waliamarket/utils/constants.dart';
import 'package:waliamarket/widget/ads_banner.dart';
import 'package:waliamarket/widget/catagory.dart';
import 'package:waliamarket/widget/product_List.dart';
import 'package:waliamarket/widget/search_bar.dart';
import 'package:waliamarket/widget/user_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;

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
  void dispose() {
    controller.dispose();
    super.dispose();
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
                    const SizedBox(height: 13),
                    const CategoryHorizontalView(), // Ensure this widget is correctly defined
                    const AdBannerWidget(), // Ensure this widget is correctly defined
                    ProductsShowcaseListView(
                      title: "Upto 70% off",
                      children: testChildern, // Ensure 'testChildern' is defined properly
                    ),
                    ProductsShowcaseListView(
                      title: "Upto 60% off",
                      children: testChildern,
                    ),
                    ProductsShowcaseListView(
                      title: "Upto 50% off",
                      children: testChildern,
                    ),
                    ProductsShowcaseListView(
                      title: "Explore",
                      children: testChildern,
                    ),
                  ],
                ),
              ),
            ),
            UserDetail(
              offset: offset,
           
            ), // Removed 'const' from UserDetail since offset is dynamic
          ],
        ),
      ),
    );
  }
}
