# UIPickerView

## 概要
UIPickerViewは、ホイールを回して値を選択するピッカービューを利用するクラスです。

![UICollectionViewのイメージ](https://github.com/stv-yokudera/ios-uikit-uipickerview-demo/wiki/images/uipickerview.png)

## 関連クラス
UIView
　
## 実装手順
1. StoryboardにUIPickerViewを配置します。
2. UIViewControllerとStoryboardのUIPickerViewを関連けます。
3. UIViewControllerにUIPickerViewDataSourceを実装します。
4. dataSourceにUIViewControllerのインスタンスを設定します。
5. UIViewControllerにUIPickerViewDelegateを実装します。
6. delegateにUIViewControllerのインスタンスを設定します。

## 主要プロパティ

|プロパティ名|説明|サンプル|
|---|---|---|
|dataSource | dataSourceを指定する <br>UIPickerViewDataSourceを利用するため | pickerView.dataSource = self |
|delegate | delegateを指定する <br>UIPickerViewDelegateを利用するため | pickerView.delegate = self |
|numberOfComponents | ピッカーの列数を取得する | pickerView.numberOfComponents |

## 主要メソッド

|メソッド名|説明|サンプル|
|---|---|---|
|numberOfRows | 指定列の行数を取得する | pickerView.numberOfRows(inComponent: 0) |
|rowSize | 指定列の行サイズを取得する | pickerView.rowSize(forComponent: 0) |
|view | 指定した行、列で使用されているviewを取得する <br> デリゲートメソッドのpickerView:viewForRow:forComponent:reusingView:が実装されていない場合は、nilを返す| pickerView.view(forRow: 0, forComponent: 1) |
|reloadAllComponents | 全列再読み込みする | pickerView.reloadAllComponents() |
|reloadComponent | 指定列のみ再読み込みする | pickerView.reloadComponent(0) |
|selectRow | 指定した行、列を選択状態にする | pickerView.selectRow(2, inComponent: 0, animated: true) |
|selectedRow | 選択されている行番号を取得する <br> 選択されていない場合は、-1を返す | pickerView.selectedRow(inComponent: 0) |


### UIPickerViewDataSourceプロトコルのメソッド

|メソッド名|説明|必須|
|---|---|---|
|numberOfComponents | ピッカーに表示する列数を返す | ◯ |
|numberOfRowsInComponent | ピッカーに表示する行数を返す | ◯ |

### UIPickerViewDelegateプロトコルのメソッド

|メソッド名|説明|必須|
|---|---|---|
|widthForComponent | コンポーネントの幅を返す | - |
|rowHeightForComponent | コンポーネントの高さを返す | - |
|titleForRow | ピッカーに表示する文字列を返す | - |
|attributedTitleForRow | ピッカーに表示する文字列を返す(装飾有り) | - |
|viewForRow | ピッカーに表示するviewを返す | - |
|didSelectRow | ピッカーで選択された時の処理 | - |

## フレームワーク
UIKit.framework

## サポートOSバージョン
iOS2.0以上

## 開発環境
|category | Version|
|---|---|
| Swift | 3.0.2 |
| XCode | 8.2.1 |
| iOS | 10.0〜 |

## 参考
https://developer.apple.com/reference/uikit/uipickerview
