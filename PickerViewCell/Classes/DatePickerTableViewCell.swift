
import UIKit

public class DatePickerTableViewCell: UITableViewCell {

  public var datePickerMode = UIDatePickerMode.date

  open weak var delegate: DatePickerTableCellDelegate?

  fileprivate let picker = UIDatePicker()

  public override func awakeFromNib() {
    super.awakeFromNib()
    picker.datePickerMode = datePickerMode
    picker.addTarget(self, action: #selector(DatePickerTableViewCell.onDateChanged(_:)), for: UIControlEvents.valueChanged)
  }

  public override var canBecomeFirstResponder: Bool {
    return true
  }

  public override var canResignFirstResponder: Bool {
    return true
  }

  public override var inputView: UIView? {
    return picker
  }

  public override func becomeFirstResponder() -> Bool {
    delegate?.onDatePickerOpen(self)
    return super.becomeFirstResponder()
  }

  public override func resignFirstResponder() -> Bool {
    delegate?.onDatePickerClose(self)
    return super.resignFirstResponder()
  }

  func onDateChanged(_ sender: UIDatePicker) {
    delegate?.onDateChange(sender, cell: self)
  }

}

/// Protocol to hook the callback of the date picker.
public protocol DatePickerTableCellDelegate: class {

  /// Called when the date changes in the picker
  ///
  /// - Parameters:
  ///   - sender: the `UIDatePicker` instance.
  ///   - cell: the target cell.
  func onDateChange(_ sender: UIDatePicker, cell: DatePickerTableViewCell)

  /// Called when the picker open.
  ///
  /// - Parameter cell: the target cell.
  func onDatePickerOpen(_ cell: DatePickerTableViewCell)

  /// Called when the picker close.
  ///
  /// - Parameter cell: the target cell.
  func onDatePickerClose(_ cell: DatePickerTableViewCell)

}
