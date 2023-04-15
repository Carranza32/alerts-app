import 'package:flutter/material.dart';

class AlertListScreen extends StatelessWidget {
  const AlertListScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Column(
		  children: [
			PreferredSize(
				preferredSize: const Size.fromHeight(64.0),
				child: Container(
					alignment: Alignment.centerLeft,
					padding: const EdgeInsets.only(left: 16, bottom: 10, right: 16),
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
		    	child: ListView.builder(
					padding: const EdgeInsets.symmetric(horizontal: 16),
		    		shrinkWrap: true,
		    		primary: false,
		    		itemCount: 10,
		    		itemBuilder: (context, index) {
		    			return Card(
		    				child: ListTile(
		    					title: Text('Alert $index'),
		    					subtitle: Text('Subtitle $index'),
		    					trailing: const Icon(Icons.arrow_forward_ios),
		    					onTap: () {
		    					  Navigator.pushNamed(context, '/detail');
		    					},
		    				),
		    			);
		    		},
		    	),
		    ),
		  ],
		);
	}
}