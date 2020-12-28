import 'package:flutter/material.dart';
import 'package:richcommerce/Managers/ApiManagers/CategoriesManager.dart';
import 'package:richcommerce/Managers/ApiManagers/ProductsManager.dart';
import 'package:richcommerce/Models/Category.dart';
import 'package:richcommerce/Models/Product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductsManager _productsManager;
  CategoriesManager _categoriesManager;

  @override
  void initState() {
    // TODO: implement initState
    _productsManager = new ProductsManager();
    _categoriesManager = new CategoriesManager();
    this.getAll();
    this.getOne(1);

    super.initState();
  }

   getAll() async{
     //List<Product> products = await _productsManager.findAll();
     List<Category> categories = await _categoriesManager.findAll();
    print(categories);
  }
  getOne(int id) async{
    //Product product = await _productsManager.findOneById(id);
    Category category = await _categoriesManager.findOneById(id);
    print(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: RaisedButton(
          onPressed: () => this.getAll(),
          child: Text("Get all"),
        ),
      ),
    );
  }
}
