import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:users_app/util.dart';

import 'constant.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  Gender? selectgender;
  String gender="";
  final ImagePicker picker = ImagePicker();
  XFile? xFile;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addUser() {
    final String firstname = firstnameController.text;
    final String lastname = lastnameController.text;
    final String email = emailController.text;
    final String phone = phoneController.text;
    final String address = addressController.text;
    final String city = cityController.text;
    final String rating = ratingController.text;
    final String Gender = gender;
    final XFile xfile =xFile!;

    if (firstname.isNotEmpty &&
        lastname.isNotEmpty &&
        email.isNotEmpty &&
        address.isNotEmpty &&
        city.isNotEmpty &&
        rating.isNotEmpty &&
        phone.isNotEmpty) {
      setState(() {
        list.add(User(
            firstname: firstname,
            lastname: lastname,
            email: email,
            phone: phone,
            address: address,
            city: city,
            rat: rating,
          gender: Gender,
          xFile: xfile
        ));
      });
      Navigator.pushNamed(context, usersdetail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
        elevation: 0,
        leading: SizedBox(width: 10),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 720,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [Colors.orange,Colors.green,Colors.deepPurpleAccent,Colors.yellowAccent],tileMode: TileMode.repeated),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CircleAvatar(
                              radius: 82,
                              backgroundColor: Colors.blueGrey,
                              foregroundColor: Colors.black,
                              backgroundImage: xFile != null
                                  ? FileImage(
                                      File(xFile?.path ?? ""),
                                    )
                                  : null,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: IconButton(
                                onPressed: () {
                                  picker
                                      .pickImage(source: ImageSource.camera)
                                      .then((value) {
                                    xFile = value;
                                    setState(() {});
                                  });
                                },
                                icon: Icon(Icons.camera_alt)),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: IconButton(
                                onPressed: () {
                                  picker.pickImage(source: ImageSource.gallery).then((value) {
                                    xFile = value;
                                    setState(() {});
                                  });
                                },
                                icon: Icon(Icons.photo)),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          controller: firstnameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter Firstname";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Firstname"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          controller: lastnameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter Lastname";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Lastname"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter Email address";
                            } else if (!value!.contains("@")) {
                              return "Enter Valid Email address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Email"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          onSaved: (newValue) {},
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter Phone Number";
                            } else if (int.tryParse(value ?? "") == null) {
                              return "Enter Valid Phone Number";
                            } else if (value?.length != 10) {
                              return null;
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Phone"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          controller: addressController,
                          keyboardType: TextInputType.streetAddress,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter Address";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Address"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter Rating";
                            } else if(int.tryParse(value!) !>= 5){
                              return "Enter Rating Between 1 to 5";
                            }
                            else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: ratingController,
                          decoration: InputDecoration(
                            hintText: "Enter Ratting Between 1 to 5",
                            contentPadding: EdgeInsets.all(10),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Gender:",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Radio(
                              value: Gender.Male,
                              groupValue: selectgender,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onChanged: (value) {
                                selectgender = value;
                                gender="Male";
                                setState(() {});
                                print("value $value");
                              },
                            ),
                            InkWell(
                              onTap: () {
                                selectgender = Gender.Male;
                                setState(() {});
                              },
                              child: Text(
                                "Male",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Radio(
                              value: Gender.Female,
                              groupValue: selectgender,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onChanged: (value) {
                                selectgender = value;
                                gender="Female";
                                setState(() {});
                                print("value $value");
                              },
                            ),
                            InkWell(
                              onTap: () {
                                selectgender = Gender.Female;
                                setState(() {});
                              },
                              child: Text(
                                "Female",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        width: 300,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: TextFormField(
                          controller: cityController,
                          keyboardType: TextInputType.streetAddress,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter City";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.all(10),
                              hintText: "City"),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  FocusScope.of(context)
                                      .unfocus(); // For keyboard Close
                                  formKey.currentState?.save();

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("User Created Successfully"),
                                    duration: Duration(seconds: 6),
                                    backgroundColor: Colors.red,
                                    action: SnackBarAction(
                                      label: "Success",
                                      onPressed: () {},
                                    ),
                                  ));
                                  addUser();
                                } else {
                                  print("Invalid");
                                }
                              },
                              child: Text("Save")),
                          SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                print("Reset");
                                formKey.currentState?.reset();
                                firstnameController.clear();
                                lastnameController.clear();
                                phoneController.text = "";
                                addressController.text = "";
                                cityController.text = "";
                                emailController.text = "";
                                xFile = null;
                                FocusScope.of(context)
                                    .unfocus(); // For keyboard Close
                              },
                              child: Text("Reset")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Gender { Male, Female }
