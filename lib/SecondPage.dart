import 'package:flutter/material.dart';
import 'package:test_app/myapp.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});
  @override
  State<Secondpage> createState() => _SecondpageState();
}
class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
       const Padding(padding: EdgeInsets.symmetric(horizontal: 20),child:  Text('Start a new course'),),
        const SizedBox(height: 15,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: const EdgeInsets.all(7),
                  child:  UiHelper.CustomButton((){}, 'Featured', Colors.yellow),),
                Padding(padding: const EdgeInsets.all(7),
                  child:UiHelper.CustomButton((){}, 'Data Science', Colors.blue)),
                Padding(padding: const EdgeInsets.all(7),
                  child: UiHelper.CustomButton((){}, 'Development', Colors.orange)),
                Padding(padding: const EdgeInsets.all(7),
                  child :UiHelper.CustomButton((){}, 'Machine Learning', Colors.red)),
                Padding(padding: const EdgeInsets.all(7),
                  child: UiHelper.CustomButton((){}, 'Buisness', Colors.green),),
                const SizedBox(height: 13,),
              ],
            ),
          )
        ),
       Expanded(child: SingleChildScrollView(
           scrollDirection: Axis.vertical,
           child:Padding(
             padding: const EdgeInsets.symmetric(horizontal: 1.0 ),
             child: Column(
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 UiHelper.courseCards(),
                 const Divider(height: 1.0,),
                 UiHelper.courseCards(),
                 const Divider(height: 1.0,),
                 UiHelper.courseCards(),
                 const Divider(height: 1.0,),
                 UiHelper.courseCards(),
                 const Divider(height: 1.0,),

               ],
             ),
           )
       ))
      ],
    );
  }
}
