PickerViewCell
=====================
[![Language Swift 3.0](https://img.shields.io/badge/Language-Swift%203.0-orange.svg?style=flat)](https://swift.org)
<br/>
We provide two types of UITableViewCell:<br/>
<p>1. DatePickerTableViewCell: when you make this cell `becomeFirstResponder`, it will invoke a UIDatePicker and then you can use the delegate function to get the value of the picker.</p>
<p>2. PickerTableViewCell: when you make this cell `becomeFirstResponder`, it will invoke a UIPickerView. You should specify your datasource and delegate.</p>

Demo
=====================
![Demo](https://s3-ap-northeast-1.amazonaws.com/uploads-jp.hipchat.com/119782/912422/OmsWKq60i5C8ODJ/ezgif.com-44fc6f7907.gif)

Installation
===================
```
pod 'PickerViewCell', '0.1.0'
```

Useage
=====================
Make your table view cell be the cells we provided, and just invoke `becomeFirstResponder` when the cell is selected.

```swift
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    if let cell = tableView.cellForRow(at: indexPath) as? DatePickerTableViewCell {
      cell.delegate = self
      if !cell.isFirstResponder {
        _ = cell.becomeFirstResponder()
      }
    } else if let cell = tableView.cellForRow(at: indexPath) as? PickerTableViewCell {
      cell.delegate = self
      cell.dataSource = self
      if !cell.isFirstResponder {
        _ = cell.becomeFirstResponder()
      }
    }
  }
```
