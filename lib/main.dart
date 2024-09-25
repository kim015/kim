import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const GamePage(),
    );
  }
}
class GamePage extends StatefulWidget {
  const GamePage({super.key});
  @override
  State<GamePage> createState()=> _GamePageState();
  }
  class _GamePageState extends State<GamePage>{
    int player=1;
    int computer=2;
    List board=[0,0,0,0,0,0,0,0,0];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: Container(
          alignment: Alignment.center,
          child: Text("60", style: TextStyle(fontSize: 20),),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.pause)),
          IconButton(
    
            onPressed: (){
              setState(() {
                board = List.filled(9, 0);
              });
            },
             icon: Icon(Icons.lock_reset))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height:  MediaQuery.of(context).size.height*0.5,
            child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
            children: [
              for (int i=0; i<board.length; i++)
              GestureDetector(
                onTap: () {
                 setState(() {
                    board[i]=player;
                 });
                },
                child: Container(
                  alignment:  Alignment.center,
                  decoration: BoxDecoration(
                    color: 
                    board[i]==player
                    ?Colors.green
                    :board[i]== computer
                   ?Colors.redAccent :
                    Colors.amber.shade300,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Text(
                    board[i]== player?"x"
                    :board[i]== computer?"o"
                    :"",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 50),
                  ),
                            ),
              )
            ],
            )
            
            ),
            
        ],
      ),
    );
  }
}
