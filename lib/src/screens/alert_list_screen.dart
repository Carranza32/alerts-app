import 'package:alerts_app/src/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

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
								final alert = apiProvider.alerts[index];

								return InkWell(
                  onTap: () => Navigator.pushNamed(context, '/detail', arguments: alert),
                  splashColor: const Color(0xffffddae),
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

                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam lacinia, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl. Donec euismod, nisl eget aliquam lacinia, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl.", 
                          style: TextStyle(fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
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