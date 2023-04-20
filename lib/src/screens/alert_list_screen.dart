import 'package:alerts_app/src/providers/api_provider.dart';
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
					padding: const EdgeInsets.only(left: 16, bottom: 10, right: 16, top: 20),
					child: const TextField(
					decoration: InputDecoration(
						isDense: true,
						hintText: 'Browse indoor plants',
						filled: true,
						border: OutlineInputBorder(),
						prefixIcon: Icon(Icons.search_rounded),
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
								final alert = apiProvider.alerts[index];

								return Card(
									child: ListTile(
										title: Text(alert.name!.first ?? ''),
										subtitle: Text(alert.email ?? ''),
										trailing: const Icon(Icons.arrow_forward_ios),
										onTap: () {
										Navigator.pushNamed(context, '/detail');
										},
									),
								);
							},
						),
					)
		    ),
		  ],
		);
	}
}