import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Application_Form/Employement.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'dart:io';
import '../Constants/Constant.dart';
import '../Controller/AuthController.dart';
import '../DocumentsUpload/training_certificates.dart';
import '../Model/AccademicCertModel.dart';
import 'Employment_Previous.dart';
import 'Model/ApplicationFormModel.dart';
import 'package:pixel_app/widgets/bottomNavigationBar/BottomNavigation.dart';

class TrainingPage extends StatefulWidget {
  TrainingPage({required this.model});
  ApplicationFormModel model = new ApplicationFormModel();
  @protected
  @mustCallSuper
  void initState() {
    hide();
    model1 = this.model;
  }

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  List<File> images = [];
  var emp = false;
  Widget MyTextField(
      {required InputDecoration decoration,
      required String hinttext,
      controller}) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill out this field';
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(18),
          hintStyle: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: Color(0xffACA9A9),
          ),
          fillColor: Color(0xfff0f0f0),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          hintText: hinttext,
        ),
      ),
    );
  }

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  GlobalKey<FormState> formKey = new GlobalKey();
  //Trainings training=new Trainings();

  TextEditingController course = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: WillPopScope(
        onWillPop: () {
          // bottomNavigationBarState.selectedIndex = 0;
          // Navigator.of(context).pushAndRemoveUntil(
          //     MaterialPageRoute(builder: (context) => bottomNavigationBar()),
          //     (Route route) => false);
          return false as Future<bool>;
        },
        child: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 40.h,
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Training',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Trainings relevant to the post applying',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            height: 30.h,
                            child: Row(
                              children: [
                                Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.shade200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TrainingCertificates()));
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.blue),
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            ' Add New Certificate ',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ))),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: SingleChildScrollView(
                                  child: FutureBuilder<AccademicCertModel>(
                                      future: AuthController().GetCert(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          if (snapshot.data!.data!.length !=
                                              0) {
                                            Future.delayed(Duration(seconds: 1))
                                                .then((value) => setState(() {
                                                      emp = true;
                                                    }));
                                            return Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Column(
                                                    children: List.generate(
                                                        snapshot
                                                            .data!.data!.length,
                                                        (index) => Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          10,
                                                                      horizontal:
                                                                          20),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade100,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(10),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade400,
                                                                        spreadRadius:
                                                                            1,
                                                                        blurRadius:
                                                                            10)
                                                                  ]),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        child:
                                                                            Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Date of Completion: ',
                                                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                                            ),
                                                                            Text('${snapshot.data?.data?.elementAt(index).dateOfCompletion}',
                                                                                style: TextStyle()),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          GestureDetector(
                                                                              onTap: () async {
                                                                                showDialog<void>(
                                                                                  context: context,
                                                                                  barrierDismissible: false, // user must tap button!
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      title: Text('Are you sure?'),
                                                                                      content: SingleChildScrollView(
                                                                                        child: ListBody(
                                                                                          children: <Widget>[
                                                                                            Text('This action cannot be undone.'),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      actions: <Widget>[
                                                                                        TextButton(
                                                                                          child: Text('Cancel', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                                                                                          onPressed: () {
                                                                                            Navigator.of(context).pop();
                                                                                          },
                                                                                        ),
                                                                                        TextButton(
                                                                                          child: Text(
                                                                                            'Delete',
                                                                                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            // Perform the delete action here

                                                                                            var response = await AuthController().DeleteCert(snapshot.data?.data?.elementAt(index).id);

                                                                                            setState(() {
                                                                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                                  content: Text(
                                                                                                "This record and its details will be permanently deleted.",
                                                                                                style: TextStyle(color: Colors.white),
                                                                                              )));
                                                                                            });
                                                                                            Navigator.of(context).pop();
                                                                                            Navigator.pushReplacement(
                                                                                              context,
                                                                                              MaterialPageRoute(
                                                                                                  builder: (context) => TrainingPage(
                                                                                                        model: model1,
                                                                                                      )),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );

                                                                                /////////
                                                                              },
                                                                              child: Icon(
                                                                                Icons.delete,
                                                                                color: Colors.red,
                                                                              ))
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 05,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Expiry Date: ',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 16),
                                                                        ),
                                                                        Flexible(
                                                                            child:
                                                                                Text('${snapshot.data?.data?.elementAt(index).expiryDate}', style: TextStyle())),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Images: ',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            100.h,
                                                                        width:
                                                                            100.w,
                                                                        margin:
                                                                            EdgeInsets.all(10),
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.grey,
                                                                            image: DecorationImage(fit: BoxFit.fill, image: NetworkImage('${snapshot.data?.data?.elementAt(index).image}'))),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ))),
                                              ],
                                            );
                                          } else {
                                            return Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Center(
                                                child: Text(
                                                  'No certificate added yet!',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            );
                                          }
                                        } else {
                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Center(
                                                child: Container(
                                              height: 30,
                                              width: 30,
                                              child: CircularProgressIndicator(
                                                color: Colors
                                                    .pinkAccent.shade100
                                                    .withOpacity(0.5),
                                              ),
                                            )),
                                          );
                                        }
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 20.h, top: 80.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 60.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Previous',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (emp == true) {
                                  // training.courses=course.text;
                                  // widget.model.trainings=training;
                                  print(widget.model.toJson());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EmploymentPage(model: widget.model),
                                      ));
                                }
                              },
                              child: Container(
                                height: 60.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  color: emp == true
                                      ? Colors.pink
                                      : Color(0xfffaeaea),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: emp == true
                                            ? Colors.white
                                            : Colors.grey.shade500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
