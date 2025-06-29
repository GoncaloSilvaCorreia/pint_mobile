class Utilizador {
  final int id;
  final String nome;
  final String email;

  Utilizador({
    required this.id,
    required this.nome,
    required this.email,
  });

  factory Utilizador.fromJson(Map<String, dynamic> json) {
    return Utilizador(
      id: json['id'],
      nome: json['name'],
      email: json['email'],
    );
  }
}