import 'package:flutter/material.dart';
import 'package:todoflutterapp/domains/task_domain.dart';

class TypeTaskDomain {
  IconData iconType;
  String titre;
  List<TaskDomain> tasks;

  TypeTaskDomain(this.iconType, this.titre);
}
