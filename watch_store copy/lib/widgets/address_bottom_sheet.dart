import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/blocs/product_bloc/product_bloc.dart';
import 'package:watch_store/styles/custom_colors.dart';
import 'package:watch_store/widgets/add_text_field.dart';

class AddressBottomSheet extends StatelessWidget {
  const AddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController addressController = TextEditingController();
    return SizedBox(
      height: 280,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            AddTextField(
              label: "Address",
              hint: 'Enter your Address',
              isPassword: false,
              controller: addressController,
              icon: Icons.add,
            ),
            const SizedBox(
              height: 40,
            ),
            BlocListener<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state is AdrressAddedState) {
                  Navigator.pop(context);
                }
              },
              child: InkWell(
                onTap: () {
                  context
                      .read<ProductBloc>()
                      .add(AddAddressEvent(addressController.text));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primary,
                  ),
                  child: const Center(
                      child: Text(
                    "Add Address",
                    style: TextStyle(fontSize: 16),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
