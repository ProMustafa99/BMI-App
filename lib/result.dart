import 'package:flutter/material.dart';
var im ;var type;


class Rusult extends StatelessWidget {
  const Rusult({Key? key ,required this.result ,required this.isMale ,required this.age }) : super(key: key);

  final double result;
  final bool isMale;
  final int age;
  String get resultPhrase{
    String res ='';
    if(result>=30)
      {
        res="Obesity ";
        im="assest/icon/ob.jpg";
      }
    else if(result>25 &&result<30)
      {
        res="OverWeight";
        im="assest/icon/over.jpg";

      }
    else if(result>=18.5 && result<=24.9)
      {res="Normal";im="assest/icon/he.jpg";}

    else
      {res="Thin"; im="assest/icon/he.jpg";}

    return res;
  }
  Container co(BuildContext context , int n)
  {
    String title="";

    if(n==1)
      {
         title ="Gender";
         if(isMale==true)
         {
           im   ="assest/icon/me.jpg";
           type ="Male";
         }
         else{im ="assest/icon/fe.png"; type ="Fmale";}


      }
    else if(n ==2)
    {
      title ="Healthiness ";
      type=resultPhrase;
    }
    else if(n==3){
      title="Ruslte";
      type=result.toStringAsFixed(2);
      im="assest/icon/download.png";
    }
    else if(n==4){
      title="Age ";type=age;
      im="assest/icon/ad.png";
    }


    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width/1,
      height: MediaQuery.of(context).size.width/4,
      child: Row(
        children: [
          Image.asset(im),  SizedBox(width: 10,),
          Text("${title} : ${type}",style:Theme.of(context).textTheme.headline3,),
        ],
      ),
    );

  }
//text
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Result page"),centerTitle:true,),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
            Image.asset("assest/icon/vec.jpg"),
              co(context,1),
              co(context,4),
              co(context,3),
              co(context,2),
          ],),
        ),
      ),
    );
  }
}
