/// currentPage : 2
/// numberOfPages : 5
/// limit : 2
/// nextPage : 3
/// prevPage : 1
library;

class MetadataEntity {
  MetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
    this.prevPage,
  });

  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;
  num? prevPage;
}
