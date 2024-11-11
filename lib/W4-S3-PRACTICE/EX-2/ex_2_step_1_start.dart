  import 'package:flutter/material.dart';

  void main() => runApp(MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("Favorite cards"),
          ),
          body:  Column(
            children: [
              FavouriteCard(isFavourite: true,),
              FavouriteCard(isFavourite: false,),
              FavouriteCard(isFavourite: true,),
            ],
          ),
        ),
      ));

  class FavouriteCard extends StatefulWidget {
    final bool isFavourite;
    const FavouriteCard({super.key,required this.isFavourite});
    @override
    State<FavouriteCard> createState() => _FavouriteCardState();
  }

  class _FavouriteCardState extends State<FavouriteCard> {
  
    Color get buttonColor => isFavourite?Colors.red:Colors.grey;
     bool isFavourite=false;

    


    void toggle(){
      setState(() {
        isFavourite = !isFavourite;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: .5,
            ),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "title",
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text("description"),
                ],
              ),
            ),
            IconButton(
              onPressed:toggle,
              icon: Icon(
                isFavourite?Icons.favorite:Icons.favorite_outline,
                color:buttonColor,
              ),
            ),
          ],
        ),
      );
    }
  }
