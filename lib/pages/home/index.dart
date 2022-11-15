import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:all_univers/components/refresh/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 10;
  double _pixels = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //列表栏
      NotificationListener(
        onNotification: (ScrollNotification notification) {
          _pixels = notification.metrics.pixels;
          setState(() {});
          return true;
        },
        child: Container(
          color: Colors.white,
          child: EasyRefresh(
            header: const SquatsHeader(),
            footer: const SquatsFooter(),
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 4));
              if (!mounted) {
                return;
              }
              setState(() {
                _count = 10;
              });
            },
            onLoad: () async {
              await Future.delayed(const Duration(seconds: 4));
              if (!mounted) {
                return;
              }
              setState(() {
                _count += 5;
              });
            },
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ProgramRow();
              },
              itemCount: _count,
            ),
          ),
        ),
      ),
      //搜索栏
      Visibility(
        visible: true,
        child: Positioned(
          left: 0,
          top: 0,
          width: MediaQuery.of(context).size.width,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: _pixels > 30 ? 1 : 0,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 253, 251, 251),
                    offset: Offset(0.0, 1.0), //阴影xy轴偏移量
                    blurRadius: 1, //阴影模糊程度
                    spreadRadius: 1.0, //阴影扩散程度
                  )
                ],
              ),
              child: Stack(
                children: const [
                  Center(
                    child: Text(
                      "发现",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 10,
                    child: Icon(
                      Icons.search,
                      size: 35,
                      color: Color.fromRGBO(37, 180, 224, 1),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

class ProgramRow extends StatefulWidget {
  const ProgramRow({super.key});

  @override
  _ProgramRowState createState() => _ProgramRowState();
}

//单个节目组件
class _ProgramRowState extends State<ProgramRow> {
  //播放状态 播放 play   暂停 pause 加载中 loading
  String playerState = 'play';
  //播放器对象
  Map playerBtnImgObj = <String, String>{
    'play': 'lib/assets/images/player/player.webp',
    'pause': 'lib/assets/images/player/suspend.webp',
    'loading': 'lib/assets/images/player/player.webp',
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        children: [
          //标题和照片列
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //图片
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                    width: 70.w,
                    height: 70.w,
                    image: const NetworkImage(
                        'https://imagev2.xmcdn.com/group60/M01/7E/85/wKgLb1zndYnA2nSSAAyIvTdcEV0402.jpg!strip=1&quality=7&magick=webp&op_type=3&columns=290&rows=290')),
              ),
              //标题
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.centerLeft,
                width: 180.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '姐姐说',
                      style: TextStyle(
                        color: Color.fromRGBO(196, 196, 198, 1),
                      ),
                    ),
                    Text(
                      'Ep.66 官方站姐说熊猫：它就是靠懒活了八百万年',
                      style: TextStyle(
                        color: Color.fromRGBO(19, 18, 20, 1),
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              //播放按钮
              Container(
                margin: EdgeInsets.only(top: 20.w),
                child: GestureDetector(
                  child: Image(
                    width: 35.w,
                    height: 35.w,
                    image: AssetImage(playerBtnImgObj[playerState]),
                  ),
                  onTap: () => {
                    setState(() => {
                          if (playerState == 'play')
                            playerState = 'pause'
                          else if (playerState == 'pause')
                            playerState = 'play'
                          else
                            playerState = 'loading'
                        })
                  },
                ),
              ),
            ],
          ),
          //评论列
          Container(
            padding: EdgeInsets.all(10.w),
            margin: EdgeInsets.only(left: 90.w, top: 10),
            width: 250.w,
            height: 80.w,
            color: const Color.fromRGBO(250, 250, 250, 1),
            child: RichText(
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              text: const TextSpan(
                  style: TextStyle(
                    color: Color.fromRGBO(148, 148, 150, 1),
                  ),
                  children: [
                    TextSpan(
                      text: '卢本伟:',
                      style: TextStyle(
                        color: Color.fromRGBO(136, 136, 139, 1),
                      ),
                    ),
                    TextSpan(
                        text:
                            '混合开发使用第二种方式但你可以这样做通过设计稿混合开发使用第二种方式但你可以这样做通过设计稿的dp大小的dp大小'),
                  ]),
            ),
          ),
          //收听人列
          Container(
            margin: EdgeInsets.only(left: 90.w, top: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://th.bing.com/th/id/R.86a0fa17b9b37ff7518b552e2517a0ae?rik=CX0%2fMchuLIBQVA&riu=http%3a%2f%2fimg.crcz.com%2fallimg%2f201809%2f11%2f1536666825645562.jpg&ehk=g6IGr0cDabvrRd5KSQdbup2trGpltKDfA7Hx7eopcm0%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
                        fit: BoxFit.cover,
                        width: 20.w,
                        height: 20.w,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2.w),
                      child: ClipOval(
                        child: Image.network(
                          'https://th.bing.com/th/id/R.86a0fa17b9b37ff7518b552e2517a0ae?rik=CX0%2fMchuLIBQVA&riu=http%3a%2f%2fimg.crcz.com%2fallimg%2f201809%2f11%2f1536666825645562.jpg&ehk=g6IGr0cDabvrRd5KSQdbup2trGpltKDfA7Hx7eopcm0%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
                          fit: BoxFit.cover,
                          width: 20.w,
                          height: 20.w,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2.w),
                      child: ClipOval(
                        child: Image.network(
                          'https://th.bing.com/th/id/R.86a0fa17b9b37ff7518b552e2517a0ae?rik=CX0%2fMchuLIBQVA&riu=http%3a%2f%2fimg.crcz.com%2fallimg%2f201809%2f11%2f1536666825645562.jpg&ehk=g6IGr0cDabvrRd5KSQdbup2trGpltKDfA7Hx7eopcm0%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
                          fit: BoxFit.cover,
                          width: 20.w,
                          height: 20.w,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2.w),
                      child: Text(
                        '听过',
                        style: TextStyle(
                          fontSize: 11.w,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 3.w),
                      child: Icon(
                        Icons.headphones,
                        size: 15.w,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 13.w),
                      child: Text('7686'),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 3.w),
                      child: Icon(
                        Icons.comment_bank_rounded,
                        size: 15.w,
                      ),
                    ),
                    Text('81')
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
