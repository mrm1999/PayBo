import 'dart:convert';
import 'dart:ui';

import 'package:PayBoProto/classes/Category.dart';
import 'package:PayBoProto/classes/Contact.dart';
import 'package:PayBoProto/classes/Event.dart';
import 'package:PayBoProto/classes/SubCategory.dart';
import 'package:PayBoProto/widgets/Loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'CategoryScreen.dart';
import 'EventScreen.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen>
    with SingleTickerProviderStateMixin {
  bool _listLoaded;
  TabController tabController;
  Category technicals, culturals, avana, donation;
  SubCategory robotics,
      programming,
      aeromodelling,
      dsc,
      cynaptics,
      electronics,
      tea,
      cae,
      concreate,
      metacryst,
      cfa,
      astronomy,
      techfest;
  SubCategory dance,
      music,
      drama,
      kalakriti,
      docm,
      debsoc,
      literary,
      quiz,
      mun,
      cultFest;
  SubCategory orm, donationDrive;
  SubCategory kerelaRF, biharRF;
  List<SubCategory> technicalSubCategoryList,
      culturalSubCategoryList,
      avanaSubCategoryList,
      donationSubCategoryList;
  List<Category> categories;
  Contact plancon, enigcon, tvsmcon;
  Event plantation, enigmaQuiz, tvsmInstrument;
  List<Event> events;

  @override
  void initState() {
    super.initState();
    _listLoaded = false;
    tabController = new TabController(length: 2, initialIndex: 0, vsync: this);
    robotics =
        new SubCategory(subCategoryID: 11, subCategoryName: "Robtics Club");
    programming =
        new SubCategory(subCategoryID: 12, subCategoryName: "Programming Club");
    aeromodelling = new SubCategory(
        subCategoryID: 13, subCategoryName: "Aeromodelling Club");
    dsc = new SubCategory(
        subCategoryID: 14, subCategoryName: "Developer Students Club");
    cynaptics =
        new SubCategory(subCategoryID: 15, subCategoryName: "Cynaptics Club");
    electronics =
        new SubCategory(subCategoryID: 16, subCategoryName: "Electronics Club");
    tea = new SubCategory(
        subCategoryID: 17, subCategoryName: "Team Engines and Daemons Club");
    cae = new SubCategory(subCategoryID: 18, subCategoryName: "CAE Club");
    concreate =
        new SubCategory(subCategoryID: 19, subCategoryName: "Concreate Club");
    metacryst =
        new SubCategory(subCategoryID: 20, subCategoryName: "Metacryst Club");
    cfa = new SubCategory(subCategoryID: 21, subCategoryName: "CFA Club");
    astronomy =
        new SubCategory(subCategoryID: 22, subCategoryName: "Astronomy Club");
    techfest =
        new SubCategory(subCategoryID: 23, subCategoryName: "Technical Fest");

    dance = new SubCategory(subCategoryID: 51, subCategoryName: "Dance Club");
    music = new SubCategory(subCategoryID: 52, subCategoryName: "Music Club");
    drama = new SubCategory(subCategoryID: 53, subCategoryName: "Drama Club");
    kalakriti =
        new SubCategory(subCategoryID: 54, subCategoryName: "Kalakriti Club");
    docm = new SubCategory(subCategoryID: 55, subCategoryName: "DOCM Club");
    debsoc =
        new SubCategory(subCategoryID: 56, subCategoryName: "Debating Society");
    literary =
        new SubCategory(subCategoryID: 57, subCategoryName: "Literary Club");
    quiz = new SubCategory(subCategoryID: 58, subCategoryName: "Quiz Club");
    mun = new SubCategory(subCategoryID: 59, subCategoryName: "MUN");
    cultFest = new SubCategory(subCategoryID: 60, subCategoryName: "FLUXUS");

    orm = new SubCategory(subCategoryID: 101, subCategoryName: "ORM");
    donationDrive =
        new SubCategory(subCategoryID: 102, subCategoryName: "Donation Drive");

    kerelaRF = new SubCategory(
        subCategoryID: 151, subCategoryName: "Kerela Relief Fund");
    biharRF = new SubCategory(
        subCategoryID: 152, subCategoryName: "Bihar Relief Fund");

    technicalSubCategoryList = [
      robotics,
      programming,
      aeromodelling,
      dsc,
      cynaptics,
      electronics,
      tea,
      cae,
      concreate,
      metacryst,
      cfa,
      astronomy
    ];
    culturalSubCategoryList = [
      dance,
      music,
      drama,
      kalakriti,
      docm,
      debsoc,
      literary,
      quiz,
      mun,
      cultFest
    ];
    avanaSubCategoryList = [orm, donationDrive];
    donationSubCategoryList = [kerelaRF, biharRF];

    technicals = new Category(
        categoryID: 1,
        categoryName: "Technicals",
        subCategoryList: technicalSubCategoryList);
    culturals = new Category(
        categoryID: 2,
        categoryName: "Culturals",
        subCategoryList: culturalSubCategoryList);
    avana = new Category(
        categoryID: 3,
        categoryName: "Avana",
        subCategoryList: avanaSubCategoryList);
    donation = new Category(
        categoryID: 4,
        categoryName: "Donation",
        subCategoryList: donationSubCategoryList);
    categories = [technicals, culturals, avana, donation];

    plancon = new Contact(
      contactName: "Shreyas Nakshataram",
      contactEmail: "shreyas@gmail.com",
      contactNumber: "1234567890",
    );
    enigcon = new Contact(
      contactName: "Kartik Garg",
      contactEmail: "kartik@gmail.com",
      contactNumber: "2345678901",
    );
    tvsmcon = new Contact(
      contactName: "Aadish Godha",
      contactEmail: "aadish@gmail.com",
      contactNumber: "3456789012",
    );

    getEventsList();
  }

  getEventsList() async {
    String uri = 'https://payboo.herokuapp.com/events';
    var response = await http.get(uri);
    if (response != null) {
      var eventList = json.decode(response.body) as List;
      events = eventList.map((json) => Event.fromJSON(json)).toList();
    } else {
      plantation = new Event(
          eventHeading: "Plantation Drive",
          eventDescription:
              "The Avana Club will be organizing a plantation Drive in the city in collaboration with few other social organizations of city. Please give your valuable contribution by donating for the good cause.",
          contact: plancon);
      enigmaQuiz = new Event(
          eventHeading: "Enigma Quiz",
          eventDescription:
              "Enigma Quiz, one of its own kind will be organized by the Quiz Club of IIT Indore. Expected to receive 200+ participants from several institutes around the country. Contribute for award money or contact us for sponsorship.",
          contact: enigcon);
      tvsmInstrument = new Event(
          eventHeading: "T vs M Instrumental Competition",
          eventDescription:
              "T vs M is the one of its own kind competition between IIT Indore and IIM Indore where both the premier institutes compete in various cultural competitions to receive the glory. Contribute for purchasing new instruments and contact us for sponsorship.",
          contact: tvsmcon);
      events = [plantation, enigmaQuiz, tvsmInstrument];
    }
    setState(() {
      _listLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'PayBo',
          style: TextStyle(fontSize: 25.0),
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(
              text: "CATEGORIES",
            ),
            Tab(
              text: "EVENTS",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          CategoryScreen(categories),
          _listLoaded ? EventScreen(events) : Loading()
        ],
      ),
    );
  }
}
