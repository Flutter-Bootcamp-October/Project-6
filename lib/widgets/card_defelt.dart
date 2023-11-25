import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/bloc/cart_bloc.dart';

class CardDefelt extends StatelessWidget {
  const CardDefelt({super.key, this.onTap, required this.groupValue});
  final void Function()? onTap;
  final int groupValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                    child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is RadioCartState) {
                          return Radio(
                            activeColor: const Color(0xfffcc873),
                            value: state.value,
                            groupValue: groupValue,
                            onChanged: (value) {
                              context
                                  .read<CartBloc>()
                                  .add(RadioCartEvent(value!));
                            },
                          );
                        } else {
                          return Radio(
                            activeColor: const Color(0xfffcc873),
                            value: 0,
                            groupValue: groupValue,
                            onChanged: (value) {
                              context
                                  .read<CartBloc>()
                                  .add(RadioCartEvent(value!));
                            },
                          );
                        }
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
