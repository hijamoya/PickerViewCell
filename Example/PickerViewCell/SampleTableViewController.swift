
import UIKit
import PickerViewCell

class SampleTableViewController: UITableViewController {

  @IBOutlet weak var birthLabel: UILabel!
  @IBOutlet weak var genderLabel: UILabel!

  fileprivate lazy var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = DateFormatter.Style.long
    formatter.timeStyle = DateFormatter.Style.none
    return formatter
  }()

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

}

// MARK: - DatePickerTableCellDelegate

extension SampleTableViewController: DatePickerTableCellDelegate {

  func onDateChange(_ sender: UIDatePicker, cell: DatePickerTableViewCell) {
    birthLabel.text = dateFormatter.string(from: sender.date)
  }

  func onDatePickerOpen(_ cell: DatePickerTableViewCell) {
    birthLabel.text = birthLabel.text!.isEmpty ? dateFormatter.string(from: Date()) : birthLabel.text
    birthLabel.textColor = UIColor.red
  }

  func onDatePickerClose(_ cell: DatePickerTableViewCell) {
    birthLabel.textColor = UIColor.gray
  }

}

// MARK: - PickerTableCellDataSource

extension SampleTableViewController: PickerTableCellDataSource {

  public func numberOfComponents(in pickerView: UIPickerView, forCell cell: PickerTableViewCell) -> Int {
    return 1
  }

  public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int, forCell cell: PickerTableViewCell) -> Int {
    return 2
  }

}

// MARK: - PickerTableCellDelegate

extension SampleTableViewController: PickerTableCellDelegate {

  func onPickerOpen(_ cell: PickerTableViewCell) {
    genderLabel.text = genderLabel.text!.isEmpty ? "MALE" : genderLabel.text
    genderLabel.textColor = UIColor.red
  }

  func onPickerClose(_ cell: PickerTableViewCell) {
    genderLabel.textColor = UIColor.gray
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int, forCell cell: PickerTableViewCell) -> String? {
    return row == 0 ? "MALE" : "FEMALE"
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int, forCell cell: PickerTableViewCell) {
    genderLabel.text = row == 0 ? "MALE" : "FEMALE"
  }

}
