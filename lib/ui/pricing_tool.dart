import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//ToDelete

class PricingTool extends StatefulWidget {
  @override
  _PricingToolState createState() => _PricingToolState();
}

class _PricingToolState extends State<PricingTool> {

  int _doses = 0;
  var _chosenOption;
  List<String> _paymentOption = ['Insurance only', 'Employer Direct Payment\nOnly', 'Insurance and Employer\nDirect Payment'];
  int _employerPaidDoses = 0;
  int _numClinicHours = 0;
  int _roundtripMiles = 0;
  int _roundtripMinutes = 0;

  //Vaccines
  bool _HepA = false;
  bool _HepB = false;
  bool _HepAB = false;
  bool _HPV = false;
  bool _Influenza = false;
  bool _MMR = false;
  bool _Pneumonia = false;
  bool _Shingles = false;
  bool _Td = false;
  bool _TDAP = false;
  bool _VaricellaVirus = false;

  Widget checkbox(String title, bool boolValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(title,
          maxLines: 1,),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            setState(() {
              switch (title) {
                case "Hepatitis - A":
                _HepA = value;
                  break;
                case "Hepatitis - B":
              _HepB = value;
                  break;
                case "Hepatitis A and B- Combo":
                  _HepAB = value;
                  break;
                case "Influenza - injectable":
              _Influenza = value;
                  break;
                case "MMR":
              _MMR = value;
                  break;
                case "Pneumonia":
                _Pneumonia = value;
                  break;
                case "Shingles":
              _Shingles = value;
                  break;
              case "Td":
              _Td = value;
              break;
              case "TDAP":
              _TDAP = value;
              break;
              case "Varicella Virus (chicken Pox)":
              _VaricellaVirus = value;
              break;
              }
            });
          },)
      ],
    );
  }

  //Calculated value

  var to_come = "";

  _DosesPerHour() {
    return _doses / 18 * 18;
  }

  _FirstMessage() {
    if (_doses == 0) {
      return "Please enter the estimated number of doses.";
    } else {
      return "Based on the estimated doses, the lowest cost option is a $to_come hour "
          "clinic staffed by $to_come pharmacist(s) and $to_come technician(s).";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 75, 141, 1.0),
          title: Title(color: Colors.black, child: Text("Clinic Pricing Tool")),
        ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(4.5),
          children: <Widget>[
            // number of doses
            Center(
              child: ListTile(
                contentPadding: EdgeInsets.all(.5),
                title: Container(
                    decoration: BoxDecoration(
//               boxShadow: [
//                 new BoxShadow(
//                   blurRadius: 50.0,
//                 )
//               ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width*.5,
                            child: Text ("How many doses do you expect to administer?")),
                        Container(
                          width: MediaQuery.of(context).size.width *.4,
                          child: TextField(
                            keyboardType: TextInputType.numberWithOptions(decimal: false),
                            style: TextStyle(color: Colors.black),
                            keyboardAppearance: Brightness.dark,
                            decoration: InputDecoration(
                              suffixText: ("Doses"),
                            ),
                            onChanged: (String value) {
                              try {
                                _doses = int.parse(value);
                              } catch (exception) {
                                _doses = 0;
                              }
                            },
                          ),
                        ),
                      ],
                    )
                ),
              )
            ),
            // How to pay
            Center(
                child: ListTile(
                  contentPadding: EdgeInsets.all(.5),
                  title: Container(
                      decoration: BoxDecoration(
//               boxShadow: [
//                 new BoxShadow(
//                   blurRadius: 50.0,
//                 )
//               ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width*.5,
                              child: Text ("How will the doses be paid for?")),
                          Container(
                            width: MediaQuery.of(context).size.width *.4,
                            child: Center(
                              child: FittedBox(
                                child: DropdownButton(
                                  hint: Text("Choose payment option"), // Not necessary for Option 1
                                  value: _chosenOption,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _chosenOption = newValue;
                                    });
                                  },
                                  items: _paymentOption.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                )
            ),
            // Duration of clinic
            Center(
                child: ListTile(
                  contentPadding: EdgeInsets.all(.5),
                  title: Container(
                      decoration: BoxDecoration(
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width*.5,
                              child: Text ("How many hours will your clinic be?")),
                          Container(
                            width: MediaQuery.of(context).size.width *.4,
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(decimal: false),
                              style: TextStyle(color: Colors.black),
                              keyboardAppearance: Brightness.dark,
                              decoration: InputDecoration(
                                suffixText: ("Hours"),
                              ),
                              onChanged: (String value) {
                                try {
                                  _doses = int.parse(value);
                                } catch (exception) {
                                  _doses = 0;
                                }
                              },
                            ),
                          ),
                        ],
                      )
                  ),
                )
            ),
            // Miles to destination
            Center(
                child: ListTile(
                  contentPadding: EdgeInsets.all(.5),
                  title: Container(
                      decoration: BoxDecoration(
//               boxShadow: [
//                 new BoxShadow(
//                   blurRadius: 50.0,
//                 )
//               ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width*.5,
                              child: Text ("How many miles round-trip will your commute be?")),
                          Container(
                            width: MediaQuery.of(context).size.width *.4,
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(decimal: false),
                              style: TextStyle(color: Colors.black),
                              keyboardAppearance: Brightness.dark,
                              decoration: InputDecoration(
                                suffixText: ("Miles"),
                              ),
                              onChanged: (String value) {
                                try {
                                  _doses = int.parse(value);
                                } catch (exception) {
                                  _doses = 0;
                                }
                              },
                            ),
                          ),
                        ],
                      )
                  ),
                )
            ),
            // Time to destination
            Center(
                child: ListTile(
                  contentPadding: EdgeInsets.all(.5),
                  title: Container(
                      decoration: BoxDecoration(
//               boxShadow: [
//                 new BoxShadow(
//                   blurRadius: 50.0,
//                 )
//               ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width*.5,
                              child: Text ("How many minutes round-trip will this commute take?")),
                          Container(
                            width: MediaQuery.of(context).size.width *.4,
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(decimal: false),
                              style: TextStyle(color: Colors.black),
                              keyboardAppearance: Brightness.dark,
                              decoration: InputDecoration(
                                suffixText: ("Minutes"),
                              ),
                              onChanged: (String value) {
                                try {
                                  _doses = int.parse(value);
                                } catch (exception) {
                                  _doses = 0;
                                }
                              },
                            ),
                          ),
                        ],
                      )
                  ),
                )
            ),
            SizedBox(height: 18,),
            // Label
            Center(
              child: Container(
                child: Text("Please check all of the following services "
                    "that your clinic will offer:",
                style: TextStyle(
                  fontSize: 20
                ),),
              ),
            ),
            // IMZ offerings
            Center(
                child: ListTile(
                  contentPadding: EdgeInsets.all(.5),
                  title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Wrap(
                            children: <Widget>[
                              checkbox("Hepatitis - A", _HepA),
                              checkbox("Hepatitis - B", _HepB),
                              checkbox("Hepatitis A and B- Combo", _HepAB),
                              checkbox("HPV", _HPV),
                              checkbox("Influenza - injectable", _Influenza),
                              checkbox("MMR", _MMR),
                              checkbox("Pneumonia", _Pneumonia),
                              checkbox("Shingles", _Shingles),
                              checkbox("Td", _Td),
                              checkbox("TDAP", _TDAP),
                              checkbox("Varicella Virus (chicken Pox)", _VaricellaVirus),
                            ],
                          ),
                        ],
                      )
                  ),
            ),
          ],
        ),
      ),
    );
  }
//}
//        body: ListView.builder(
//          itemCount: 17,
//          itemBuilder: (BuildContext context, int index) {
//            return lineItem(context);
//          },
//        ));
//  }

  Widget lineItem(BuildContext context) {
    return Card(
        // margin between cards
        margin: EdgeInsets.all(8.0),
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.5)),
        semanticContainer: true,
        color: Colors.white,
        child: ListTile(
          contentPadding: EdgeInsets.all(.5),
                title: Container(
              decoration: BoxDecoration(
//               boxShadow: [
//                 new BoxShadow(
//                   blurRadius: 50.0,
//                 )
//               ]
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*.4,
                      child: Text ("How many doses do you expect to administer?")),
                  Container(
                    width: MediaQuery.of(context).size.width *.4,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: false),
                      style: TextStyle(color: Colors.black),
                      keyboardAppearance: Brightness.dark,
                      decoration: InputDecoration(
                        suffixText: ("Doses"),
                      ),
                      onChanged: (String value) {
                        try {
                          _doses = int.parse(value);
                        } catch (exception) {
                          _doses = 0;
                        }
                      },
                    ),
                  ),
                ],
              )
              ),
//          title: Text("title"),
//          subtitle: Text("subtitle"),
        ));
  }
}

