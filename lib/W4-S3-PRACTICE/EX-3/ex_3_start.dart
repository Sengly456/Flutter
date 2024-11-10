import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      //this line of code remove the Debug banner in the top right of the page when we debug
      home: Scaffold(
        backgroundColor: Colors.green[50],
        
        body: Picture(),
      ),
    ));
class Picture extends StatefulWidget{
  const Picture({super.key});

  @override
  State<Picture> createState() => _PictureState();
}
class _PictureState extends State<Picture>{

   int index=0;
  void nextButton(){
    setState(() {
      index=(index+1)%images.length;
    }); 
  }
  void backButton(){
    setState(() {
      index = (index - 1 + images.length) % images.length;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: [
          IconButton(
            onPressed: backButton,
            tooltip: "Go to the previous page",
            icon: const Icon(Icons.navigate_before),
          ),
          IconButton(
            onPressed: nextButton,
            tooltip: "Go to the next page",
            icon: const Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(images[index]),
      ),
    );
  }
}