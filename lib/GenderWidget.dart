import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {

  final Function(int) onChange;

  const GenderWidget({super.key,required this.onChange});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {

  int _gender = 0;

  final ChoiceChip3DStyle selectedStyle =  ChoiceChip3DStyle(
      topColor: Colors.grey[200]!,
      backColor: Colors.grey,
      borderRadius: BorderRadius.circular(20)
  );


  final ChoiceChip3DStyle unSelectedStyle =  ChoiceChip3DStyle(
      topColor: Colors.white,
      backColor: Colors.grey[300]!,
      borderRadius: BorderRadius.circular(20)
  );


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
              style: _gender == 1 ? selectedStyle : unSelectedStyle,
              onSelected: (){
              setState(() {
                _gender = 1;
              });
              widget.onChange(_gender);

              },
              onUnSelected: (){},
            selected: _gender == 1,
              child: Column(
                children: [
                  Image.asset('assets/Images/man.png',width: 50,),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('Male'),
                ],
              ),),

          const SizedBox(width: 20,),
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style:_gender == 2 ? selectedStyle : unSelectedStyle,
            onSelected: (){
              setState(() {
                _gender = 2;
              });
              widget.onChange(_gender);
            },
            onUnSelected: (){},
            selected: _gender == 2,
            child: Column(
              children: [
                Image.asset('assets/Images/woman.png',width: 50,),
                const SizedBox(
                  height: 5,
                ),
                const Text('Woman'),
              ],
            ),)
        ],
      ),
    );
  }
}
