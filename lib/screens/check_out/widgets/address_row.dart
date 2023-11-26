import 'package:flutter/material.dart';

class AddressRow extends StatelessWidget {
  const AddressRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurStyle: BlurStyle.normal,
                offset: Offset(15, 85),
                blurRadius: 70,
              ),
            ],
          ),
        ),
        ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 2,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return const Card(
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 205,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: -5,
                      leading: Radio(value: 0, groupValue: [], onChanged: null),
                      title: Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.mode_edit_outline_outlined),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 42.0, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 160,
                          child: Text(
                            "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                            style: TextStyle(color: Color(0xFF847F7F)),
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.phone_android_outlined),
                            SizedBox(width: 4),
                            Text("+61 2 4916 1349"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
