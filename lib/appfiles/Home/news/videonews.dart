// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Const.dart';
import 'package:final_project/appfiles/Home/news/nesmap.dart';
import 'package:final_project/customSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';

import '../../../customWidget/customAppBar.dart';

class VideoNews extends StatefulWidget {
  const VideoNews({
    Key? key,
  }) : super(key: key);

  @override
  State<VideoNews> createState() => _VideoNewsState();
}

class _VideoNewsState extends State<VideoNews> {
  final videsonews = <Map<String, dynamic>>[];
  bool _videoArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int __isPlayingIndex = -1;
  VideoPlayerController? _controller;
  bool isLoading = true;
  int _onupdateControllerTime = 0;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;
  _initData() async {
    final news = await FirebaseFirestore.instance.collection('news').get();
    videsonews.addAll(news.docs.map((e) => e.get('video')..['id'] = e.id));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  List pageBody = [
    'Endurance videos',
    'Search',
    'Today videos',
    'videos',
    'This our newest video we will notify you when is a new video is upload',
    'You have watched all videos for today you can watch out previous videos by choosing the date',
    'Loading..',
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: pageBody[0],
        isLeading: false,
      ),
      body: SafeArea(
        child: Container(
          decoration: _videoArea == false
              ? BoxDecoration(color: backgroundColor)
              : BoxDecoration(color: Colors.grey.withOpacity(0.6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _videoArea == false
                  ? Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      width: width,
                      margin: EdgeInsets.only(bottom: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Container()),
                              InkWell(
                                onTap: () async {
                                  var pickedDate_ = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2022),
                                      lastDate: DateTime(2055));
                                },
                                child: Icon(
                                  Icons.calendar_month,
                                  size: 14.sp,
                                  color: iconColor,
                                ),
                              ),
                            ],
                          ),
                          Gap(15),
                          Container(
                            width: width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: iconColor,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: white,
                                  size: 15.sp,
                                ),
                                Padding(padding: EdgeInsets.only(left: 5.sp)),
                                Text(pageBody[1],
                                    style: textSlestyle(context, white, 15.sp,
                                        FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        _playView(context),
                        _controlView(context),
                      ],
                    ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        iconColor,
                        Colors.grey.withOpacity(0.9),
                      ]),
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      Gap(20),
                      Row(children: [
                        Text(pageBody[2], style: mystyle15WB),
                        Spacer(),
                        Row(children: [
                          Icon(
                            Icons.video_call,
                            size: 17,
                            color: white,
                          ),
                          SizedBox(width: 4),
                          Text('${newsList.length}  ${pageBody[3]}',
                              style: textSlestyle(
                                  context, white, 14.sp, FontWeight.normal)),
                        ]),
                        SizedBox(width: 10)
                      ]),
                      Expanded(child: _view())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String convertTow(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  _controlView(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remind = max(0, duration - head);
    final mins = convertTow(remind ~/ 60.0);
    final secs = convertTow(remind % 60);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: iconColor,
            inactiveTrackColor: white,
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 2.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            thumbColor: iconColor,
            overlayColor: iconColor.withAlpha(32),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: iconColor,
            inactiveTickMarkColor: backgroundColor,
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: TextStyle(color: white),
          ),
          child: Slider(
            value: max(0, min(_progress * 100, 100)),
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split(".")[0],
            onChanged: (value) {
              setState(() {
                _progress = value * 0.01;
              });
            },
            onChangeStart: (value) {
              _controller?.pause();
            },
            onChangeEnd: (value) {
              final duration = _controller?.value.duration;
              if (duration != null) {
                {
                  var newValue = max(0, min(value, 99)) * 0.01;
                  var millis = (duration.inMilliseconds * newValue).toInt();
                  _controller?.seekTo(Duration(milliseconds: millis));
                  _controller?.play();
                }
              }
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: backgroundColor,
          margin: const EdgeInsets.only(
            bottom: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (noMute) {
                    _controller?.setVolume(0);
                  } else {
                    _controller?.setVolume(1.0);
                  }
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Icon(
                    noMute ? Icons.volume_up : Icons.volume_off,
                    color: iconColor,
                  ),
                ),
              ),
              Gap(10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    foregroundColor: textColor,
                    backgroundColor: white),
                onPressed: () async {
                  final index = __isPlayingIndex - 1;
                  if (index >= 0) {
                    _initializeVideo(index);
                  } else {
                    CustomSanckbar(pageBody[4], title: pageBody[5]);
                  }
                },
                child: Icon(
                  Icons.fast_rewind,
                  size: 20,
                  color: iconColor,
                ),
              ),
              Gap(15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    foregroundColor: textColor,
                    backgroundColor: white),
                onPressed: () async {
                  if (_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _controller?.pause();
                  } else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _controller?.play();
                  }
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 20,
                  color: iconColor,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    foregroundColor: textColor,
                    backgroundColor: Colors.white),
                onPressed: () async {
                  final index = __isPlayingIndex + 1;
                  if (index <= videsonews.length - 1) {
                    _initializeVideo(index);
                  } else {
                    CustomSanckbar(pageBody[5], title: "");
                  }
                },
                child: Icon(
                  Icons.fast_forward,
                  size: 20,
                  color: iconColor,
                ),
              ),
              SizedBox(width: 20),
              Text(
                "$mins:$secs",
                style: TextStyle(
                  color: textColor,
                  fontSize: 12.sp,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0, 0.1),
                      blurRadius: 3.0,
                      color: white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _view() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      itemCount: videsonews.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _initializeVideo(index);
            setState(() {
              if (_videoArea == false) {
                _videoArea = true;
              }
            });
          },
          child: _card(index),
        );
      },
    );
  }

  _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(pageBody[6],
              style: textSlestyle(context, textColor, 13.sp, FontWeight.bold)),
        ),
      );
    }
  }

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onupdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onupdateControllerTime > now) {
      return;
    }
    _onupdateControllerTime = now + 500;
    //
    final controller = _controller;
    if (controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("controller can't be initialized");
      return;
    }
    _duration ??= _controller?.value.duration;
    var duration = _duration;
    if (duration == null) return;
    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;
    if (playing) {
      if (_disposed) return;
      setState(() {
        //60 30 // 45/60= 0.75(0,1)
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  _initializeVideo(int index) {
    final controller = VideoPlayerController.network(videsonews[index]["url"]);
    final old = _controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    _controller = controller;
    controller.initialize().then((_) {
      old?.dispose();
      __isPlayingIndex = index;
      controller.addListener(_onControllerUpdate);
      controller.play();
      setState(() {});
    });
  }

  _card(int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              videsonews[index]["thumbnail"]),
                          fit: BoxFit.cover))),
              Gap(15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(videsonews[index]["title"] ?? pageBody[6],
                          style: mystyle15WB)),
                  Padding(
                    padding: const EdgeInsets.only(top: 7, right: 130),
                    child: Text(videsonews[index]["Time"],
                        style: textSlestyle(
                            context, white, 12.sp, FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
          Gap(15),
          Row(
            children: [
              for (int i = 0; i < 100; i++)
                i.isEven
                    ? Container(
                        width: 3.w,
                        height: 1.h,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )
                    : Container(
                        width: 3.w,
                        height: 1.h,
                        color: white,
                      ),
            ],
          ),
        ],
      ),
    );
  }
}
