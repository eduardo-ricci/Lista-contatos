import 'package:flutter/material.dart';
import 'contacts_list_screen.dart';
import 'add_contact_screen.dart';
import 'main.dart';

class HomeScreen extends StatelessWidget {
  final List<Contact> contacts;
  final Function onSave;
  final Function onDelete;

  HomeScreen(
      {required this.contacts, required this.onSave, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 204, 86),
      appBar: AppBar(
        title: Text('Início'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/images/logo_agenda.png'),
            SizedBox(
              width: 200.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactsListScreen(
                          contacts: contacts, onDelete: onDelete),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 20.0),
                ),
                child: const Text('Ver Contatos'
                    ),
              ),
            ),
            SizedBox(
              width: 200.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddContactScreen(contacts: contacts, onSave: onSave),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 18.0),
                ),
                child: Text('Adicionar Contato'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
