import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

pushTo(BuildContext context, String route) {
  context.push(route);
}

pushReplacment(BuildContext context, String route) {
context.pushReplacement(route);
}

pushAndRemoveUntil(BuildContext context, String route) {
context.go(route);
}

pop(BuildContext context)
{
  context.pop();
}