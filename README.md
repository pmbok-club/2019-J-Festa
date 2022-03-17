# Contents

<a href="#概要">概要</a><br>
<a href="#参考画像">参考画像</a><br>
<a href="https://github.com/pmbok-club/2019-J-Festa#Processingでプログラミングとデジタルアートを体験しよう">Processingでプログラミングとデジタルアートを体験しよう！</a><br>

<a href="#目次">目次</a><br>
<a href="#1-processingとは">1. Processingとは...</a><br>
<a href="#2-processingのインストール方法">2. Processingのインストール方法</a><br>
<a href="#3-j-festaポスタープログラムの実行方法">3. J-Festaポスタープログラムの実行方法</a><br>
- <a href="#1-実行方法">1. 実行方法</a><br>
- <a href="#2-プログラムの説明">2. プログラムの説明</a><br>

<a href="#4-もっとやってみたい人へ">4. もっとやってみたい人へ</a><br>
<a href="#静大-図書館浜松にあるprocessingの本">静大 図書館(浜松)にあるProcessingの本</a><br>
<a href="#processing学習サイト">Processing学習サイト</a><br>
<a href="#processingと似た分野について">Processingと似た分野について</a><br>

# 概要

2019年5月17日に開催された情報学部の交流イベント「J-Festa」のプロモーション用プログラム。

コンピュータシステム演習の最後に紹介の時間をもらったときに、プロジェクターで投影した。

また、ポスターの画像もこれと同様のプログラムで作成した。

## 参考画像
ポスター

![image](https://user-images.githubusercontent.com/40051885/156569974-bb00a5f5-7121-4ad7-86d2-604361eefb4a.png)

プログラム実行結果

![image](https://user-images.githubusercontent.com/40051885/156570143-bf74ab69-3885-49d3-91d2-f8df54b8951a.png)

当時の紹介文を以下に掲載。

# Processingでプログラミングとデジタルアートを体験しよう！

こんにちは。情報科学科 今村と申します。
今回2019/5/17(金)に行われるJ-Festaというイベントのポスターの作成にProcessingを使用したのでその紹介をさせていただきます。

## 目次
1. Processingとは...
1. Processingのインストール方法
1. J-Festaポスタープログラムについて
    1. 実行方法
    1. プログラムの説明
1. もっとやってみたい人へ

## 1. Processingとは...

> 電子アートとビジュアルデザインのためのプログラミング言語であり、統合開発環境である。
> アーティストによるコンテンツ制作作業のために、詳細な設定を行う関数を排除している。 
> 視覚的なフィードバックが即座に得られるため、初心者がプログラミングを学習するのに適しており、
> 電子スケッチブックの基盤としても利用できる。Java を単純化し、グラフィック機能に特化した言語といえる。

[wikipedia](https://ja.wikipedia.org/wiki/Processing) から引用


作例はこちらのサイトなどをご覧ください。
- [Processingというあまり知られていないプログラミング言語が思ったよりすごい件](https://tsukurukids.com/4358)
- twitterのハッシュタグ [#processing](https://twitter.com/search?q=%23processing&src=typed_query) で検索


ポイントとしては、
- フリーで使える
- 結果が視覚的にわかりやすいためプログラミング入門向き
- 内部はJavaで動いているためこれからの予習になる(情報学部では1年生でJavaを勉強します)


新入生の皆さんで大学に入ってからプログラミングを学ぶという人は多いかと思います。
静大情報学部ではまずWebページの作成ができるHTMLを覚え、その次にJavaというプログラミング言語を勉強します。
Javaを勉強するときまず"Hello, world"のような文字列を画面に出力させるといったことをするのですがいまいちプログラミングをしているという実感がわかないと思います。

そんなときの息抜きとしてこのProcessingを使ってみてください。
手軽に視覚的でわかりやすいプログラミングを書くことができます。
プログラミングを勉強するとこんなおもしろいことができるんだと少しでも感じてもらえたらうれしいです。


## 2. Processingのインストール方法

ProcessingはWindows, Macどちらの環境でも動作します。
インストールはこちらのサイトが参考になります。

[Processingの始め方（ダウンロードから起動まで）](https://tsukurukids.com/4363)


## 3. J-Festaポスタープログラムの実行方法
### 1. 実行方法
ProcessingがPCにインストールされていることを前提とします。

今回のポスターのプログラムはfsのshare\studentに置いてあります。
「JFesta2019demo」というフォルダごと自分のPCにコピーしてください。
フォルダの中身は下記の通りです。
```
JFesta2019demo
 +-data
 +-img
 +-JFesta2019demo.pde
 +-torus.pde
```

「JFesta2019demo.pde」をダブルクリックするとProcessingが起動します。
左上の三角形(実行)を押すとプログラムが実行されます。

割り当てキー
- 1: J-Festaのタイトルの表示/非表示切替
- P: 押した瞬間のフレームが画像として保存される、保存先は同じ階層のimgフォルダ

終了は右上のバツかProcessing側で四角形(停止)を押します。

### 2. プログラムの説明

プログラミングに慣れていない方は難しいと思うので雰囲気だけでもつかんでみてください。

概要としては、
- 三次元空間上に仮想のカメラの設置、2つのトーラス(ドーナツ型の立体のこと)の準備(setup())
- 毎秒30回(frameRate(30))、draw()の処理が実行される
    - 3色のライト(pointLight():skyblue, yeloww, magenta)と1つの白色光(directionalLight())の設置、回転
    - 内側のトーラス(inner)の描画、回転
    - 外側のトーラス(outer)の描画、回転
    - J-Festaのタイトルの表示
    - 回転のパラメータを更新
    - (※繰り返し)


トーラスのコンストラクタについて
```
Torus(int r, int c, float ir, float or, int type, int param)
int   r  : 縦の分割数
int   c  : 横の分割数
float ir : 筒の半径(ドーナツの厚み)
float or : トーラスの半径(ドーナツの大きさ)
int type : NL(内側まで描画)、HF(外側だけ描画)のどちらか
int param: 球体の配置のパラメータ
```

例：
```
inner = new Torus(32, 32,  50.0, 100.0, NML, 8);
```
innerと名付けたトーラスは、縦・横32分割で厚み50.0、大きさ100.0、タイプはNML、パラメータは8に設定する。

コードは変更可能なのでこれらの値を変更して実際に試してみましょう。

内側の円に変化が表れたと思います。


## 4. もっとやってみたい人へ
今回のポスターのプログラムはプログラミングでこんなことができるというデモとして作成しました。
できるかぎりわかりやすく書いたつもりなのでプログラミングをある程度勉強してからもう一度見直してみてださい。

また今回のプログラムを作成するにあたって3Dプログラミングとトーラスについては下記サイトを参考にさせていただきました。
- [WebGL 開発支援サイト wgld.org](https://wgld.org/)


上記サイトはJavaScriprという言語を使ったものですがプログラムを組むうえでの知識としては言語をまたいで活用することができます。

もしプログラミングを使った表現に興味があるなら静大図書館の資料やネットを調べてみてください。

### 静大 図書館(浜松)にあるProcessingの本
- Processingをはじめよう. 第2版(オライリー・ジャパン,オーム社,2016.9)
- Processingアニメーションプログラミング入門(技術評論社, 2011.8)
- ジェネラティブ・アート : Processingによる実践ガイド. 普及版(ビー・エヌ・エヌ新社, 2014.11)
- Nature of code : Processingではじめる自然現象のシミュレーション(ボーンデジタル, 2014.9)
- など

### Processing学習サイト
下記2つのサイトでは大学の講義で使用した資料が公開されています
- [Processing 学習ノート](http://www.d-improvement.jp/learning/processing/)
- [yoppa org](https://yoppa.org/)

### Processingと似た分野について
Processingなどを用いてプログラミングで表現をすることをクリエイティブコーティングやジェネラティブアートと言ったりします。Twitterにこれらのハッシュタグがあるので検索してみるとおもしろいです。


ここまで読んでいただきありがとうございました。
それでは新入生の皆さんのこれからの大学生活ぜひ楽しんでください！
