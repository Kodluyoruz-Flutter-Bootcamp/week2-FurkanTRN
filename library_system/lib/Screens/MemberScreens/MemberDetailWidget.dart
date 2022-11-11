import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:library_system/Models/Member.dart';
import 'package:library_system/Tools/DateTimeFormat.dart' as dateFormatter;

class MemberDetailWidget extends StatelessWidget {
  MemberDetailWidget({super.key, required this.member});
  Member member;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Üye"), backgroundColor: Colors.purple),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                createMemberField('Üye Ad-Soyad',
                    '${member.firstName.toString()} ${member.lastName.toString()}'),
                createMemberField('Üye No', member.memberNumber.toString()),
                createMemberField(
                    'Üye Tipi', member.type.toString().split('.').elementAt(1)),
                createMemberField(
                    'Üye Telefon No', member.phoneNumber.toString()),
                createMemberField('Üye Kayıt Tarihi',
                    dateFormatter.DateFormat(member.memberOfStartDate)),
                createMemberField('Member Status', isMemberActive(member)),
                createMemberField('Member Block Status', isMemberBlock(member))
              ],
            ))
          ],
        ),
      ),
    );
  }
}

Widget createMemberField(String mbtitle, String mbsubtitle) {
  return ListTile(
    title: Text(mbtitle),
    subtitle: Text(mbsubtitle),
  );
}

String isMemberActive(Member member) {
  return member.isActive ? "Active" : "Passive";
}

String isMemberBlock(Member member) {
  return member.isBlock ? "Yes" : "No";
}
