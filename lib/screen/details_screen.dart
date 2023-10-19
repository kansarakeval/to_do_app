import 'package:flutter/material.dart';
import 'package:to_do_app/model/taskmodal.dart';
import 'package:to_do_app/util/global.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String dropdownValue = 'Low';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Details",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
          actions: [
            IconButton(onPressed: (){
              TaskModal taskModal = TaskModal(
                title: titleController.text,
                description: descriptionController.text,
                priority: dropdownValue,
              );
              setState(() {
                taskModal.title=titleController.text;
                taskModal.description=descriptionController.text;
                taskModal.priority=dropdownValue;
              });
              Global.g1.todoList.add(taskModal);
              Navigator.pop(context);
            }, icon: Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
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
              SizedBox(height: 15,),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'description',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
