import 'package:flutter/material.dart';
import 'package:part_9/models/User.dart';
import 'package:part_9/screens/UserDetailScreen.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

List<User> usersList = [
  User(
      age: 34,
      firstName: 'Олег',
      lastName: 'Нечипоренко',
      phone: '9645619845',
      email: 'oleg.kizaru@mail.ru',
      avatar:
          'https://mediaex.ru/wp-content/uploads/9/5/a/95a3c6039ad3dbc367db00336fd562b0.jpeg'),
  User(
      age: 26,
      firstName: 'Иван',
      lastName: 'Дрёмин',
      phone: '9247156467',
      email: 'ivan.face@mail.ru',
      avatar:
          'https://24smi.org/public/media/celebrity/2019/12/19/art4cjl3hnt8-ivan-dremin.png'),
  User(
      age: 27,
      firstName: 'Глеб',
      lastName: 'Голубин',
      phone: '9248450923',
      email: 'gleb.pharaoh@mail.ru',
      avatar:
          'https://kinmeduch.ru/wp-content/uploads/e/5/4/e540f06e72bf397b80b3586bf00f13b1.jpeg'),
];

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailScreen(
                    user: usersList[index],
                  ),
                ),
              );
            },
            child: Card(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      child: usersList[index].avatar == ''
                          ? Image.network('')
                          : Image.network(usersList[index].avatar,
                              fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Имя: ' + usersList[index].firstName,
                            textAlign: TextAlign.left,
                          ),
                          Text('Фамилия: ' + usersList[index].lastName),
                          Text('Возраст: ' + usersList[index].age.toString()),
                          Text('Телефон: ' + usersList[index].phone),
                          Text('Email: ' + usersList[index].email),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          );
        });
  }
}
