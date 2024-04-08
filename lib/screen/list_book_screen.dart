import 'package:appbookblog/component/item_book.dart';
import 'package:appbookblog/model/book.dart';
import 'package:appbookblog/screen/list_book/books_bloc.dart';
import 'package:appbookblog/screen/list_book/books_event.dart';
import 'package:appbookblog/screen/list_book/books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBookScreen extends StatelessWidget {
  const ListBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BooksBloc()..add(BooksFetch()),
      child: ListBook(),
    );
  }
}

class ListBook extends StatefulWidget {
  const ListBook({super.key});

  @override
  State<ListBook> createState() => _ListBookState();
}

class _ListBookState extends State<ListBook> {

  late BooksBloc booksBloc;
  
  @override
  void initState() {
    super.initState();
    print('ListBookScreen initState');
    booksBloc = context.read<BooksBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    print('ListBookScreen dispose');
    booksBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    print('ListBookScreen build');
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            BlocBuilder<BooksBloc, BooksState>(
              bloc: booksBloc,
              builder: (ctx, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              booksBloc.add(BooksRefresh());
                            },
                            icon: const Icon(Icons.refresh,
                                color: Color(0xFFfd9501))),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                booksBloc = context.read<BooksBloc>();
                              });
                            },
                            icon: const Icon(Icons.delete,
                                color: Color(0xFFfd9501))),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return BlocProvider.value(
                          //         value: booksBloc,
                          //         child: const TestScreen(),
                          //       );
                          //     },
                          //   ),
                          // );
                        },
                        icon: const Icon(Icons.add, color: Color(0xFFfd9501))),
                  ],
                );
              },
            ),
            Text(
              'Library',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            BlocBuilder<BooksBloc, BooksState>(
              bloc: booksBloc,
              builder: (ctx, state) {
                print('ListBookScreen BlocBuilder');
                switch (state.booksStatus) {
                  case BooksStatus.initial:
                    return CircularProgressIndicator();
                  case BooksStatus.success:
                    if (state.length == 0) return Text('Data Empty');
                    List<Book> listBook = List.from(state.listBook);
                    return Expanded(
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemBook(
                                title: listBook[index].title,
                                description: listBook[index].description,
                                value: listBook[index].isCheck,
                                onChangeValue: (value) {
                                  setState(() {
                                    listBook[index].isCheck = value ?? false;
                                  });
                                });
                          }),
                    );
                  case BooksStatus.failure:
                    return Text('Fetch Failure');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
