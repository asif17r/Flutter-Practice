import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(PictureStoryApp());
}

class PictureStoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Story Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoryLibraryScreen(),
    );
  }
}

class StoryLibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Library'),
      ),
      body: ListView.builder(
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the story viewer screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StoryViewerScreen(story: storyList[index]),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    storyList[index].coverImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    storyList[index].title,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class StoryViewerScreen extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();

  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  final Story story;
  StoryViewerScreen({Key? key, required this.story}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              story.coverImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                story.content,
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                speak(story.content);
              },
              child: Text('Read Aloud'),
            ),
          ],
        ),
      ),
    );
  }
}

class Story {
  final String title;
  final String coverImage;
  final String content;

  Story({required this.title, required this.coverImage, required this.content});
}

// Dummy data
List<Story> storyList = [
  Story(
    title: 'A very good boy',
    coverImage: 'assets/asif.jpg',
    content:
        'In the realm of Rajshahi University lived Asif, a brilliant and honest student known for his coding prowess. He formed an alliance with the mysterious programmer Orion, and their partnership flourished until Asif vanished without a trace.\n\nHis absence left a deep void, but Orion continued their coding journey in his honor. Rumors spread of Asif\'s pursuit of coding excellence in a mythical realm.\n\nThough he was physically gone, his legacy endured, inspiring generations with his story of friendship, dedication, and the pursuit of greatness',
  ),
  Story(
    title: 'The Brilliance of Sanjoy',
    coverImage: 'assets/sanjoy.jpg',
    content:
        'In the land of academic pursuits, there lived a brilliant young mind named Sanjoy. His excellence in Departmental studies was matched only by his prowess in coding and the art of persuasion. He possessed a unique charm that could convince even the most skeptical minds. However, amidst his achievements, there was a bittersweet chapter in his life.\n\nSanjoy\'s heart carried a deep affection for a girl from Chattogram. Her smile was like a distant star that guided him through his endeavors.\n\nOne day, a mythical tale began to circulate about an ancient artifact, said to grant immeasurable wisdom and power to those who dared to seek it. Determined to prove his love and brilliance, Sanjoy embarked on a perilous journey to find this artifact.\n\nHis path was fraught with challenges and sacrifices. The trials tested his wit, courage, and unwavering dedication. As he ventured deeper into the unknown, he discovered the artifact\'s hiding place atop a treacherous mountain.\n\nUpon reaching the summit, he found the artifact, radiating an ethereal glow. It bestowed upon him a profound revelation: the true power of love, brilliance, and selflessness.\n\nHowever, his triumph was bittersweet. The artifact could not bring the girl from Chattogram any closer to him. He realized that true greatness lay not only in personal achievements but in the impact one has on others.\n\nWith a heavy heart, Sanjoy descended the mountain, his journey forever etched in the annals of myth. His story inspired generations, reminding them that even in the pursuit of greatness, it\'s the connections we make and the lives we touch that truly define us.',
  ),

  Story(
    title: 'Love\'s Story: Fading Away',
    coverImage: 'assets/mukul.jpg',
    content:
        'In a calm village surrounded by hills, there lived Mukul, a strong warrior whom everyone respected. He fell in love with Sumaiya, a woman whose kindness melted his tough exterior.\n\nMukul was tough but soft in love. They seemed perfect together, but something sad happened. Mukul found out that Sumaiya, who had a boyfriend, wasn\'t honest. She told him to not talk to her again, and the village that used to feel safe became sad.\n\nThey talked and Sumaiya said sorry with tears. She explained she was scared. Their strong love now felt broken.\n\nMukul turned his pain into strength, inspiring the village. He showed them how to heal after heartbreak.\n\nSumaiya carried regret for what she did. Their story reminds us that love can sometimes fade away, even when it\'s really strong.',
  ),

  // Add more stories here
];
