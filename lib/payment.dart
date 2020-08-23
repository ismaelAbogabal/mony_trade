import 'package:flutter/material.dart';
import 'package:stripe_sdk/stripe_sdk.dart';
import 'package:stripe_sdk/stripe_sdk_ui.dart';

void deposit(BuildContext context) {
  Stripe.init(
    "pk_test_51HJHOaL0yYsS5pFGqgFwYeGBtVWoKe08L5MOlCWfKJqJogvDPxvX1s9Fid2qMquMjo7if10iLNHIRco6v8FkrXsU00NfclbdvT",
    returnUrlForSca: "Con.gabalismael.tradeapp",
  );

  showDialog(
    context: context,
    builder: (context) => Material(child: CardForm()),
  );
}
