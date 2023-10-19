import 'package:flutter/material.dart';

class TaskModal {
  String? priority,title,description;
  Color? color;

  TaskModal({this.priority, this.title, this.description,this.color});

  factory TaskModal.fromModel(Map t1){
    TaskModal a1 = TaskModal(
      priority: t1['priority'],
      title: t1['title'],
      description: t1['description'],
      color: t1['color']
    );
    return a1;
  }
}
