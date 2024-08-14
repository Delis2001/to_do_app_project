// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30,),
          Container(
            margin:const  EdgeInsets.all(20),
            height: 50,
            child: const TextField(
              decoration: InputDecoration(hintText: 'Search',prefixIcon: Icon(Icons.search,size: 30,),hintStyle: TextStyle(fontSize: 20),fillColor: Color.fromARGB(255, 243, 240, 240),filled: true,
                  border: OutlineInputBorder(borderSide: BorderSide.none,                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
          )
        ],
      ),
    );
  }
}
