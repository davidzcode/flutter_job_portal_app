import 'package:flutter/material.dart';
import 'package:flutter_job_portal_app/BottomNavBar.dart';
import 'package:flutter_job_portal_app/Colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(child: MainProfileScreen()),
    );
  }
}

class MainProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TopProfileContainer(),
        BottomProfileContainer(),
      ],
    );
  }
}

class TopProfileContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200.0,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(3.0),
                    height: 90.0,
                    width: 90.0,
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
                  SizedBox(height: 10.0,),
                  Text("David Zambrano", style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("UI / UX Designer", style: TextStyle(fontSize: 12.0),),
                ],
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Text("Competencias Completadas", style: TextStyle(color: Colors.grey),),
                Spacer(),
                Text("89%",  style: TextStyle(color: Colors.grey),)
              ],),
              Row(
                children: <Widget>[
                  CustomPaint(
                    child: Container(
                      height: 10,
                      width: 344,
                    ),
                    painter: ProgressPainter(),
                  )
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }
}

class BottomProfileContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text("Trabajos Recomendados", style: TextStyle(color: secondaryColor,fontSize: 16.0),),
              Spacer(),
              Text("VER TODOS", style: TextStyle(fontSize: 12,color: primaryColor, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        Container(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              RecomendCard("Senior UI/UX designer","microsoft corp","Delhi", Colors.deepPurple),
              RecomendCard("Grapich designer","Samsung","Tokiyo", Colors.redAccent),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text("Actividades Recientes", style: TextStyle(color: secondaryColor,fontSize: 16.0),),
            ],
          ),
        ),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ActivitysCard("Trabajos Guardados", 49, Icon(Icons.bookmark,color: Colors.redAccent,), Colors.redAccent.withOpacity(0.2)),
              ActivitysCard("Aplicaciones", 124, Icon(Icons.check,color: primaryColor,), Colors.blue.withOpacity(0.2)),
            ],
          ),
        ),
      ],
    );
  }
}

class RecomendCard extends StatelessWidget {
  final String jobName,companyName,location;
  final Color colorCard;

  RecomendCard(this.jobName,  this.companyName,this.location, this.colorCard );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 100,
      width: 250.0,
      child: Material(
        elevation: 3.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13.0))),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: colorCard,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(jobName,style: TextStyle(color: Colors.white,fontSize: 16.0, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10.0,),
                  Text(companyName,style: TextStyle(color: Colors.white,fontSize: 12.0, fontWeight: FontWeight.normal),),
                  SizedBox(height: 10.0,),
                  Text(location,style: TextStyle(color: Colors.white,fontSize: 12.0, fontWeight: FontWeight.normal),),
                ],
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: Text("APPLY",style: TextStyle(color: Colors.white,fontSize: 12),),
              ),
            )
          ],
        )
      ),
    );
  }
}

class ActivitysCard extends StatelessWidget {
  final String activityName;
  final int countActivity;
  final Icon iconActivity;
  final Color colorActivity;

  ActivitysCard(this.activityName, this.countActivity, this.iconActivity, this.colorActivity);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Material(
          elevation: 5.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    color: colorActivity
                  ),
                  child: Center(child: iconActivity),
                ),
                SizedBox(width: 10.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("$countActivity", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                    Text(activityName, style: TextStyle(color: Colors.grey.withOpacity(.6)),),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

class ProgressPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(0, size.height/2);
    final p2 = Offset(345, size.height/2);
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);

    final q1 = Offset(0, size.height/2);
    final q2 = Offset(size.width*0.89, size.height/2);
    final paint_proress = Paint()
      ..color = Colors.lightGreen
      ..strokeWidth = 4;
    canvas.drawLine(q1, q2, paint_proress);



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
