import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  SystemConfig? systemConfig;

  @override
  void initState() {
    super.initState();
    _fetchConfig();
  }

  Future<void> _fetchConfig() async {
    systemConfig = await fetchSystemConfig();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: systemConfig != null
            ? Text('Mobile Regex: ${systemConfig!.mobileRegex}')
            : CircularProgressIndicator(),
      ),
    );
  }
}



Future<SystemConfig?> fetchSystemConfig() async {
  try {
    final response = await http.get(Uri.parse('https://progress-soft-app-b8046.cloudfunctions.net/getConfig'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return SystemConfig.fromJson(data);
    } else {
      print('Error fetching configuration: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error fetching configuration: $e');
    return null;
  }
}

class SystemConfig {
  String? mobileRegex;
  String? passwordRegex;

  SystemConfig({this.mobileRegex, this.passwordRegex});

  factory SystemConfig.fromJson(Map<String, dynamic> json) {
    return SystemConfig(
      mobileRegex: json['mobileRegex'],
      passwordRegex: json['passwordRegex'],
    );
  }
}
