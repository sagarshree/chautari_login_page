import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.36,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.purple,
                        Colors.teal,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100.0),
                      // bottomRight: Radius.circular(100.0),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.account_circle,
                        size: MediaQuery.of(context).size.height * 0.32 * 0.33,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Chautari',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: 'Galada',
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Galada'),
                      ),
                    ),
                  ],
                ),
              ),
              orientation == Orientation.portrait
                  ? Column(
                      children: <Widget>[
                        inputAndLoginFields(context, orientation),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        otherLoginFields(context, orientation),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        inputAndLoginFields(context, orientation),
                        otherLoginFields(context, orientation),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}

otherLoginFields(parentContext, orientation) {
  return Column(
    children: <Widget>[
      Container(
        child: Text(
          'or login with',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(parentContext).size.height * 0.025,
      ),
      Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          GestureDetector(
            onTap: () => print('Facebook Login'),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/facebook.png'),
            ),
          ),
          SizedBox(
            width: 50,
          ),
          GestureDetector(
              onTap: () => print('Google Login'),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/google.png'),
                backgroundColor: Colors.white,
                radius: 25,
              ))
        ]),
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            FlatButton(
              onPressed: () => print('Register tapped'),
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}

inputAndLoginFields(parentContext, orientation) {
  double size = MediaQuery.of(parentContext).size.height;

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: orientation == Orientation.portrait
              ? EdgeInsets.only(bottom: 10.0)
              : EdgeInsets.only(bottom: 5.0),
          height: orientation == Orientation.portrait
              ? MediaQuery.of(parentContext).size.height * 0.068
              : MediaQuery.of(parentContext).size.height * 0.125,
          width: orientation == Orientation.portrait
              ? MediaQuery.of(parentContext).size.width * 0.8
              : MediaQuery.of(parentContext).size.width * 0.4,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: kElevationToShadow[4]),
          child: ListTile(
            contentPadding: EdgeInsets.only(bottom: 15, left: 20),
            leading: Icon(
              Icons.email,
              size: 20,
            ),
            title: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email or Phone',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: orientation == Orientation.portrait
              ? EdgeInsets.only(top: 10.0, bottom: 5.0)
              : EdgeInsets.only(top: 5.0, bottom: 5.0),
          height: orientation == Orientation.portrait
              ? MediaQuery.of(parentContext).size.height * 0.068
              : MediaQuery.of(parentContext).size.height * 0.125,
          width: orientation == Orientation.portrait
              ? MediaQuery.of(parentContext).size.width * 0.8
              : MediaQuery.of(parentContext).size.width * 0.4,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: kElevationToShadow[4]),
          child: ListTile(
            contentPadding: EdgeInsets.only(bottom: 15, left: 20),
            leading: Icon(
              Icons.vpn_key,
              size: 20,
            ),
            title: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Align(
            alignment: Alignment.center,
            child: FlatButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () => print('Forgot Password'),
              child: Text(
                'Forgot Password ?',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => print('LOGIN tapped: size = $size '),
          child: Container(
            margin: EdgeInsets.only(bottom: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.purple,
                    Colors.teal,
                  ],
                )),
            height: orientation == Orientation.portrait
                ? MediaQuery.of(parentContext).size.height * 0.068
                : MediaQuery.of(parentContext).size.height * 0.125,
            width: orientation == Orientation.portrait
                ? MediaQuery.of(parentContext).size.width * 0.8
                : MediaQuery.of(parentContext).size.width * 0.4,
            child: Center(
              child: Text(
                'LOGIN',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
