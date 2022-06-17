import 'package:flutter/material.dart';
import 'package:latianresponsi/model/user_model.dart';
import 'package:latianresponsi/services/data_source.dart';
import 'package:latianresponsi/theme.dart';
import 'package:latianresponsi/widget/card_list.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final TextEditingController _searchController = TextEditingController();
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 100), child: _buildFieldSearch()),
          _buildButtonSearch(),
          _buildDetailUserBody()
        ],
      ),
    );
  }

  Widget _buildFieldSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(15, 0, 0, 0),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset.fromDirection(0, 0))
            ]),
        child: TextFormField(
          textAlign: TextAlign.center,
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Search",
          ),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Search Can\'t be empty';
            } else {
              return null;
            }
          },
          onChanged: (text) => setState(() => search = text),
        ),
      ),
    );
  }

  Widget _buildButtonSearch() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: mainColor,
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => home()));
        },
        child: Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDetailUserBody() {
    return Container(
      child: FutureBuilder<List<UsersModel>>(
        future: GithubDataSource.instance.loadUsersList(),
        builder: (
            BuildContext context,
            AsyncSnapshot<List<UsersModel>> snapshot,
            ) {
          if (snapshot.hasError) {
            debugPrint("${snapshot.runtimeType}");
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
              return _buildSuccessSection(snapshot);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {

    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildSuccessSection(AsyncSnapshot<List<UsersModel>> snapshot) {
    // return Text("${data.runtimeType}");
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (BuildContext context, int index) {
        debugPrint("${snapshot.data![index].login}");
        return Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "${snapshot.data![index].avatarUrl}",
                width: 80,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${snapshot.data![index].login}",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
          ],
        );;
      },
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
