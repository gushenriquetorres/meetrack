import 'package:flutter/material.dart';
import 'package:meetrack/app/repositories/cliente_repository.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({super.key});

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  final clientes = ClienteRepository.clientes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetrack'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int cliente) {
          return ListTile(
            leading: Image.asset(clientes[cliente].icone),
            title: Text(clientes[cliente].nome),
            trailing: Text(
              clientes[cliente].telefone,
              style: const TextStyle(fontSize: 10),
            ),
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: clientes.length,
      ),
    );
  }
}
