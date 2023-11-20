import 'package:discover_app/data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _location = ['Polure', 'Japan', 'London'];
  final int _activelocation = 1;

  @override
  Widget build(BuildContext context) {
    double myToolbarHeight = 50;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Center(
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,

        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              // color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        title: SizedBox(
          height: myToolbarHeight,
          child: Image.asset("assets/logo_discover.png", fit: BoxFit.cover),
        ),
        centerTitle: true,
        toolbarHeight: myToolbarHeight,
        // title: Text(
        //   'Discover app',
        //   style: TextStyle(fontSize: 30, color: Colors.black),
        // ),
        // centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 3, right: 3, bottom: 20),
                child: _locationbar(context),
              ),
              _articlesList(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _locationbar(BuildContext _context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Color.fromRGBO(69, 69, 69, 1),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _location.map(
          (l) {
            bool _isActive = _location[_activelocation] == l ? true : false;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      color: _isActive ? Colors.white : Colors.white54),
                ),
                _isActive
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.redAccent),
                        height: 5,
                        width: 30,
                      )
                    : Container(),
              ],
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _articlesList(BuildContext _context) {
    return Expanded(
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(articles[index].image),
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 2,
                              blurRadius: 20,
                              offset: Offset(0, 7))
                        ]),
                    height: 300,
                    // color: Colors.amberAccent,
                  ),
                ),
              );
            }));
  }
}
