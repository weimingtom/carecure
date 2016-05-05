# Introduction #



一个方便做程式码简体/繁体转换的工具，特别是因为Delphi 6以后把DFM内中文字存Unicode内码，所以一般的简繁转换工具无法支援!!
\r\n
\r\n必须搭配网友老胡所提供的COM元件，一起使用：
\r\nhttp://sc.hokoy.com/Works/Program/HokoyWordKit.aspx
\r\n
\r\n还有为了有些DFM可能不是存成纯文字档，所以在搭配Borland公司所提供的Delphi Form Conversion Utility(convert.exe,再Delphi安装目录下的BIN有)，在执行过程如果发现该DFM不是存为文字档便会自动叫用convert.exe先将他转为纯

# Delphi convert.exe使用方法例子 #
如是是在Delphi 7 IDE里面，可以直接按F12出窗体列表，选择窗体的保存方式为txt或bin。
如果没装D 7，那么可以通过使用convert.exe
```
D:\>cd progra~1
D:\PROGRA~1>dir/w
D:\PROGRA~1>cd delphi7lite
D:\PROGRA~1\Delphi7Lite>cd bin
D:\PROGRA~1\Delphi7Lite\Bin>convert
Delphi Form Conversion Utility Version 7.0
Copyright (c) 1995,2002 Borland Software Corporation
Usage: convert.exe [-i] [-s] [-t | -b] <filespec(s) | @filelist>
  -i  Convert files in-place (output overwrites input)
  -s  Recurse subdirectories
  -t  Convert to text
  -b  Convert to binary

D:\PROGRA~1\Delphi7Lite\Bin>convert -t f:\eagle\careproject\trunk\*.dfm
Delphi Form Conversion Utility Version 7.0
Copyright (c) 1995,2002 Borland Software Corporation
f:\eagle\careproject\trunk\untAnaBizMonth.dfm => f:\eagle\careproject\trunk\untA
naBizMonth.txt (text)
......
63 files processed in f:\eagle\careproject\trunk\*.dfm

D:\PROGRA~1\Delphi7Lite\Bin>convert -t f:\eagle\careproject\trunk\*.dfm
```

# Details #

  * [|Delphi 7 窗体中文乱码问题|](http://www.cnblogs.com/amonw/archive/2009/11/04/1595659.html)
  * [|delphi7的dfm里中文显示成乱码的解决办法|](http://jim19770812.blogspot.com/2009/03/delphi7-dfm.html)
  * [|Delphi乱码一例解决|](http://liaoxuewei1980.spaces.live.com/blog/cns!C8D670F8C5F22B6B!181.entry)

  * [Delphi程式码简体繁体转换Jason Replace v1.1](http://www.winu.cn/thread-24885-1-1.html)
  * [|世纪飞翔Delphi工程简繁互换工具|](http://www.2ccc.com/article.asp?articleid=1789)
  * [|DFM 2 TXT|](http://www.winu.cn/bbs/viewthread.php?tid=7447)将 DFM 转换成为文字档的范例程序
  * [|Delphi Form Converter 1.12 |](http://www.brothersoft.com/delphi-form-converter-download-48912.html)
  * [|How to convert Delphi forms from binary to text and vice versa|](http://www.delphidabbler.com/tips/66)
  * [|如何精简Delphi|](http://www.cnitblog.com/sca/archive/2006/06/16/12355.html)


  * [|Unicode编码查询 - 在线查询字符的Unicode编码|](http://www.nengcha.com/code/unicode/)
  * [.md](.md)
  * [.md](.md)