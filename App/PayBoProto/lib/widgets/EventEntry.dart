import 'package:PayBoProto/classes/Event.dart';
import 'package:PayBoProto/screens/FormScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class EventEntry extends StatefulWidget {
  final Event event;
  EventEntry(this.event);
  @override
  _EventEntryState createState() => _EventEntryState(event);
}

class _EventEntryState extends State<EventEntry> {
  Event event;
  _EventEntryState(this.event);

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
                                  widget.event.eventHeading,
                                  widget.event.category.categoryID,
                                  widget.event.subCategory.subCategoryID),),);
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
                              Text(
                                "Name : " + event.contact.contactName,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Email : ",
                                  ),
                                  InkWell(
                                    child: Text(
                                      event.contact.contactEmail,
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    onTap: () => {
                                      launch("mailto:" +
                                          event.contact.contactEmail),
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Phone : " + event.contact.contactNumber,
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
