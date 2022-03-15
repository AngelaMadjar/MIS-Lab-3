class Memory<T> {

  List<T> elements = [];

  void add(T item) {
    elements.add(item);
  }

  void remove(T item) {
    elements.remove(item);
  }

  void clear() {
    elements.clear();
  }

  bool contains(T item) {
    return elements.contains(item);
  }

  List<T> getItems() {
    return elements;
  }
}