import 'package:flutter/material.dart';

class List_item {
 late String category;
 late int amount ;
 late int counter=0;

 List_item({String? Category,int? Amount}){
   this.category = Category!;
   this.amount=Amount!;
   counter++;
 }


}