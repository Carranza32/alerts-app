import 'package:alerts_app/src/models/index.dart';
import 'package:alerts_app/src/screens/detail_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class AlertCard extends StatelessWidget {
	final Result alert;
	
	const AlertCard( {super.key, required this.alert} );

	@override
	Widget build(BuildContext context) {
		return InkWell(
			onTap: () => Navigator.of(context).push(
				PageRouteBuilder(
					pageBuilder: (context, animation, secondaryAnimation) => DetailScreen(alert: alert),
					transitionDuration: const Duration(milliseconds: 1000),
					reverseTransitionDuration: const Duration(milliseconds: 1000),
					transitionsBuilder: (context, animation, secondaryAnimation, child) {
						return FadeTransition(
							opacity: animation,
							child: child,
						);
					},
				)
			),
			splashColor: const Color(0xffffddae),
			child: Hero(
				tag: alert.email ?? '',
				child: Container(
				margin: const EdgeInsets.only(bottom: 10),
				padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
				decoration: BoxDecoration(
					color: const Color(0xfff2efe8),
					borderRadius: BorderRadius.circular(17),
				),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
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

						const AutoSizeText(
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