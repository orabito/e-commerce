/// message : "Product added successfully to your wishlist"
/// status : "success"
/// statusMsg : "fail"
library;

class AddWishlistEntity {
  AddWishlistEntity({
    this.message,
    this.status,
    this.statusMsg,
  });

  String? message;
  String? status;
  String? statusMsg;
}
