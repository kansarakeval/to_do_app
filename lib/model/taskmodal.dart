class TaskModal {
  String? priority,title,description;

  TaskModal({this.priority, this.title, this.description,});

  factory TaskModal.fromModel(Map t1){
    TaskModal a1 = TaskModal(
      priority: t1['priority'],
      title: t1['title'],
      description: t1['description'],
    );
    return a1;
  }
}
