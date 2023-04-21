import 'package:alerts_app/src/models/index.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final alert = ModalRoute.of(context)!.settings.arguments as Result;

	  return Scaffold(
      appBar: AppBar(
        title: const Text('Details page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xfff6f4ee),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(alert.picture!.thumbnail ?? ''),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${alert.name!.first} ${alert.name!.last}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Text(
                            timeago.format(alert.registered!.date!),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[700]
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(Icons.star_border_outlined, color: Color(0xff827769)),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam lacinia, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl. Donec euismod, nisl eget aliquam lacinia, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl.", 
                style: TextStyle(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}