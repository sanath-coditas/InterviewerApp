import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {

  String quality;
  CategoryItem({required this.quality});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: (){
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          margin: EdgeInsets.all(7),
          height: 45,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border: Border.all(
                  width: isSelected?2.0:0.5,
                color: isSelected?Color.fromRGBO(63, 132, 86,2):Colors.black,
              ),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Center(
            child: Text(widget.quality,
              style:  TextStyle(
                fontSize: 20,
                color: isSelected?Color.fromRGBO(63, 132, 86,2):Colors.black,
                fontWeight: isSelected?FontWeight.bold:FontWeight.normal
              ),
            ),
          ),
        )
    );
  }
}
