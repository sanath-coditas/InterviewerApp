import 'package:flutter/material.dart';
import 'package:interview_app/widgets/category_item.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.symmetric(vertical: 30),
      height: 300,
      // color: Colors.green,
      child: Column(
        children: [
          Row(children: [
            CategoryItem(quality: 'Politeness'),
            CategoryItem(quality: 'Professionalism')
          ],),
          Row(children: [
            CategoryItem(quality: 'Expertise'),
            CategoryItem(quality: 'Guidance')
          ],),
          Row(children: [
            CategoryItem(quality: 'Attentiveness'),
            CategoryItem(quality: 'Questions Asked')
          ],),
          Row(children: [
            CategoryItem(quality: 'Quality of Questions'),
          ],),
        ],
      ),
    );
  }
}
