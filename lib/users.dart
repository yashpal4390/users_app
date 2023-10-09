import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:users_app/util.dart';

import 'constant.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  void _deleteUser(int index) {
    setState(() {
      list.removeAt(index);
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
        leading: SizedBox(height: 2),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Search User'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: searchController,
                            decoration:
                                InputDecoration(labelText: 'Enter User Name'),
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: InkWell(
                            child: Text('Search'),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.search_sharp)),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, fav_page);
            },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
            Icons.favorite_outlined,
            color: Colors.red,
          ),
              ))
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final user = list[index];
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
                    padding: const EdgeInsets.only(left: 100),
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
                            Text("Gender: "),
                            Text(
                              user.gender,
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
                  bottom: 0,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Share.share(user.firstname ?? "");
                        },
                        icon: Icon(
                          Icons.share,
                          size: 18,
                          color: Colors.black38,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Delete User'),
                                content: const Text(
                                    "Are You Sure Want To Delete This User?"),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: const Text("No")),
                                  TextButton(
                                    onPressed: () {
                                      _deleteUser(index);
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Yes"),
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
                      IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Added in Favourite Users"),
                              duration: Duration(seconds: 4),
                              backgroundColor: Colors.red,
                              action: SnackBarAction(
                                label: "Success",
                                onPressed: () {},
                              ),
                            ));
                            favouriteuserList.add(list[index]);
                          },
                          icon: Icon(
                            Icons.favorite_outline,
                            size: 18,
                            color: Colors.black38,
                          ))
                    ],
                  ),
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(thickness: 3);
          },
          itemCount: list.length),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushNamed(context, loginpage);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
