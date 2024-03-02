import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mai_greatit/presentations/home/home_section.dart';
import 'package:mai_greatit/presentations/home/home_ui_state.dart';
import 'package:mai_greatit/presentations/widget/mai_bottom_nav_bar.dart';
import 'package:mai_greatit/presentations/widget/mai_bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mai_greatit/presentations/widget/button_circle.dart';
class Home extends HookWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final homeUiState=useState(HomeUiState());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final pageController=usePageController();
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
                  const Text("74560590",style: TextStyle(fontSize: 16),),
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
                itemCount: homeUiState.value.dataFeatures.length,
                itemBuilder: (BuildContext context,index)=>
                    ButtonCircle(
                        title: homeUiState.value.dataFeatures[index].title,
                        iconName: homeUiState.value.dataFeatures[index].iconName),
              ),
              )
            ],
          ),
        )
        )
      ),
      drawer: const Drawer(),
      body: PageView(
        controller: pageController,
        children: [
          HomeSection(dataPreference: homeUiState.value.dataPreference)
        ],
      ),
      bottomNavigationBar:MaiBottomNavBar(
        maiBottomNavItem:  <MaiBottomNavItem>[
              MaiBottomNavItem(
                icon: Icon(Icons.home_filled,color: homeUiState.value.currentIndexBottomNav==0?Colors.deepOrange:Colors.black,),
                title: "Accueil",
                currentIndex: 0,
                isSelected: homeUiState.value.currentIndexBottomNav==0,
                onPressed: (currentIndex)=>homeUiState.value.currentIndexBottomNav=currentIndex,
              ),
              MaiBottomNavItem(
                  icon: SizedBox(
                    height: 24,
                    child: SvgPicture.asset(
                      homeUiState.value.currentIndexBottomNav==1?
                          "assets/images/orangeMoneyActive.svg":
                    "assets/images/orangeMoneyBlack.svg"
                      ,
                    width: 15,
                    height: 15,
                  ),
                  ),
                  currentIndex: 1,
                isSelected: homeUiState.value.currentIndexBottomNav==1,
                onPressed: (currentIndex)=>homeUiState.value.currentIndexBottomNav=currentIndex,
                  title: "Orange Money"),
              MaiBottomNavItem(
                  icon: Icon(Icons.book_online,color: homeUiState.value.currentIndexBottomNav==2?Colors.deepOrange:Colors.black,), title: "Ma Ligne",currentIndex: 2,
                isSelected: homeUiState.value.currentIndexBottomNav==2,
                onPressed: (currentIndex)=>homeUiState.value.currentIndexBottomNav=currentIndex),
              MaiBottomNavItem(
                  icon: Icon(Icons.shopping_cart_rounded,color: homeUiState.value.currentIndexBottomNav==3?Colors.deepOrange:Colors.black,), title: "Sugu",currentIndex: 3,
                isSelected: homeUiState.value.currentIndexBottomNav==3,
                onPressed: (currentIndex)=>homeUiState.value.currentIndexBottomNav=currentIndex),
              MaiBottomNavItem(
              icon: Icon(Icons.qr_code,color:homeUiState.value.currentIndexBottomNav==4?Colors.deepOrange:Colors.black ,),
              title: "Sarali",currentIndex: 4,
              isSelected: homeUiState.value.currentIndexBottomNav==4,
              onPressed: (currentIndex)=>homeUiState.value.currentIndexBottomNav=currentIndex,)
        ],
      )
    );
  }
}
