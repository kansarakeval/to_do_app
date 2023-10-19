import 'package:flutter/material.dart';

class HomeDataScreen extends StatefulWidget {
  const HomeDataScreen({super.key});

  @override
  State<HomeDataScreen> createState() => _HomeDataScreenState();
}

class _HomeDataScreenState extends State<HomeDataScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "TO Do",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Container(
          margin: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.15,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.amber.shade100),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title:",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 10,),
                    Text("description:",style: TextStyle(fontSize: 20),),

                  ],
                ),
                Spacer(),
                Text("detailse",style: TextStyle(fontSize: 20),)
              ],
            ),
          ),

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'detail').then(
                  (value) {
                setState(() {});
              },
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
