import 'package:alerts_app/src/providers/api_provider.dart';
import 'package:alerts_app/src/widgets/alert_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AlertListScreen extends StatelessWidget {
  const AlertListScreen({super.key});

	@override
	Widget build(BuildContext context) {
		final apiProvider = Provider.of<ApiProvider>(context);

		return Column(
		  children: [
			PreferredSize(
				preferredSize: const Size.fromHeight(64.0),
				child: Container(
					alignment: Alignment.centerLeft,
					padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
					child: const TextField(
            decoration: InputDecoration(
              hintText: 'Buscar...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.search_rounded, color: Color(0xff827769)),
            ),
					),
				),
			),

			Expanded(
		    	child: apiProvider.alerts.isEmpty
					? const Center(child: CircularProgressIndicator())
					: RefreshIndicator(
						onRefresh: () async {
							await apiProvider.getAlerts();
						},
						child: ListView.builder(
							padding: const EdgeInsets.symmetric(horizontal: 16),
							shrinkWrap: true,
							primary: false,
							itemCount: apiProvider.alerts.length,
							itemBuilder: (context, index) {
								return AlertCard(alert: apiProvider.alerts[index]);
							},
						),
					)
		    ),
		  ],
		);
	}
}