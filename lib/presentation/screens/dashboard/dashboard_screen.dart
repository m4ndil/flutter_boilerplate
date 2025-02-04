import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/providers/auth_provider.dart';
import '../../../domain/providers/item_provider.dart';
import '../auth/login_screen.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    // delays execution until after the widget tree is built.
    Future.microtask(() {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final itemProvider = Provider.of<ItemProvider>(context, listen: false);

      if (authProvider.user != null) {
        itemProvider.fetchItems(authProvider.user!.accessToken);
      }
    });
  }

  void logout() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.logout();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'), actions: [
        IconButton(icon: Icon(Icons.logout), onPressed: logout),
      ]),
      body: itemProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : itemProvider.items.isEmpty
          ? Center(child: Text('No items available'))
          : ListView.builder(
        itemCount: itemProvider.items.length,
        itemBuilder: (context, index) {
          final item = itemProvider.items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Rate: ${item.rate}'),
            trailing: Text('Qty: ${item.qty}'),
          );
        },
      ),
    );
  }
}
