import 'package:flutter/material.dart';
import 'package:meetrack/app/models/cliente.dart';
import 'package:meetrack/app/pages/clientes_detalhes_page.dart';
import 'package:meetrack/app/repositories/cliente_repository.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({super.key});

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  final clientes = ClienteRepository.clientes;
  List<Cliente> selecionadas = [];

  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: const Text('Meetrack'),
      );
    } else {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('${selecionadas.length} selecionadas'),
        backgroundColor: Colors.blueGrey[50],
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
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
              onTap: () {
                setState(() {
                  (selecionadas.contains(clientes[cliente]))
                      ? selecionadas.remove(clientes[cliente])
                      : selecionadas.add(clientes[cliente]);
                });
              });
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: clientes.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionadas.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.star),
              label: const Text(
                'Acompanhar',
                style: TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
