import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_job_portal_app/BottomNavBar.dart';
import 'package:flutter_job_portal_app/ProfileScreen.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Job Portal',
      theme: ThemeData(
      ),
      home:MainScreen()
  ));
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Categorias",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0,color: Colors.black),),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(Radius.circular(100.0))
                  ),
                  child: Center(
                    child: Text("08",style: TextStyle(color: Colors.white,fontSize: 10.0),),
                  )
              ),
              SizedBox(width: 5.0,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                child: Container(
                  padding: EdgeInsets.all(3.0),
                  height: 45.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      border: Border.all(color: Color.fromRGBO(237, 237, 237, 1))
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    child: Container(
                      child: Image.asset("assets/images/user_profile.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5.0,)
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BottomContainer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(.1),
      height: 600,
        child: GridView.count(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          crossAxisCount: 2,
          children: <Widget>[
            CategoriaCard("Diseño",Icons.edit, Colors.blue),
            CategoriaCard("IT",Icons.computer, Colors.lightGreen),
            CategoriaCard("Mareting",Icons.pie_chart, Colors.orangeAccent),
            CategoriaCard("Enseñanza", Icons.book, Colors.deepOrangeAccent),
            CategoriaCard("Ingenieria",Icons.build, Colors.deepPurple),
            CategoriaCard("Salud",Icons.healing, Colors.redAccent),
            CategoriaCard("Ciencia",Icons.lightbulb_outline, Colors.lightBlueAccent),
            CategoriaCard("Cine",Icons.movie_creation, Colors.greenAccent),
          ],
        )
    );
  }
}

class CategoriaCard extends StatelessWidget {
  final String cardName;
  final IconData iconCard;
  final Color colorIcon;

  CategoriaCard(this.cardName, this.iconCard, this.colorIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: 150,
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Color.fromRGBO(240, 240, 240, 1)
                      ),
                    ),
                  ),
                  Icon(iconCard,size: 40.0, color: colorIcon,),
                ],
              ),

              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Color.fromRGBO(240, 240, 240, 1)
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(cardName, style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("8000+ trabajos",style: TextStyle(color: Color.fromRGBO(170, 170, 170, 1)),),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}