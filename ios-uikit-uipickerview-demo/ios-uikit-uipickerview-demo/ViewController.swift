//
//  ViewController.swift
//  ios-uikit-uipickerview-demo
//
//  Created by OkuderaYuki on 2017/02/11.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var highlightedLabel: UILabel!
    var testData: [[String]] = [["0", "1", "2"], ["a", "b", "c", "d", "e"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDataSource()
        setDelegate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        selectRow()
        selectedRow()
    }
    
    //MARK:- properties
    
    /// データソースを設定する
    private func setDataSource() {
        pickerView.dataSource = self
    }
    
    /// デリゲートを設定する
    private func setDelegate() {
        pickerView.delegate = self
    }
    
    /// ピッカーの列数を取得する
    private func numberOfComponents() {
        let components = pickerView.numberOfComponents
        print("numberOfComponents: \(components)")
    }
    
    //MARK:- methods
    
    /// 指定列の行数を取得する
    private func numberOfRows() {
        var rows = pickerView.numberOfRows(inComponent: 0)
        print("一番左の列の行数: \(rows)")
        
        rows = pickerView.numberOfRows(inComponent: 1)
        print("左から二列目の行数: \(rows)")
    }
    
    /// 指定列の行サイズを取得する
    private func rowSize() {
        let rowSize = pickerView.rowSize(forComponent: 0)
        print("一番左の列の行サイズ: \(rowSize)")
    }
    
    /// 指定した行、列で使用されているviewを取得する
    ///
    /// デリゲートメソッドのpickerView:viewForRow:forComponent:reusingView:が実装されていない場合は、nilを返す
    private func reusingView() {
        guard let view = pickerView.view(forRow: 0, forComponent: 1) else { return }
        print("view:\(view)")
    }
    
    /// 全列再読み込みする
    private func reloadAll() {
        pickerView.reloadAllComponents()
    }
    
    /// 指定列のみ再読み込みする
    private func reloadComponent() {
        testData[0].append(contentsOf: ["3", "4", "5"])
        pickerView.reloadComponent(0)
    }
    
    /// 指定した行、列を選択状態にする
    private func selectRow() {
        pickerView.selectRow(2, inComponent: 0, animated: false)
        pickerView.selectRow(4, inComponent: 1, animated: true)
    }
    
    /// 選択されている行番号を取得する
    ///
    /// 選択されていない場合は、-1を返す
    private func selectedRow() {
        var selectedRow = pickerView.selectedRow(inComponent: 0)
        print("Component: 0 -> selectedRow: \(selectedRow)")
        
        selectedRow = pickerView.selectedRow(inComponent: 1)
        print("Component: 1 -> selectedRow: \(selectedRow)")
    }
}

//MARK:- UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    
    //MARK:- required
    
    /// ピッカーに表示する列数を返す
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return testData.count
    }
    
    /// ピッカーに表示する行数を返す
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return testData[component].count
    }
}

//MARK:- UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    
    //MARK:- optional
    
    /// コンポーネントの幅を返す
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 192
    }
    
    /// コンポーネントの高さを返す
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
    
    /// ピッカーに表示する文字列を返す
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return testData[component][row]
    }
    
//    /// ピッカーに表示する文字列を返す(装飾有り)
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        let attribute: [String: Any] = [NSForegroundColorAttributeName: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]
//        let titleString = NSAttributedString(string: testData[component][row],
//                                             attributes: attribute)
//        return titleString
//    }
    
//    /// ピッカーに表示するviewを返す
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let pickerLabel = UILabel()
//        let titleString = testData[component][row]
//        let font = UIFont(name: "Futura-Medium", size: 16.0) ?? UIFont.systemFont(ofSize: 16.0)
//        let attributes: [String: Any] = [NSFontAttributeName: font,
//                                         NSForegroundColorAttributeName: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]
//        
//        let attributedTitle = NSAttributedString(string: titleString, attributes: attributes)
//        pickerLabel.attributedText = attributedTitle
//        
//        // 中央寄せ
//        pickerLabel.textAlignment = .center
//        
//        // 選択状態の場合は、背景色・文字色を変更する
//        if let selectedLabel = pickerView.view(forRow: row, forComponent: component) as? UILabel {
//            highlightedLabel = selectedLabel
//            highlightedLabel.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
//            highlightedLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        }
//        return pickerLabel
//    }
    
    /// ピッカーで選択された時の処理
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("didSelect row: \(row), component: \(component)")
        print("value: \(testData[component][row])")
    }
}
