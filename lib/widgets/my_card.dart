import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/bloc/cart_bloc.dart';

class MyCard extends StatelessWidget {
  MyCard(
      {super.key,
      this.onTap,
      required this.name,
      required this.loc,
      required this.phone});

  final void Function()? onTap;
  final String name;
  final String loc;
  final String phone;

  int groupValue = 0;

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
                            value: 1,
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
                  Expanded(
                    flex: 3,
                    child: Text(
                      name,
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
                loc,
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
                      phone,
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
