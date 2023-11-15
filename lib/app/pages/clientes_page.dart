import 'package:flutter/material.dart';
import 'package:meetrack/app/models/cliente.dart';
import 'package:meetrack/app/repositories/cliente_repository.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({super.key});

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  final clientes = ClienteRepository.clientes;
  List<Cliente> selecionadas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetrack'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int cliente) {
          return ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            leading: (selecionadas.contains(clientes[cliente]))
                ? const CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : SizedBox(
                    width: 40,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      child: Image.asset(clientes[cliente].icone),
                    ),
                  ),
            title: Text(clientes[cliente].nome),
            subtitle: Text(
              clientes[cliente].telefone,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            trailing: Text(
              clientes[cliente].gerente,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            selected: selecionadas.contains(clientes[cliente]),
            selectedTileColor: Colors.indigo[50],
            onLongPress: () {
              setState(() {
                (selecionadas.contains(clientes[cliente]))
                    ? selecionadas.remove(clientes[cliente])
                    : selecionadas.add(clientes[cliente]);
              });
            },
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: clientes.length,
      ),
    );
  }
}
