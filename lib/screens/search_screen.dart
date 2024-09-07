import 'package:flutter/material.dart';
import 'package:waliamarket/widget/search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  SearchBarWidget(isReadOnly:false, hasBackButton:true,)
  



    );}
}