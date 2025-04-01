import 'package:flutter/material.dart';
import 'package:newyorktimesapp/models/news.dart';
import 'package:newyorktimesapp/components/news_details.dart';

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
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: notices.length,
        itemBuilder: (context, index) {

          return Container(
            margin: EdgeInsets.fromLTRB(10, 3, 10, 3),
            padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
            color: Colors.white24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notices[index].title ?? 'Título no disponible',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),

                Text(
                  "Fecha de publicación: ${notices[index].published_date}",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
