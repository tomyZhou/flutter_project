import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     title: "导航演示001",
//     home: FirstScreen(),
//   ));
// }

// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("导航页面")),
//       body: Center(
//         child: RaisedButton(
//           //凸起的按钮
//           child: Text("查看商品详情"),
//           onPressed: () {
//             //导航
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => new SecondScreen()));
//           },
//         ),
//       ),
//     );
//   }
// }

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("商品详情")),
//       body: Center(
//         child: RaisedButton(
//           child: Text(" 返回"),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }

//**********************************导航002**********************************/
class Product {
  final String title; //标题
  final String description; //描述

  Product(this.title, this.description);
}

void main() {
  runApp(MaterialApp(
    title: "参数传递",
    home: ProductList(
        products: List.generate(30, (i) => Product("商品$i", "这是一个商品详情，编号为$i"))),
  ));
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //大括号里面要用return
    return Scaffold(
      appBar: AppBar(title: Text("商品列表")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          //大括号里面要用return
          return ListTile(
            title: Text(products[index].title),
            subtitle: Text(products[index].description),
            onTap: () {
              //大括号里面要用return
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) =>ProductDetail(product:products[index])
              //     )
              // );
              _navigateToDetail(context, index);
            },
          );
        },
      ),
    );
  }

  _navigateToDetail(BuildContext context, int index) async {
    //异步方法
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetail(product: products[index])));

    final mySnackBar = SnackBar(
      content: new Text(result),
      backgroundColor: Colors.black54,
      duration: Duration(seconds: 2),
      action: new SnackBarAction(
          label: '我是snackbar按钮',
          onPressed: () {
            print('点击了snackbar按钮');
          }),
    );
    Scaffold.of(context).showSnackBar(mySnackBar);

    // Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(product.description),
            Image.asset("images/ic_launcher.jpg"),
            RaisedButton(
              child: Text("大长腿小姐姐"),
              onPressed: () {
                Navigator.pop(context, '大长腿小姐姐，电话15011112222');
              },
            ),
            RaisedButton(
              child: Text("小蛮腰小姐姐"),
              onPressed: () {
                Navigator.pop(context, '小蛮腰小姐姐，电话17799998888');
              },
            ),
          ],
        ),
      ),
    );
  }
}
