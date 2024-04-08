import 'package:appbookblog/model/book.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


enum BooksStatus { initial, success, failure }

@immutable
final class BooksState extends Equatable {
  BooksState({
    this.booksStatus = BooksStatus.initial,
    this.listBook = const <Book>[],
    this.length = 0,
  });
  final List<Book> listBook;
  final BooksStatus booksStatus;
  int length = 0;

  BooksState copyWith({
    BooksStatus? status,
    List<Book>? listBook,
  }) {
    return BooksState(
        listBook: listBook ?? this.listBook,
        booksStatus: status ?? booksStatus,
        length: listBook?.length ?? 0);
  }

  @override
  String toString() {
    return '''BooksState { status: $booksStatus, listBook: ${length} }''';
  }

  @override
  List<Object> get props => [booksStatus, listBook];
}
