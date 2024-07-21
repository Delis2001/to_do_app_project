// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppBarIcon extends StatefulWidget {
  const AppBarIcon({super.key});

  @override
  State<AppBarIcon> createState() => _AppBarIconState();
}

class _AppBarIconState extends State<AppBarIcon> {
  @override
  Widget build(BuildContext context) {
    return AppBar(leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios_new_rounded)),);
  }
}
class AppBarIcons extends StatefulWidget {
  const AppBarIcons({super.key});

  @override
  State<AppBarIcons> createState() => _AppBarIconsState();
}

class _AppBarIconsState extends State<AppBarIcons> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(leading: IconButton(
        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 235, 232, 232))),
        onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios_new_rounded)),);
  }
}
class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Expanded(
            child: _isSearching
                ? TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _isSearching = false;
                            _searchController.clear();
                          });
                        },
                      ),
                    ),
                    onChanged: (value) {
                      // Handle search logic
                      print('Search input: $value');
                    },
                  )
                : Container(),
          );
    
   
  }
}
   