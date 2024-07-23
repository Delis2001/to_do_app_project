// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CreateToDoScreen extends StatefulWidget {
  
  const CreateToDoScreen({super.key});

  @override
  State<CreateToDoScreen> createState() => _CreateToDoScreenState();
}

class _CreateToDoScreenState extends State<CreateToDoScreen> {
  //for calender
   DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _focusedDay = DateTime.now();

  Future<void> _pickDateTime() async {
    DateTime? pickedDate;

    // Pick a date
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Date'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width*0.9, // Ensures width constraints
            height: 400, // Set a fixed height for the calendar
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ensures column takes minimum space
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
                        _focusedDay = focusedDay;
                      });
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDate, day);
                    },
                    calendarStyle: CalendarStyle( 
                      outsideDecoration: BoxDecoration(color: Colors.white),
                      
                      defaultTextStyle: TextStyle(color: Colors.white),
                      defaultDecoration: BoxDecoration(color: Color(0xff6F24E9),borderRadius: BorderRadius.circular(5),), 
                      tableBorder: TableBorder(borderRadius: BorderRadius.circular(5)), 
                      todayDecoration: BoxDecoration(
                        color:Color(0xff6F24E9),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color:Color(0xff6F24E9),
                        shape: BoxShape.circle,
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                      style: TextButton.styleFrom(
                        fixedSize: Size(130, 48),
                         backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(width: 8), // Spacing between buttons
                    ElevatedButton(
                      onPressed: () {
                        pickedDate = _selectedDate;
                        Navigator.pop(context);
                      },
                      child: Text('Choose Time',style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(130, 48),
                      backgroundColor: Color(0xff6F24E9),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back)),
        title: Text('ToDo'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset('assets/images/vector3.png',color: Color(0xff6F24E9),),
          ),
          Icon(Icons.delete_forever_outlined,color: Color(0xff6F24E9),),
        ],
      ),
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SizedBox(height: 20),
            Text(
              'Selected Date: ${DateFormat.yMMMd().format(_selectedDate)}',style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Selected Time: ${_selectedTime.format(context)}',style: TextStyle(fontWeight: FontWeight.bold),
            ),
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Text('Title'),
        ),
        Padding(
         padding: const EdgeInsets.only(left: 15),
         child: TextField(
           cursorColor: Color(0xff6F24E9),
           enabled: true,
           enableSuggestions: true,
           showCursor: true,
           maxLines: null,
           keyboardType: TextInputType.multiline,
           decoration: InputDecoration(
            icon:Image.asset('assets/images/ellipse.png'),
           border: UnderlineInputBorder(borderSide: BorderSide.none),
           ),
         ),
       ),
        Spacer(),
        Row(children: [ 
          IconButton(onPressed: (){
         _pickDateTime();
          }, icon: Icon(Icons.alarm_outlined)),
          IconButton(onPressed: (){}, icon: Image.asset('assets/images/tag.png',color: Color(0xff6F24E9),)),
            Text('category',style: TextStyle(fontWeight: FontWeight.bold),),
              IconButton(onPressed: (){
             showDialog(context: context, builder: (context) => SimpleDialog(
                children: [
                Column(children: [
                  ListTile(
                    onTap: () {
                      showDialog(context: context, builder: (context) => SimpleDialog(children: [
                      ListTile(leading:   Image.asset(
                        color:  Color(0xff6F24E9),
                        'assets/images/tag.png',),title:  Text('all categories',style: TextStyle(color:Color(0xff6F24E9) )),),
                      ListTile(leading:   Image.asset('assets/images/tag.png',),title: Text('Kodex'),), 
                       ListTile(leading:   Image.asset('assets/images/tag.png',),title: Text('Webstack'),),
                        ListTile(leading:   Image.asset('assets/images/tag.png',),title: Text('Univyerse'),),
                         ListTile(leading:  Image.asset('assets/images/tag.png',),title: Text('Lorem Iposum'),),
                    ListTile(leading:   Image.asset('assets/images/tag.png',),title: Text('Nunc ac'),),
                     ListTile(leading: Icon(Icons.add,color: Color(0xff6F24E9),),title: Text('new category',style:TextStyle(color: Color(0xff6F24E9)),),)
                      ],),);
                    },
                    leading:  Image.asset('assets/images/tag.png',color: Color(0xff6F24E9),),title:  Text('all categories',style: TextStyle(color: Color(0xff6F24E9)),)),
                   ListTile(leading: Icon(Icons.add,color: Color(0xff6F24E9),)  ,title: Text('new category',style:TextStyle(color: Color(0xff6F24E9)),),)
                ],)
              ],),);
            
              }, icon: Icon(Icons.keyboard_arrow_up_outlined,color: Color(0xff6F24E9),))],),
      ],),),
    );
  }
}