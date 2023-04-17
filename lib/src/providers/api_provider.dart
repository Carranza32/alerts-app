import 'dart:io';

import 'package:alerts_app/src/models/index.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const _baseUrl = "https://randomuser.me/api/?results=100";

class ApiProvider with ChangeNotifier {

	List<Result> _alerts = [];

	List<Result> get alerts => _alerts;

	ApiProvider(){

		getAlerts();
	}

	getAlerts() async {
		final response = await http.get(
			Uri.parse(_baseUrl),
			// headers: {
			// 	HttpHeaders.authorizationHeader: user.llaveApi ?? ''
			// }
		);

		if (response.statusCode == HttpStatus.ok) {
			final data = randomUserModelFromJson( response.body );

			_alerts = data.results!;
		} else {
			throw Exception('Failed to load data');
		}

		notifyListeners();
	}
}