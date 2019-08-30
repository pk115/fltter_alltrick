import 'package:flutter/material.dart';
import 'package:flutter_alltrick/sqlite/utils/database_helper.dart';
import 'package:intl/intl.dart';

class AddMemberScreen extends StatefulWidget {
  var id;

  AddMemberScreen(this.id);

  @override
  _AddMemberScreenState createState() => _AddMemberScreenState(id);
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  var id;

  _AddMemberScreenState(this.id);

  DatabaseHelper db = DatabaseHelper.internal();

  TextStyle myStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  DateTime birthDate;
  String strBirthDate;
  TextEditingController ctrFName = TextEditingController();
  TextEditingController ctrLName = TextEditingController();
  TextEditingController ctrEmail = TextEditingController();
  TextEditingController ctrPhone = TextEditingController();

  String sex = 'ชาย';
  bool isActive = true;
  final _formKey = GlobalKey<FormState>();

  Future<Null> getDetail(int id) async {
    var res = await db.getUserDetail(id);
    var detail = res[0];
    setState(() {
      ctrFName.text = detail['first_name'];
      ctrLName.text = detail['last_name'];
      ctrEmail.text = detail['email'];
      ctrPhone.text = detail['telephone'];

      String _BDate = detail['birth_date'];

      DateTime getbdate = DateTime.parse(_BDate);

      var strDate = DateFormat.MMMd('th_TH')
          .format(DateTime(getbdate.year, getbdate.month, getbdate.day));
      strBirthDate = '$strDate ${getbdate.year + 543} ';
      birthDate = getbdate;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (id != null) {
      getDetail(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime _currentDate;

    Future<Null> _ShowDatePicker() async {
      final DateTime picked = await showDatePicker(
        locale: const Locale('th'),
        context: context,
        initialDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        firstDate: DateTime(
            DateTime.now().year - 80, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(
            DateTime.now().year + 1, DateTime.now().month, DateTime.now().day),
      );
      if (picked != null && picked != _currentDate) {
        setState(() {
//          var formatter = DateFormat('dd-MMM-yyyy');
//          String formatted = formatter.format(picked);
//          strBirthDate=formatted;

          var strDate = DateFormat.MMMd('th_TH')
              .format(DateTime(picked.year, picked.month, picked.day));
          strBirthDate = '$strDate ${picked.year + 543} ';
          birthDate = picked;
        });
      }
    }

    Future<Null> saveData() async {
      print(ctrFName.text);
      print(ctrLName.text);
      print(ctrEmail.text);
      print(ctrPhone.text);
      print(sex);
      print(birthDate);
      print(isActive);

      if (_formKey.currentState.validate() && birthDate != null) {
        ///print("save");
        Map member = {
          'firstname': ctrFName.text,
          'lastname': ctrLName.text,
          'email': ctrEmail.text,
          'telephone': ctrPhone.text,
          'birthDate': birthDate.toString(),
          'id': id
        };
        if (id != null) {
          await db.UpdateDataUser(member);
          Navigator.of(context).pop({'ok': true});
        } else {
          await db.saveDataUser(member);
          Navigator.of(context).pop({'ok': true});
        }
      } else {
        print("Fail");
      }
    }

    String _validateEmail(String value) {
      if (value.isEmpty) return 'กรุณาระบุอีเมลล์';

      final RegExp nameExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      if (!nameExp.hasMatch(value)) return 'รูปแบบอีเมลไม่ถูกต้อง';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: () => saveData())
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "รายละเอียด",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                controller: ctrFName,
                                decoration: InputDecoration(
                                    labelText: 'FName', labelStyle: myStyle),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'กรุณาระบุชื่อ';
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: ctrLName,
                                decoration: InputDecoration(
                                    labelText: 'LName', labelStyle: myStyle),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'กรุณาระบุนามสกุล';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Birth Date",
                              style: myStyle,
                            ),
                            FlatButton(
                                onPressed: () => _ShowDatePicker(),
                                child: Text(
                                  strBirthDate ?? 'เลือกวันที่',
                                  style: myStyle,
                                ))
                          ],
                        ),
                        TextFormField(
                          controller: ctrEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email', labelStyle: myStyle),
                          validator: _validateEmail,
                        ),
                        TextFormField(
                          controller: ctrPhone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              labelText: 'Phone', labelStyle: myStyle),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'กรุณาระบุPhone';
                            }
                            if (value.length != 10) {
                              return 'รูปแบบเบอรโทรไม่ถูกต้อง';
                            }
                          },
                        ),
                        SwitchListTile(
                          value: isActive,
                          onChanged: (bool value) {
                            setState(() {
                              isActive = value;
                            });
                          },
                          title: Text("ON-OFF"),
                        ),
                        ListTile(
                          title: const Text("เพศ"),
                          trailing: DropdownButton(
                            value: sex,
                            style: myStyle,
                            onChanged: (String newValue) {
                              setState(() {
                                sex = newValue;
                              });
                            },
                            items: <String>['ชาย', 'หญิง'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
