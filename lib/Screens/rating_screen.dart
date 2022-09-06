import 'package:flutter/material.dart';
import 'package:interview_app/Screens/qualities_screen.dart';
import 'package:interview_app/constants/constants_file.dart';
import 'package:interview_app/Providers/interviewers.dart';
import 'package:provider/provider.dart';
import '../Providers/rating_model.dart';
import '../widgets/rating_tile.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({Key? key}) : super(key: key);
  static const routeName = '/ratingScreen';
  @override
  Widget build(BuildContext context) {
        var selectedQualities = Provider.of<RatingProvider>(context);
        return SafeArea(
        child: Scaffold(
          backgroundColor: kbackgroundColor,
        body: Container(
          color: kbackgroundColor,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height,
          child: Column(
           children: [
             const Text('How would you \nrate your\ninterviewer(s)?',
             style: TextStyle(
               fontSize: 45,
               fontWeight: FontWeight.bold
             ),
             ),
             Container(
               padding: EdgeInsets.all(10),
               margin: EdgeInsets.only(top: 20,bottom: 20),
               width: double.infinity,
               child: const Text('SELECT YOUR RATING',
                 textAlign: TextAlign.left,
                 style: TextStyle(
                     fontSize: 17,
                     fontWeight: FontWeight.bold,
                     color: Colors.grey
                 ),
               ),
             ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 0.8
                  ),
                  itemCount: Provider.of<RatingProvider>(context).getRatingFormats.length,
                  itemBuilder: (BuildContext context,index) => RatingTile(Provider.of<RatingProvider>(context).getRatingFormats[index])
              ),
            )
           ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Text('GO BACK',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
            ),
            SizedBox(
              width: 130,
              child: FloatingActionButton(
                elevation: 10,
                backgroundColor: (selectedQualities.getSelected().isSelected)?Colors.green:Color.fromRGBO(153, 158, 178, 2),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                onPressed: () {
                  if(selectedQualities.getSelected().isSelected) {
                    Navigator.pushNamed(context,QualitiesScreen.routeName);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    Text(
                      'NEXT',
                      style: TextStyle(
                          color:(selectedQualities.getSelected().isSelected)?Colors.white:Colors.black45,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward_ios,
                      color: (selectedQualities.getSelected().isSelected)?Colors.white:Colors.black45 ,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
    )
    );
  }
}
