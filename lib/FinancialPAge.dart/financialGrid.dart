import 'package:flutter/material.dart';
import '../FinancialPAge.dart/Financial.dart';

class FinancialGrid extends StatefulWidget {
  final List<Finance> financialDetails;
  FinancialGrid(this.financialDetails);
  @override
  _FinancialGridState createState() => _FinancialGridState();
}

class _FinancialGridState extends State<FinancialGrid> {
  // Title List Here
  // var bankName = [
  //   "SBI",
  //   "HDFC",
  //   "ICICI",
  //   "SBI",
  //   "SBI",
  //   "HDFC",
  //   "ICICI",
  //   "SBI",
  // ];
  // var ownerName = [
  //   "VIJAY KUMAR",
  //   "RAVI SHANKAR",
  //   "ROHIT KHANNA",
  //   "MOHIT KUMAR",
  //   "VIJAY KUMAR",
  //   "RAVI SHANKAR",
  //   "ROHIT KHANNA",
  //   "MOHIT KUMAR",
  // ];

  // // Description List Here
  // var currentAmount = [
  //   '55000',
  //   '152356',
  //   '78652',
  //   '3256000',
  //   '55000',
  //   '152356',
  //   '78652',
  //   '3256000',
  // ];

  // // Image Name List Here
  // var financeImage = [
  //   "assets/images/fin1.png",
  //   "assets/images/fin2.jpg",
  //   "assets/images/fin3.jpg",
  //   "assets/images/fin4.jpg",
  //   "assets/images/fin1.png",
  //   "assets/images/fin2.jpg",
  //   "assets/images/fin3.jpg",
  //   "assets/images/fin4.jpg",
  // ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    //double width = MediaQuery.of(context).size.width * 0.4;
    return ListView.builder(
      itemCount: widget.financialDetails.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // This Will Call When User Click On ListView Item
            showDialogFunc(
                context,
                widget.financialDetails[index].bankImage,
                widget.financialDetails[index].bankName,
                widget.financialDetails[index].amount,
                widget.financialDetails[index].userName);
          },
          // Card Which Holds Layout Of ListView Item
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.asset(
                    widget.financialDetails[index].bankImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "BANK/CARD NAME : ${widget.financialDetails[index].bankName}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BalooChettan2',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "OWNER NAME : ${widget.financialDetails[index].userName}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BalooChettan2',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("CURRENT AMOUNT : ₹ ${widget.financialDetails[index].amount}",
                          style: TextStyle(
                            fontFamily: 'BalooChettan2',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontStyle: FontStyle.italic,
                          )),
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

showDialogFunc(context, img, bank, amount, owner) {
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
              padding: EdgeInsets.all(10),
              height: 450,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      img,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 300,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "BANK/CARD NAME : $bank",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BalooChettan2',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "OWNER NAME : $owner",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BalooChettan2',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "CURRENT AMOUNT : ₹ $amount",
                    style: TextStyle(
                        fontFamily: 'BalooChettan2',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
