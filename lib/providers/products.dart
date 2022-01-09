import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier{ // ChangeNotifier is a mix in
  List<Product> _items = [
    Product(
      id: 'd1',
      description: 'Sample text',
      title: 'Bạc Sỉu Đá',
      price: 29000,
      imageUrl: 'https://product.hstatic.net/1000075078/product/bac-siu-da_9bf82220a1a54847aa7357de541e7552_large.jpg'
    ),
    Product(
        id: 'd2',
        description: 'Sample text',
        title: 'Cà Phê Đen Đá',
        price: 29000,
        imageUrl: 'https://product.hstatic.net/1000075078/product/ca-phe-den-da_6e25255ae31c4f3bbbb502f77e2c100d_large.jpg'
    ),
    Product(
        id: 'd3',
        description: 'Sample text',
        title: 'Cà Phê Sữa Đá',
        price: 30000,
        imageUrl: 'https://product.hstatic.net/1000075078/product/ca-phe-sua-da_b00c53d18cd84144a164790323106a2f_large.jpg'
    ),
    Product(
        id: 'd4',
        description: 'Sample text',
        title: 'Trà Đào Cam Sả Đá',
        price: 45000,
        imageUrl: 'https://product.hstatic.net/1000075078/product/tra-dao-cam-xa_668678_400x400_207c526c987c4026877ebae748c62afd_large.jpg'
    ),

    Product(
        id: 'd5',
        title: 'Trà Hạt Sen Đá',
        description: 'Sample text',
        price: 45000,
        imageUrl: 'https://product.hstatic.net/1000075078/product/tra-sen_905594_400x400_c82fd1b3786d45f380cf4c15e9af7ab9_large.jpg'    
    ),
    Product(
        id: 'd6',
        title: 'Trà Long Nhãn Hạt Chia',
        description: 'Sample text',
        price: 45000,
        imageUrl: 'https://product.hstatic.net/1000075078/product/tra-nhan-da_484810_400x400_446acb3ad76a48d38a98855cd7be54cd_large.jpg'
    ),

    Product(
        id: 'd7',
        title: 'Trà Đen Macchiato',
        description: 'Sample text',
        price: 50000,
        imageUrl: 'https://product.hstatic.net/1000075078/product/tra-den-matchiato_430281_400x400_88f47618a6b84c2d9ad633d3298fb390_large.jpg'
    ),

    Product(
        id: 'd8',
        title: 'Hồng Trà Sữa Trân Châu',
        description: 'Sample text',
        price: 55000,
        imageUrl: 'https://product.hstatic.net/1000075078/product/hong-tra-sua-tran-chau_326977_400x400_30c57e67d1104ae4b7313cf5d40f3e87_large.jpg'
    ),
  ];

  //var _showFavoritesOnly = false; 

 

  List<Product> get items { 
    // if(_showFavoritesOnly == true){
    //   return _items.where((prod) => prod.isFavorite == true).toList(); 
    // }
    return [..._items];
    
  }


  List<Product> get favoriteItems{
    return _items.where((prod) => prod.isFavorite == true).toList(); 
  }  

  Product findById(String id ){
    return _items.firstWhere((prod) => prod.id == id); 
  }

  String ImageById( String targetId){
    //print(targetId);
    //print(targetId == items[0].id);
    String result = 'clone'; 
    _items.forEach((element) {if(targetId == element.id) result = element.imageUrl;}); 
    //print(result);
    return result;
  }

  void addProduct(){
    //_items.add(valu)
    notifyListeners(); /// Anounce the relevant widgets that the data has been changed. 
  }
}