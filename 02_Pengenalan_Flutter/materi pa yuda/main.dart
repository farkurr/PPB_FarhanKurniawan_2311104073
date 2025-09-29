void main() {
  //<type> <variable_name> = <value>;
  //type = int, double, string, bool, List, Map, Set, Dynamic, Var...

  int age = 20;
  String name = "Farhan Kurniawan";
  double height = 175.5;
  print(age);
  print(name);
  print(height);

  //first name and last name
  String firstName = name.split(" ")[0];
  String lastName = name.split(" ")[1];
  print("firstName: $firstName");
  print("lastName: $lastName");
}
