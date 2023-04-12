import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// opt+command+L ⇨全体整形
//ウィジットを選択してopt+enter ⇨columnウィジット
//control+spaceでどんなプロパティがあるかの一覧が確認できる

//stateless widgetを継承したい、stとうてば変換で出てくるからクラスを作りたい時はそれ使う
//constは値を変えたくない時に使う、問題が起きない以上つけなくてもよいかも
//scaffoldは各画面を作る感じ、それをMaterialAppで管理するみたいな

class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bizcard"),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 251, 250, 249),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          //Stackはどんどん上に上に重ねていく感じ、getCardの上にgetAvatarがくる
          alignment: Alignment.topCenter,
          children: <Widget>[
            _getCard(),
            _getAvatar(),
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 27, 158, 211),
        borderRadius: BorderRadius.circular(14.5), //角を丸っぽくするかどうか
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Tomoya",
            style: TextStyle(
              fontSize: 20.9,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text("tomonosuke.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.rocket),
              Text("go to the Moon!"),
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 196, 174, 174),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 1.2),
          image: const DecorationImage(
              image: NetworkImage(
                  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fnaruto-official.com%2F&psig=AOvVaw2Prcko8GcqnRHoP2dxX2v3&ust=1681372142325000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCOiJ_Lrto_4CFQAAAAAdAAAAABAE"),
              fit: BoxFit.cover)),
    );
  }
}

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  _tapButton() {
    debugPrint("Email Tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: <Widget>[
          IconButton(onPressed: () => _tapButton(), icon: Icon(Icons.login)),
          IconButton(
              onPressed: () => _tapButton(), icon: Icon(Icons.account_circle))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.missed_video_call),
        onPressed: () => debugPrint("Hi"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          //下のメニューバーは少なくとも2つのアイテムがいる
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "cart")
        ],
        onTap: (int index) => debugPrint("Tapped item: $index"),
      ),
      backgroundColor: Colors.redAccent.shade100,
      body: Container(
        // body:アプリケーション全体の設定
        alignment: Alignment.center,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton()
            // InkWell(
            //   child: Text(
            //     "Tap me!",
            //     style: TextStyle(fontSize: 23.4),
            //   ),
            //   onTap: () => debugPrint("tapped..."),
            // )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        //ボタンカスタマイズのためのさまざまな仕様がセットされている
        onTap: () {
          final snackBar = SnackBar(
            content: Text("Helllo Again!"),
            backgroundColor: Colors.amberAccent.shade700,
          );
//SnackBar押したらしたからでてくる
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }, //onTap

        child: Container(
          padding: EdgeInsets.all(20.0), //内部の文字からどれだけの余白を作るか
          decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(8.0)),
          child: Text("Button"),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Material(
        color: Colors.deepOrange,
        child: Center(
            child: Text(
          "Hello Flutter",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 23.4,
              fontStyle: FontStyle.italic),
        )));
  }
}
