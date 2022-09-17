
import 'package:flutter/material.dart';
import 'package:network2/Post.dart';
import 'package:network2/network.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data='';

  void postList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      showRes(response),
    });
  }

  void get2(){
    Network.GET2(Network.API_GET, Network.paramsEmpty()).then((response) => {
      print(response),
      showRes(response),
    });
  }

  void postCreate(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      print(response),
      showRes(response),
    });
  }

  void postUpdate(Post post){
    Network.PUT(Network.API_UPDATE+post.id.toString(), Network.paramsUpdate(post)).then((response) => {
      print(response),
      showRes(response),
    });
  }

  void postDelet(Post post){
    Network.DEL(Network.API_DELETE+post.id2.toString(), Network.paramsEmpty()).then((response) => {
      print(response),
      showRes(response),
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = Post(name: 'test',salary: '123',age: 23,id: 21,id2: 2);
    //get2();
    postList();
    //postCreate(post);
    //postDelet(post);
  }

  showRes(String response){
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data == '' ? 'No data' : data),
      ),
    );
  }
}
