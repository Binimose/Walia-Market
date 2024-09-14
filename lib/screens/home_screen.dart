import 'package:flutter/material.dart';
import 'package:waliamarket/model/user_detail.dart';
import 'package:waliamarket/resource/cloud_firestore.dart';
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
  List<Widget>?discount70;
  List<Widget>?discount60;
  List<Widget>?discount50;
  List<Widget>?discount0;

  @override
  void initState() {
    super.initState();
    getData();
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
  void getData() async{
    List<Widget> temp70 = await CloudFireStorre().getProductFromDiscount(70);
    List<Widget> temp60 = await CloudFireStorre().getProductFromDiscount(60);
    List<Widget> temp50 = await CloudFireStorre().getProductFromDiscount(50); 
    List<Widget> temp0 = await CloudFireStorre().getProductFromDiscount(0);
    setState(() {
      discount70 =temp70;
      discount60 = temp60;
      discount50 = temp50;
      discount0 = temp0;
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
        body:discount70 != null &&
              discount60 != null &&
              discount50 != null &&
              discount0 != null? Stack(
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
                      children: discount70!, // Ensure 'testChildern' is defined properly
                    ),
                    ProductsShowcaseListView(
                      title: "Upto 60% off",
                      children:  discount60!,
                    ),
                    ProductsShowcaseListView(
                      title: "Upto 50% off",
                      children: discount50!,
                    ),
                    ProductsShowcaseListView(
                      title: "Explore",
                      children: discount0!,
                    ),
                  ],
                ),
              ),
            ),
            UserDetail(
              offset: offset,
           
            ), // Removed 'const' from UserDetail since offset is dynamic
          ],
        ):
        const Center(child: CircularProgressIndicator())
      ),
    );
  }
}


