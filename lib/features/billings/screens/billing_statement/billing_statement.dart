import 'package:flutter/material.dart';

class BillingStatement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Statement'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implement back button functionality here
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBillingItem('Rent', '4,500'),
                _buildBillingItem('Water', '330', subItems: [
                  '5 cubic meter',
                  'Free',
                  '3 @ 55/cubic meter',
                  '110',
                ]),
                _buildBillingItem('Electricity', '1,600', subItems: [
                  '100 kWh @ 16/kWh',
                ]),
                _buildBillingItem('Wi-Fi', '600', subItems: [
                  '2 @ 300/person',
                ]),
                _buildBillingItem('Parking', '150', subItems: [
                  '1 @ 150/slot',
                ]),
                _buildBillingItem('Maintenance', '300', subItems: [
                  'Water Leak',
                ]),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Text(
                      '7,480',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBillingItem(String title, String amount, {List<String>? subItems}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          if (subItems != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: subItems.map((item) {
                return Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Text(item),
                );
              }).toList(),
            ),
          SizedBox(height: 5),
          Text(
            amount,
            style: TextStyle(fontSize: 16),

          ),
          Divider(),
        ],
      ),
    );
  }
}