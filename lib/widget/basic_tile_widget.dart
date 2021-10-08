import 'package:flutter/material.dart';

class BasicTile {
  final String title;
  final List<BasicTile> listTiles;

  const BasicTile({
    required this.title,
    this.listTiles = const [],
  });
}

class BasicTileWidget extends StatelessWidget {
  final BasicTile tile;

  const BasicTileWidget({
    Key? key,
    required this.tile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = tile.title;
    final tiles = tile.listTiles;

    if (tiles.isEmpty) {
      return ListTile(
        title: Text(title),
      );
    } else {
      return Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: ExpansionTile(
          key: PageStorageKey(title),
          title: Text(title),
          children: tiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
        ),
      );
    }
  }
}

final basicTiles = <BasicTile>[
  BasicTile(
    title: 'Countries',
    listTiles: [
      BasicTile(title: 'Russia'),
      BasicTile(title: 'Canada'),
      BasicTile(title: 'USA'),
      BasicTile(title: 'China'),
      BasicTile(title: 'China'),
      BasicTile(title: 'Australia'),
      BasicTile(title: 'India'),
      BasicTile(title: 'Argentina'),
    ],
  ),
  BasicTile(
    title: 'Dates',
    listTiles: [
      BasicTile(title: '2020', listTiles: buildMonths()),
      BasicTile(title: '2021', listTiles: buildMonths()),
      BasicTile(title: '2022'),
      BasicTile(title: '2023'),
    ],
  ),
];

List<BasicTile> buildMonths() => [
      'January',
      'February',
      'March',
      'April',
      'November',
      'December',
    ].map<BasicTile>(buildMonth).toList();

BasicTile buildMonth(String month) => BasicTile(
      title: month,
      listTiles: List.generate(28, (index) => BasicTile(title: '$index.')),
    );
