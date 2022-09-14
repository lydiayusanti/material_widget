import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var _controllerNama = TextEditingController();
  var _controllerNim = TextEditingController();

  var _status = "Hadir";

  var _salinan = false;

  double _slider = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Input Form Absensi",
        ),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text(
              "Alamat Email",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _textField(),
          const SizedBox(
            height: 32,
          ),
          const ListTile(
            title: Text(
              "Data Diri",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          _textFormField(),
          const SizedBox(
            height: 32,
          ),
          const ListTile(
            title: Text(
              "Status Absen",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          _radio(),
          const SizedBox(
            height: 32,
          ),
          _switch(),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  ListTile _switch() {
    return ListTile(
      onTap: () => setState(() => _salinan = !_salinan),
      title: Text("Salin Isi Form"),
      trailing: Switch(
        value: _salinan,
        onChanged: (value) => setState(() => _salinan = value),
      ),
    );
  }

  Column _radio() {
    return Column(
      children: [
        ListTile(
          onTap: () => setState(() => _status = 'Hadir'),
          leading: Radio(
            value: "Hadir",
            groupValue: _status,
            onChanged: (value) {
              setState(() => _status = value.toString());
            },
          ),
          title: Text("Hadir"),
        ),
        ListTile(
          onTap: () => setState(() => _status = 'Izin'),
          leading: Radio(
            value: "Izin",
            groupValue: _status,
            onChanged: (value) {
              setState(() => _status = value.toString());
            },
          ),
          title: Text("Izin"),
        ),
        ListTile(
          onTap: () => setState(() => _status = 'Sakit'),
          leading: Radio(
            value: "Sakit",
            groupValue: _status,
            onChanged: (value) {
              setState(() => _status = value.toString());
            },
          ),
          title: Text("Sakit"),
        ),
      ],
    );
  }

  Padding _textField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: TextEditingController(),
            decoration: const InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orangeAccent),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _textFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextFormField(
            validator: (value) => value == '' ? "Dont Empty" : null,
            controller: _controllerNama,
            decoration: InputDecoration(labelText: 'Nama Lengkap'),
          ),
          TextFormField(
            validator: (value) => value == '' ? "Dont Empty" : null,
            controller: _controllerNim,
            decoration: InputDecoration(labelText: 'NIM'),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
