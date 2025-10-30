class User {
  String name;
  int age;

  User(this.name, this.age);
}

class SubPerson extends User {
  SubPerson(String name, int age) : super(name, age);

  void hello() {
    print('Hello world');
  }
}
