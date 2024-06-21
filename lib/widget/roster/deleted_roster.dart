
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/roster.dart';

class DeletedRoster extends StatelessWidget {
  const DeletedRoster({super.key, required this.removeRoster});
final List<Roster> removeRoster;
  @override
  Widget build(BuildContext context) {
    int deletedRosterNumber = removeRoster.length;

    return Scaffold(
    appBar: AppBar(
        backgroundColor: Colors.cyan,
        title:const Text('Deleted Roster Details'),
      ),
      body: Center(
        child: removeRoster.isEmpty
            ? const Text('There are no deleted Roster details!')
            : ListView.builder(
                itemCount: deletedRosterNumber,
                itemBuilder: (context, index) {
                  Roster item =removeRoster[index];
                  return ListTile(
                    title: Text( item.creatorName),
                    subtitle: Text(
                        ''''ID: ${item.id}
                         Created Year: ${item.createdYear}, 
                         Start Year: ${item.startDate},
                          End Date: ${item.endDate}'''),
                  );
                },
              ),
      ),
    );
  }
}
