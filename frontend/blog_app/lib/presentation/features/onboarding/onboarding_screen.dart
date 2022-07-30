import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blog_app/presentation/features/onboarding/onboarding.dart';
import 'package:blog_app/presentation/features/sign_in/sign_in.dart';
import 'package:blog_app/presentation/resources/app_colors.dart';
import 'package:blog_app/presentation/widgets/slide_fade_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  itemCount: 3,
                  scrollBehavior: MaterialScrollBehavior(),
                  itemBuilder: (context, index) {
                    return PageWidget(index:index);
                  }),
            ),
            Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 20.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: SmoothPageIndicator(
                          controller: _imageController,
                          count: 3,
                          axisDirection: Axis.horizontal,
                          effect: SlideEffect(
                              spacing: 8.0,
                              radius: 10.0,
                              dotWidth: 10.0,
                              dotHeight: 10.0,
                              paintStyle: PaintingStyle.stroke,
                              strokeWidth: 1.5,
                              dotColor: Colors.grey,
                              activeDotColor: AppColors.primaryColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:12.0),
                      child: OnboardingButton(
                        function: _animateSlider,
                        lastIndex:(nextPage-1)>=2
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


class PageWidget extends StatefulWidget {
  final int index;
  const PageWidget({Key? key,required this.index}) : super(key: key);

  @override
  _PageWidgetState createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> with AutomaticKeepAliveClientMixin{

  List<String> svgList=[
    "mobile_life.svg",
    "online_reading.svg",
    "blog_post.svg"
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            height: 450.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SvgPicture.asset("assets/${svgList[widget.index]}"),
        ),
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
                      "We do the hard part ${widget.index}",
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
  }

  @override
  bool get wantKeepAlive => true;
}




class OnboardingButton extends StatefulWidget {
  Function function;
  bool lastIndex;
  OnboardingButton({Key? key,required this.function,required this.lastIndex}) : super(key: key);

  @override
  _OnboardingButtonState createState() => _OnboardingButtonState();
}

class _OnboardingButtonState extends State<OnboardingButton> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;


  bool end=false;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addListener(() {
      setState(() {

      });
    });
    toggleEndButton();
    // <-- Set your duration here.
  }


  void toggleEndButton(){
    end=widget.lastIndex;
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    print("Onboarding button called");
    return Stack(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        !widget.lastIndex?Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            child: Text("Skip",style: Theme.of(context).textTheme.button?.copyWith(
                color: AppColors.greyColor,
                fontSize: 18.0
            ),
            ),
            onPressed: (){

            },
          ),
        ):SizedBox(),
        AnimatedAlign(
          duration: Duration(milliseconds: 300),
          alignment: widget.lastIndex?Alignment.centerLeft:Alignment.centerRight,
          child: InkWell(
            onTap: (){
              if(widget.lastIndex){
                Navigator.pushReplacementNamed(context, SignInScreen.routeName);
              }
              else{
                widget.function();
              }
            },
            child: AnimatedContainer(
              height:widget.lastIndex?40.0:60.0,
              width: widget.lastIndex?140:60.0,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(30.0))
              ),
              duration: Duration(
                milliseconds: 200
              ),
              child: Center(
                child: widget.lastIndex?Text("Get Started",style: Theme.of(context).textTheme.button?.copyWith(
                  color: Colors.white
                ),):Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}



