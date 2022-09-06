import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RatingFormat {
  String emoji;
  String review;
  String description;
  Color borderColor;
  bool isSelected;
  RatingFormat(
      {required this.emoji,
      required this.description,
      required this.review,
      required this.borderColor,
      required this.isSelected});
}

class RatingProvider extends ChangeNotifier {
  final List<RatingFormat> _ratingOptions = [
    RatingFormat(
        emoji: '\u{1F44F}',
        review: 'Awesome',
        description: 'Best Interviewer Ever!',
        borderColor: Colors.blue,
        isSelected: false),
    RatingFormat(
        emoji: '\u{1F44D}',
        review: 'Good',
        description: 'Nice Person. Really Nice!',
        borderColor: Colors.lightGreen,
        isSelected: false),
    RatingFormat(
        emoji: '\u{1F610}',
        review: 'Neutral',
        description: 'Ummm... Okay.I guess!',
        borderColor: Colors.black45,
        isSelected: false),
    RatingFormat(
        emoji: '\u{1F641}',
        review: 'Bad',
        description: 'Needs to Improve! A LOT!',
        borderColor: Colors.red,
        isSelected: false),
  ];

  List<RatingFormat> get getRatingFormats {
    return [..._ratingOptions];
  }

  void toggleSelected(RatingFormat ratingFormat) {
    _ratingOptions.forEach((element) {
      if (element != ratingFormat) {
        element.isSelected = false;
      }
    });
    _ratingOptions[_ratingOptions.indexOf(ratingFormat)].isSelected =
        !_ratingOptions[_ratingOptions.indexOf(ratingFormat)].isSelected;
    notifyListeners();
  }



  RatingFormat getSelected() {
      return _ratingOptions.firstWhere((element) => element.isSelected,orElse: (){
        return RatingFormat(
            emoji: '',
            description: '',
            review: '',
            borderColor: Colors.black45,
            isSelected: false);
      });
    }

}
