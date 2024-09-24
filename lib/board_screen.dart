import 'package:flutter/material.dart';
import 'package:xo_game/main_screen.dart';

import 'custom_button.dart';

class BoardScreen extends StatefulWidget {
  // const BoardScreen({super.key});
  static const String routeName = '/board';
  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  // static const String routeName = '/board';
  // String text = "";

  List<String> board = List.filled(9, "");
  int Score1 = 0;
  int Score2 = 0;

  @override
  Widget build(BuildContext context) {
    GameBoardArgs args= ModalRoute.of(context)!.settings.arguments == null ? GameBoardArgs(player1Name: '',player2Name: ''):ModalRoute.of(context)!.settings.arguments as GameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.1,
        backgroundColor: Colors.black.withOpacity(0.8),
        title: Container(
            alignment: Alignment.center,
            child: Text("XO Game",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900))),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.015,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "${args.player1Name} (X)",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "$Score1",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        "${args.player2Name} (O)",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "$Score2",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.015,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: MediaQuery.sizeOf(context).width * 0.003,
                    mainAxisSpacing: MediaQuery.sizeOf(context).height * 0.003,
                    mainAxisExtent: MediaQuery.sizeOf(context).height * 0.248),
                itemBuilder: (context, index) => CustomButton(
                    label: board[index], onpressed: onClick, index: index),
                itemCount: 9,
              ),
            )
          ],
        ),
      ),
    );
  }

  int round = 1;

  void onClick(int i) {
    setState(() {
      if(board[i].isNotEmpty) return;
      if (round % 2 == 0) {
        board[i] = "O";
        if(checkWinner("O")){
          clearBoard();
          return;
        }
      } else {
        board[i] = "X";
        if(checkWinner("X")){
          clearBoard();
          return;
        }
      }
      //Tie
      if(round==9){
        clearBoard();
        return;
      }
      round++;

    });
  }

  void increaseScore(String symbol) {
    if (symbol == "X")
      Score1++;
    else if (symbol == "O") Score2++;
    setState(() {});
  }

  bool checkWinner(String symbol) {
    setState(() {
    });
      if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
        increaseScore(symbol);
        return true;
      }
      if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
        increaseScore(symbol);
        return true;
      }
      //check rows
      //0 1 2
      //3 4 5
      //6 7 8
      for (int i = 0; i <= 6; i += 3) {
        if (board[i] == symbol &&
            board[i + 1] == symbol &&
            board[i + 2] == symbol) {
          increaseScore(symbol);
          return true;
        }
      }
      //check columns
      //0 3 6
      //1 4 7
      //2 5 8
      for (int i = 0; i <= 2; i++) {
        if (board[i] == symbol &&
            board[i + 3] == symbol &&
            board[i + 6] == symbol) {
          increaseScore(symbol);
          return true;
        }
      }
      return false;

  }

  void clearBoard() {
    board = List.filled(9, "");
    round = 1;
    setState(() {});
  }
}
