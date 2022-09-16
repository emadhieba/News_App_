
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:datae_base/models/webview/web_view.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

Widget buildArticleItem(article,context)=>InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(



    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0,),

            image:  DecorationImage(

              image: NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        const SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              crossAxisAlignment:CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children:  [



                Expanded(

                  child: Text('${article['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 4,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text(

                  '${article['publishedAt']}',

                  style: TextStyle(

                    color: Colors.grey,

                  ),),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);
Widget myDivider() =>  const Padding(
  padding: EdgeInsets.only(
    top: 15.0,
  ), );
Widget articleBuilder(list,context, {isSearch = false})=> ConditionalBuilder(
  condition:  list.isNotEmpty,
  builder:(context)=>ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index) => buildArticleItem(list[index],context),
    separatorBuilder: (context,index) =>myDivider(),
    itemCount: 10,),
  fallback:(context)=> isSearch ? Container() : Center(child: CircularProgressIndicator()) ,
);
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
    Function? onSubmitt,
    Function? onChange,
  required String? label,
   bool isPassword = false,
   Function? validate,
   IconData? suffix,
  required IconData prefix ,
  Function? suffixPressed,
}) => TextFormField(
     controller:controller ,
     keyboardType: type ,
     onFieldSubmitted: (s){
       onSubmitt!(s);
     } ,
onChanged: (s){
  onChange!(s);
} ,
obscureText:  isPassword,
validator: (s){
  validate!(s);
},
decoration: InputDecoration(
labelText: label ,
prefix: Icon(
prefix,
),
border: OutlineInputBorder(),
suffixIcon: suffix != null ? IconButton(
  onPressed: (){
    suffixPressed!();
  } ,
  icon:   Icon(
  
  suffix ,
  
  ),
) : null,
),

    );
void navigateTo(context,widget) => Navigator.push(
context,
MaterialPageRoute(
builder: (context) => widget,
),
);
