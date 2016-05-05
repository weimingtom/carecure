# Introduction #

VCLSkin  http://www.link-rank.com/


# Details #

安装:
1，解压缩 Vclskin2.zip 到任意目录
2，在 Delphi IDE 环境中选择菜单 "File. Open...", 然后找到连接库 vclskind7.dpk, 按着点击Compile按钮。
3，在 Environment 添加VCLSkin控件所在的路径。

http://blog.csdn.net/weide001/archive/2009/04/22/4100975.aspx|VCL skin 使用教程--Delphi 7|


Delphi VCLSkin 界面美化 http://www.cnblogs.com/chenbg2001/archive/2009/08/10/1543181.html

http://www.2ccc.com/article.asp?articleid=5429|VclSkin V5.4 for D7-D2010 FullSource|

开个贴，专门讨论VclSkin控件，用过的人都进来看看  http://topic.csdn.net/t/20051121/09/4406708.html#

今天调试代码，提高动态赋值的DBGrid窗体的显示速度，发现了一个被遗忘的过程，这个过程非常有用，特别是创建比较复杂的DBGrid的时候。
```
      DBGrid.Columns.BeginUpdate;   
      try   
          //DBGrid.Columns的创建、以及各种属性的赋值等   
      finally   
          DBGrid.Columns.EndUpdate;   
      end;   
```
> 加入这段代码后，动态赋值从原本的2.5s左右提高到现在的0.4s   ，代码简单但非常实用。
> Treeview、TDataSet等控件都有类似的过程，以前没想到DBGrid.Columns也有这种过程。


再贴一个代码简单但实用的一个过程：用于显示执行一段代码所需的时间，但时间精度不高。
```
  var   
      BeginTime:   TDateTime;   
    
  Procedure   ShowProcTime(bShow:   Boolean;   sCaption:String='');   
  begin   
      if   bShow   then   
          Showmessage(sCaption+'['+FormatFloat('0.000',(Time-BeginTime)*24*3600)+']');           
      BeginTime:=Time;   
  end;   
    
  用法：   
      ShowProcTime(False);   
      DBGrid.Columns.BeginUpdate;   
      try   
          //DBGrid.Columns的创建、以及各种属性的赋值等   
      finally   
          DBGrid.Columns.EndUpdate;   
      end;   
      ShowProcTime(True,'DBGrid');   
      //...另外的过程   
      ShowProcTime(True,'...');  
```

### 参见 ###

  * [|delphi开发日志——换肤，给程序穿上美丽的外衣|](http://www.cnblogs.com/edrp/archive/2007/12/08/987776.html)

  * [|VclSkin使用教程|](http://blog.csdn.net/iiprogram/archive/2007/08/06/1728767.aspx)

  * [|delphi vclskin实现动态换肤|](http://hi.baidu.com/hjylinyi/blog/item/6eb829f74f89b827730eec18.html)
  * [|全局界面控件VCLSkin使用手记及发现的一些问题|](http://www.delphibbs.com/delphibbs/dispq.asp?lid=2478512)
  * [|vclskin突然变慢了该怎么办？|](http://topic.csdn.net/u/20090711/20/21e3e68f-b7d7-4f71-bcb9-2ada24aeba25.html)
  * [|Delphi的高手请进，请教一个关于窗体创建的问题！|](http://zhidao.baidu.com/question/61246668.html)
  * [.md](.md)
  * [.md](.md)