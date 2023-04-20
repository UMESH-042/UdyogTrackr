import 'package:flutter/material.dart';

class BalanceSheetPage extends StatelessWidget {
  final double assetsTotal;
  final double liabilitiesTotal;
  final double equityTotal;

  BalanceSheetPage({required this.assetsTotal, required this.liabilitiesTotal, required this.equityTotal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Balance Sheet'),
      ),
      body: ListView(
        children: [
          _buildSectionTitle('Assets'),
          _buildBalanceItem('Cash', assetsTotal),
          _buildBalanceItem('Accounts Receivable', assetsTotal),
          _buildBalanceItem('Inventory', assetsTotal),
          _buildBalanceItem('Prepaid Expenses', assetsTotal),
          _buildBalanceItem('Other Assets', assetsTotal),
          Divider(),
          _buildTotalItem('Total Assets', assetsTotal),
          Divider(),
          _buildSectionTitle('Liabilities'),
          _buildBalanceItem('Accounts Payable', liabilitiesTotal),
          _buildBalanceItem('Notes Payable', liabilitiesTotal),
          _buildBalanceItem('Wages Payable', liabilitiesTotal),
          _buildBalanceItem('Taxes Payable', liabilitiesTotal),
          _buildBalanceItem('Other Liabilities', liabilitiesTotal),
          Divider(),
          _buildTotalItem('Total Liabilities', liabilitiesTotal),
          Divider(),
          _buildSectionTitle('Equity'),
          _buildBalanceItem('Common Stock', equityTotal),
          _buildBalanceItem('Retained Earnings', equityTotal),
          _buildBalanceItem('Other Equity', equityTotal),
          Divider(),
          _buildTotalItem('Total Equity', equityTotal),
          Divider(),
          _buildTotalItem('Total Liabilities & Equity', assetsTotal + liabilitiesTotal + equityTotal),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[500],
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBalanceItem(String label, double value) {
    return ListTile(
      title: Text(label),
      trailing: Text(value.toStringAsFixed(2)),
    );
  }

  Widget _buildTotalItem(String label, double value) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        value.toStringAsFixed(2),
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
