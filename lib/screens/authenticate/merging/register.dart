import 'package:crew_brew/services/auth.dart';
import 'package:crew_brew/shared/constants.dart';
import 'package:crew_brew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:crew_brew/shared/customWidgets/customText.dart';
import 'package:crew_brew/shared/colors.dart';

// ! Information about the class:
// ~ This class is the screen for registration
// ! Use of the class:
// ~ This class extracts the information from the user necessary to register him

// ! TODOS:
// TODO Integrate the pretty design of register page

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  // final Function toggleView;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // ! AuthService instance:
  // ~ We need this instance to have access to the method defined in services/auth.dart called registerWithEmailAndPassword()
  final AuthService _auth = AuthService();

  final CustomText _customText = CustomText();

  // ! formKey:
  // ~ This key we are going to use to identify our form and we are
  // ~ going to associate our forms with this global FormState key
  // ~ when we want to validate our form, then we do it via this formKey
  final _formKey = GlobalKey<FormState>();

  // ! Loading state:
  // ~ when loading is true, then instead of Scaffold we will be showing Loading widget
  // ~ it is set to true befure we provide data to the DB, waiting for it to respond
  bool loading = false;

  // ! Text field states:
  // ~ This are the states which are used to request the data from the user for registration
  String username = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    // ! popScreen():
    // ~ Since we want to allow our user to go back to welcome screen ( perhaps he figures out that he is already registered ), we keep register screen on stack
    // ~ After the registration was successful, we remove the screen from the stack before moving to Home screen, so that we do not allow user to get back to registration
    // ~ If he has just already registered
    void popScreen() {
      Navigator.pop(context);
    }

    Size size = MediaQuery.of(context).size;

    // ! If true, we return loading widget, otherwise Scaffold
    return loading
        ? Loading()
        : Scaffold(
            //this following statement is to make sure that a keyboard on the screen won't push the whole screen up when it pops up
            resizeToAvoidBottomInset: false,
            //appbar on the registeration screen
            appBar: AppBar(
              title: const Text(
                'Registration',
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 30,
                ),
              ),
              backgroundColor: welcomeh,
            ),
            //normal ol stack; i use fit to expand the stack to fill the screen; try to change this to fill instead of expand to solve overflow problems
            body: Container(
              child: Form(
                key: _formKey,
                child: Stack(fit: StackFit.expand, children: [
                  SizedBox(
                    child: Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/images/bgtop.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //* you will see a lot of these sizedboxes, i use them to create a bit of an empty space between the children/widgets/components
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        //*Add the welcoming text first; as you can see i am using a customText Widget so i don't have to re-style every text on the page
                        _customText.customText('Creat New\n Account'),
                        //*again empty space
                        SizedBox(
                          height: size.height * 0.05,
                        ),

                        // * Start of TextFormField for the username
                        TextFormField(
                            // ! TextInputDecoration is defined in shared/constants.dart. We extend the predefined widget with method 'copyWith'
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: texts),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: borders)),
                              contentPadding: const EdgeInsets.all(15),
                              labelText: 'Username',
                              labelStyle: const TextStyle(
                                fontFamily: 'Lobster',
                                color: texts,
                                fontSize: 20.0,
                              ),
                            ),
                            // ! validator property:
                            // ~ we return null value if this formField is VALID or a string it's NOT VALID
                            // ~ validator will be used in RaisedButton when calling _formKey.currentState!.validate()
                            validator: (val) =>
                                val!.isEmpty ? 'Enter a username' : null,
                            // ! onChanged property:
                            // ~ When information is entered into the TextForField, this property is triggered
                            onChanged: (val) {
                              // ~ We take email state and set it equal to value which is in e-mail textField
                              // ~ We also make use of trim() function to remove any spaces
                              setState(() => username = val.trim());
                            }),
                        // * End of TextFormField for the username
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        // * Start of TextFormField for the e-mail
                        TextFormField(
                            // ! TextInputDecoration is defined in shared/constants.dart. We extend the predefined widget with method 'copyWith'
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: texts),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: borders)),
                              contentPadding: const EdgeInsets.all(15),
                              labelText: 'E-mail',
                              labelStyle: const TextStyle(
                                fontFamily: 'Lobster',
                                color: texts,
                                fontSize: 20.0,
                              ),
                            ),
                            // ! validator property:
                            // ~ we return null value if this formField is VALID or a string it's NOT VALID
                            // ~ validator will be used in RaisedButton when calling _formKey.currentState!.validate()
                            validator: (val) =>
                                val!.isEmpty ? 'Enter an email' : null,
                            // ! onChanged property:
                            // ~ When information is entered into the TextForField, this property is triggered
                            onChanged: (val) {
                              // ~ We take email state and set it equal to value which is in e-mail textField
                              // ~ We also make use of trim() function to remove any spaces
                              setState(() => email = val.trim());
                            }),
                        // * End of TextFormField for the e-mail
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextFormField(
                            // ! TextInputDecoration is defined in shared/constants.dart. We extend the predefined widget with method 'copyWith'
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: texts),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: borders)),
                                 
                              contentPadding: const EdgeInsets.all(15),
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                fontFamily: 'Lobster',
                                color: texts,
                                fontSize: 20.0,
                              ),
                            ),
                            // ~ This hides the password when entering it
                            obscureText: true,
                            // ! validator property:
                            // ~ we return null value if this formField is VALID or a string it's NOT VALID
                            // ~ validator will be used in RaisedButton when calling _formKey.currentState!.validate()
                            validator: (val) => val!.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            // ! onChanged property:
                            // ~ When information is entered into the TextForField, this property is triggered
                            onChanged: (val) {
                              // ~ We take password state and set it equal to value which is in password textField
                              // ~ We also make use of trim() function to remove any spaces
                              setState(() => password = val.trim());
                            }),
                        FloatingActionButton.extended(
                          onPressed: () async {
                            // ~ Here we check if our form is valid
                            // ~ currentState tells us what values are inside the form fields
                            // ~ validate() method uses validator properties in the TextFormFields
                            if (_formKey.currentState!.validate()) {
                              // * Here we decide to show the loading screen
                              setState(() => loading = true);
                              // ~ We will get null or AppUser, so we don't know the type of return. Therefore we use dynamic
                              // ~ We await for the result from the Firebase
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      username, email, password, context);
                              // ~ If registration is NOT successful, we provide an error message.
                              if (result == null) {
                                setState(() {
                                  error =
                                      'please supply a valid email or password';
                                  // * Here we decide to remove the loading screen
                                  loading = false;
                                });
                                // ! If login is successful:
                                // ~ pop current screen from the stack then it's automatically redirected to Home page
                              } else {
                                popScreen();
                              }
                            }
                          },
                          label: Text(
                            'Register',
                            style: const TextStyle(
                              fontSize: 30,
                              fontFamily: 'Lobster',
                            ),
                          ),
                          backgroundColor: buttons,
                          extendedPadding: const EdgeInsets.all(40),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ]),
                ]),
              ),
            ),
          );
  }
}