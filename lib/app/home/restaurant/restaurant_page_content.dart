import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RestaurantPageContent extends StatelessWidget {
  const RestaurantPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('restaurant')
            .orderBy('rating', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Wystąpił nieoczekiwany problem'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Proszę czekać, trwa ładowanie danych');
          }

          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Restauracja'),
                          SizedBox(
                            height: 10,
                          ),
                          Text(document['name']),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pizza'),
                          SizedBox(
                            height: 10,
                          ),
                          Text(document['pizza']),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Ocena'),
                          SizedBox(
                            height: 10,
                          ),
                          Text(document['rating'].toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ],
          );
        });
  }
}
