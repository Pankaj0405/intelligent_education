import 'package:flutter/material.dart';

class StudentDocument extends StatelessWidget {
  const StudentDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Document'),
        centerTitle: true,
        leading: Icon(Icons.school),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Upload Document',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Document: ',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: Text('Select'),
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (){},
              child: Text('UPLOAD',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[400],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Delete',style: TextStyle(fontWeight: FontWeight.w700),),
                      Text('Download',style: TextStyle(fontWeight: FontWeight.w700)),
                      Text('Document Name',style: TextStyle(fontWeight: FontWeight.w700)),
                      Text('Status',style: TextStyle(fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Divider(
                    height: 10,
                    thickness: 1.5,
                    color: Colors.black,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.delete),
                                  SizedBox(),
                                  GestureDetector(
                                      onTap: () {},
                                      child: Text('View')),
                                  SizedBox(width: 2,),
                                  SizedBox(
                                      width: 100,
                                      child: Text('Document Name',overflow: TextOverflow.ellipsis,)),
                                  Text('Status'),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
