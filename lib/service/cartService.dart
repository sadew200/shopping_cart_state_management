
class CartService{
  static List _item=[];
  static void saveCartToStorage(Object v){
    _item.add(v);
  }
 static List loadCartFromStorage(){
    return _item;
 }
  static  void clearStoredCart(){
    _item=[];
  }
}