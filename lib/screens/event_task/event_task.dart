import 'package:event_vault/database/functions/add_event_task/add_event_task.dart';
import 'package:event_vault/database/modals/event_task_model/event_task_model.dart';
import 'package:event_vault/screens/event_task/event_task_add.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/empty_list_handling/empty_list_handling.dart';
import 'package:event_vault/widgets/event_task/event_task.dart';
import 'package:event_vault/widgets/screen_task/screen_task.dart';
import 'package:flutter/material.dart';

class EventTask extends StatefulWidget {
  const EventTask({super.key, required this.eventID});
  final String eventID;

  @override
  State<EventTask> createState() => _EventTaskState();
}

class _EventTaskState extends State<EventTask> {
  List<EventTaskModel> taskList = [];

  @override
  void initState() {
    super.initState();
    eventTaskListener.addListener(getTask);
    getTask();
  }

  void getTask() {
    setState(() {
      taskList = getEventTaskByEventId(widget.eventID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Task'),
      floatingActionButton: customFloatingButton(
        context: context,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventTaskAdd(eventID: widget.eventID),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: eventTaskListener,
            builder: (context, eventTasks, child) {
              if (taskList.isEmpty) {
                return emptyList(message: 'No Task');
              } else {
                return ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    final eventTask = taskList[index];
                    return eventTaskCard(
                      context: context,
                      taskDetails: eventTask.task,
                      eventId: widget.eventID,
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
