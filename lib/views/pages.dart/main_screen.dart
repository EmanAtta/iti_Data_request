import 'package:application_2/models/user_model.dart';
import 'package:application_2/services/user_service.dart';
import 'package:flutter/material.dart';

class main_screen extends StatefulWidget {
  const main_screen({super.key});

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  List<DataCompleted> AllData = [];
  bool isLoading = true;

  getAllData() async {
    AllData = await Dataservice().getDataComplted();
    isLoading = false;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: AllData.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(AllData[index].title ?? '--'),
                subtitle: Text(AllData[index].completed.toString()),
              );
            },
          );
  }
}
