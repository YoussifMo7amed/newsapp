import 'package:flutter/material.dart';

Widget buildArtecleItem(List<dynamic>? article) => Column(
  children: [
    const SizedBox(
      height: 40.0,
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.black,
      ),
    ),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: article != null
            ? ListView.builder(
                itemCount: article.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                             
                            ),
                            height: 175,
                            width: 180,
                            child: Image.network(
                              article[index]['urlToImage'],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 175,
                              width: 100,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      article[index]['title'],
                                      style: TextStyle(
                                          fontSize: 17.0, fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      article[index]['description'],
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15.0, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(), // or any other loading indicator
              ),
      ),
    ),
  ],
);
Widget dfaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        void Function(String)? onChange,
        void Function(String)? onsubmit,
        String? Function(String?)? validator,
        required String label,
        required IconData? prefix,
        bool ispassword = false,
        IconData? sufix,
        void Function()? ontap,
        void Function()? sufixFunction}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: ispassword,
      onChanged: onChange,
      onFieldSubmitted: onsubmit,
      validator: validator,
      onTap: ontap,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefix),
          suffixIcon: sufix != null
              ? IconButton(onPressed: sufixFunction, icon: Icon(sufix))
              : null,
          border: const OutlineInputBorder()),
    );

