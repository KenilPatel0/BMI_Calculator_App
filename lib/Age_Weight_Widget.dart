import 'package:flutter/material.dart';

class AgeWeightWidget extends StatefulWidget {

  final Function(int) onChange;
  final String title;
  final int intValue;
  final int min;
  final int max;
  const AgeWeightWidget({super.key,
    required this.onChange,
    required this.title,
    required this.intValue,
    required this.max,
    required this.min,
  });

  @override
  State<AgeWeightWidget> createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {

  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.intValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
    child: Card(
    elevation: 12,
    shape: const RoundedRectangleBorder(),
    child: Column(
      children: [
        Text(widget.title,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.grey
        ),
        ),

        const SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    if(counter>widget.min){
                      counter --;
                    }
                  });
                  widget.onChange(counter);
                },
                child: const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.remove,color: Colors.white,),
                ),
              ),

              const SizedBox(width: 15,),
              Text(counter.toString(),
              textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(width: 15,),

              InkWell(
                onTap: (){
                  setState(() {
                    if(counter < widget.max){
                      counter ++;
                    }
                  });
                  widget.onChange(counter);
                },
                child: const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add,color: Colors.white,),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    ),
    );
  }
}
