import 'package:flutter/material.dart';

class PersonalDocumentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final documentList = [
      {
        'title': 'Birth Certificate',
        'subtitle': 'Vehicle Registration',
        'status': '✔',
        'statusColor': Colors.green,
        'trailing': Icon(Icons.more_vert),
      },
      {
        'title': 'Driving Licence',
        'subtitle': 'A driving license is an official do...',
        'status': 'loading',
        'statusColor': Colors.green,
        'trailing': SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      },
      {
        'title': 'Passport',
        'subtitle': 'A passport is a travel document...',
        'status': 'UPLOAD',
        'statusColor': Colors.green,
        'trailing': Text(
          'UPLOAD',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      },
      {
        'title': 'Election Card',
        'subtitle': 'Incorrect document type',
        'status': 'UPLOAD',
        'statusColor': Colors.green,
        'trailing': Text(
          'UPLOAD',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Document'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...documentList.map((doc) {
              return ListTile(
                title: Row(
                  children: [
                    Text(doc['title'].toString()),
                    SizedBox(width: 6),
                    Icon(Icons.info_outline, size: 16, color: Colors.grey),
                  ],
                ),
                subtitle: Text(
                  doc['subtitle'].toString(),
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: doc['trailing'] as Widget,
              );
            }).toList(),
            Spacer(),
            Text.rich(
              TextSpan(
                text:
                    'By continuing, I confirm that I have read & agree to the ',
                children: [
                  TextSpan(
                    text: 'Terms & conditions',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy policy',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              style: TextStyle(fontSize: 13, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null, // Disabled
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'NEXT',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
