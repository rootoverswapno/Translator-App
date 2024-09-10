import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({super.key});

  @override
  State<LanguageTranslationPage> createState() =>
      _LanguageTranslationPageState();
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {
  var languages = [
    'Hindi',
    'English',
    'Bangla',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese'
  ];
  var originallanguage = "From";
  var destinationlanguage = "To";
  var output = " ";
  TextEditingController languagecontroller = TextEditingController();

  Future<void> translate(String src, String dest, String input) async {
    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text.toString();
    });
    if (src == '--' || dest == '--') {
      setState(() {
        output = "Failed to translate";
      });
    }
  }

  String getLanguagecode(String language) {
    if (language == "English") {
      return "en";
    } else if (language == "Hindi") {
      return "hi";
    } else if (language == "Bangla") {
      return "bn";
    } else if (language == "Spanish") {
      return "es";
    } else if (language == "French") {
      return "fr";
    } else if (language == "German") {
      return "de";
    } else if (language == "Chinese") {
      return "zh";
    } else if (language == "Japanese") {
      return "ja";
    } else {
      return "--";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            child: Icon(Icons.logout),
            onTap: () async {
              await FirebaseAuth.instance.signOut();

              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
        title: Text(
          "Language Translator",
          style: TextStyle(
            color: Colors.red, // Set text color
            fontStyle: FontStyle.italic, // Make text italic
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(0, 10, 98, 156),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      originallanguage,
                      style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String? Value) {
                      setState(() {
                        originallanguage = Value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  DropdownButton<String>(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      destinationlanguage,
                      style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String? Value) {
                      setState(() {
                        destinationlanguage = Value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Please Enter Your Text...',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  controller: languagecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter text to translate';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 65, 84, 116),
                  ),
                  onPressed: () {
                    translate(
                      getLanguagecode(originallanguage),
                      getLanguagecode(destinationlanguage),
                      languagecontroller.text.toString(),
                    );
                  },
                  child: Text("Translate"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "\n$output",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
