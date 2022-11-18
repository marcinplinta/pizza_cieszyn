import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionContent extends StatefulWidget {
  const AddOpinionContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionContent> createState() => _AddOpinionContentState();
}

class _AddOpinionContentState extends State<AddOpinionContent> {
  var restaurantName = '';
  var pizzaName = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę restauracji',
            ),
            onChanged: (newValue) {
              setState(() {
                restaurantName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę pizzy',
            ),
            onChanged: (newValue) {
              setState(() {
                pizzaName = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('restaurant').add({
                'name': restaurantName,
                'pizza': pizzaName,
                'rating': 3.0,
              });
            },
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
