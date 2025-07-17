import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'apiProvider.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  bool _isFirstLoad = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetchUsers();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isFirstLoad) {
      _fetchUsers();
      _isFirstLoad = false;
    }
  }

  Future<void> _fetchUsers() async {
    if (!_isLoading && mounted) {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<ApiProvider>(context, listen: false).fetchUsers(1);
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Third Screen', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
        color: Colors.grey.shade300,
        height: 1.0,
          ),
        ),),
      body: Consumer<ApiProvider>(
        builder: (context, userProvider, child) {
          return userProvider.users.isEmpty && !_isLoading
          ? Center(child: Text('No users available'))
          : RefreshIndicator(
          onRefresh: () async {
            await Provider.of<ApiProvider>(context, listen: false).fetchUsers(1);
          },
          child: ListView.builder(
            controller: _scrollController,
            itemCount: userProvider.users.length + (_isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == userProvider.users.length) {
            return Center(child: CircularProgressIndicator());
              }
              final user = userProvider.users[index];
              return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
            title: Text('${user.firstname} ${user.lastname}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: Text(user.email),
            contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
            shape: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 1.0, ),
            ),
            onTap: () {
              Navigator.pop(context, '${user.firstname} ${user.lastname}');
            },
              );
            },
          ),
            );
        },
      ),
    );
  }
}