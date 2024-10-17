import 'package:first_app/controller/fetchMeme.dart';
import 'package:first_app/controller/saveMyData.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imgUrl ="";
  int? memeNo;
  int targetMeme =100;
  bool isLoading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetInitMemeNo();
    UpdateImg();
  }

  GetInitMemeNo() async{
    memeNo = await SaveMyData.fetchData()?? 0;
    if(memeNo!>100){
      targetMeme = 500;
    }else if(memeNo! > 500){
      targetMeme  = 1000;
    }
    setState(() {
      
    });
  }

  void UpdateImg() async{
    String getImgUrl = await FetchMeme.fetchNewMeme();
    setState(() {
      imgUrl = getImgUrl;
      isLoading  = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                "Meme #${memeNo?.toString()??'0'}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Target ${targetMeme} Memes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              isLoading?
                  Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator()
                      )
                    )
                  ):
              Image.network(
                height: 400,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitHeight,
                  imgUrl),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading= true;
                    });
                    await SaveMyData.saveData((memeNo??0)+1);
                    GetInitMemeNo();
                    UpdateImg();
                  },
                  child: Container(
                      height: 20,
                      width: 70,
                      child: Center(
                          child: Text(
                        "More Fun!!",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )))),
              //TextButton(onPressed: (){}, child: Text("Submit")),
              //OutlinedButton(onPressed: (){}, child: Text("Submit"))
              Spacer(),
              Text(
                "Created By",
                style: TextStyle(fontSize: 10),
              ),
              Text(
                "Vaibhav B Ippar",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ));
  }
}
