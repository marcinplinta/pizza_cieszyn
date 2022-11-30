part of 'restaurant_cubit.dart';

@immutable
class RestaurantState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const RestaurantState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
