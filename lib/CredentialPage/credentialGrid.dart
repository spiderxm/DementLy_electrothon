import 'package:DementLy/CredentialPage/Credential.dart';
import 'package:DementLy/buildPages/credential.dart';
import 'package:flutter/material.dart';

class CredentialGrid extends StatefulWidget {
  final List<Credential> credentialList;
  CredentialGrid(this.credentialList);
  @override
  _CredentialGridState createState() => _CredentialGridState();
}

class _CredentialGridState extends State<CredentialGrid> {
  // Title List Here
  // var titleList = [
  //   "Passport",
  //   "Aadhar",
  //   "Driving License",
  //   "ID Card",
  //   "Passport",
  //   "Aadhar",
  //   "Driving License",
  //   "ID Card",
  // ];

  // // Description List Here
  // var descList = [
  //   "This photo contains my passport.",
  //   "This photo contains my aadhar card.",
  //   "This photo contains my driving license.",
  //   "This photo contains my id card.",
  //   "This photo contains my passport.",
  //   "This photo contains my aadhar card.",
  //   "This photo contains my driving license.",
  //   "This photo contains my id card.",
  // ];

  // // Image Name List Here
  // var imgList = [
  //   "assets/images/cred1.jpg",
  //   "assets/images/cred2.jpeg",
  //   "assets/images/cred3.jpg",
  //   "assets/images/cred4.jpg",
  //   "assets/images/cred1.jpg",
  //   "assets/images/cred2.jpeg",
  //   "assets/images/cred3.jpg",
  //   "assets/images/cred4.jpg",
  // ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.4;
    return ListView.builder(
      itemCount: widget.credentialList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // This Will Call When User Click On ListView Item
            showDialogFunc(
                context,
                widget.credentialList[index].creditImage,
                widget.credentialList[index].title,
                widget.credentialList[index].desc);
          },
          // Card Which Holds Layout Of ListView Item
          child: Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    widget.credentialList[index].creditImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.credentialList[index].title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'BalooChettan2',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width,
                        child: Text(
                          widget.credentialList[index].desc,
                          maxLines: 4,
                          style: TextStyle(
                              fontFamily: 'BalooChettan2',
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 400,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'BalooChettan2',
                    fontSize: 25,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'BalooChettan2',
                          fontStyle: FontStyle.italic,
                          color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
