class Note {
  int id;
  String nom;
  String text;

  Note(this.id, this.nom, this.text);

  @override
  String toString() {
    return 'list id: $id, nom: $nom, text: $text ';
  }
}
