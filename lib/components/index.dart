// import 'package:flutter/material.dart';
// import 'package:newyorktimesapp/models/news.dart';
// import 'package:newyorktimesapp/components/news_details.dart';
//
// class NewyorktimesScreen extends StatefulWidget {
//   const NewyorktimesScreen({Key? key}) : super(key: key);
//
//   @override
//   _NewyorktimesScreenState createState() => _NewyorktimesScreenState();
// }
//
// class _NewyorktimesScreenState extends State<NewyorktimesScreen> {
//   List<News> news = [];
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchNews();
//   }
//
//   Future<void> fetchNews() async {
//     setState(() => isLoading = true);
//     news = await News.getNews();
//     print(news);
//     setState(() => isLoading = false);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }
//
//     return ListView.builder(
//       itemCount: news.length < 10 ? news.length : 10,
//       itemBuilder: (context, index) {
//         final article = news[index];
//         final imageUrl = (article.media != null && article.media!.isNotEmpty)
//             ? article.media![0].mediadata?.firstWhere((element) => element.url != null)?.url ?? ''
//             : '';
//
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => NewsDetailsScreen(news: article),
//               ),
//             );
//           },
//           child: Card(
//             color: Colors.grey[800],
//             margin: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (imageUrl.isNotEmpty)
//                   Image.network(
//                     imageUrl,
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                     height: 200,
//                     loadingBuilder: (context, child, loadingProgress) {
//                       if (loadingProgress == null) {
//                         return child;
//                       } else {
//                         return Center(child: CircularProgressIndicator(value: loadingProgress.expectedTotalBytes != null
//                             ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
//                             : null));
//                       }
//                     },
//                     errorBuilder: (context, error, stackTrace) {
//                       return const Center(child: Icon(Icons.error, color: Colors.red));
//                     },
//                   ),
//
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "${article.title ?? "Sin título"} - ${article.published_date ?? "Fecha desconocida"}",
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
