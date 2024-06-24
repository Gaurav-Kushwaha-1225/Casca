import 'package:flutter/material.dart';

import '../../models/users.dart';
import '../../services/database/casca_db.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  List<User> users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    final data = await CascaUsersDB.getUsers();
    setState(() {
      users = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
                "This is testing page created to test buttons and other features"),
            _isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return ListTile(
                          title: Text(
                              "${user.name} \n ${user.userName} \n ${user.dOB}"),
                          subtitle: Text(
                              "${user.email} \n ${user.gender} \n ${user.mobNo}"),
                        );
                      },
                      itemCount: users.length),
                )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUsers();
        },
        child: const Icon(Icons.file_download_outlined),
      ),
    );
  }
}
