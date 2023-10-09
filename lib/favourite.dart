import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:users_app/util.dart';

class FavoriteUser extends StatefulWidget {
  const FavoriteUser({super.key});

  @override
  State<FavoriteUser> createState() => _FavoriteUserState();
}

class _FavoriteUserState extends State<FavoriteUser> {
  void _deleteUser(int index) {
    setState(() {
      favouriteuserList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite User List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favouriteuserList.length,
        itemBuilder: (context, index) {
          final user = favouriteuserList[index];
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: 0.2)
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only( left: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text("Name: "),
                          Text(
                            user.firstname,
                            style: TextStyle(color: Colors.black26),
                          ),
                          SizedBox(width: 5),
                          Text(
                            user.lastname,
                            style: TextStyle(color: Colors.black26),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Email: "),
                          Text(
                            user.email,
                            style: TextStyle(color: Colors.black26),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("Mo.: "),
                          Text(
                            user.phone,
                            style: TextStyle(color: Colors.black26),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Address: "),
                          Text(
                            user.address,
                            style: TextStyle(color: Colors.black26),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("City: "),
                          Text(
                            user.city,
                            style: TextStyle(color: Colors.black26),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Rating: "),
                          RatingBarIndicator(
                            rating: double.parse(user.rat as String),
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 16.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 45,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black12,
                  foregroundColor: Colors.black,
                  backgroundImage: user.xFile != null
                      ? FileImage(
                    File(user.xFile?.path ?? ""),
                  )
                      : null,
                ),
              ),
              Positioned(
                right: 10,
                top: 0,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Delete User'),
                              content: const Text("Are You Sure Want To Delete This User from Favourite list?"),
                              actions: <Widget>[
                                TextButton(onPressed: (){
                                  Navigator.of(context).pop(false);
                                }, child: const Text("No")
                                ),
                                TextButton(onPressed: (){
                                  _deleteUser(index);
                                  Navigator.pop(context);
                                }, child: const Text("Yes"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 18,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}