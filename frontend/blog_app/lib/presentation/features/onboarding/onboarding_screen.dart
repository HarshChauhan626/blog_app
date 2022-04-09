import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/widgets/slide_fade_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static const String routeName = '/onboarding';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => OnboardingScreen(),
    );
  }

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _imageController = PageController();
  final PageController _textController=PageController();

  int nextPage=0;

  final List<Widget> _list = [
    SliderBox(
        child: FlutterLogo(
      textColor: Colors.red,
    )),
    SliderBox(
        child: FlutterLogo(
      textColor: Colors.green,
    )),
    SliderBox(
        child: FlutterLogo(
      textColor: Colors.blue,
    ))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => _animateSlider());
  }

  void _animateSlider() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      if (nextPage <3) {
        // nextPage = 0;
        print(nextPage);

        _textController
            .animateToPage(nextPage,
            duration: Duration(seconds: 1), curve: Curves.linear);

        _imageController
            .animateToPage(nextPage,
            duration: Duration(seconds: 1), curve: Curves.linear)
            .then((_) => _animateSlider());

        setState(() {
          print(_imageController.page!.round());
          nextPage = _imageController.page!.round() + 1;
          print(nextPage);
        });

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _imageController,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            height: 450.0,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.red,
                            child: _list[0]),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,10.0,10.0,10.0),
                                child: SlideFadeTransition(
                                    child: Text(
                                      "We do the hard part $index",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,10.0,10.0,10.0),
                                child: SlideFadeTransition(
                                    child: Text(
                                      "Everybody wants to be famous, but nobody wants to do the work. I live by that. You grind hard so you can play hard. At the end of the day, you put all the work in, and eventually it’ll pay off. It could be in a year, it could be in 30 years. Eventually, your hard work will pay off.",
                                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                          color: Colors.grey[500]
                                      ),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ),
            Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22.0, vertical: 20.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: SmoothPageIndicator(
                          controller: _textController,
                          count: 3,
                          axisDirection: Axis.horizontal,
                          effect: SlideEffect(
                              spacing: 8.0,
                              radius: 15.0,
                              dotWidth: 15.0,
                              dotHeight: 15.0,
                              paintStyle: PaintingStyle.stroke,
                              strokeWidth: 1.5,
                              dotColor: Colors.grey,
                              activeDotColor: AppColors.primaryColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            child: Text("Skip",style: Theme.of(context).textTheme.button?.copyWith(
                              color: AppColors.greyColor,
                              fontSize: 18.0
                            ),
                            ),
                            onPressed: (){

                            },
                          ),
                          InkWell(
                            onTap: (){
                              _animateSlider();
                            },
                            child: Container(
                              height:60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(30.0))
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class SliderBox extends StatelessWidget {
  final Widget child;
  const SliderBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(10), child: child);
  }
}
