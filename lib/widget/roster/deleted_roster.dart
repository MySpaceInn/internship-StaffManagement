
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';

class DeletedRoster extends StatelessWidget {
  const DeletedRoster({super.key, required this.rosters});
  final List<Roster> rosters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Deleted Roster Details'),
      ),
      body: Center(
        child: rosters.isEmpty
            ? Text('There are no deleted Roster details!')
            : ListView.builder(
                itemCount: rosters.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(rosters[index].creatorName),
                    subtitle: Text(
                        'ID: ${rosters[index].id} Created Year: ${rosters[index].createdYear}, Start Year: ${rosters[index].startDate}, End Date: ${rosters[index].endDate}'),
                  );
                },
              ),
      ),
    );
  }
}
