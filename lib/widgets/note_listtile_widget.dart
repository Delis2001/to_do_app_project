import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/note_category_provider.dart';

class NotesWidget extends StatefulWidget {
  const NotesWidget({super.key});

  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteCategoryProvider>(builder: (context, NoteCategoryProvider, child) {
            return ListView.builder(
                    scrollDirection:Axis.vertical,
                    itemCount: NoteCategoryProvider.note.length,
                    itemBuilder: (context, index) {
                    final note = NoteCategoryProvider.note[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: (){
                            Navigator.of(context).pop();
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        tileColor: Color(0xffD9D9D9),
                        trailing: GestureDetector(
                          onTap: (){
            showDialog(context: context, builder: (context) =>SimpleDialog(
            shape: ShapeBorder.lerp(LinearBorder(), LinearBorder(), BorderSide.strokeAlignInside),
            children: [Row(children: [
            IconButton(onPressed: (){
              Navigator.of(context).pop();
            }, icon: Icon(Icons.cancel,color: Color(0xff6F24E9),size: 30,)),
            Text('1 Note Selected'),
             Spacer(),
            IconButton(onPressed: (){}, icon: Image.asset(
                     color:  Color(0xff6F24E9),
                     'assets/images/pin.png',),),
             IconButton(onPressed: (){
            NoteCategoryProvider.removeCategory(index);
             }, icon:  Image.asset(
                     color:  Color(0xff6F24E9),
                     'assets/images/delete.png',),),
              IconButton(onPressed: (){}, icon:  Image.asset(
                     color:  Color(0xff6F24E9),
                     'assets/images/tag.png',),),
                             ],)],));
                          },
                          child: ImageIcon(Image.asset('assets/images/dots.png').image)),
                        title: Text(note.title!,style: TextStyle(fontWeight: FontWeight.bold),),subtitle: Text(note.content!),),
                    );
                  },);
            },);
    
     
  }
}