import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Food{

  String foodId = '';
  String foodName = "";
  int foodKCalPerDish = 0;
  int totalDishes = 0;
  double caloriesPerMinute = 0;
  int userTimeMinutesSelected = 0;
  String userTimeSelected = '';
  int userTimeBasedCalories = 0;

  Food(Map data)
  {
    foodId = data["foodId"];
    foodName = data["foodName"];
    totalDishes = data['totalDishes'];
    foodKCalPerDish =  data["kcal"];
    //caloriesPerMinute =  data["timePerMinute"];
  }

  Food.fromEmpty();

  Map<String, dynamic> toJson() {
    return {
      "foodId": this.foodId,
      "foodName": this.foodName,
      "totalDishes": this.totalDishes,    
      "foodKCalPerDish": this.foodKCalPerDish,    
      "caloriesPerMinute": this.caloriesPerMinute,  
      "userTimeMinutesSelected": this.userTimeMinutesSelected,  
      "userTimeSelected": this.userTimeSelected,  
      "userTimeBasedCalories": this.userTimeBasedCalories,  
    };
  }

  Food.fromSavedJson(Map<String, dynamic> data) {
    foodId = data["foodId"];
    foodName = data["foodName"];
    totalDishes = data['totalDishes'];
    foodKCalPerDish =  data["foodKCalPerDish"];
    caloriesPerMinute =  data["caloriesPerMinute"];
    userTimeMinutesSelected =  data["userTimeMinutesSelected"];
    userTimeSelected =  data["userTimeSelected"];
    userTimeBasedCalories =  data["userTimeBasedCalories"];
  }

  static Future<void> saveFoodsForDate(DateTime dateTime, List<Food> foodList) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savingList = [];
    for(int i =0; i < foodList.length; i ++)
    {
      Map<String, dynamic> json = foodList[i].toJson();
      String newAddition = jsonEncode(Food.fromSavedJson(json));
      savingList.add(newAddition);
    }
    String dateTimeKey = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    await prefs.setStringList(dateTimeKey, savingList);
  }

  static Future getSavedFoodsForDate(DateTime dateTime) async {
    String dateTimeKey = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    List<Food> savedListForDate = [];
    final prefs = await SharedPreferences.getInstance();
    List<String> alreadySaved = prefs.getStringList('$dateTimeKey') ?? [];
    for(int i=0; i < alreadySaved.length; i++)
    {
      Map<String, dynamic> decodeList = jsonDecode(alreadySaved[i]);
      Food food = Food.fromSavedJson(decodeList);
      savedListForDate.add(food);
    }
    return savedListForDate;
  }
}