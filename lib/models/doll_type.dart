enum DollType {
  body(name: 'Body'),
  clothes(name: 'Clothes'),
  customizing(name: 'Customizing'),
  doll(name: 'Doll');

  const DollType({
    required this.name,
  });

  final String name;
}
