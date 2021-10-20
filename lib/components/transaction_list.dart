import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionsList;
  final void Function(String) onRemove;

  TransactionList(this.transactionsList, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactionsList.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Container(
                    height: constraints.maxHeight * 0.3,
                    child: Text(
                      'Nenhuma transação cadastrada!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Fira Code',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactionsList.length,
            itemBuilder: (ctx, index) {
              final tr = transactionsList[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          'R\$${tr.value}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => onRemove(tr.id),
                  ),
                ),
              );
            },
          );
  }
}
