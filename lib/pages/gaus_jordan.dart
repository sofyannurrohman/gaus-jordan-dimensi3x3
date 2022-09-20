import 'dart:convert';

import "package:flutter/material.dart";
import 'package:gausjordan/pages/about.dart';
import 'package:gausjordan/pages/instruction.dart';
import 'package:gausjordan/provider/provider.dart';
import 'package:provider/provider.dart';
import "../../shared/theme.dart";

class GausJordanPage extends StatefulWidget {
  const GausJordanPage({Key? key}) : super(key: key);

  @override
  State<GausJordanPage> createState() => _GausJordanPageState();
}

class _GausJordanPageState extends State<GausJordanPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Provider.of<GausProvider>(context, listen: false).initScreen();
    super.initState();
  }

  bool isGausJordan = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<GausProvider>(builder: (context, prov, _) {
      return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            "Gauss-Jordan",
            style: TextStyle(fontWeight: semiBold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => InstructionPage());
                  Navigator.push(context, route);
                },
                icon: Image.asset("assets/information.png")),
            IconButton(
                onPressed: () {
                  prov.reset();
                  setState(() {});
                },
                icon: Image.asset("assets/reset.png"))
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    inputan(label: "x", controller: prov.x1),
                    inputan(label: "y", controller: prov.y1),
                    inputan(label: "z", controller: prov.z1),
                    samadengan(controller: prov.h1),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    inputan(label: "x", controller: prov.x2),
                    inputan(label: "y", controller: prov.y2),
                    inputan(label: "z", controller: prov.z2),
                    samadengan(controller: prov.h2),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    inputan(label: "x", controller: prov.x3),
                    inputan(label: "y", controller: prov.y3),
                    inputan(label: "z", controller: prov.z3),
                    samadengan(controller: prov.h3),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      color: kPrimaryColor,
                      elevation: 1,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          isGausJordan = true;
                          prov.submitData();
                          prov.resultStep = [];
                          prov.gausjordan();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Harus diisi semua')),
                          );
                        }
                      },
                      child: Text(
                        "Elim Gaus-Jordan",
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 16,
                            fontWeight: semiBold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 17),
                Divider(
                  color: kBlackColor,
                ),
                Builder(builder: (context) {
                  if (prov.resultStep.isEmpty) {
                    return SizedBox();
                  }
                  var d = prov.resultStep.last;
                  var result = json.decode(d["result"]) as List;
                  var desc = d["desc"];
                  var isSuccess = d["isSuccess"];
                  return Container(
                    margin: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hasil :",
                          style: TextStyle(fontSize: 18, fontWeight: semiBold),
                        ),
                        Center(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: result.map(
                                (e) {
                                  var d = e as List;
                                  return Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: d.map(
                                          (x) {
                                            return Container(
                                                width: 50,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(5),
                                                child: Text(formatDouble(x)));
                                          },
                                        ).toList()),
                                  );
                                },
                              ).toList()),
                        ),
                        Builder(builder: (context) {
                          if (!isGausJordan || isSuccess == null) {
                            return SizedBox();
                          }
                          return Column(
                              children: result.map(
                            (e) {
                              var index = result.indexOf(e);
                              var h = e[3] as double;
                              var label = "x";
                              if (index == 1) {
                                label = "y";
                              }
                              if (index == 2) {
                                label = 'z';
                              }

                              return Text("$label ${formatDouble(h)}");
                            },
                          ).toList());
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        Builder(builder: (context) {
                          if (isSuccess == true) {
                            return SizedBox();
                          }
                          return Text(
                            desc,
                            style: TextStyle(fontSize: 16, fontWeight: medium),
                          );
                        })
                      ],
                    ),
                  );
                }),
                Builder(builder: (context) {
                  if (prov.resultStep.isEmpty) {
                    return SizedBox();
                  }
                  return Column(
                    children: [
                      Divider(
                        color: kBlackColor,
                      ),
                      Container(
                        margin: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Detail Pengerjaan :',
                              style:
                                  TextStyle(fontSize: 18, fontWeight: semiBold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: prov.resultStep.length,
                              itemBuilder: ((context, index) {
                                var d = prov.resultStep[index];
                                var result = json.decode(d['result']) as List;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      d['title'],
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: semiBold),
                                    ),
                                    Text(d['desc']),
                                    Center(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: result.map(
                                            (e) {
                                              var d = e as List;
                                              return Container(
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: d.map(
                                                        (x) {
                                                          return Container(
                                                              width: 50,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5),
                                                              child: Text(
                                                                  formatDouble(
                                                                      x)));
                                                        },
                                                      ).toList()));
                                            },
                                          ).toList()),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget inputan(
      {String? label,
      TextEditingController? controller,
      void Function(String)? onChanged}) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[400],
            ),
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              validator: (value) {
                if (value!.isEmpty) {
                  return '';
                }
              },
              keyboardType: TextInputType.numberWithOptions(),
              style: TextStyle(fontSize: 24, fontWeight: semiBold),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  errorStyle: TextStyle(fontSize: 0),
                  border: InputBorder.none),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              label!,
              style: TextStyle(fontSize: 24, fontWeight: semiBold),
            ),
          )
        ],
      ),
    );
  }

  Widget samadengan(
      {TextEditingController? controller, void Function(String)? onChanged}) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: Text(
              "=",
              style: TextStyle(fontSize: 24, fontWeight: semiBold),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[400],
            ),
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              validator: (value) {
                if (value!.isEmpty) {
                  return '';
                }
              },
              keyboardType: TextInputType.numberWithOptions(),
              style: TextStyle(fontSize: 24, fontWeight: semiBold),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0), border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
