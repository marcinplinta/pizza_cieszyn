import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_cieszyn/app/home/restaurant/cubit/restaurant_cubit.dart';

class RestaurantPageContent extends StatelessWidget {
  const RestaurantPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantCubit(),
      child: BlocBuilder<RestaurantCubit, RestaurantState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Wystąpił nieoczekiwany problem: ${state.errorMessage}',
              ),
            );
          }

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = state.documents;

          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Restauracja'),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(document['name']),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Pizza'),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(document['pizza']),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Ocena'),
                          const SizedBox(
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

          return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('restaurant')
                  .orderBy('rating', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {});
        },
      ),
    );
  }
}
