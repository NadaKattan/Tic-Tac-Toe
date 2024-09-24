import 'package:flutter/material.dart';
import 'package:xo_game/board_screen.dart';

class MainScreen extends StatelessWidget {
  // const MainScreen({super.key});

  static const String routeName = '/main';
  TextEditingController controller1=TextEditingController();
  TextEditingController controller2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.1,
        backgroundColor: Colors.black.withOpacity(0.8),
        title: Container(
            alignment: Alignment.center,
            child: Text("XO Game",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900))),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.08),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).width * 0.1,),
            TextField(
              controller: controller1,
              decoration: InputDecoration(hintText: "Enter player 1 name"),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).width * 0.03,),
            TextField(
              controller: controller2,
              decoration: InputDecoration(hintText: "Enter player 2 name"),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).width * 0.05,),
            Container(
              // alignment: Alignment.end,
              child: ElevatedButton(
                  onPressed: () {
                    if(controller1.text.isNotEmpty&&controller2.text.isNotEmpty){
                      Navigator.of(context).pushNamed(BoardScreen.routeName,arguments: GameBoardArgs(player1Name: controller1.text, player2Name: controller2.text));
                    }
                    else{
                      Navigator.of(context).pushNamed(BoardScreen.routeName,arguments: GameBoardArgs(player1Name: "Player 1", player2Name: "Player 2"));
                    }
                  },
                  child: Text("Start",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w100)),
                  style: ElevatedButton.styleFrom(
                    shape: OvalBorder(),
                    backgroundColor: Colors.black.withOpacity(0.8),
                    fixedSize: Size(MediaQuery.sizeOf(context).width * 0.25, MediaQuery.sizeOf(context).height * 0.1)
                  )),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).width * 0.02,),
            Expanded(child: Image.asset("assets/images/xo.jpg",fit: BoxFit.fill,)),
            
          ],
        ),
      ),
    );
  }
}
class GameBoardArgs{
  String player1Name;
  String player2Name;
  GameBoardArgs({required this.player1Name,required this.player2Name});
}
