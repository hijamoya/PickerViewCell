PickerViewCell
=====================
We provide two type of UITableViewCell:<br/>
1. DatePickerTableViewCell: when you make this cell `becomeFirstResponder`, it will invoke a UIDatePicker and then you can use the delegate function to get the value of the picker.<br/>
2.PickerTableViewCell: when you make this cell `becomeFirstResponder`, it will invoke a UIPickerView. You should specify your datasource and delegate.

Demo
=====================
![Demo](https://s3-ap-northeast-1.amazonaws.com/uploads-jp.hipchat.com/119782/912422/X5rdr3NDLQ9TprK/simulator-screen-shot-1-dec-20.png)

Useage
=====================
Make your table view cell be the cells we provided, and just invoke `becomeFirstResponder` when the cell is selected.

```java
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
