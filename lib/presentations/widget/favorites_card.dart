import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritesCard extends StatelessWidget {
  final String title;
  final String icon;
  const FavoritesCard({super.key,required this.icon,required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
       onPressed: (){},
       style: ButtonStyle(
         elevation: const MaterialStatePropertyAll(0),
         backgroundColor: const MaterialStatePropertyAll(Colors.white),
         side: const MaterialStatePropertyAll(BorderSide(color: Colors.black12,width: 1)),
         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))) ,
         padding:const MaterialStatePropertyAll(EdgeInsets.zero)
       ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: SvgPicture.asset("assets/images/$icon.svg",width: 50,height: 50,),
            ),
            const SizedBox(height: 10,),
            Center(
              child: Text(title,textAlign: TextAlign.center,style: const TextStyle(
                  color: Colors.black,fontSize: 12),),
            )
          ],
        ),
      );
  }
}
