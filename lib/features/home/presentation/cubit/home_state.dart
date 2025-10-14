class HomeState {}

class HomeIntialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSucessState extends HomeState {
  String? message;
  HomeSucessState({this.message});
}

class HomeErrorState extends HomeState {}
