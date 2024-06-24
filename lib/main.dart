import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> _faqs = [
    {
      'question': 'What is Frontend Mentor, and how will it help me?',
      'answer':
          'Frontend Mentor offers realistic coding challenges to help developers improve their frontend coding skills with projects in HTML, CSS, and JavaScript.\nIt\'s suitable for all levels and ideal for portfolio building.',
      'isExpanded': false,
    },
    {
      'question': 'Is Frontend Mentor free?',
      'answer': 'This is the answer to the second question.',
      'isExpanded': false,
    },
    {
      'question': 'Can I use Frontend Mentor projects in my portfolio?',
      'answer': 'This is the answer to the third question.',
      'isExpanded': false,
    },
    {
      'question': 'How can I get help if I\'m stuck on a challenge?',
      'answer': 'This is the answer to the fourth question.',
      'isExpanded': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 228, 236),
      body: Stack(
        children: [
          // Background Pattern (Replace with actual image)
          SizedBox(
            height: 210,
            child: SvgPicture.asset(
              'assets/images/background-pattern-mobile.svg', // Replace with your image path
              width: 1000000,
              alignment: Alignment.topCenter,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 25),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FAQ Title Section
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Image(
                              image: AssetImage('assets/images/icon-star.jpg'),
                              width: 25,
                              height: 25,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            'FAQs',
                            style: TextStyle(
                              color: Color.fromARGB(255, 60, 19, 66),
                              fontSize: 32.0,
                              //fontWeight: FontWeight.bold,
                              fontFamily: "WorkSans-Bold",
                            ),
                          ),
                          // To balance the space
                        ],
                      ),
                      const SizedBox(height: 20.0),

                      // FAQ Items
                      Expanded(
                        child: ListView.builder(
                          itemCount: _faqs.length,
                          itemBuilder: (context, index) {
                            return ExpansionTile(
                              tilePadding: const EdgeInsets.only(bottom: 20),
                              title: MouseRegion(
                                onEnter: (_) => _updateExpansion(index, true),
                                onExit: (_) => _updateExpansion(index, false),
                                child: Text(
                                  _faqs[index]['question'],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: "WorkSans-SemiBold",
                                    color: _faqs[index]['isHovered'] == true
                                        ? const Color(0xFFAD1FEA)
                                        : const Color.fromARGB(255, 60, 19, 66),
                                  ),
                                ),
                              ),
                              trailing: _faqs[index]['isExpanded']
                                  ? const Image(
                                      image: AssetImage(
                                          'assets/images/icon-minus.jpg'),
                                      width: 30,
                                      height: 30,
                                    )
                                  : const Image(
                                      image: AssetImage(
                                          'assets/images/icon-plus.jpg'),
                                      width: 30,
                                      height: 30,
                                    ),
                              onExpansionChanged: (bool expanded) {
                                setState(() {
                                  _faqs[index]['isExpanded'] = expanded;
                                });
                              },
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 10.0),
                                  child: Text(
                                    _faqs[index]['answer'],
                                    style: const TextStyle(
                                      fontFamily: "WorkSans-Regular",
                                      fontSize: 16.0,
                                      color: Color.fromARGB(255, 140, 102, 146),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateExpansion(int index, bool isHovered) {
    setState(() {
      _faqs[index]['isHovered'] = isHovered;
    });
  }
}
