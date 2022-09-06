import 'package:flutter/material.dart';
import 'package:interview_app/models/rating_model.dart';
import 'package:provider/provider.dart';
class RatingTile extends StatelessWidget {
  RatingFormat ratingFormat;
  RatingTile(this.ratingFormat);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<RatingProvider>(context,listen: false).toggleSelected(ratingFormat);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: ratingFormat.isSelected?80:0,
        child: Container(
          padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ratingFormat.isSelected?const Color.fromRGBO(0, 27, 193,3):Color.fromRGBO(228, 230, 239, 3),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ratingFormat.borderColor,

              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    ratingFormat.emoji,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 70),
                  ),
                ),

                Expanded(
                  child: Text(
                    '${ratingFormat.review}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ratingFormat.isSelected?Colors.white:Colors.black
                    ),
                  ),
                ),
                Text(ratingFormat.description, textAlign: TextAlign.left,
                style: TextStyle(
                    color: ratingFormat.isSelected?Colors.white:Colors.black
                ),
                )
              ],
            )),
      ),
    );
  }
}
