import 'package:flutter/material.dart';
import 'main.dart';

class ContactsListScreen extends StatelessWidget {
  final List<Contact> contacts;
  final Function onDelete;

  ContactsListScreen({required this.contacts, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 67, 173),
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView.separated(
        itemCount: contacts.length,
        separatorBuilder: (context, index) =>
            Divider(), 
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            subtitle: Text(
              'Telefone: ${contacts[index].phone}\nE-mail: ${contacts[index].email}',
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Excluir Contato'),
                      content: Text('Deseja realmente excluir este contato?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            onDelete(index);
                            Navigator.of(context).pop();
                          },
                          child: Text('Sim'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Não'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
