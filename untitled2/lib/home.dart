import 'package:flutter/material.dart';

void main() {
  runApp(PhoneBookApp());
}

class Contact {
  final String name;
  final String phoneNumber;
  final String? imageUrl;

  Contact({
    required this.name,
    required this.phoneNumber,
    this.imageUrl,
  });
}

class PhoneBookApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'HungKon', phoneNumber: '033-570-3752', imageUrl: 'https://haycafe.vn/wp-content/uploads/2021/12/Hinh-nen-cute.jpg'),
    Contact(name: 'Hungnguyen', phoneNumber: '123-133-1234'),

    // Add more contacts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhoneHung',
      home: Scaffold(
        appBar: AppBar(
          title: Text('PhoneHung'),
        ),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: contacts[index].imageUrl != null
                    ? NetworkImage(contacts[index].imageUrl!)
                    : null,
              ),
              title: Text(contacts[index].name),
              subtitle: Text(contacts[index].phoneNumber),
              onTap: () {
                // Handle tapping on a contact to view details
                _showContactDetails(context, contacts[index]);
              },
            );
          },
        ),
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(contact.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (contact.imageUrl != null)
                Image.network(
                  contact.imageUrl!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              Text('Phone Number: ${contact.phoneNumber}'),
              // You can add more details here as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}