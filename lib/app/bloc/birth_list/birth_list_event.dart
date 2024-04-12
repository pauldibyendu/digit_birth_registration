
abstract class BirthListEvent {}

class BirthListInitialEvent extends BirthListEvent {}

class BirthListSearchEvent extends BirthListEvent {
  final String searchString;
  BirthListSearchEvent({
    required this.searchString,
  });
}