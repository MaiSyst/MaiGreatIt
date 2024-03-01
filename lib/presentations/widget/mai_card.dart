import 'package:flutter/material.dart';

class MaiCard extends StatelessWidget {
  final double width;
  final double height;
  final bool isBanner;
  final String image;
  final String title;
  final String description;
  const MaiCard({
    super.key,
    this.width=200,
    this.height=150,
    this.isBanner=true,
    required this.image,
    required this.title,
    this.description=""
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children:[
            Container(
            width: width,
            height: height,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(10),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.deepOrangeAccent.withAlpha(50))
            ),),
            Positioned(
            left: 5,
            right: 5,
            top: 5,
            child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/images/$image",fit: BoxFit.cover,height: 95,)),
            ),
            Positioned(
              left: 5,
              right: 5,
                bottom: 5,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                   description.isNotEmpty?Row(
                      children: [
                        Text(description,style: const TextStyle(
                            color: Colors.deepOrangeAccent,fontWeight: FontWeight.w700),),
                        const Icon(Icons.arrow_forward_rounded,size: 15,
                          color: Colors.deepOrangeAccent,)
                      ],
                    ):const SizedBox()
                  ],
                )
            ),
          ]
        ),
      ),
    );
  }
}
