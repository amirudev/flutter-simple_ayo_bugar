import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_ayo_bugar/routes/page_config.dart';

class ABRouteInformationParser extends RouteInformationParser<ABPageConfiguration> {
  @override
  Future<ABPageConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
    log(
      const JsonEncoder.withIndent('\t',).convert(
        {
          'location': routeInformation.location,
          'state': routeInformation.state?.toString(),
        },
      ),
      name: "RouteInformationParser.parseRouteInformation",
    );
    return ABPageConfiguration();
  }
}