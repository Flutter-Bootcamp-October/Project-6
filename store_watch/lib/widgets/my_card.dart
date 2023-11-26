import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  const MyCard(
      {super.key,
      this.onTap,
      required this.name,
      required this.loc,
      required this.phone});
  final void Function()? onTap;
  final String name;
  final String loc;
  final String phone;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: 250,
        //height: 180,
        child: Card(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Radio(
                      activeColor: const Color(0xfffcc873),
                      value: 1,
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      widget.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: const Icon(
                        Icons.mode_edit_outlined,
                        color: Color(0xff11151e),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                widget.loc,
                style: const TextStyle(color: Color(0xffb5b2b2)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.phone_iphone,
                      color: Color(0xff0f141d),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.phone,
                      style: const TextStyle(color: Color(0xff4a4e54)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
