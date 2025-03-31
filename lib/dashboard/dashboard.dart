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
        itemCount: notices.length < 10 ? notices.length : 10,
        itemBuilder: (context, index) {
          final notice = notices[index];
          final image = (notice.media != null && notice.media!.isNotEmpty && notice.media![0].mediadata != null && notice.media![0].mediadata!.isNotEmpty)
              ? (notice.media![0].mediadata!.firstWhere(
                (element) => element.url != null,
            orElse: () => notice.media![0].mediadata!.first, // Devuelve el primer elemento aunque no tenga URL
          ).url ?? '')
              : '';


          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailsScreen(news: notice),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (image.isNotEmpty)
                  Image.network(
                    image,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                SizedBox(height: 10),
                Text(
                  notice.title ?? 'Título no disponible',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),

                Text(
                  "Fecha de publicación: ${notice.published_date}",
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
