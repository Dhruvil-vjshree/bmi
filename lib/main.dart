import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

var weight_cont = TextEditingController();
var height_ft = TextEditingController();
var height_inch = TextEditingController();
var result = "";

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

          title: Text('Body Mass Calculation'),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: 400,
            child: Center(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  SizedBox(height: 30,),
                  Center(

                    child: Text('Welcome To BMI Calculator ',
                        style: TextStyle(
                            fontSize:24,fontWeight:FontWeight.w700 ),
                      ),
                  ),


                  SizedBox(height: 25,),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),

                    child: TextField(
                      controller: weight_cont,
                      decoration: InputDecoration(
                        labelText: 'Weight',
                        hintText: ' In KG ',
                        prefixIcon: Icon(Icons.line_weight),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),

                  SizedBox(height: 5,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                    child: TextField(
                      controller: height_ft,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height ',
                        hintText: 'In Feet',
                        prefixIcon: Icon(Icons.height),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.5),
                        )
                      ),
                    ),
                  ),

                  SizedBox(height: 5,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 08),
                    child: TextField(
                      controller: height_inch,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height',
                        hintText: 'In Inch ',
                        prefixIcon: Icon(Icons.height_sharp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  ElevatedButton(onPressed: (){

                    var wt = weight_cont.text.toString();
                    var feet = height_ft.text.toString();
                    var inch = height_inch.text.toString();

                    // niche no mean jo 3 ae field khali na hoy to calculation kro and if
                    // jo khali hoy to setstate ni help lain ne reslut no msg print kro

                    if(wt!="" && feet!="" && inch!="" ){

                      var iweight= int.parse(wt);
                      var ifeet = int.parse(feet);
                      var iinch = int.parse(inch);

                      var tinch = (ifeet*12) + iinch;
                      var centimeter = tinch*2.54;
                      var meter = centimeter/100;

                      var bmi = iweight/(meter*meter);

                      var print ="";



                      if(bmi>25){
                        print='You are over weight  🐷';
                      }
                         else if(bmi<18){
                        print='You are under weight 🍴';

                      }

                      else{
                        print='You are Healthy 🏃‍ ';
                      }

                      // bmi nu calculation nu result print krva
                    setState(() {
                      result = " $print \n\n Your bmi is : ${bmi.toStringAsFixed(2)}";
                    });

                    } else {
                      setState(() {

                        result = "Please Fill The All Blanks 😒  ";
                      });

                    }




                  }, child: Text('Calculate')),

                  SizedBox(height: 5,),

                  Text(result, style: TextStyle(fontSize: 20) ,)



                ],
              ),
            ),
          ),
        )


        ),

    );




  }
}
