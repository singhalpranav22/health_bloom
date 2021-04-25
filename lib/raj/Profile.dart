import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profileuser extends StatefulWidget {
  @override
  _ProfileuserState createState() => _ProfileuserState();
}

class _ProfileuserState extends State<Profileuser> {
  @override
  int startmass=40;
  int desiredmass=50;
  int Tcalories=0;
  int total=0;
  int day=0;
  int temp;
  User user;
  CollectionReference userRef;
  Widget dayy=Text('Day :-');
  progressCal(){
    temp=(desiredmass-startmass)*7720;
    temp=temp+Tcalories;
    if(temp<0){
      temp=temp*(-1);
    }
    day=27;
    print(temp);
    while(temp>0){
      day++;
      temp=temp-600;
    }
    setState(() {
      dayy=Text('Day :-'+day.toString());
    });
    // print(Tcalories);
    print(temp);
    temp++;
    print(temp);
    temp++;
    print(temp);
    // print(startmass);
    // print(desiredmass);
    // print(day);
  }

  getUser(){
    user = FirebaseAuth.instance.currentUser;
    userRef= FirebaseFirestore.instance.collection("Home");
  }
  getData()async{
    await userRef.doc(user.uid).get().then((dataa){
      if (dataa.data().containsKey('startmass')){
        if(dataa['startmass']!=null){
          startmass=dataa['startmass'];
        }
      }
      if (dataa.data().containsKey('desiredmass')){
        if(dataa['desiredmass']!=null){
          desiredmass=dataa['desiredmass'];
        }
      }
      if (dataa.data().containsKey('Tcalories')){
        if(dataa['Tcalories']!=null){
          Tcalories=dataa['Tcalories'];
        }
      }
      print(Tcalories);
      progressCal();
    });

  }
  setData()async{
    await userRef.doc(user.uid).update({
      "startmass":startmass,
      "desiredmass":desiredmass,
    });
  }
  @override
  void initState() {

    getUser();
    getData();

    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('TRACK PROGRESS'),
      ),
      body: Container(
        child:Column(
          children: [
            Expanded(
                flex: 2,
                child: Row(
              children: [
                Expanded(child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration: boxdeco(),
                  child: Column(
                    children: [
                      Icon(Icons.format_indent_increase),
                      Text('Initial Weight'),
                      Text(startmass.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  startmass=startmass+1;
                                });
                                setData();
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[200],
                                  ),
                                  child: Icon(Icons.add))
                          ),
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  startmass=startmass-1;
                                });
                                setData();
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[200],
                                  ),
                                  child: Icon(Icons.remove))
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration: boxdeco(),
                  child: Column(
                    children: [
                      Icon(Icons.weekend),
                      Text('Desired Weight'),
                      Text(desiredmass.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  desiredmass++;
                                });
                                setData();
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[200],
                                  ),
                                  child: Icon(Icons.add))
                          ),
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  desiredmass--;
                                });
                                setData();
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[200],
                                  ),
                                  child: Icon(Icons.remove))
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )
            ),
            Expanded(
                flex: 2,
                child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: boxdeco(),
              child:Column(
                children: [
                  Divider(),
                  Text('Estimated Day require to reach destination'),
                  dayy,
                ],
              )
            )),
            Expanded(
                flex: 2,child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: boxdeco(),
              child: Column(
                children: [
                  Divider(),
                  Text('Your Growth is increasing'),
                  Divider(),
                ],
              ),
            )),
            Expanded(flex: 2,child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration: boxdeco(),
                  child: Column(
                    children: [
                      Divider(),
                      Text('You are Doing well keep it up!'),
                      Divider(),
                    ],
                  ),
                ),
              ],
            )),
            Expanded(child: GestureDetector(
              onTap: getData,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue,
                  ),
                  child: Text('REFRESH'),
                  // child: Text('your progress is goood'),
                ),
              ),
            )),

          ],
        )
      ),
    );
  }
  BoxDecoration boxdeco() {
    return BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange[100],
    );
  }
}
