import 'package:flutter/material.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _controller,
             decoration: InputDecoration(
             prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Icon(Icons.arrow_back,color: Colors.blue.shade900,),
            ),
            hintText: "Search Products",
             suffixIcon: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 18.0),
               child: InkWell(
                  onTap: ()=>Navigator.pop(context),
                  child: Icon(Icons.clear)),
             )
          ),
            )
          ],
        ),
      ),
    );
  }
}
