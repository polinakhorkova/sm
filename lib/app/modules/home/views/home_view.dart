import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Модель данных для счетчика
class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // Уведомляем слушателей об изменении состояния
  }

  void decrement() {
    _counter--;
    notifyListeners(); // Уведомляем слушателей об изменении состояния
  }
}

// Главный виджет приложения
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterModel(), // Создаем экземпляр модели данных
      child: MaterialApp(
        home: CounterApp(),
      ),
    );
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Primer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter:',
            ),
            Text(
              '${counterModel.counter}', // Отображаем значение счетчика
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterModel.increment(), // Увеличиваем счетчик
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => counterModel.decrement(), // Уменьшаем счетчик
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(HomeView());
}
