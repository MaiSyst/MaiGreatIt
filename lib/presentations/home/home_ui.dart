import 'package:flutter/cupertino.dart';
import 'package:mai_greatit/presentations/home/home_ui_state.dart';
import 'package:mai_greatit/presentations/widget/favorites_card.dart';
import 'package:mai_greatit/presentations/widget/mai_bottom_nav_bar.dart';
import 'package:mai_greatit/presentations/widget/mai_bottom_nav_item.dart';
import 'package:mai_greatit/presentations/widget/mai_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mai_greatit/presentations/widget/button_circle.dart';
import 'package:mai_greatit/presentations/widget/card_user_account.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late HomeUiState homeUiState;
  @override
  void initState() {
    homeUiState=HomeUiState();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
          icon: SvgPicture.asset("assets/images/profil.svg",width: 50,height: 50,),
        ),
        titleSpacing: -10,
        title: SizedBox(
          width: 160,
          child: TextButton(
              onPressed: () => {},
              child: Row(
                children: [
                  const Text("73990590",style: TextStyle(fontSize: 16),),
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                      "assets/images/chevron-down.svg",
                      width: 20,
                    height: 20,
                  )],
              )),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.person_2_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity,160),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Bonjour, Mariko ",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              const SizedBox(height: 20,),
              SizedBox(
                height: 100,
                child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeUiState.dataFeatures.length,
                itemBuilder: (BuildContext context,index)=>
                    ButtonCircle(
                        title: homeUiState.dataFeatures[index].title,
                        iconName: homeUiState.dataFeatures[index].iconName),
              ),
              )
            ],
          ),
        )
        )
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CardUserAccount(),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextButton(
                onPressed: (){},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Mes favoris",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 16),),
                    Row(
                      children: [
                        Text("Personnaliser",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),),
                        Icon(Icons.arrow_forward_rounded,size: 20,)
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: 120,
              width: double.infinity,
              child: GridView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: 120,
                    crossAxisSpacing: 10
                  ),

                children: const[
                  FavoritesCard(icon: "updateNiNA", title: "Mettre a jour NINA"),
                  FavoritesCard(icon: "forfaitInternet", title: "Forfait Internet"),
                  FavoritesCard(icon: "buycredit", title: "Acheter du credit"),
                  FavoritesCard(icon: "forfaitInternet", title: "Ne ta'a")
                ],
              ),
            ),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: SizedBox(
                width: double.infinity,
                child: Text("J'en profite",
                style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 16),),
              )
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context,index)=>const SizedBox(width: 20,),
                itemCount: homeUiState.dataPreference.length,
                itemBuilder: (BuildContext context,index)=>MaiCard(
                    image: homeUiState.dataPreference[index].image,
                  title: homeUiState.dataPreference[index].title,
                  description: homeUiState.dataPreference[index].desc,),
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
      bottomNavigationBar:MaiBottomNavBar(
        maiBottomNavItem:  <MaiBottomNavItem>[
    MaiBottomNavItem(
      icon: Icon(Icons.home_filled,color: homeUiState.currentIndexBottomNav==0?Colors.deepOrange:Colors.black,),
      title: "Accueil",
      currentIndex: 0,
      isSelected: homeUiState.currentIndexBottomNav==0,
      onPressed: (currentIndex)=>setState(()=>homeUiState.currentIndexBottomNav=currentIndex),
    ),
    MaiBottomNavItem(
        icon: SizedBox(
          height: 24,
          child: SvgPicture.asset(
            homeUiState.currentIndexBottomNav==1?
                "assets/images/orangeMoneyActive.svg":
          "assets/images/orangeMoneyBlack.svg"
            ,
          width: 15,
          height: 15,
        ),
        ),
        currentIndex: 1,
      isSelected: homeUiState.currentIndexBottomNav==1,
      onPressed: (currentIndex)=>setState(()=>homeUiState.currentIndexBottomNav=currentIndex),
        title: "Orange Money"),
    MaiBottomNavItem(
        icon: Icon(Icons.book_online,color: homeUiState.currentIndexBottomNav==2?Colors.deepOrange:Colors.black,), title: "Ma Ligne",currentIndex: 2,
      isSelected: homeUiState.currentIndexBottomNav==2,
      onPressed: (currentIndex)=>setState(()=>homeUiState.currentIndexBottomNav=currentIndex)),
    MaiBottomNavItem(
        icon: Icon(Icons.shopping_cart_rounded,color: homeUiState.currentIndexBottomNav==3?Colors.deepOrange:Colors.black,), title: "Sugu",currentIndex: 3,
      isSelected: homeUiState.currentIndexBottomNav==3,
      onPressed: (currentIndex)=>setState(()=>homeUiState.currentIndexBottomNav=currentIndex)),
    MaiBottomNavItem(
      icon: Icon(Icons.qr_code,color:homeUiState.currentIndexBottomNav==4?Colors.deepOrange:Colors.black ,),
      title: "Sarali",currentIndex: 4,
      isSelected: homeUiState.currentIndexBottomNav==4,
      onPressed: (currentIndex)=>setState(()=>homeUiState.currentIndexBottomNav=currentIndex),)
  ],
      )
    );
  }
}
