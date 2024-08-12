enum WebtoonStatus {
  ongoing,
  hiatus,
  completed;

  @override
  String toString() {
    switch (this) {
      case WebtoonStatus.ongoing:
        return 'ongoing';
      case WebtoonStatus.hiatus:
        return 'hiatus';
      case WebtoonStatus.completed:
        return 'completed';
    }
  }
}
