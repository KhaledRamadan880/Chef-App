import 'package:chef_app/features/menu/data/menu_reopsitory/menu_repo.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepo) : super(MenuInitial());

  TextEditingController mealNameController = TextEditingController();
  TextEditingController mealPriceController = TextEditingController();
  TextEditingController mealDescController = TextEditingController();
  GlobalKey<FormState> addMealKey = GlobalKey<FormState>();

  final MenuRepo menuRepo;

  List categoryList = [
    'Beef',
    'Chicken',
    "Fish",
    "Seafood",
    "Pork",
    "Lamb",
    "Vegetarian",
    "Vegan",
    "Gluten-free",
  ];
  var selectedItem = 'Beef';
  void changeItem(item) {
    selectedItem = item;
    emit(ChangeItemState());
  }

  String groupval = 'quantity';
  void changeGroupVal(value) {
    groupval = value;
    emit(ChangeGroupValState());
  }
}
