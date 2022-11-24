import 'package:flutter/material.dart';
import 'package:counter_7/model/budget.dart';
import 'package:counter_7/page/drawer.dart';

class DataBudget extends StatefulWidget {
  const DataBudget({super.key});

  @override
  State<DataBudget> createState() => _MyDataBudgetState();
}

class _MyDataBudgetState extends State<DataBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: drawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Budget.budgets[index].judul,
                    style: const TextStyle(fontSize: 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Budget.budgets[index].nominal.toString(),
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        Budget.budgets[index].jenis,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: Budget.budgets.length,
      ),
    );
  }
}