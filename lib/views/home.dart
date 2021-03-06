import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_tasks_clone/providers/task_provider.dart';
import 'package:google_tasks_clone/widgets/home/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TaskProvider state = context.watch<TaskProvider>();
    state.getData();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (state.allTasks != null)
            SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const ListTitle('Tasks'),
                  ActiveTasksList(),
                  DoneTasksList(),
                ],
              ),
            ))
        ],
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: AddTaskPanelButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
