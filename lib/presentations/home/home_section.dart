import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mai_greatit/data/models/data_mai_card.dart';
import 'package:mai_greatit/presentations/widget/card_user_account.dart';
import 'package:mai_greatit/presentations/widget/favorites_card.dart';
import 'package:mai_greatit/presentations/widget/mai_card.dart';

class HomeSection extends HookWidget {
  final List<DataMaiCard>dataPreference;
  const HomeSection({super.key,required this.dataPreference});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                itemCount: dataPreference.length,
                itemBuilder: (BuildContext context,index)=>MaiCard(
                    image: dataPreference[index].image,
                  title: dataPreference[index].title,
                  description: dataPreference[index].desc,),
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      );
  }
}
