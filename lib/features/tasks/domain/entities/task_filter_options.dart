enum TaskFilterOptions {
  all,
  completed,
  pending;

  String get text {
    switch (this) {
      case TaskFilterOptions.all:
        return 'All  ';
      case TaskFilterOptions.completed:
        return 'Completed  ';
      case TaskFilterOptions.pending:
        return 'Pending  ';
    }
  }
}
