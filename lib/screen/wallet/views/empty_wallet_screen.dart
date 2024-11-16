import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'components/wallet_balance_card.dart';

class EmptyWalletScreen extends StatelessWidget {
  const EmptyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Added SingleChildScrollView
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: WalletBalanceCard(
                  balance: 384.90,
                  onTabChargeBalance: () {},
                ),
              ),
              const SizedBox(height: 16), // Add spacing instead of Spacer
              Image.asset(
                Theme.of(context).brightness == Brightness.light
                    ? "assets/Illustration/EmptyState_lightTheme.png"
                    : "assets/Illustration/EmptyState_darkTheme.png",
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              const SizedBox(height: 16),
              Text(
                "Empty wallet history",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5, vertical: defaultPadding),
                child: Text(
                  "Customer network effects freemium. Advisor android paradigm shift product management. Customer disruptive crowdsource",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
