import 'package:flutter/material.dart';
import 'result.dart';
import 'dart:math';
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
bool isMale = true;
var height = 130.0;
int wight = 60;
int age = 25;
int num=0;
String error='Calculate';
Color co =Colors.white;
class _MyHomePageState extends State<MyHomePage> {

  Expanded m1Expanded(BuildContext context, String type) {
    String x = '';
    Color c = Colors.black;

    if (type == 'male') {
      x = 'male';
      c = Colors.teal;
    } else {
      x = 'female';
      c = Colors.blueGrey;
    }
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (type == 'male') {
              isMale = true;
            } else {
              isMale = false;
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: c,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "${x}",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Expanded m2Expanded(BuildContext context, String type , int x) {
    String title="";
    if(Type=="Weight")
      {
        setState(() {
          title = type;

        });
        num = wight;
      }
    else{
      setState(() {
        title = type;
      });
    }

    if(x==1)
    {num = wight;}
    else{
        num = age;

    }

    Color c = Colors.blueGrey;
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: c,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${title}",
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "${num}",
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        type=="Weight" ?wight++ : age++;
                      });
                    },
                    child: Icon(Icons.add,),

                  ),
                 const SizedBox(width: 10,),
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        type=="Age"?--age:--wight;
                      });
                      },
                    child: Icon(Icons.remove),),
                ],
              )


            ],
          ),
        ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1Expanded(context, 'male'),
                    const SizedBox(
                      width: 10,
                    ),
                    m1Expanded(context, 'female'),
                  ],
                ),
              ),
            ), //Button (Mail , Female)
            Container(
              margin: EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey,
              ),
              width:360,
              height: 140,

              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text("Height",style: Theme.of(context).textTheme.headline1,),
                  Text("${height.toStringAsFixed(1)}",style: Theme.of(context).textTheme.headline2,),
                  Slider
                    (
                      value: height,
                      onChanged: (double val)=> setState( (){height=val;} ),
                      min: 60,
                      max: 220,
                      label:"valu", //لما تكبس علىها بتعطيك كلمية valu
                      activeColor:Colors.white , //لون لحدد التحديد
                      inactiveColor:Colors.green // لون للمكان لمش محدد او مش موصله slider,

                  ),

                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m2Expanded(context, 'Weight' ,1),
                    const SizedBox(
                      width: 10,
                    ),
                    m2Expanded(context, 'Age',2),
                  ],
                ),
              ),
            ),//Button (Weight , Age)
            Container(
              color: Colors.teal,
              width: double.infinity,
              height:MediaQuery.of(context).size.height/14,
              child:TextButton(
                  onPressed: (){
                    setState(() {
                      if(wight<5 ||age<1) {
                        error="Age less than 1 or weight less than 5";
                        co=Colors.red;
                      }
                      else{
                        var result = wight /pow(height/100 ,2);
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return  Rusult(result: result, isMale: isMale, age: age);
                        }));
                      }
                    });
                  },
                  child:Text("${error}",style: TextStyle(fontSize: 20 ,color: co)),

              ) ,
            )

          ],
        ),
      ),
    );
  }
}
