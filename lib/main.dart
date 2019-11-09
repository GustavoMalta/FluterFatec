import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador", home: Home()));

  /*print(Teste("Carlos", 10));
  String nome = "Gustavo";
  String temp = nome.substring(0,5);
  print (nome + " " + temp);*/
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _qnt = 0;
  String _message='';
  void _alterar(int quantidade) {
    setState(() {
      if(_qnt + quantidade<0){
        _message = "Não pode ser menor que zero";
      }else{
         _qnt += quantidade;
        if (_qnt>5){
          _message = "Lotado";
        }
        else{
          _message = "Há vagas";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(
            "https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png",
            fit: BoxFit.cover,
            height: 1080),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$_qnt pessoas",
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40, color: Colors.pink),
                    ),
                    onPressed: () {
                      _alterar(-1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.pink,
                      ),
                    ),
                    onPressed: () {
                      _alterar(1);
                    },
                  ),
                )
              ],
            ),
            Text(
              _message,
              style: TextStyle(
                color: Colors.purpleAccent,
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        )
      ],
    );
  }
}
