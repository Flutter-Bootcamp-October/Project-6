import 'package:flutter/material.dart';

class CardDefelt extends StatefulWidget {
  const CardDefelt({super.key, this.onTap});
  final void Function()? onTap;
  @override
  State<CardDefelt> createState() => _CardDefeltState();
}

class _CardDefeltState extends State<CardDefelt> {
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
                  const Expanded(
                    flex: 3,
                    child: Text(
                      "Work",
                      style: TextStyle(fontWeight: FontWeight.bold),
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
              const Text(
                "2972 Westheimer Rd,",
                style: TextStyle(color: Color(0xffb5b2b2)),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40, top: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_iphone,
                      color: Color(0xff0f141d),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "(270 333 111 999)",
                      style: TextStyle(color: Color(0xff4a4e54)),
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
