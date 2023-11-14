import 'package:meetrack/app/models/cliente.dart';

class ClienteRepository {
  static List<Cliente> clientes = [
    Cliente(
      icone: 'images/edc.png',
      nome: 'EDC | Novo Hamburgo',
      cnpj: '39.891.826/0001-23',
      telefone: '(51) 99907-5448',
      cidade: 'Novo Hamburgo',
    ),
  ];
}
