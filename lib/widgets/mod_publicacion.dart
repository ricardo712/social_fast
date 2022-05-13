import 'package:flutter/material.dart';
import 'package:social_fast/models/post.model.dart';
import 'package:social_fast/models/pub_model.dart';
import 'package:social_fast/services/uploadImage.dart';
import 'package:social_fast/utils/responsive.dart';
import 'package:social_fast/views/publica.dart';

class modPublicacion extends StatelessWidget {
  PubModel pubModel = PubModel();
  modPublicacion({Key? key, required this.pubModel})
      : assert(pubModel != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive resposive = Responsive(context);
    UploadImage post = UploadImage();
    final userName = pubModel.uName;
    final fecha = pubModel.fecha;
    final menPub = pubModel.mensaje;
    final size = MediaQuery.of(context).size;
    final dias;
    final mes;
    final ano;

    return Expanded(
      child: StreamBuilder<List<PostModel>>(
        stream: post.getPosts(),
        builder: (context, state) {
          if (state.hasData) {
            return ListView.builder(
              itemCount: state.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  //color: Colors.deepPurpleAccent,
                  padding: EdgeInsets.all(resposive.dp(2)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(43, 0, 0, 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        resposive.dp(1),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          CircleAvatar(
                            radius: resposive.dp(4),
                            backgroundImage: AssetImage('assets/images/a.jpg'),
                          ),
                          SizedBox(
                            width: resposive.wp(2),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    state.data![index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: resposive.dp(3),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    state.data![index].date.toString(),
                                    //fecha!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: resposive.dp(1.5),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Icon(Icons.public),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      //?Parte de la Imagen ↓
                      SizedBox(
                        height: resposive.hp(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            state.data![index].content,
                            style: TextStyle(fontSize: resposive.dp(1.9)),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: resposive.hp(1),
                      ),

                      state.data![index].image != ""
                          ? SizedBox(
                              width: double.infinity,
                              height: 200,
                              child: Image(
                                image: NetworkImage(state.data![index].image),
                                fit: BoxFit.cover,
                              ))
                          : Container(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const publicacionPerfil())),
                              icon: const Icon(
                                Icons.comment,
                                color: Colors.white,
                              )),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
