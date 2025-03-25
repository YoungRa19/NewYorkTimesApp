import 'package:flutter/material.dart';
import 'package:newyorktimesapp/models/news.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool loading = true;
  List<News> notices = [];

  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    notices = await News.getNews();
    for(var notice in notices){
      print(notice.toMap());
    }
    setState(() {
      loading = false;
      notices;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The New York Times",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: notices.length,
          itemBuilder: (context,index){
            return Text("${notices[index].title}",style: TextStyle(color: Colors.white),);
          })
    );
  }
}
