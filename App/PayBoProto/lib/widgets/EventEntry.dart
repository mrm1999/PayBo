import 'package:PayBoProto/classes/Event.dart';
import 'package:PayBoProto/screens/FormScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventEntry extends StatefulWidget {
  final Event event;
  EventEntry(this.event);
  @override
  _EventEntryState createState() => _EventEntryState();
}

class _EventEntryState extends State<EventEntry> {
  Future _launchEmail(String email) async {
    String emailUrl = "mailto:$email";
    if (await canLaunch(emailUrl)) {
      launch(emailUrl);
    } else {
      throw "Error in opening email app";
    }
  }

  Future _launchTel(String number) async {
    String emailUrl = "tel:$number";
    if (await canLaunch(emailUrl)) {
      launch(emailUrl);
    } else {
      throw "Error in opening email app";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10.0,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.event.eventHeading,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.event.eventDescription,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormScreen(
                                  1, widget.event.eventHeading, 0, 0)));
                    },
                    elevation: 5.0,
                    child: Text(
                      "CONTRIBUTE",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Center(
                            child: Text(
                          'CONTACT US',
                          style: TextStyle(fontSize: 20.0),
                        )),
                        content: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Name : " +
                                        widget.event.contact.contactName,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              InkWell(
                                onTap: () => _launchEmail(
                                    widget.event.contact.contactEmail),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.email),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      widget.event.contact.contactEmail,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              InkWell(
                                onTap: () => _launchTel(
                                    widget.event.contact.contactNumber),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      widget.event.contact.contactNumber,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      barrierDismissible: true,
                    ),
                    elevation: 5.0,
                    child: Text(
                      "CONTACT US",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
