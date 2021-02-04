import 'package:flutter/material.dart';
import 'dart:async';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
//TODO: declare var & images

  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");
  bool iscross = true;
  String message;

  List<String> gameState;
  String brand = 'Try your luck baby';
//TODO: init state of array with boxes

  @override
  void initState() {
    // TODO: implement initState
    this.gameState = [
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
    ];
    this.message = '';
  }

//TODO: game reset

  gameReset() {
    setState(() {
      this.gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      this.message = '';
    });
  }

//TODO: playgame method

  playgame(int index) {
    if (this.gameState[index] == 'empty') {
      setState(() {
        if (this.iscross) {
          this.gameState[index] = 'cross';
        } else {
          this.gameState[index] = 'circle';
        }
        this.iscross = !this.iscross;
        this.checkWin();
      });
    }
  }

//TODO: check for win (thats to check either elements are in line and daigonal) || wining logic
  checkWin() {
    //horizontal cases
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = ('${gameState[0]} is winner');
        Timer(Duration(milliseconds: 900), () {
          this.gameReset();
        });
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = ('${gameState[3]} is winner');
        Timer(Duration(milliseconds: 900), () {
          this.gameReset();
        });
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = ('${gameState[6]} is winner');
        Timer(Duration(milliseconds: 900), () {
          this.gameReset();
        });
      });
    }
    //vertical cases
    else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = ('${gameState[3]} is winner');
        Timer(Duration(milliseconds: 900), () {
          this.gameReset();
        });
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = ('${gameState[1]} is winner');
        Timer(Duration(milliseconds: 900), () {
          this.gameReset();
        });
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = ('${gameState[2]} is winner');
        Timer(Duration(milliseconds: 900), () {
          this.gameReset();
        });
      });
    }
    //diagonal cases
    else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = ('${gameState[0]} is winner');
        Timer(Duration(milliseconds: 900), () {
          this.gameReset();
        });
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = ('${gameState[2]} is winner');
        Timer(Duration(milliseconds: 900), () {
          this.gameReset();
        });
      });
    } else if (!this.gameState.contains('empty')) {
      setState(() {
        this.message = ('game is draw');
        Timer(Duration(milliseconds: 900), () {
          this.gameReset();
        });
      });
    }
  }

  //TODO: assining of image to the box
  //AssetImage
  getimage(String element) {
    switch (element) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

//TODO: designing of app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OXO'),
        elevation: 5,
      ),
      backgroundColor: Colors.orangeAccent,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: this.gameState.length,
                itemBuilder: (context, i) => SizedBox(
                  height: 50,
                  width: 50,
                  child: MaterialButton(
                    onPressed: () {
                      playgame(i);
                    },
                    child: Image(
                      image: this.getimage(this.gameState[i]),
                    ),
                    splashColor: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              child: Text(
                this.message,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              padding: EdgeInsets.all(28),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  gameReset();
                },
                padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color(0xff2C3A47),
                splashColor: Colors.yellow,
                elevation: 8,
                child: Text(
                  'RESET',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              child: Text(
                brand.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.all(25),
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}
