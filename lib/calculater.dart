import 'package:bmi_calculater/main.dart';
import 'package:flutter/material.dart';


class BMICalculater extends StatefulWidget {
  const BMICalculater({Key? key}) : super(key: key);

  @override
  _BMICalculaterState createState() => _BMICalculaterState();
}

class _BMICalculaterState extends State<BMICalculater> {



  Color myColor = Colors.transparent;
  TextEditingController weight_Controller = new TextEditingController();
  TextEditingController height_Controller = new TextEditingController();
  var main_result = TextEditingController();


  CalCulate_BMI (String weight,String height) async{
    var myDouble_weight = double.parse(weight);
    assert(myDouble_weight is double);
    var myDouble_height = double.parse(height);
    assert(myDouble_height is double);


    var res = (myDouble_weight/(myDouble_height*myDouble_height));

    setState(() {
      main_result.text = res.toStringAsFixed(2);
      if(res<18.5){
        myColor = Color(0xFF87B1D9);
      }
      else if(res>=18.5 && res<=24.9){
        myColor = Color(0xFF3DD365);
      }
      else if(res>=25 && res<=29.9){
        myColor = Color(0xFFEEE133);
      }
      else if(res>=30 && res<=34.9){
        myColor = Color(0xFFFD802E);
      }
      else if(res>=35){
        myColor = Color(0xFFF95353);
      }
    });

  }


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      const Color(0xFF6DD5ED),
                      const Color(0xFF2193B0)
                    ]
                )
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text("BMI Calculator",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF0038FF),fontSize: 25),),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                    child: TextField(
                      controller: weight_Controller,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(fontSize: 18,color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your weight (kg)",
                      ),
                    ),),
                  Padding(padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: TextField(
                      controller: height_Controller,
                      autofocus: false,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(fontSize: 18,color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your height (m)",
                      ),
                    ),),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                      child: SizedBox(
                        width: 180,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            CalCulate_BMI(weight_Controller.text, height_Controller.text);
                          },
                          child: Text("Calculate",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xFF0038FF)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  )
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                          color: myColor,
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Center(child: Text("BMI: "+main_result.text,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color(0xFF87B1D9),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                          ),
                          Text("Underweight",style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color(0xFF3DD365),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                          ),
                          Text("Normal",style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color(0xFFEEE133),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                          ),
                          Text("Overweight",style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color(0xFFFD802E),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                          ),
                          Text("obese",style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color(0xFFF95353),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                          ),
                          Text("Extreme",style: TextStyle(fontSize: 15),)
                        ],
                      )
                    ],
                  ),)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
