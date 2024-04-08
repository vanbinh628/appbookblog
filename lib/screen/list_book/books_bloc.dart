import 'dart:convert';

import 'package:appbookblog/model/book.dart';
import 'package:appbookblog/screen/list_book/books_event.dart';
import 'package:appbookblog/screen/list_book/books_state.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://fakerestapi.azurewebsites.net/api/v1/Books";

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(BooksState()) {
    on<BooksFetch>(_handleBooksFetch);
    on<BooksRefresh>(_handleBooksRefresh);
  }

  Future<void> _handleBooksFetch(
      BooksFetch event, Emitter<BooksState> emit) async {
    try {
      final getListBook = await fetchListOfBooks();
      return emit(
          state.copyWith(status: BooksStatus.success, listBook: getListBook));
    } catch (_) {
      return emit(
          state.copyWith(status: BooksStatus.failure, listBook: List.empty()));
    }
  }

  Future<void> _handleBooksRefresh(
      BooksRefresh event, Emitter<BooksState> emit) async {
    emit(state.copyWith(status: BooksStatus.initial, listBook: List.empty()));
    try {
      final getListBook = await fetchListOfBooks();
      return emit(
          state.copyWith(status: BooksStatus.success, listBook: getListBook));
    } catch (_) {
      return emit(
          state.copyWith(status: BooksStatus.failure, listBook: List.empty()));
    }
  }
}

Future<List<Book>> fetchListOfBooks() async {
  try {
    final response = await http.get(Uri.parse(baseUrl));
    final requestSuccessful = response.statusCode == 200;

    if (requestSuccessful) {
      var pokemonsJson = jsonDecode(response.body) as List<dynamic>;

      return pokemonsJson.map((bookJson) {
        return Book(
            id: bookJson["id"],
            title: bookJson["title"],
            description: bookJson["description"],
            pageCount: bookJson["pageCount"],
            excerpt: '',
            publishDate: '');
      }).toList();
    }

    return [];
  } catch (exception) {
    print(exception);
    return [];
  }
}
