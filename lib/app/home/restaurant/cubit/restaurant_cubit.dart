import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit()
      : super(const RestaurantState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));
}
