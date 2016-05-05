# Introduction #

Delphi小经验小窍门



# Details #

  * [|Delphi程序设计的一般问题|](http://blog.csdn.net/yueyahe/archive/2006/04/20/670066.aspx)
  * [|很希望大家把自己做项目中的小技巧共享出来|](http://topic.csdn.net/u/20071126/11/55c5b4c0-adc4-40c1-9b43-1a5d10e20cf8.html)

  * [|Delphi程序员容易犯的错误，欢迎指正补充|](http://topic.csdn.net/t/20020522/19/744364.html)

  * [|不能再菜的问题：在Delphi中代码如何换行：）|](http://topic.csdn.net/t/20010302/17/77974.html):delphi中语句的结束是以分号;为标志,你可以随便换行写. 但字串比较特殊中间有'；'所以我用'+'搞定！
  * [|Delphi Packed Record和Record的区别|](http://blog.csdn.net/jiangnanandi/archive/2009/02/16/3895890.aspx)    [|关于Packed record和record的区别--Delphi的内存管理|](http://www.moon-soft.com/program/bbs/readelite123432.htm):Record的数据各个字节都是对齐的，数据格式比较完整，所以这种格式相对packed占用的内存比较大， 但是因为格式比较整齐，所以电脑读取这个类型的数据的时候速度比较快。 而Packed Record对数据进行了压缩，节省了内存空间，当然他的速度也变的慢了。不过，对于现在的操作系统来，packed Record 节省的那些空间已不用考虑他了。除了做DLL（不用packed容易造成内存混乱）和做硬件 编程时（比如串口）编程时必须用到packed Record，其它情况都可以用Record
  * [|区别nil,self,owner?|](http://topic.csdn.net/t/20021107/22/1158136.html)
  * [|我又有问题了，show,showmodal,有什么区别啊？？|](http://topic.csdn.net/t/20030719/08/2046511.html)
  * [|Delphi中三种延时方法及其定时精度分析|](http://www.delphifans.com/infoview/Article_437.html)    [|sleep函数的用法，大家帮我看看|](http://topic.csdn.net/t/20060704/16/4859975.html)
  * [|delphi中application.processmessages的作用|](http://www.cnblogs.com/raymond19840709/archive/2008/03/26/1122400.html)：如果你运行一个非常耗时的循环，那么在这个循环结束前，你的程序可能不会响应任何事件，你按按钮没有反应，程序设置无法绘制窗体，看上去就如同死了一样，这有时不是很方便，例如于终止循环的机会都没有了。这时你就可以在循环中加上这么一句，每次程序运行到这句时，程序就会让系统响应一下消息，从而使你有机会按按钮，窗体有机会绘制。
  * [|《悟透Delphi》第三章 WIN32的时空观|](https://forum.eviloctal.com/thread-8952-1-3.html)  [|如何在DELPHI工程中定义全局变量|](http://topic.csdn.net/u/20070802/11/c7e29d0c-e61f-419e-9d6d-72831fe7d019.html)  [|Delphi 下全局对象的使用|](http://23book.net/SoftwareDev/Delphi/54794.htm)  [|变量和过程、函数的作用域！！！用DELPHI半年了，这些还不明白！！！！！！！！|](http://topic.csdn.net/t/20020321/21/591919.html)  [|Object Pascal Variable Scope|](http://delphi.about.com/od/beginners/l/aa060899.htm)
  * [|Understanding Delphi Project Files (.DPR)|](http://delphi.about.com/od/beginners/a/delphi_dpr.htm)
  * [|在Delphi程序中调用控制面板设置功能|](http://www.delphifans.com/InfoView/Article_537.html)  http://www.7880.com/info/Article-47743c80.html|编程打开特殊的系统窗口(如控制面板)|
  * [|Delphi中使用Hint体验windows的温柔|](http://blog.csdn.net/SmallHand/archive/2008/12/22/3580217.aspx)
  * [|Delphi中如何用默认浏览器打开一个网址？|](http://zhidao.8844.com/792245.htm)
  * [|系統日期時間函數： CURRENT\_TIMESTAMP , {fn NOW()} , GETDATE()|](http://sharedderrick.blogspot.com/2008/02/currenttimestamp-fn-now-getdate.html)  [|怎么从sql server中取系统日期?|](http://topic.csdn.net/t/20030515/12/1787285.html)  [|小弟有個笨問題~~ "{fn NOW()}|](http://social.msdn.microsoft.com/forums/zh-TW/240/thread/e6fec02f-7c35-40ca-8009-cac9e1da4e0b/)
  * [|string TStrings pchar的相互转换|](http://www.codesky.net/article/doc/200308/2003080963295785.htm)
  * [|如何屏蔽双击放大窗体？？？？|](http://topic.csdn.net/t/20030425/15/1707659.html)
  * [| Delphi中如何判断Edit.text为合法的日期？|](http://topic.csdn.net/u/20090310/16/51de7aa2-ee03-428a-92d3-be19acd8ebd8.html)
  * [|关于复制form|](http://topic.csdn.net/t/20030529/15/1850877.html)  [|给个提示: 在DELPHI中如何复制FORM, 即在我的工程中, 把FORM!的一个复制加入工程中|](http://topic.csdn.net/t/20030724/16/2067636.html)  [|How to Clone a Delphi Form|](http://delphi.about.com/od/adptips2006/qt/formclone.htm)
  * [|delphi中自己写的过程是不是只有自己手工添加过程定义|](http://topic.csdn.net/t/20030327/12/1583380.html#)
  * [|软件启动画面中启动状态的显示|](http://www.haoxiai.net/bianchengyuyan/Delphi/14233.html)
  * [|WindowsForms菜单设计全攻略|](http://aspxboy.com/private/1770/default.aspx)
  * [|怎样给MDI主窗口加一个背景图|](http://topic.csdn.net/t/20000222/13/2615.html)
  * [|在Delphi中定位文件位置|](http://www.cnblogs.com/myamanda/articles/1610404.html)
  * [|Delphi快速入门（五）|](http://www.qilou.com/1/8/61354.html)
  * [|请教delphi中有关case语句的用法|](http://topic.csdn.net/t/20040325/14/2885384.html)  [|case的语法是怎么样？？|](http://topic.csdn.net/t/20021113/15/1173103.html)
  * [|如何把integer转成string?|](http://topic.csdn.net/t/20020129/09/505585.html)
  * [|如何将子窗体彻底关闭|](http://topic.csdn.net/t/20020125/07/497662.html)  [|能详细说一下action:=cafree这句吗?好多书都没说清楚!|](http://topic.csdn.net/t/20030503/19/1736012.html)
  * [|Making A Splash|](http://www.deltics.co.nz/blog/?p=295)  [|How to make a splash screen with a progress bar on Turbo Delphi?|](http://stackoverflow.com/questions/919220/how-to-make-a-splash-screen-with-a-progress-bar-on-turbo-delphi)
  * [|delphi代码标准文档 (下）|](http://hi.baidu.com/kinsonhe/blog/item/4b7ac00363bc9adc277fb5cf.html)
  * [|一名Delphi程序员的开发习惯|](http://blog.gkong.com/more.asp?id=96473&Name=mahuaqiang)
  * [|一个程序员的开发习惯（ZT）|](http://www.delphifans.com/infoview/Article_57.html)
  * [|浅谈Delphi开发经验[1](http://setup.exe.cn/article/html/6348.html)|]
  * [|请问MFM1992是什么文件，有什么用，可以删除吗?|](http://topic.csdn.net/t/20000110/20/473.html)
  * [|TListView用法详解|](http://hi.baidu.com/pwfС%CE%C0/blog/item/1a3293e7c2054027b83820d9.html)
  * [|如何把选择的文件图标显示在列表中|](http://win.chinaunix.net/bbs/thread-27069-1-6.html)   [|技巧：如何在ListItem显示相关文件图标|](http://www.002pc.com/master/College/Language/Delphi/12429.html)  [|用ListView制作导航界面|](http://hi.baidu.com/pwfС%CE%C0/blog/item/70016eec17690c2e63d09f07.html)  [ListView基本用法大全|](http://www.cnblogs.com/y232995558/archive/2009/04/10/1432812.html|Delphi)
  * [| Delphi的Hint入门指导|](http://blog.csdn.net/cyai/archive/2008/02/22/2113744.aspx)
  * [|DBLookupListBox和DBLookupComboBox|](http://delphi.ktop.com.tw/board.php?cid=30&fid=1498&tid=92297)
假如你有兩個table  master detail(一對多)
master 全戶資料(datasource1)
> > 戶號 <- keyfield
> > 戶長
> > 地址
> > 電話
> > :
detail 個人基本資料(datasource2)
> > 戶號  <- keyfield
> > 姓名
> > 統號
> > 生日
> > 電子郵件
> > :
> > :
你可以依此設定如下,
DataField :  戶號                  <- 欲關聯的主datafield
DataSource : datasource1 <- 欲關聯的主Datasource
KeyField :   戶號   <- 關聯鍵值
ListField :  姓名     <- 要顯示戶內人口
ListSource : datasource2  <- 要顯示的Datasoruce



  * [.md](.md)
  * [.md](.md)