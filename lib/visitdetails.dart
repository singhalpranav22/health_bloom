import 'package:flutter/material.dart';
class RequestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visit Details",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xff9ad7e9),
      ),
      body: Container(
        color:  Color(0xff9ad7e9),
        child: Column(
          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Center(
//                child: Image.asset("images/help.png",
//                  height: 150.0,
//                ),
//
//              ),
//            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Doctor : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),

                  ),
                  Text("Dr. Raj Shekhawat",
                    style: TextStyle(
//                    fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Medicines : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),

                  ),
                  Expanded(
                    child: Text("Paracetamol, Sumo Cold",
                      style: TextStyle(
//                    fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Description ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),

                  ),
                  
                  Expanded(
                    child: Text(" Minor Fever detected.",
                      style: TextStyle(
//                    fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Row(
//                children: [
//                  Text("Address : ",
//                    style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      fontSize: 25.0,
//                    ),
//
//                  ),
//                  Expanded(
//
//                    child: Text("${need.address}",
//                      style: TextStyle(
////                    fontWeight: FontWeight.bold,
//                        fontSize: 25.0,
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            ),
//            Padding(
//                padding: const EdgeInsets.all(8.0),
//
////
////                ),
//                child:  Card(
//                  color: Colors.blue[100],
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(55),
//                  ),
//                  child: ListTile(
//                    contentPadding: EdgeInsets.symmetric(
//                        horizontal: 25, vertical: 20),
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.vertical(
//                          bottom: Radius.circular(10.0),
//                          top: Radius.circular(2.0)),
//                    ),
////                  child: Padding(
////                    padding: const EdgeInsets.all(8.0),
//                    title: Expanded(
//                      child: Text("${need.description}",
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//
//                          fontSize: 25.0,
//                        ),
////                      ),
//                      ),
//                    ),
//                  ),
//                )
//
//            ),
          ],
        ),
      ),

    );
  }
}