import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  
  // Now update our container width
  width: screenWidth > 600 ? 600 : screenWidth * 0.9;

  

    return MaterialApp(
      title: 'Business Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const BusinessCard(),
    );
 }
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  void _launchEmail() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'estradaprince56@gmail.com',
  );
  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  }
}

void _launchPhone() async {
  final Uri phoneLaunchUri = Uri(
    scheme: 'tel',
    path: '09943775393',
  );
  if (await canLaunchUrl(phoneLaunchUri)) {
    await launchUrl(phoneLaunchUri);
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Card(
          elevation: 4,
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
  width: 120,
  height: 120,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.teal,
    image: DecorationImage(
      image: NetworkImage('YOUR_IMAGE_URL'),
      fit: BoxFit.cover,
    ),
  ),
),
const SizedBox(height: 20),
const Text(
  'PRINCE ESTRADA',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
),
const Text(
'Batak mag flutter',
  style: TextStyle(
    fontSize: 18,
    color: Colors.black,
  ),
  
),
const Divider(height: 32, thickness: 1),
ListTile(
   onTap: _launchPhone,
   hoverColor: Colors.teal.withOpacity(0.1), 
  leading: Icon(Icons.email, color: Colors.teal),
  title: Text('estradaprince56@gmail.com'),
),
 ListTile(
  leading: Icon(Icons.phone, color: Colors.teal),
  title: Text('0930-123-4567'),
  onTap: _launchPhone,
   hoverColor: Colors.teal.withOpacity(0.1), 


),
  ListTile(
  leading: Icon(Icons.location_on, color: Colors.teal),
  title: Text('Davao City, Philippines'),
  onTap: _launchPhone,
   hoverColor: Colors.teal.withOpacity(0.1), 


),



              ],
            ),
          ),
        ),
      ),
    );
  }
}


