import 'package:flutter/material.dart';
import 'package:task_manager_app/class_detail.dart';

class AddDetail extends StatefulWidget {
  const AddDetail({super.key});

  @override
  State<AddDetail> createState() => _AddDetailState();
}

class _AddDetailState extends State<AddDetail> {
  double screenWidth = 0.0;
  double screenHeight = 0.0;

  final _form = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  Future<void>_selectDate() async{
    DateTime ? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100)
      );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectTime(TextEditingController controller) async {
    TimeOfDay? picked = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
      builder: (BuildContext? context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null) {
      String hour = "";
      String min = "";



    if (picked.hour > 21){
      hour = (picked.hour - 12).toString();
    }
    else if (picked.hour > 12){
      hour = "0${picked.hour - 12}";

    }

    else if (picked.hour > 9){
      hour = (picked.hour).toString();
    }

    else{
      hour= "0${picked.hour}";
    }


      if (picked.minute > 9) {
        min = picked.minute.toString();
      } else {
        min = "0${picked.minute}";
      }

      setState(() {
        controller.text =
            "$hour:$min ${picked.period.toString().split(".")[1].toUpperCase()}";
      });
    }
  }

  void createTODO() {
    final validateStatus = _form.currentState?.validate();
    if (validateStatus!) {
      final Todo todo = Todo(
          title: _titleController.text.trim(),
          description: _descController.text.trim(),
          date: _dateController.text.trim(),
          startTime: _startTimeController.text.trim(),
          endTime: _endTimeController.text.trim(),
          category: _categoryController.text.trim());

      Navigator.pop(context, todo);
    }
  }
  Text _getTextFormFieldHeading(String text) {
    return Text(text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }
    InputDecoration _getTextFormFieldInputDecoration() {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      focusColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
  InputDecoration _getTextFormFieldInputDecorationWithIcon(Icon icon) {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      focusColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
  


  @override
  Widget build(BuildContext context) {
 return PopScope(
      canPop: false,
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Form(
              key: _form,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                              onPressed: () {
                                final Todo todo = Todo(
                                    title: "",
                                    description: "",
                                    date: "",
                                    startTime: "",
                                    endTime: "",
                                    category: "");
      
                                Navigator.pop(context, todo);
                              },
                              icon: const Icon(Icons.arrow_back)),
                        ),
                        const Text(
                          "Create New Task",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10, width: 10)
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.08,
                    ),
                    _getTextFormFieldHeading("Task Name"),
                    TextFormField(
                        controller: _titleController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Enter a title";
                          }
                          return null;
                        },
                        decoration: _getTextFormFieldInputDecoration()),
                    const SizedBox(
                      height: 20,
                    ),
                    _getTextFormFieldHeading("Category"),
                    TextFormField(
                      controller: _categoryController,
                      validator: (text){
                        if (text == null || text.isEmpty){
                          return "Enter a catergory";
                        }
                        return null;
                      },
                      decoration: _getTextFormFieldInputDecoration()),
                    const SizedBox(
                      height: 10,
                    ),
                
                    const SizedBox(
                      height: 20,
                    ),
                    _getTextFormFieldHeading("Description"),
                    SizedBox(
                      height: 100,
                      child: TextFormField(
                          controller: _descController,
                          maxLines: null,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Enter a Desc";
                            }
                            return null;
                          },
                          decoration: _getTextFormFieldInputDecoration()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _getTextFormFieldHeading("Date"),
                    TextFormField(
                      controller: _dateController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Enter a Date";
                        }
                        return null;
                      },
                      decoration: _getTextFormFieldInputDecorationWithIcon(
                          const Icon(Icons.calendar_month_outlined)),
                      readOnly: true,
                      onTap: () {
                        _selectDate();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: _getTextFormFieldHeading("Start Time")),
                        const SizedBox(width: 20),
                        Expanded(child: _getTextFormFieldHeading("End Time"))
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                              controller: _startTimeController,
                              style: const TextStyle(fontSize: 18, color: Colors.black),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return "Enter a Time";
                                }
                                return null;
                              },
                              decoration:
                                  _getTextFormFieldInputDecorationWithIcon(
                                      const Icon(Icons.timer_outlined)),
                              readOnly: true,
                              onTap: () => _selectTime(_startTimeController)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: TextFormField(
                              controller: _endTimeController,
                              style: const TextStyle(fontSize: 18, color: Colors.black),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return "Enter a Time";
                                }
                                return null;
                              },
                              decoration:
                                  _getTextFormFieldInputDecorationWithIcon(
                                      const Icon(Icons.timer_outlined)),
                              readOnly: true,
                              onTap: () => _selectTime(_endTimeController)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.10,
                    ),
                    GestureDetector(
                      onTap: createTODO,
                      child: Container(
                        alignment: Alignment.center,
                        width: screenWidth * 0.9,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Create Task",
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      )),
    );
  }
}