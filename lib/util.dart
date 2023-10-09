import 'dart:core';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class User {
  String firstname;
  String lastname;
  String email;
  String phone;
  String address;
  String city;
  String rat;
  String gender;
  XFile? xFile;

  User({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.rat,
    required this.xFile,
    required this.gender,
  });
}

List<User> searchlist=[];
List<User> favouriteuserList=[];
List<User> list = [];
