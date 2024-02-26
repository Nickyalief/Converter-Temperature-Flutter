import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nicky Alief",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.grey[200], // Background color: light grey
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Konversi Suhu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black, // Text color: black
            ),
          ),
          backgroundColor: Colors.grey[200], // Background color: light grey
          iconTheme: IconThemeData(color: Colors.black), // Icon color: black
        ),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController celciust = TextEditingController();
  TextEditingController farenheitt = TextEditingController();
  TextEditingController kelvint = TextEditingController();
  TextEditingController reamurt = TextEditingController();

  String _chosenValue = "Celcius";
  var c, f, k, r, hasil;

  final TextEditingController input = TextEditingController(
    text: '',
  );

  void hitung() {
    if (_chosenValue == "Celcius") {
      c = double.parse(input.text);
      r = c * (4 / 5);
      f = (c * 9 / 5) + 32;
      k = c + 273.15;
      celciust.text = c.toString();
      farenheitt.text = f.toString();
      reamurt.text = r.toString();
      kelvint.text = k.toString();
    } else if (_chosenValue == "Reamur") {
      r = double.parse(input.text);
      c = r * (4 / 5);
      f = (r * 9 / 4) + 32;
      k = (r * 5 / 4) + 273.16;
      celciust.text = c.toString();
      farenheitt.text = f.toString();
      reamurt.text = r.toString();
      kelvint.text = k.toString();
    } else if (_chosenValue == "Farenheit") {
      f = double.parse(input.text);
      c = (f * 5 / 9) - 32;
      r = (f * 4 / 9) - 32;
      k = (f - 32) * 5 / 9 + 273.16;
      celciust.text = c.toString();
      farenheitt.text = f.toString();
      reamurt.text = r.toString();
      kelvint.text = k.toString();
    } else if (_chosenValue == "Kelvin") {
      k = double.parse(input.text);
      c = k - 273.16;
      r = (k - 273.16) * 4 / 5;
      f = (k - 273.16) * 9 / 5 + 32;
      celciust.text = c.toString();
      farenheitt.text = f.toString();
      reamurt.text = r.toString();
      kelvint.text = k.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Background color: light grey
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Suhu",
              hintText: "Masukkan Suhu",
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.blue), // Blue border when focused
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blue), // Blue border when not focused
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
            ],
            style: TextStyle(color: Colors.black), // Text color: black
            controller: input,
          ),
          DropdownButton<String>(
            value: _chosenValue,
            items: <String>[
              'Celcius',
              'Farenheit',
              'Kelvin',
              'Reamur',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                    style: TextStyle(color: Colors.black)), // Text color: black
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                _chosenValue = value!;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              hitung();
            },
            child: Text(
              'Konversi Suhu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color: white
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Button color: blue
            ),
          ),
          Text("Celcius: "),
          TextField(
            controller: celciust,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Celcius",
            ),
            style: TextStyle(color: Colors.black), // Text color: black
          ),
          Text("Reamur: "),
          TextField(
            controller: reamurt,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Reamur",
            ),
            style: TextStyle(color: Colors.black), // Text color: black
          ),
          Text("Farenheit: "),
          TextField(
            controller: farenheitt,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Farenheit",
            ),
            style: TextStyle(color: Colors.black), // Text color: black
          ),
          Text("Kelvin: "),
          TextField(
            controller: kelvint,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Kelvin",
            ),
            style: TextStyle(color: Colors.black), // Text color: black
          ),
        ],
      ),
    );
  }
}
