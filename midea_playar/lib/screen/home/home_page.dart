import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:midea_playar/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider homeProviderR;
  late HomeProvider homeProviderW;
  @override
  Widget build(BuildContext context) {
    homeProviderR = context.read<HomeProvider>();
    homeProviderW = context.watch<HomeProvider>();
    List<Model> map = [
      Model(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeJY9XaKb5r2mH0jT6j6Bx5BkK9TbV2pXwUQ&usqp=CAU",
        Path:
            "https://pagalfree.com/musics/128-Aayi Nai - Stree 2 128 Kbps.mp3",
        title: "Paras",
      ),
    ];

    List<Audio> song = [
      Audio.network(
          "https://pagalfree.com/musics/128-Aayi Nai - Stree 2 128 Kbps.mp3"),
      Audio.network(
          "https://pagalfree.com/musics/128-Bhool Bhulaiyaa 3 - Title Track (Feat. Pitbull) - Bhool Bhulaiyaa 3 128 Kbps.mp3"),
      Audio.network(
          "https://pagalfree.com/download/320-Mere Mehboob Mere Sanam - Bad Newz 320 Kbps.mp3"),
      Audio.network(
        "https://pagalfree.com/musics/128-Maar Udi - Sarfira 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Angaaron - Pushpa 2 The Rule 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/download/320-Tauba Tauba - Bad Newz 320 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Halki Halki Si - Asees Kaur 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Satyanaas - Chandu Champion 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Zaalim - Badshah 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Aaj Ki Raat - Stree 2 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Khaali Botal - Manan Bhardwaj 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Pushpa Pushpa - Pushpa 2 The Rule 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Main Yaad Aaunga - Stebin Ben 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Ghagra - Crew 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Team India Hain Hum - Maidaan 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Tilasmi Bahein - Heeramandi 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Khudaya - Sarfira 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Hauli Hauli - Khel Khel Mein 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Galti - Vishal Mishra 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Singham Again Title Track - Singham Again 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Agar Ho Tum - Mr. And Mrs. Mahi 128 Kbps.mp3",
      ),
      Audio.network(
        "https://pagalfree.com/musics/128-Sukriya - Saaj Bhatt 128 Kbps.mp3",
      ),
    ];
    return Scaffold(
      backgroundColor: const Color(0xff2C3C42),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/b_image/1b.jpeg"),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "MUSIC",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 38,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 38,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 38,
                      )),
                ],
              ),
              Slider(
                value: homeProviderR.rangeSlider.toDouble(),
                max: 1,
                onChanged: (value) {
                  homeProviderW.setRangeSlider(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Model {
  String? Path, image, title;
  Model({this.image, this.Path, this.title});
}
