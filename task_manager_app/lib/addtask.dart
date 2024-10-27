import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:const Color.fromARGB(255, 150, 187, 248) ,
        appBar: AppBar(
          backgroundColor: Colors.blue ,
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
          centerTitle: true,
          title:const Text('QuickTask'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
        body: const Padding(
          
          padding: EdgeInsets.all(10),
          child: Text('Task ToDo',
          style: TextStyle(
            color: Color.fromARGB(255, 68, 136, 245),
            fontWeight: FontWeight.bold,
            fontSize: 30
            ),
          ), 
            
        ),
        floatingActionButton: Container(
        child: ElevatedButton(
          onPressed: (){

        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add,color: Colors.black,size: 40,),
            SizedBox(width: 5,),
            Text(
              'Add Task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
        ),
        
    
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
      )
    );
  }
}