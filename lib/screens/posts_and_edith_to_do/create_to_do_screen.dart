// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/models/to_do_model.dart';
import 'package:to_do_app/providers/to_do_provider.dart';

class CreateToDoScreen extends StatefulWidget {
  const CreateToDoScreen({super.key});

  @override
  State<CreateToDoScreen> createState() => _CreateToDoScreenState();
}

class _CreateToDoScreenState extends State<CreateToDoScreen> {
  final TextEditingController contentController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  void _handleSubmitted(Widget value) {
    print('Text submitted: $value');
    // Handle the submission here, e.g., update state, make API call, etc.
  }

  //for calender
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _focusedDay = DateTime.now();

  void _pickDateTime() async {
    DateTime? pickedDate;

    // Pick a date
    await showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Container(
          height: 500,
          width: double.infinity,
          child: Column(
            // Ensures column takes minimum space
            children: [
              Expanded(
                child: TableCalendar(
                  daysOfWeekVisible: true,
                  firstDay: DateTime.utc(2000, 1, 1), // Arbitrary past date
                  lastDay: DateTime.utc(2100, 12, 31), // Arbitrary future date
                  focusedDay: _focusedDay,
                  calendarFormat: CalendarFormat.month,
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;
                      _focusedDay = selectedDay;
                    });
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDate, day);
                  },
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    outsideDecoration: BoxDecoration(color: Colors.white),
                    defaultTextStyle: TextStyle(color: Color(0xff6F24E9)),
                    defaultDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    tableBorder:
                        TableBorder(borderRadius: BorderRadius.circular(5)),
                    todayDecoration: BoxDecoration(
                      color: const Color.fromARGB(255, 206, 206, 206),
                      shape: BoxShape.rectangle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Color(0xff6F24E9),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    titleTextStyle: TextStyle(color: Colors.black),
                    titleCentered: true,
                    formatButtonVisible: false,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                      style: TextButton.styleFrom(
                        side: BorderSide(color: Color(0xff6F24E9)),
                        fixedSize: Size(132, 48),
                        backgroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Spacing between buttons
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: ElevatedButton(
                      onPressed: () {
                        pickedDate = _selectedDate;
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Choose Time',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(132, 48),
                        backgroundColor: Color(0xff6F24E9),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate!;
      });

      // Pick a time

      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
      );

      if (pickedTime != null && pickedTime != _selectedTime) {
        setState(() {
          _selectedTime = pickedTime;
        });
      }
      showDialog<void>(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AlertDialog(
                shape: ShapeBorder.lerp(LinearBorder(), LinearBorder(),
                    BorderSide.strokeAlignInside),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${DateFormat.yMMMd().format(_selectedDate)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' ${_selectedTime.format(context)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              final title = titleController.text.trim();
              final content = contentController.text.trim();
              if (title.isNotEmpty && content.isNotEmpty) {
                final todo = ToDoModel(title: title, content: content);
                Provider.of<ToDoProvider>(context, listen: false)
                    .addCategory(todo);
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('ToDo'),
        actions: [
          Image.asset(
            height: 35,
            'assets/images/vector3.png',
            color: Color(0xff6F24E9),
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Image.asset(
              height: 20,
              color: Color(0xff6F24E9),
              'assets/images/delete.png',
                       ),
           ),
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: Image.asset(
              height: 2,
              color: Color(0xff6F24E9),
              'assets/images/delete.png',
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            /* Text(
              'Selected Date: ${DateFormat.yMMMd().format(_selectedDate)}',style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Selected Time: ${_selectedTime.format(context)}',style: TextStyle(fontWeight: FontWeight.bold),
            ),*/
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextField(
                controller: titleController,
                cursorColor: Color(0xff6F24E9),
                enabled: true,
                enableSuggestions: true,
                autofocus: true,
                showCursor: true,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(fontSize: 25),
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextField(
                controller: contentController,
                cursorColor: Color(0xff6F24E9),
                enableSuggestions: true,
                autofocus: true,
                showCursor: true,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'ToDo...',
                 hintStyle: TextStyle(color: Color(0xff6F24E9),),
                  icon: Image.asset('assets/images/ellipse.png'),
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                /*  Visibility(visible: _selectedDate != null && _selectedTime != null,child: Container(
    child: Column(children: [
   Text(
              ' ${DateFormat.yMMMd().format(_selectedDate)}',style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '${_selectedTime.format(context)}',style: TextStyle(fontWeight: FontWeight.bold),
            ),
],),
               ),),*/

                IconButton(
                    onPressed: () {
                      _pickDateTime();
                    },
                    icon: Icon(Icons.alarm_outlined)),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/tag.png',
                      color: Color(0xff6F24E9),
                    )),
                Text(
                  'category',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          children: [
                            Column(
                              children: [
                                ListTile(
                                    leading: Image.asset(
                                      'assets/images/tag.png',
                                      color: Color(0xff6F24E9),
                                    ),
                                    title: Text(
                                      'all categories',
                                      style:
                                          TextStyle(color: Color(0xff6F24E9)),
                                    )),
                                ListTile(
                                  leading: Icon(
                                    Icons.add,
                                    color: Color(0xff6F24E9),
                                  ),
                                  title: Text(
                                    'new category',
                                    style: TextStyle(color: Color(0xff6F24E9)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: Color(0xff6F24E9),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
