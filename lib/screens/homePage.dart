import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/productmodel.dart';
import '../services/get_all_products.dart';
import '../widgets/custom_card.dart';
class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomeState();
  static String id='HomePage';
}

class _HomeState extends State<HomePage> {
  int currentState = 0;
  late bool value = false;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index){
            setState(() {
              currentState = index;
            });
          },
          children: [
            Container(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  foregroundColor: Colors.orange,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  actions: [
                    IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.cartShopping,color: Colors.orange,))
                  ],
                  title: Text('Welcome To Terri Store',style: TextStyle(color: Colors.black),),
                ),
                body:CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child:Column(
                        children: [
                          CarouselSlider(
                            items: [
                              //1st Image of Slider
                              Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: Image.asset("images/one.png").image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              //2nd Image of Slider
                              Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: Image.asset("images/two.png").image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              //3rd Image of Slider
                              Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: Image.asset("images/three.png").image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              //4th Image of Slider
                              Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: Image.asset("images/fo.png").image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              //5th Image of Slider
                              Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: Image.asset("images/fi.png").image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],

                            //Slider Container properties
                            options: CarouselOptions(
                              height: 180.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              viewportFraction: 0.9,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 70,right: 70),
                            child: Text("Are You Ready For Shopping?",style: TextStyle(fontSize: 20,fontFamily: 'Sen'),),
                          )
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                        child:Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: FutureBuilder<List<productModel>>(
                            future: GetAllProducts().getAllProducts(),
                            builder: (context,snapshot){
                              if(snapshot.hasData){
                                List<productModel> products=snapshot.data!;
                                return GridView.builder(
                                  shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: products.length,
                                    clipBehavior: Clip.none,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.2,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 100,
                                    ), itemBuilder: (context,index){
                                  return CustomCard(product: products[index]);
                                });
                              }else if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator(
                                  color: Colors.orange,
                                ));
                              } else if (snapshot.hasError) {     // <----
                                return Center(child: Text(snapshot.error.toString()));   // <----
                              } else {
                                return const Center(child: Text('No data available'));
                              }
                            },
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
            Container(

            ),
            Container(

            ),
            Container(
               child:  Column(
                 children: [
                   Row(
                     children: [
                       SizedBox(width: 20,),
                       Padding(
                         padding: const EdgeInsets.only(top: 70),
                         child: Stack(children: [
                           CircleAvatar(minRadius: 40,
                             backgroundColor: Colors.orange,
                           ),
                           Positioned(
                               bottom: 1,
                               right: 1,
                               child: InkWell(
                                 onTap: (){

                                 },
                                 child: Icon(
                                   Icons.camera_alt_outlined,size: 25,
                                   color: Colors.teal,
                                 ),
                               )),
                         ],),
                       ),
                       SizedBox(width: 30.0,),
                       Column(
                         children: [
                           SizedBox(height: 70,),
                           Padding(
                             padding: const EdgeInsets.only(right: 85),
                             child: Text("Name",style: TextStyle(fontSize: 18,fontFamily: 'Sen')),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(right: 85),
                             child: Text("email",style: TextStyle(fontSize: 16,fontFamily: 'Sen',color: Color(0xFF7C7C7C))),
                           ),
                         ],
                       ),

                     ],
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Divider(),
                   Expanded(
                     child: ListView(
                       children: [
                         Row(
                           children: [
                             SizedBox(
                               width: 20.0,
                             ),
                             Icon(Icons.shopping_cart_outlined,color: Colors.orange,),
                             SizedBox(
                               width: 20.0,
                             ),
                             Text(
                               "Orders",
                               style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.w400,
                                   fontFamily: 'Sen'),
                             ),
                             SizedBox(
                               width: 200.0,
                             ),
                             IconButton(
                                 onPressed: () {

                                 },
                                 icon: Icon(Icons.arrow_forward_ios_rounded)),
                           ],
                         ),
                         Divider(),
                         Row(
                           children: [
                             SizedBox(
                               width: 20.0,
                             ),
                             Icon(Icons.content_paste_search_sharp,color: Colors.orange),
                             SizedBox(
                               width: 20.0,
                             ),
                             Text(
                               "My Details",
                               style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.w400,
                                   fontFamily: 'Sen'),
                             ),
                             SizedBox(
                               width: 170.0,
                             ),
                             IconButton(
                                 onPressed: () {},
                                 icon: Icon(Icons.arrow_forward_ios_rounded)),
                           ],
                         ),
                         Divider(),
                         Row(
                           children: [
                             SizedBox(
                               width: 20.0,
                             ),
                             Icon(Icons.location_on,color: Colors.orange),
                             SizedBox(
                               width: 20.0,
                             ),
                             Text(
                               "Delievery Address",
                               style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.w400,
                                   fontFamily: 'Sen'),
                             ),
                             SizedBox(
                               width: 105.0,
                             ),
                             IconButton(
                                 onPressed: () {},
                                 icon: Icon(Icons.arrow_forward_ios_rounded)),
                           ],
                         ),
                         Divider(),
                         Row(
                           children: [
                             SizedBox(
                               width: 20.0,
                             ),
                             Icon(Icons.sunny,color: Colors.orange),
                             SizedBox(
                               width: 20.0,
                             ),
                             Text(
                               "Theme",
                               style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.w400,
                                   fontFamily: 'Sen'),
                             ),
                             SizedBox(
                               width: 200.0,
                             ),
                             Checkbox(
                               activeColor: Colors.orange,
                               value: this.value,
                               onChanged: (bool? value) {
                                 setState(() {
                                   this.value = value!;
                                 });
                               },),
                           ],
                         ),
                         Divider(),
                         Row(
                           children: [
                             SizedBox(
                               width: 20.0,
                             ),
                             Icon(Icons.language,color: Colors.orange),
                             SizedBox(
                               width: 20.0,
                             ),
                             Text(
                               "Language",
                               style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.w400,
                                   fontFamily: 'Sen'),
                             ),
                             SizedBox(
                               width: 170.0,
                             ),
                             IconButton(
                                 onPressed: () {},
                                 icon: Icon(Icons.arrow_forward_ios_rounded)),
                           ],
                         ),
                         Divider(),
                         Row(
                           children: [
                             SizedBox(
                               width: 20.0,
                             ),
                             Icon(Icons.people_alt_outlined,color: Colors.orange),
                             SizedBox(
                               width: 20.0,
                             ),
                             Text(
                               "Contact Us",
                               style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.w400,
                                   fontFamily: 'Sen'),
                             ),
                             SizedBox(
                               width: 160.0,
                             ),
                             IconButton(
                                 onPressed: () {},
                                 icon: Icon(Icons.arrow_forward_ios_rounded)),
                           ],
                         ),
                         Divider(),
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                     child:  Row(
                         children: [
                           SizedBox(
                             width: 15,
                           ),
                           SizedBox(
                             width: 114,
                           ),
                           Text(
                             "Log Out",
                             style: TextStyle(
                                 color: Colors.orange,
                                 fontSize: 18,
                                 fontWeight: FontWeight.w700,
                                 fontFamily: 'Sen')),
                         ])),
                 ],
               ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        curve: Curves.easeIn,
        showElevation: true,
        selectedIndex: currentState,
        onItemSelected:(index){
          setState(() {
            currentState = index;
          });
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(icon: Icon(Icons.home),
              title: Text('Home'),
              inactiveColor: Colors.grey,
              activeColor: Colors.orange,
              textAlign: TextAlign.center
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favourite'),
              inactiveColor: Colors.grey,
              activeColor: Colors.orange,
              textAlign: TextAlign.center
          ),
          BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.cartShopping),
              title: Text('Cart'),
              inactiveColor: Colors.grey,
              activeColor: Colors.orange,
              textAlign: TextAlign.center
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              inactiveColor: Colors.grey,
              activeColor: Colors.orange,
              textAlign: TextAlign.center
          ),
        ],
      ),
    );
  }
}
