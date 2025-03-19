import 'package:flutter/material.dart';
import 'package:newyorktimesapp/models/news.dart';

class NewsDetailsScreen extends StatelessWidget {
  final News news;

  const NewsDetailsScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Acceder a mediadata a través de media
    final imageUrl = (news.media != null && news.media!.isNotEmpty)
        ? news.media![0].mediadata?.firstWhere((element) => element.url != null)?.url ?? ''
        : '';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Noticia"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[850],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl.isNotEmpty)
              Image.network(imageUrl, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              news.title ?? "Sin título",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              news.published_date ?? "Fecha desconocida",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              news.abstract ?? "No hay resumen disponible.",
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
