// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import
import 'dart:ffi';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'MemberDetailWidget.dart';
import 'package:library_system/Models/Member.dart';
import '../../Enum/MemberType.dart';
import '../../Tools/DateTimeFormat.dart' as dateFormatter; // Tarihi memberin içine Datetime olarak gidiyor ama ekranda gösterirken anlaşılır kılmak için küütphane kullandım ve bunu metotlaştırdım.

class MemberOperation_Widget extends StatefulWidget {
  const MemberOperation_Widget({super.key});

  @override
  State<MemberOperation_Widget> createState() => _MemberOperation_WidgetState();
}

class _MemberOperation_WidgetState extends State<MemberOperation_Widget> {
  TextEditingController mbName = TextEditingController();
  TextEditingController mbLastName = TextEditingController();
  TextEditingController mbEmail = TextEditingController();
  TextEditingController mbPhone = TextEditingController();
  TextEditingController mbOfStartDate = TextEditingController();
  List<Member> lstMember = <Member>[];
  int id = 1; // Üye no int tipine çevrildi ve in-memory olarak otomatik arttırma yapıyor.
  MemberType? selectedMbType = MemberType.Starter; // Bunun belirtilmesinin sebebi dropdown buttona member tipini yazdırmak.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Üye Ekle"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    createField(mbName, 'Üye adı', 8),
                    createField(mbLastName, 'Üye Soyadı', 8),
                    createField(mbEmail, 'Üye email', 8),
                    createField(mbPhone, 'Üye telefon', 8),
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: DropdownButton<MemberType>(
                          value: selectedMbType,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          onChanged: (MemberType? newValue) {
                            setState(() {
                              selectedMbType = newValue;
                            });
                          },
                          items: MemberType.values.map((MemberType value) {
                            return DropdownMenuItem<MemberType>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                        )),
                    lstMember.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(5),
                            child: DropdownButton(
                              onChanged: (Member? newValue) {
                                setState(() {});
                              },
                              items: lstMember.map((Member value) {
                                return DropdownMenuItem<Member>(
                                  value: value,
                                  child: Text(value.firstName.toString()),
                                );
                              }).toList(),
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: saveMember,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple),
                        child: Text("Kaydet"),
                      ),
                    ),
                    lstMember.isNotEmpty
                        ? SizedBox(
                            height: 250,
                            child: ListView.builder(
                                itemCount: lstMember.length,
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: ListTile(
                                        title: Text(lstMember[index]
                                            .firstName
                                            .toString()),
                                        subtitle: Text(lstMember[index]
                                            .lastName
                                            .toString()),
                                        leading: Icon(Icons.person),
                                        trailing: Icon(Icons.arrow_forward),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MemberDetailWidget(
                                                        member:
                                                            lstMember[index]),
                                              ));
                                        },
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : Container(),
                  ],
                ))));
  }

  saveMember() {
    Member member = Member();
    member.memberNumber = id;
    member.firstName = mbName.text.toString();
    member.lastName = mbLastName.text.toString();
    member.eMail = mbEmail.text.toString();
    member.phoneNumber = mbPhone.text.toString();
    member.type = selectedMbType;
    member.memberOfStartDate = DateTime.now();
    member.isActive = true;

    setState(() {
      id++;
      lstMember.add(member);
      mbName.text = "";
      mbLastName.text = "";
      mbEmail.text = "";
      mbPhone.text = "";
    });
  }
}
// kolay widget oluşturmak için fonksiyon yazıldı
Widget createField(
    TextEditingController txcontroller, String? hnText, double padValue) {
  return Padding(
    padding: EdgeInsets.only(top: padValue),
    child: TextField(
      controller: txcontroller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(1)),
          ),
          hintText: hnText),
    ),
  );
}
