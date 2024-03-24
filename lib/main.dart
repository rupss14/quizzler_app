import 'package:flutter/material.dart';
import 'package:quizzler_app/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brains.dart';

QuizBrain quizBrain= QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon>scoreKeeper=[];
 void checkAns(bool userPickedAns){ //created to add the scorekeeper and call a function direct.
   bool correctAns = quizBrain.getQuesAns();
   setState((){
     if(quizBrain.isFinished() == true){
       Alert(context: context, title: "Finished", desc: "You have reached the end of the quiz",).show();
     quizBrain.reset();
     scoreKeeper=[];

     }
     else{
   if(userPickedAns == correctAns){
       scoreKeeper.add(
                  Icon(Icons.check,
                  color:Colors.green,),);
     print('you r right!');//we can cut this.
   }
   else {
     print('you r wrong!');//we can cut this.
      scoreKeeper.add(
                  Icon(Icons.close,
                  color:Colors.red,),);
   }

     /*  scoreKeeper.add(
                  Icon(Icons.check,
                  color:Colors.green,),);*/
     quizBrain.nextQues();}
   });
 }
  /*List<String>questions=[
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];
  List<bool>answers=[
    false,
    true,
    true,
  ];*/



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  backgroundColor:Colors.green,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(

                       style:TextButton.styleFrom(
    backgroundColor:Colors.green,
    ),

              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAns(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style:TextButton.styleFrom(
    backgroundColor:Colors.red,
    ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAns(false);
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children:scoreKeeper,
        ),
      ],
    );
  }
}

/*bool correctAns = quizBrain.getQuesAns();
                if(correctAns==false){
                  print('you r right!');
                }
                else {
                  print('you r wrong!');
                }
                setState((){
                  /*  scoreKeeper.add(
                  Icon(Icons.close,
                  color:Colors.red,),);*/
                 quizBrain.nextQues();

                });*/