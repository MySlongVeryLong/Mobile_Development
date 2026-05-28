import 'dart:math';

enum Skill {
  Flutter(label: 'despacito'),
  Dart(label: 'noob'),
  Other(label: 'jeff Bezo');

  final String label;

  const Skill({required this.label});

  double salary() {
    switch (this) {
      case Skill.Flutter:
        return 5000;
      case Skill.Dart:
        return 3000;
      case Skill.Other:
        return 1500;
    }
  }
}

class Address {
  // attribute
  final String street;
  final String city;
  final int zipcode;

  // constructor
  Address({required this.street, required this.city, required this.zipcode});

  String toString() {
    return "$street\t\t $city\t\t $zipcode";
  }
}

class Employee {
  // attribute
  final List<Skill> skills;
  final Address address;
  final int yearOfExperience;

  // constructor
  Employee({
    required this.skills,
    required this.address,
    required this.yearOfExperience,
  });

  Employee mobileDeveloper() {
    return Employee(
      skills: [Skill.Dart, Skill.Flutter],
      address: this.address,
      yearOfExperience: this.yearOfExperience,
    );
  }
  // method

  double employeeSalary() {
    double baseSallery = 400;
    double experienceBonus = 500;
    double sum = baseSallery + (this.yearOfExperience * experienceBonus);
    return sum;
  }

  String toString() {
    return "Employee\nSkills: ${skills.map((skill) => skill.label).join(", ")}\nAddress: $address\nExperience: $yearOfExperience\nSalary: ${employeeSalary()}";
  }
}

void main() {
  int experience = 5;

  Employee employee = Employee(
    skills: [Skill.Flutter, Skill.Other],

    address: Address(
      street: 'Gothem Street',
      city: 'Phnom Penh',
      zipcode: 11011,
    ),
    yearOfExperience: experience,
  );

  Employee mobileEmployee = employee.mobileDeveloper();

  print(employee);
  print(mobileEmployee);
  print(Skill.Flutter.label);
}
