import 'dart:collection';

class PageQueue {
  final Queue<int> _queue = Queue();

  void addPage(int page) {
    _queue.remove(page);
    _queue.addLast(page);
  }

  void removePage(int page) {
    _queue.remove(page);
  }

  int previousPage() {
    if (_queue.isEmpty) {
      return -1;
    }
    return _queue.removeLast();
  }
}