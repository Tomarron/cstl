=begin
= CSTL

== 目次
* ((<CSTLとは>))
* ((<インストール>))
* ((<リファレンスマニュアル>))
  * ((<vector|URL:vector.html>))
  * ((<deque|URL:deque.html>))
  * ((<list|URL:list.html>))
  * ((<set, multiset|URL:set.html>))
  * ((<map, multimap|URL:map.html>))
  * ((<string|URL:string.html>))
  * ((<algorithm|URL:algorithm.html>))
* ((<STLとの主な違い>))
* ((<ライセンス>))
  * ((<日本語訳(参考)>))


== CSTLとは
CSTLは、C++のSTLを模倣したC言語用のコンテナライブラリである。
CSTLは以下の特長を持つ。
* STLと同様なデータ構造・アルゴリズムを提供。
* STLに似たインターフェイス。
* マクロを使うことにより、任意の型の要素に対応。
* C89準拠の処理系ならば大抵の環境に移植可能。


== インストール
* 手動でコピーする方法

  ((<SourceForge.jp|URL:http://sourceforge.jp/projects/cstl/files/>))からtarballをダウンロードする。
  tarballを展開し、cstlディレクトリをインクルードパスの通ったディレクトリにコピーする。

* ((<SVNリポジトリ|URL:http://svn.sourceforge.jp/svnroot/cstl/>))からチェックアウトする方法

  インクルードパスの通ったディレクトリに移動し、以下のコマンドを実行する。
    最新スナップショットをチェックアウト
    > svn checkout http://svn.sourceforge.jp/svnroot/cstl/trunk/cstl ./cstl
    特定のバージョンをチェックアウト(x.x.xはバージョン番号)
    > svn checkout http://svn.sourceforge.jp/svnroot/cstl/tags/rel-x.x.x/cstl ./cstl

ヘッダファイルのみなのでビルドする必要はない。


== リファレンスマニュアル
CSTLは以下のコンテナを提供する。

* ((<vector|URL:vector.html>))

  可変長配列。許容量を超えた要素の追加をした場合、自動的に拡張する。
  末尾での要素の挿入・削除が高速であり、それ以外の位置の要素の挿入・削除と要素の検索は遅い。
  インデックスによる要素のランダムアクセスが可能。
  ((<アルゴリズム|URL:algorithm.html>))が使用可能。

* ((<deque|URL:deque.html>))

  両端キュー。
  先頭と末尾での要素の挿入・削除が高速であり、それ以外の位置の要素の挿入・削除と要素の検索は遅い。
  インデックスによる要素のランダムアクセスが可能。
  ((<アルゴリズム|URL:algorithm.html>))が使用可能。

* ((<list|URL:list.html>))

  双方向リンクリスト。
  要素の挿入・削除が高速であり、要素の検索は遅い。

* ((<set|URL:set.html>))

  要素が値によって自動的にソートされるコンテナ。要素は定数となる。
  要素の重複は許されない。
  要素の挿入・削除・検索が速い。

* ((<multiset|URL:set.html>))

  要素の重複が許されることを除き、setと同じである。

* ((<map|URL:map.html>))

  キーと値のペアを要素とするコンテナ。要素はキーによって自動的にソートされる。キーは定数となる。
  キーの重複は許されない。
  要素の挿入・削除が速い。キーの検索は速く、値の検索は遅い。
  キーによる要素のランダムアクセスが可能。
  連想配列として使用可能。

* ((<multimap|URL:map.html>))

  キーの重複が許されることと、キーによる要素のランダムアクセスが不可能であることを除き、mapと同じである。
  辞書として使用可能。

* ((<string|URL:string.html>))

  可変長文字列。許容量を超えた文字の追加をした場合、自動的に拡張する。
  ((<アルゴリズム|URL:algorithm.html>))が使用可能。


== STLとの主な違い
* vector, deque, stringはインデックスで要素にアクセスするため、イテレータをサポートしない。
* vector, deque, listのpop_back(), pop_front()は削除した値を返す。
* vector, stringのshrink()は許容量の縮小ができる。
* stringのreserve()は許容量の縮小ができない。
* set, mapのinsert()は重複による成否を引数で返す。
* set, multiset, map, multimapのerase()は削除した次の位置のイテレータを返す。
* set, multiset, map, multimapのerase_range()は削除した次の位置のイテレータを返す。
* 未対応なメンバ関数あり。
* vector, deque, stringのみアルゴリズムをサポートする。
* アルゴリズムのbinary_search()は見つかったインデックスを返す。
* 未対応なアルゴリズムあり。


== ライセンス
本ソフトウェアのライセンスは、修正BSDライセンスに従う。

  Copyright (c) 2006-2007, KATO Noriaki
  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:

  1. Redistributions of source code must retain the above copyright notice,
     this list of conditions and the following disclaimer.
  2. Redistributions in binary form must reproduce the above copyright notice,
     this list of conditions and the following disclaimer in the documentation
     and/or other materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=== 日本語訳(参考)

  Copyright (c) 2006-2007, KATO Noriaki
  All rights reserved.

  ソースコード形式かバイナリ形式か、変更するかしないかを問わず、以下の条件を満た
  す場合に限り、再頒布および使用が許可されます。

  1. ソースコードを再頒布する場合、上記の著作権表示、本条件一覧、および下記免責
     条項を含めること。
  2. バイナリ形式で再頒布する場合、頒布物に付属のドキュメント等の資料に、上記の
     著作権表示、本条件一覧、および下記免責条項を含めること。

  本ソフトウェアは、著作権者によって「現状のまま」提供されており、明示黙示を問わ
  ず、商業的な使用可能性、および特定の目的に対する適合性に関する暗黙の保証も含
  め、またそれに限定されない、いかなる保証もありません。著作権者は、事由のいかん
  を問わず、損害発生の原因いかんを問わず、かつ責任の根拠が契約であるか厳格責任で
  あるか（過失その他の）不法行為であるかを問わず、仮にそのような損害が発生する可
  能性を知らされていたとしても、本ソフトウェアの使用によって発生した（代替品また
  は代用サービスの調達、使用の喪失、データの喪失、利益の喪失、業務の中断も含め、
  またそれに限定されない）直接損害、間接損害、偶発的な損害、特別損害、懲罰的損
  害、または結果損害について、一切責任を負わないものとします。

<<< sfjp
=end
