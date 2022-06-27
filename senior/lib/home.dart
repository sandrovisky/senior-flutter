import 'package:flutter/material.dart';
import 'package:senior/appbar.dart';
import 'package:senior/movies_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  Widget _buildHeaderIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/senior.png',
          fit: BoxFit.contain,
          height: 32,
        ),
      ],
    );
  }

  Widget _buildSearchForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                  child: TextFormField(
                    controller: searchController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Cant be null";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Ex: Harry Potter',
                        border: OutlineInputBorder()),
                  )),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MoviesData(
                                search: searchController.text,
                              )));
                    }
                  },
                  child: const Text('Search'))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: seniorAppBarHome(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[
                const Text(
                  "Find out how many movies were released each year by the name typed below:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                _buildSearchForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
