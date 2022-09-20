import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class GausProvider extends ChangeNotifier {
  TextEditingController x1 = TextEditingController();
  TextEditingController x2 = TextEditingController();
  TextEditingController x3 = TextEditingController();
  TextEditingController y1 = TextEditingController();
  TextEditingController y2 = TextEditingController();
  TextEditingController y3 = TextEditingController();
  TextEditingController z1 = TextEditingController();
  TextEditingController z2 = TextEditingController();
  TextEditingController z3 = TextEditingController();
  TextEditingController h1 = TextEditingController();
  TextEditingController h2 = TextEditingController();
  TextEditingController h3 = TextEditingController();

  bool checkAllNotEmpty() {
    if (x1.text.isNotEmpty &&
        x2.text.isNotEmpty &&
        x3.text.isNotEmpty &&
        y1.text.isNotEmpty &&
        y2.text.isNotEmpty &&
        y3.text.isNotEmpty &&
        z1.text.isNotEmpty &&
        z2.text.isNotEmpty &&
        z3.text.isNotEmpty &&
        h1.text.isNotEmpty &&
        h2.text.isNotEmpty &&
        h3.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool checkAllNumeric() {
    if (isNumeric(x1.text) &&
        isNumeric(x2.text) &&
        isNumeric(x3.text) &&
        isNumeric(y1.text) &&
        isNumeric(y2.text) &&
        isNumeric(y3.text) &&
        isNumeric(z1.text) &&
        isNumeric(z2.text) &&
        isNumeric(z3.text) &&
        isNumeric(h1.text) &&
        isNumeric(h2.text) &&
        isNumeric(h3.text)) {
      return true;
    } else {
      return false;
    }
  }

  List<List> data = [
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
  ];

  submitData() {
    data[0][0] = double.parse(x1.text);
    data[0][1] = double.parse(y1.text);
    data[0][2] = double.parse(z1.text);
    data[1][0] = double.parse(x2.text);
    data[1][1] = double.parse(y2.text);
    data[1][2] = double.parse(z2.text);
    data[2][0] = double.parse(x3.text);
    data[2][1] = double.parse(y3.text);
    data[2][2] = double.parse(z3.text);
    data[0][3] = double.parse(h1.text);
    data[1][3] = double.parse(h2.text);
    data[2][3] = double.parse(h3.text);
  }

  void initScreen() {
    reset();
    x1.text = '';
    x2.text = '';
    x3.text = '';
    y1.text = '';
    y2.text = '';
    y3.text = '';
    z1.text = '';
    z2.text = '';
    z3.text = '';
    h1.text = '';
    h2.text = '';
    h3.text = '';
  }

  List<List>? swapColumn1() {
    var pointer = data[0][0];
    var d10 = data[1][0];
    var d20 = data[2][0];
    if (pointer == 0 && d10 != 0) {
      var col1 = data[0];
      var col2 = data[1];
      data[0] = col2;
      data[1] = col1;
      return data;
    }
    if (pointer == 0 && d10 == 0) {
      var col1 = data[0];
      var col3 = data[2];
      data[0] = col3;
      data[2] = col1;
      return data;
    } else {
      return null;
    }
  }

  Map swapColumn2() {
    var pointer = data[1][1];
    var c20 = data[2][1];
    var stopped = false;
    if (pointer == 0 && c20 == 0) {
      stopped = true;
    }
    if (pointer == 0 && c20 != 0) {
      var col2 = data[1];
      var col3 = data[2];
      data[1] = col3;
      data[2] = col2;
      return {"stopped": stopped, "data": data};
    } else {
      return {"stopped": stopped, "data": null};
    }
  }

  reset() {
    data = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
    ];
    resultStep = [];
    x1.text = '';
    x2.text = '';
    x3.text = '';
    y1.text = '';
    y2.text = '';
    y3.text = '';
    z1.text = '';
    z2.text = '';
    z3.text = '';
    h1.text = '';
    h2.text = '';
    h3.text = '';
  }

  List<Map> resultStep = [];
  bool gaus() {
    var swap1 = swapColumn1();
    if (swap1 != null) {
      saveToResultStep(
          title: "Pindah baris", desc: "Tukar baris pertama", d: data);
    }

    var baris1 = data[0];
    var pembagi = data[0][0] as double;
    for (var i = 0; i < baris1.length; i++) {
      var e = data[0][i];
      data[0][i] = e / pembagi;
    }

    saveToResultStep(title: "Langkah 1", desc: "Baris / M[1][1]", d: data);

    var baris2 = data[1];
    var b = data[1][0] as double;
    var pointer = b * -1;
    for (var i = 0; i < baris2.length; i++) {
      var e = data[1][i];
      var pengkali = data[0][i];
      data[1][i] = pointer * pengkali + e;
    }
    saveToResultStep(
        title: "Langkah 2", desc: "Baris 2 - (M[2][1]) * baris 1", d: data);
    var baris3 = data[2];
    var p = data[2][0] as double;

    if (!p.isNegative) {
      p = p * -1;
    } else {
      p = p * -1;
    }
    for (var i = 0; i < baris3.length; i++) {
      var e = data[2][i];
      var pengkali = data[0][i];
      data[2][i] = p * pengkali + e;
    }
    saveToResultStep(
        title: "Langkah 3", desc: "Baris 3 - (M[3][1]) * baris 1", d: data);

    var swap2 = swapColumn2();
    var swap2Stopped = swap2['stopped'];
    var swap2Data = swap2['data'];
    if (swap2Data != null) {
      saveToResultStep(
          title: "Pindah baris", desc: "Tukar baris kedua", d: data);
    }
    if (swap2Stopped) {
      saveToResultStep(
          title: "Tidak dapat diselesaikan",
          desc:
              "Nilai M[2][2] dan M[3][2] = 0 sehingga tidak bisa membentuk matriks identitas",
          d: data);
      return false;
    }

    var z = data[1][1] as double;

    for (var i = 1; i < baris2.length; i++) {
      var e = data[1][i];
      data[1][i] = e / z;
    }

    saveToResultStep(title: "Langkah 4", desc: "Baris 2 / M[2][2]", d: data);

    var m = data[2][1] as double;
    if (!m.isNegative) {
      m = m * -1;
    } else {
      m = m * -1;
    }
    for (var i = 1; i < baris3.length; i++) {
      var e = data[2][i];
      var pengkali = data[1][i];
      data[2][i] = m * pengkali + e;
    }
    saveToResultStep(
        title: "Langkah 5", desc: "Baris 3 - (M[3][2]) * baris 2", d: data);

    var y = data[2][2] as double;
    if (y == 0) {
      saveToResultStep(
          title: "Tidak dapat diselesaikan",
          desc: "Matriks[3][3] = 0 tidak dapat membentuk matriks identitas",
          d: data);
      return false;
    }
    for (var i = 2; i < baris3.length; i++) {
      var e = data[2][i];
      data[2][i] = e / y;
    }
    saveToResultStep(
        title: "Langkah 6",
        isSuccess: true,
        desc: "Baris 2 / M[3][3]",
        d: data);
    notifyListeners();

    return true;
  }

  void gausjordan() {
    var r = gaus();
    if (r == false) {
      return;
    }
    var baris1 = data[0];
    var baris2 = data[1];

    var p = data[0][2] as double;
    if (!p.isNegative) {
      p = p * -1;
    } else {
      p = p * -1;
    }
    for (var i = 2; i < baris1.length; i++) {
      var e = data[0][i];
      var pengkali = data[2][i];
      data[0][i] = p * pengkali + e;
    }
    saveToResultStep(
        title: "Langkah 7", desc: "Baris 1 - (M[1][3]) * baris 3", d: data);
    var m = data[1][2] as double;
    if (!m.isNegative) {
      m = m * -1;
    } else {
      m = m * -1;
    }
    for (var i = 2; i < baris1.length; i++) {
      var e = data[1][i];
      var pengkali = data[2][i];
      data[1][i] = m * pengkali + e;
    }
    saveToResultStep(
        title: "Langkah 8", desc: "Baris 2 - (M[2][3]) * baris 3", d: data);
    var c = data[0][1] as double;
    if (!c.isNegative) {
      c = c * -1;
    } else {
      c = c * -1;
    }
    for (var i = 1; i < baris1.length; i++) {
      var e = data[0][i];
      var pengkali = data[1][i];
      data[0][i] = c * pengkali + e;
    }
    saveToResultStep(
        title: "Langkah 9",
        isSuccess: true,
        desc: "Baris 1 - (M[1][2]) * baris 2",
        d: data);
    notifyListeners();
  }

  void saveToResultStep(
      {String? title, bool? isSuccess, String? desc, List? d}) {
    var map = {
      "title": title,
      "isSuccess": isSuccess,
      "desc": desc,
      "result": json.encode(d)
    };
    resultStep.add(map);
    notifyListeners();
  }
}
