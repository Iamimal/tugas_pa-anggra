import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'hal_rumah.dart' as rumah;
import 'hal_galery.dart' as galery;
import 'hal_info.dart' as info;
import 'hal_agenda.dart' as agenda;

void main() {
  runApp(MaterialApp(
    title: "Tab Bar",
    home: LoginScreen(), // Set LoginScreen as the initial screen
    routes: {
      '/home': (context) => Home(),
    },
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  int _currentIndex = 0; // Track the selected tab index

  final List<Widget> _pages = [
    rumah.Rumah(),
    info.InfoTab(),
    galery.GalleryTab(),
    agenda.AgendaTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF697565), // Lighter Green
        title: Text('4 Mobile Apps'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF697565), // Lighter Green
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() {
                  _currentIndex = 0; // Navigate to Home
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Info'),
              onTap: () {
                setState(() {
                  _currentIndex = 1; // Navigate to Info
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.filter),
              title: Text('Gallery'),
              onTap: () {
                setState(() {
                  _currentIndex = 2; // Navigate to Gallery
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Agenda'),
              onTap: () {
                setState(() {
                  _currentIndex = 3; // Navigate to Agenda
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            Divider(), // Add a divider before the logout option
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                ); // Navigate back to the login screen
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Agenda',
          ),
        ],
        selectedItemColor: Color(0xFF1E201E), // Dark Green
        unselectedItemColor: Color(0xFFECDFCC), // Light Yellow
      ),
    );
  }
}
