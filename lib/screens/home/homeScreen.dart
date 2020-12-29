import 'package:flutter/material.dart';
import 'package:richcommerce/Managers/ApiManagers/AddressesManager.dart';
import 'package:richcommerce/Managers/ApiManagers/AuthManager.dart';
import 'package:richcommerce/Managers/ApiManagers/CategoriesManager.dart';
import 'package:richcommerce/Managers/ApiManagers/OrdersManager.dart';
import 'package:richcommerce/Managers/ApiManagers/ProductsManager.dart';
import 'package:richcommerce/Models/Address.dart';
import 'package:richcommerce/Models/Category.dart';
import 'package:richcommerce/Models/Order.dart';
import 'package:richcommerce/Models/Product.dart';
import 'package:richcommerce/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductsManager _productsManager;
  CategoriesManager _categoriesManager;
  OrdersManager _ordersManager;
  AuthManager _authManager;
  AddressesManager _addressesManager;
  @override
  void initState() {
    // TODO: implement initState
    _productsManager = new ProductsManager();
    _categoriesManager = new CategoriesManager();
    _ordersManager = new OrdersManager();
    _authManager = new AuthManager();
    _addressesManager = new AddressesManager();

    //this.getAll();
    // this.getOne(1);

   //getAuthToken();


    getSharedPrefs();
    super.initState();
  }

  getSharedPrefs() async {
    print("dede");
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getKeys());
    print(_prefs.getString("authToken"));

  }
  getAuthToken() async {
    User u = new User();
    u.email = "test@gmail.com";
    u.password = "motdepasse";
    String token = await _authManager.getAuthToken(u);
    print("Token $token");
  }
  getAll() async {
    List<Product> products = await _productsManager.findAll();
    //List<Category> categories = await _categoriesManager.findAll();
    //List<Address> addresses = await _addressesManager.findAll();
    print(products);
  }

  getOne(int id) async {
    //Product product = await _productsManager.findOneById(id);
    //Category category = await _categoriesManager.findOneById(id);
    //Order order = await _ordersManager.findOneById(id);
    Address address = await _addressesManager.findOneById(id);
    print(address);
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
