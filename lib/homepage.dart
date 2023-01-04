import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; //the first player is 'o'
  List<String> displayExoh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  var myTextStyle = const TextStyle(color: Colors.white, fontSize: 30);
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes=0;

  // static var myNewFont =GoogleFonts.pressStart2p(
  //     textStyle: const TextStyle(color: Colors.black,letterSpacing: 3));
  static var myNewFontWhite=GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.white,letterSpacing: 3,fontSize: 15)
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          const SizedBox(height: 30,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:  const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Player O',
                        style: myNewFontWhite,

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        ohScore.toString(),
                        style: myNewFontWhite,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Player X',
                        style: myNewFontWhite,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        exScore.toString(),
                        style: myNewFontWhite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          displayExoh[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                    onTap: () {
                      _tapped(index);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {

    setState(() {
      if (ohTurn && displayExoh[index] == '') {
        displayExoh[index] = 'O';
        filledBoxes+=1;
      } else if (!ohTurn && displayExoh[index] == '') {
        displayExoh[index] = 'X';
        filledBoxes+=1;
      }
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // checks 1st Row
    if (displayExoh[0] == displayExoh[1] &&
        displayExoh[0] == displayExoh[2] &&
        displayExoh[0] != '') {
      _showWinDialog(displayExoh[0]);
    }
    // checks 2nd Row
    if (displayExoh[3] == displayExoh[4] &&
        displayExoh[3] == displayExoh[5] &&
        displayExoh[3] != '') {
      _showWinDialog(displayExoh[3]);
    }
    // checks 3rd Row
    if (displayExoh[6] == displayExoh[7] &&
        displayExoh[6] == displayExoh[8] &&
        displayExoh[6] != '') {
      _showWinDialog(displayExoh[6]);
    }
    // checks 1st Column
    if (displayExoh[0] == displayExoh[3] &&
        displayExoh[0] == displayExoh[6] &&
        displayExoh[0] != '') {
      _showWinDialog(displayExoh[0]);
    }
    // checks 2nd Column
    if (displayExoh[1] == displayExoh[4] &&
        displayExoh[1] == displayExoh[7] &&
        displayExoh[1] != '') {
      _showWinDialog(displayExoh[1]);
    }
    // checks 3rd column
    if (displayExoh[2] == displayExoh[5] &&
        displayExoh[2] == displayExoh[8] &&
        displayExoh[2] != '') {
      _showWinDialog(displayExoh[2]);
    }
    // checks 1st diagonal
    if (displayExoh[6] == displayExoh[4] &&
        displayExoh[6] == displayExoh[2] &&
        displayExoh[6] != '') {
      _showWinDialog(displayExoh[6]);
    }
    // checks 2nd diagonal
    if (displayExoh[0] == displayExoh[4] &&
        displayExoh[0] == displayExoh[8] &&
        displayExoh[0] != '') {
      _showWinDialog(displayExoh[0]);
    }
    else if(filledBoxes==9){
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('DRAW'),
            actions: [
              TextButton(
                  child: const Text('PLAY AGAIN!'),
                  onPressed: (){
                    _clearBoard();
                    Navigator.of(context).pop();
                  }
              )
            ],
          );
        });
  }


  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER IS:$winner'),
            actions: [
              TextButton(
                  child: const Text('PLAY AGAIN!'),
                  onPressed: (){
                    _clearBoard();
                    Navigator.of(context).pop();
                  }
              )
            ],
          );
        });
    if (winner == 'O') {
      ohScore += 1;
    } else if (winner == 'X') {
      exScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for(int i=0; i<9;i++){
        displayExoh[i]='';
      }
    });
    filledBoxes=0;
  }
}
