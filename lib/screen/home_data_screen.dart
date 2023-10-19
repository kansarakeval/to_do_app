import 'package:flutter/material.dart';
import 'package:to_do_app/model/taskmodal.dart';
import 'package:to_do_app/util/global.dart';

class HomeDataScreen extends StatefulWidget {
  const HomeDataScreen({super.key});

  @override
  State<HomeDataScreen> createState() => _HomeDataScreenState();
}

class _HomeDataScreenState extends State<HomeDataScreen> {
  bool isGrid = true;
  String dropdownValue = 'Low';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
          actions: [
            IconButton(onPressed: (){
              setState(() {
                isGrid=! isGrid;
              });

            }, icon: Icon(isGrid?Icons.list:Icons.grid_on_outlined))
          ],
        ),
        body: isGrid?ListView.builder(
          itemCount: Global.g1.todoList.length,
          itemBuilder: (context, index) {
            TaskModal taskModal = Global.g1.todoList[index];
            return InkWell(
              onTap: () {
                setState(() {
                  Global.g1.todoList.removeAt(index);
                });
              },onLongPress: (){
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: titleController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), hintText: "Title"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), hintText: "Description"),
                        ),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        items: <String>['Low', 'Medium', 'High', 'Urgent']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 15),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Global.g1.todoList[index] = TaskModal(
                              title: titleController.text,
                              description: descriptionController.text,
                              priority: dropdownValue,
                            );
                          });
                          Navigator.pop(context);
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
              child: Container(
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
                          Text("Title: ${taskModal.title}",style: TextStyle(fontSize: 20),),
                          SizedBox(height: 10,),
                          Text("description: ${taskModal.description}",style: TextStyle(fontSize: 20),),

                        ],
                      ),
                      Spacer(),
                      Text("${taskModal.priority}",style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),

              ),
            );
          },

        ):GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 120),
          itemCount: Global.g1.todoList.length,
          itemBuilder: (context, index) {
            TaskModal taskModal = Global.g1.todoList[index];
            return InkWell(
              onTap: () {
                setState(() {
                  Global.g1.todoList.removeAt(index);
                });
              },onLongPress: (){
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: titleController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), hintText: "Title"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), hintText: "Description"),
                        ),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        items: <String>['Low', 'Medium', 'High', 'Urgent']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 15),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Global.g1.todoList[index] = TaskModal(
                              title: titleController.text,
                              description: descriptionController.text,
                              priority: dropdownValue,
                            );
                          });
                          Navigator.pop(context);
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
              child: Container(
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
                          Text("Title: ${taskModal.title}",style: TextStyle(fontSize: 20),),
                          SizedBox(height: 10,),
                          Text("description: ${taskModal.description}",style: TextStyle(fontSize: 20),),

                        ],
                      ),
                      Spacer(),
                      Text("${taskModal.priority}",style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),

              ),
            );
          },

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
