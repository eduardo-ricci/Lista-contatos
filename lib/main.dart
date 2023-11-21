import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'home_screen.dart';

//Discentes: Eduardo Ricci da Silva, Samilly Vitória Siqueira Ribeiro

void main() {
  runApp(MyApp());
}

class Contact {
  String name;
  String phone;
  String email;

  Contact({required this.name, required this.phone, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
    );
  }
}

class MyApp extends StatelessWidget {
  final String contactsFileName = 'contacts.txt';
  List<Contact> contacts = [];

  MyApp() {
    loadContacts();
  }

  Future<void> loadContacts() async {
    try {
      final file = File(contactsFileName);
      if (await file.exists()) {
        final contactsJson = await file.readAsString();
        final List<dynamic> contactsList = json.decode(contactsJson);

        contacts = contactsList.map((contactMap) {
          return Contact.fromMap(contactMap);
        }).toList();
      }
    } catch (e) {
      print('Erro ao carregar contatos: $e');
    }
  }

  Future<void> saveContacts() async {
    try {
      final file = File(contactsFileName);
      final contactsList = contacts.map((contact) => contact.toMap()).toList();
      final contactsJson = json.encode(contactsList);
      await file.writeAsString(contactsJson);
    } catch (e) {
      print('Erro ao salvar contatos: $e');
    }
  }

  void deleteContact(int index) {
    contacts.removeAt(index);
    saveContacts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda de Contatos',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomeScreen(
          contacts: contacts, onSave: saveContacts, onDelete: deleteContact),
    );
  }
}
