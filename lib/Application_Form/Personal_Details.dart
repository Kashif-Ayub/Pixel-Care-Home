import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/widgets/bottomNavigationBar/BottomNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../Constants/Constant.dart';
import 'Address.dart';
import 'Conviction.dart';
import 'Model/ApplicationFormModel.dart';
import 'Next_of_Kin.dart';
import 'Reference_Form.dart';

class PersonalDetailPage extends StatefulWidget {
  PersonalDetailPage({required this.model});
  ApplicationFormModel model = new ApplicationFormModel();

  @override
  State<PersonalDetailPage> createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  Widget MyTextField(
      {required InputDecoration decoration,
      required String hinttext,
      controller}) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: TextFormField(
        onChanged: (val) {
          setState(() {});
        },
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

  TextEditingController surname = new TextEditingController();
  TextEditingController forename = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController town = new TextEditingController();
  TextEditingController code = new TextEditingController();
  TextEditingController national = new TextEditingController();
  TextEditingController hometel = new TextEditingController();
  TextEditingController daytel = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController insurance = new TextEditingController();
  List title = ['Mr.', 'Ms.', 'Other'];
  List gen = ['Male', 'Female', 'Other'];
  List country = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Anguilla",
    "Antigua &amp; Barbuda",
    "Argentina",
    "Armenia",
    "Aruba",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bermuda",
    "Bhutan",
    "Bolivia",
    "Bosnia &amp; Herzegovina",
    "Botswana",
    "Brazil",
    "British Virgin Islands",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Cape Verde",
    "Cayman Islands",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Congo",
    "Cook Islands",
    "Costa Rica",
    "Cote D Ivoire",
    "Croatia",
    "Cruise Ship",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Estonia",
    "Ethiopia",
    "Falkland Islands",
    "Faroe Islands",
    "Fiji",
    "Finland",
    "France",
    "French Polynesia",
    "French West Indies",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Gibraltar",
    "Greece",
    "Greenland",
    "Grenada",
    "Guam",
    "Guatemala",
    "Guernsey",
    "Guinea",
    "Guinea Bissau",
    "Guyana",
    "Haiti",
    "Honduras",
    "Hong Kong",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Isle of Man",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jersey",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kuwait",
    "Kyrgyz Republic",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Macau",
    "Macedonia",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Montserrat",
    "Morocco",
    "Mozambique",
    "Namibia",
    "Nepal",
    "Netherlands",
    "Netherlands Antilles",
    "New Caledonia",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "Norway",
    "Oman",
    "Pakistan",
    "Palestine",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Puerto Rico",
    "Qatar",
    "Reunion",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Pierre &amp; Miquelon",
    "Samoa",
    "San Marino",
    "Satellite",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "South Africa",
    "South Korea",
    "Spain",
    "Sri Lanka",
    "St Kitts &amp; Nevis",
    "St Lucia",
    "St Vincent",
    "St. Lucia",
    "Sudan",
    "Suriname",
    "Swaziland",
    "Sweden",
    "Switzerland",
    "Syria",
    "Taiwan",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Timor L'Este",
    "Togo",
    "Tonga",
    "Trinidad &amp; Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Turks &amp; Caicos",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "Uruguay",
    "Uzbekistan",
    "Venezuela",
    "Vietnam",
    "Virgin Islands (US)",
    "Yemen",
    "Zambia",
    "Zimbabwe"
  ];
  var areufree;
  var selectedCountry = 'Pakistan';
  var titleSelected = 'Mr';
  var selectedGender = 'Male';
  var month = 'September';
  var day = '1';
  var year = '2022';
  var dob;

  Future<void> _SetVals() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString("Surname") != null) {
      surname.text = _prefs.getString("Surname").toString();
    }
    if (_prefs.getString("Forename") != null) {
      forename.text = _prefs.getString("Forename").toString();
    }

    if (_prefs.getString("address") != null) {
      address.text = _prefs.getString("address").toString();
    }
    if (_prefs.getString("TownCity") != null) {
      town.text = _prefs.getString("TownCity").toString();
    }
    if (_prefs.getString("postcode") != null) {
      code.text = _prefs.getString("postcode").toString();
    }
    if (_prefs.getString("Nationality") != null) {
      national.text = _prefs.getString("Nationality").toString();
    }
    if (_prefs.getString("mobilephone") != null) {
      hometel.text = _prefs.getString("mobilephone").toString();
    }
    if (_prefs.getString("email") != null) {
      email.text = _prefs.getString("email").toString();
    }
    if (_prefs.getString("insurancenumber") != null) {
      insurance.text = _prefs.getString("insurancenumber").toString();
    }
    if (_prefs.getString("selectedCountry") != null) {
      selectedCountry = _prefs.getString("selectedCountry").toString();
    }
    if (_prefs.getString("Title") != null) {
      titleSelected = _prefs.getString("Title").toString();
    }

    if (_prefs.getString("day") != null) {
      day = _prefs.getString("day").toString();
    }

    if (_prefs.getString("month") != null) {
      month = _prefs.getString("month").toString();
    }
    if (_prefs.getString("year") != null) {
      year = _prefs.getString("year").toString();
    }

    if (_prefs.getString("selectedGender") != null) {
      selectedGender = _prefs.getString("selectedGender").toString();
    }
    setState(() {});
  }

  @override
  void initState() {
    hide();

    titleSelected = widget.model.personalDetail?.title ?? "Mr";
    surname.text = widget.model.personalDetail?.surname ?? "";
    forename.text = widget.model.personalDetail?.forename ?? "";
    selectedGender = widget.model.personalDetail?.gender ?? "Male";
    address.text = widget.model.personalDetail?.address ?? "";
    town.text = widget.model.personalDetail?.townCity ?? "";
    code.text = widget.model.personalDetail?.postalCode ?? "";
    selectedCountry = widget.model.personalDetail?.country ?? "Pakistan";
    national.text = widget.model.personalDetail?.nationality ?? "";
    hometel.text = widget.model.personalDetail?.homeTel ?? "";
    daytel.text = widget.model.personalDetail?.dayTimeContact ?? "";
    email.text = widget.model.personalDetail?.email ?? "";
    insurance.text = widget.model.personalDetail?.nationalInsuranceNo ?? "";
    areufree = widget.model.personalDetail?.remainTakeupEmploymentInUk ?? "No";
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        formKey.currentState?.validate();
      });
    });
    // TODO: implement initState
    _SetVals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Form(
        key: formKey,
        child: WillPopScope(
          onWillPop: () {
            // bottomNavigationBarState.selectedIndex = 0;
            // Navigator.of(context).pushAndRemoveUntil(
            //     MaterialPageRoute(builder: (context) => bottomNavigationBar()),
            //     (Route route) => false);
            return false as Future<bool>;
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40.h, left: 10.w),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Perosnal Details',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Fill all fields with best of your knowledge',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      height: 30.h,
                      child: Row(
                        children: [
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Title'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: DropdownButtonFormField<String>(
                            value: "Mr.",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please select from this field';
                              }
                            },
                            items: title
                                .map((e) => DropdownMenuItem<String>(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (String? value) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("Title", value.toString());

                              titleSelected = value!;
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              hintStyle: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: Color(0xffACA9A9),
                              ),
                              fillColor: Colors.grey.shade200,
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
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Surname'),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: TextFormField(
                            onChanged: (val) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("Surname", val.toString());
                              setState(() {});
                            },
                            controller: surname,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill out this field';
                              }
                            },
                            textCapitalization: TextCapitalization.words,
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
                              hintText: 'Enter surname',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Forename'),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: TextFormField(
                            onChanged: (val) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("Forename", val.toString());
                              setState(() {});
                            },
                            controller: forename,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill out this field';
                              }
                            },
                            textCapitalization: TextCapitalization.words,
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
                              hintText: 'Enter forename',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Date of Birth'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, left: 20.w, right: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50.h,
                                width: 90.w,
                                child: DropdownButtonFormField<String>(
                                  value: "1",
                                  items: List.generate(
                                      31,
                                      (index) => DropdownMenuItem(
                                            child: Text('${index + 1}'),
                                            value: '${index + 1}',
                                          )),
                                  onChanged: (String? value) async {
                                    SharedPreferences _prefs =
                                        await SharedPreferences.getInstance();
                                    _prefs.setString("day", value.toString());
                                    day = value!;
                                    setState(() {});
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    hintStyle: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Color(0xffACA9A9),
                                    ),
                                    fillColor: Colors.grey.shade200,
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
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                height: 50.h,
                                width: 140.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: DropdownButtonFormField<String>(
                                  value: "January",
                                  items: [
                                    'January',
                                    'February',
                                    'March',
                                    'April',
                                    'May',
                                    'June',
                                    'July',
                                    'August',
                                    'September',
                                    'October',
                                    'November',
                                    'December'
                                  ]
                                      .map((e) => DropdownMenuItem(
                                            child: Text('${e}'),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (String? value) async {
                                    month = value!;
                                    SharedPreferences _prefs =
                                        await SharedPreferences.getInstance();
                                    _prefs.setString("month", value.toString());
                                    setState(() {});
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    hintStyle: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Color(0xffACA9A9),
                                    ),
                                    fillColor: Colors.grey.shade200,
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
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                height: 50.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: DropdownButtonFormField<String>(
                                  value: "2022",
                                  items: List.generate(
                                      DateTime.now().year,
                                      (index) => DropdownMenuItem(
                                            child: Text(
                                                '${DateTime.now().year - index}'),
                                            value:
                                                '${DateTime.now().year - index}',
                                          )),
                                  onChanged: (String? value) async {
                                    year = value!;
                                    SharedPreferences _prefs =
                                        await SharedPreferences.getInstance();
                                    _prefs.setString("year", value.toString());
                                    setState(() {});
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    hintStyle: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Color(0xffACA9A9),
                                    ),
                                    fillColor: Colors.grey.shade200,
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.w, top: 15.h),
                                    child: Text('Gender'),
                                  ),
                                  SizedBox(height: 10.h),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.w, right: 20.w),
                                    child: DropdownButtonFormField<String>(
                                      value: selectedGender,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please select from this field';
                                        }
                                      },
                                      items: gen
                                          .map((e) => DropdownMenuItem<String>(
                                                child: Text(e),
                                                value: e,
                                              ))
                                          .toList(),
                                      onChanged: (String? value) async {
                                        selectedGender = value!;
                                        SharedPreferences _prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        _prefs.setString(
                                            "selectedGender", value.toString());
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 5),
                                        hintStyle: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                          color: Color(0xffACA9A9),
                                        ),
                                        fillColor: Colors.grey.shade200,
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
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Address'),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: TextFormField(
                            onChanged: (val) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("address", val.toString());
                              setState(() {});
                            },
                            controller: address,
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
                              hintText: 'Enter address',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15.w, right: 15.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20.w, top: 15.h),
                                      child: Text('Town/City'),
                                    ),
                                    SizedBox(height: 10.h),
                                    Padding(
                                      padding: EdgeInsets.only(right: 5.w),
                                      child: TextFormField(
                                        onChanged: (val) async {
                                          SharedPreferences _prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          _prefs.setString(
                                              "TownCity", val.toString());
                                          setState(() {});
                                        },
                                        textCapitalization:
                                            TextCapitalization.words,
                                        controller: town,
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
                                          hintText: 'Enter City',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20.w, top: 15.h),
                                      child: Text('Post Code'),
                                    ),
                                    SizedBox(height: 10.h),
                                    Padding(
                                      padding: EdgeInsets.only(right: 5.w),
                                      child: TextFormField(
                                        onChanged: (val) async {
                                          SharedPreferences _prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          _prefs.setString(
                                              "postcode", val.toString());
                                          setState(() {});
                                        },
                                        textCapitalization:
                                            TextCapitalization.words,
                                        controller: code,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please fill out this field';
                                          }
                                        },
                                        keyboardType: TextInputType.multiline,
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
                                          hintText: 'Enter post code',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Country'),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20.w, right: 20.w, top: 10),
                          child: DropdownButtonFormField<String>(
                            value: selectedCountry,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please select from this field';
                              }
                            },
                            items: country
                                .map((e) => DropdownMenuItem<String>(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (String? value) async {
                              selectedCountry = value!;
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString(
                                  "selectedCountry", value.toString());
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              hintStyle: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: Color(0xffACA9A9),
                              ),
                              fillColor: Colors.grey.shade200,
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
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15.w, right: 15.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 05.w, top: 15.h),
                                      child: Text('Nationality'),
                                    ),
                                    SizedBox(height: 10.h),
                                    Padding(
                                      padding: EdgeInsets.only(right: 5.w),
                                      child: TextFormField(
                                        onChanged: (val) async {
                                          SharedPreferences _prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          _prefs.setString(
                                              "Nationality", val.toString());
                                          setState(() {});
                                        },
                                        textCapitalization:
                                            TextCapitalization.words,
                                        controller: national,
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
                                          hintText: 'Enter nationality',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15.w, right: 15.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 20.w, top: 15.h),
                                      child: const Text('Mobile Phone'),
                                    ),
                                    SizedBox(height: 10.h),
                                    Padding(
                                      padding: EdgeInsets.only(right: 5.w),
                                      child: TextFormField(
                                        onChanged: (val) async {
                                          SharedPreferences _prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          _prefs.setString(
                                              "mobilephone", val.toString());

                                          setState(() {});
                                        },
                                        keyboardType: TextInputType.number,
                                        controller: hometel,
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
                                          hintText: 'Enter Mobilephone',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Expanded(
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       Container(
                              //         margin:
                              //             EdgeInsets.only(left: 20.w, top: 15.h),
                              //         child: Text('Day Time Contact'),
                              //       ),
                              //       SizedBox(height: 10.h),
                              //       Padding(
                              //         padding: EdgeInsets.only(right: 5.w),
                              //         child: TextFormField(
                              //           onChanged: (val) {
                              //             setState(() {});
                              //           },
                              //           controller: daytel,
                              //           keyboardType: TextInputType.number,
                              //           validator: (value) {
                              //             if (value!.isEmpty) {
                              //               return 'Please fill out this field';
                              //             }
                              //           },
                              //           decoration: InputDecoration(
                              //             contentPadding: EdgeInsets.all(18),
                              //             hintStyle: GoogleFonts.dmSans(
                              //               fontWeight: FontWeight.w500,
                              //               fontSize: 15.sp,
                              //               color: Color(0xffACA9A9),
                              //             ),
                              //             fillColor: Color(0xfff0f0f0),
                              //             filled: true,
                              //             border: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //             enabledBorder: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //             focusedBorder: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //             hintText: 'Enter day time contact',
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('Email Address'),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: TextFormField(
                            onChanged: (val) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString("email", val.toString());

                              setState(() {});
                            },
                            controller: email,
                            validator: (value) {
                              final bool isValid =
                                  EmailValidator.validate(value.toString());

                              if (!isValid) {
                                return 'Invalid Email';
                              }

                              if (value!.isEmpty) {
                                return 'Please fill out this field';
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
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
                              hintText: 'Enter email address',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text('National Insurance Number'),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: TextFormField(
                            onChanged: (val) async {
                              SharedPreferences _prefs =
                                  await SharedPreferences.getInstance();
                              _prefs.setString(
                                  "insurancenumber", val.toString());
                              setState(() {});
                            },
                            controller: insurance,
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
                              hintText: 'Enter national insurance number',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 15.h),
                          child: Text(
                              'Are you free to remain & take up employment in the UK?'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.w, top: 10.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      areufree = 'No';
                                    });
                                  },
                                  child: Container(
                                    height: 30.h,
                                    width: 300.w,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade100,
                                      border: areufree == 'No'
                                          ? Border.all(
                                              color: Colors.green, width: 2)
                                          : null,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No',
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
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      areufree = 'Yes';
                                    });
                                  },
                                  child: Container(
                                    height: 30.h,
                                    width: 300.w,
                                    decoration: BoxDecoration(
                                      color: Color(0xfffaeaea),
                                      border: areufree == 'Yes'
                                          ? Border.all(
                                              color: Colors.green, width: 2)
                                          : null,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade500),
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
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 20.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                formKey.currentState!.save();
                                if (month == 'January') {
                                  month = '01';
                                } else if (month == 'February') {
                                  month = '02';
                                } else if (month == 'March') {
                                  month = '03';
                                } else if (month == 'April') {
                                  month = '04';
                                } else if (month == 'May') {
                                  month = '05';
                                } else if (month == 'June') {
                                  month = '06';
                                } else if (month == 'July') {
                                  month = '07';
                                } else if (month == 'August') {
                                  month = '08';
                                } else if (month == 'September') {
                                  month = '09';
                                } else if (month == 'October') {
                                  month = '10';
                                } else if (month == 'November') {
                                  month = '11';
                                } else if (month == 'December') {
                                  month = '12';
                                }
                                PersonalDetail details = new PersonalDetail();
                                if (true) {
                                  details.title = titleSelected;
                                  details.surname = surname.text;
                                  details.forename = forename.text;
                                  details.dob = year + '-' + month + '-' + day;
                                  details.gender = selectedGender;
                                  details.address = address.text;
                                  details.townCity = town.text;
                                  details.postalCode = code.text;
                                  details.country = selectedCountry;
                                  details.nationality = national.text;
                                  details.homeTel = hometel.text;
                                  details.dayTimeContact = daytel.text;
                                  details.email = email.text;
                                  details.nationalInsuranceNo = insurance.text;
                                  details.remainTakeupEmploymentInUk = areufree;

                                  widget.model.personalDetail = details;

                                  Navigator.of(context).pop();
                                }
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
                                if (month == 'January') {
                                  month = '01';
                                } else if (month == 'February') {
                                  month = '02';
                                } else if (month == 'March') {
                                  month = '03';
                                } else if (month == 'April') {
                                  month = '04';
                                } else if (month == 'May') {
                                  month = '05';
                                } else if (month == 'June') {
                                  month = '06';
                                } else if (month == 'July') {
                                  month = '07';
                                } else if (month == 'August') {
                                  month = '08';
                                } else if (month == 'September') {
                                  month = '09';
                                } else if (month == 'October') {
                                  month = '10';
                                } else if (month == 'November') {
                                  month = '11';
                                } else if (month == 'December') {
                                  month = '12';
                                }
                                PersonalDetail details = new PersonalDetail();
                                if (formKey.currentState!.validate()) {
                                  details.title = titleSelected;
                                  details.surname = surname.text;
                                  details.forename = forename.text;
                                  details.dob = year + '-' + month + '-' + day;
                                  details.gender = selectedGender;
                                  details.address = address.text;
                                  details.townCity = town.text;
                                  details.postalCode = code.text;
                                  details.country = selectedCountry;
                                  details.nationality = national.text;
                                  details.homeTel = hometel.text;
                                  details.dayTimeContact = daytel.text;
                                  details.email = email.text;
                                  details.nationalInsuranceNo = insurance.text;
                                  details.remainTakeupEmploymentInUk = areufree;

                                  widget.model.personalDetail = details;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ConvictionPage(
                                            model: widget.model)),
                                  );
                                }
                              },
                              child: Container(
                                height: 60.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                  color: formKey.currentState?.validate() ==
                                              true &&
                                          areufree != null
                                      ? Colors.pink
                                      : Color(0xfffaeaea),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color:
                                            formKey.currentState?.validate() ==
                                                        true &&
                                                    areufree != null
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
