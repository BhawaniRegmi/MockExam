import 'package:flutter/material.dart';
import 'package:mock_exam/Screens/homeScreen.dart';
import 'package:mock_exam/Screens/profileScreen.dart';


import '../main.dart';
class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});
   
  @override
  Widget build(BuildContext context) {
         void logOutDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            insetPadding: EdgeInsets.all(16),
            contentPadding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            content: Container(
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 6, 16, 16),
                    child: Text(
                      "Are you sure you want to Logout ?",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 1,
                  ),
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.fromLTRB(35, 15, 0, 20),
                         child: SizedBox(width: 80,
                           child: ElevatedButton(
                            
                                         style: ElevatedButton.styleFrom(
                                           
                                           minimumSize: const Size(double.infinity, 48),
                                           backgroundColor: Colors.red, // Adjust color as needed
                                         ),
                                         onPressed: () {
                                           Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                                         },
                                         child: const Text('Yes'),
                                       ),
                         ),
                       ),
                       const SizedBox(width: 30,),
                         Padding(
                         padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
                         child: SizedBox(width: 80,
                           child: ElevatedButton(
                            
                                         style: ElevatedButton.styleFrom(
                                           
                                           minimumSize: Size(double.infinity, 48),
                                           backgroundColor: Color(0xFF1b447d), // Adjust color as needed
                                         ),
                                         onPressed: () {
                                           Navigator.pop(context);
                                         },
                                         child: const Text('No'),
                                       ),
                         ),
                       ),
                     ],
                   ),
                  // new FlatButton(
                  //   child: new Text(
                  //     "OK",
                  //     style: TextStyle(color: MyColors.primaryColor),
                  //   ),
                  //   onPressed: () {

                  //   },
                  // ),
                ],
              ),
            ));
      },
    );
  }

    return  Drawer(
        child: Column(
          children: [
            // UserAccountsDrawerHeader(
            //   currentAccountPicture: CircleAvatar(
            //     backgroundImage: AssetImage('assets/images/profile.png'), // Replace with your imagefsdf
            //   ),
            //   accountName: Text('Your Name'),
            //   accountEmail: Text('Mobile: +123456789'),
            //   decoration: BoxDecoration(
            //     color: Colors.red,
            //   ),
            // ),
                SizedBox(height: 23.5,),
            Container(
              color: Color(0xFF1b447d), // Background color for the header
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                children: [
                   GestureDetector(
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileApp()),
                  );
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/auth/profile.jpg'),
                ),
                ),
                  SizedBox(width: 16), // Space between image and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pragg Nanandhaa',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Mobile: +977-9826478511',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                       ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                     
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    onTap: () {
                     
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileApp()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                    
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => SettingsScreen()),
                      // );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notification'),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => InboxScreen()),
                      // );
                      // Navigate to Notification screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About Us'),
                    onTap: () {
                      // Navigate to About Us screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => AboutUsScreen()),
                      // );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.description),
                    title: Text('Terms and Condition'),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => SideBarNotificationScreen()),
                      // );
                      // Navigate to Notification screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.shield),
                    title: Text('Privacy Policy'),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => SideBarNotificationScreen()),
                      // );
                      // Navigate to Notification screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Contact Us'),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => SideBarNotificationScreen()),
                      // );
                      // Navigate to Notification screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log Out'),
                    onTap: () {
                      // Handle Log Out
                    // _showConfirmationDialog("Are you sure you want to logout?");
                    logOutDialog();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}