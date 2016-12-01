
import UIKit

open class PickerTableViewCell: UITableViewCell {

  open weak var dataSource: PickerTableCellDataSource?
  open weak var delegate: PickerTableCellDelegate?

  public let picker = UIPickerView()

  open override func awakeFromNib() {
    super.awakeFromNib()
    picker.delegate = self
    picker.dataSource = self
  }

  open override var canBecomeFirstResponder: Bool {
    return true
  }

  open override var canResignFirstResponder: Bool {
    return true
  }

  open override func becomeFirstResponder() -> Bool {
    picker.dataSource = self
    delegate?.onPickerOpen(self)
    return super.becomeFirstResponder()
  }

  open override func resignFirstResponder() -> Bool {
    delegate?.onPickerClose(self)
    return super.resignFirstResponder()
  }

  open override var inputView: UIView? {
    return picker
  }

}

// MARK: - UIPickerViewDelegate

extension PickerTableViewCell: UIPickerViewDelegate {

  public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return delegate?.pickerView(pickerView, titleForRow: row, forComponent: component, forCell: self)
  }

  public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    delegate?.pickerView(pickerView, didSelectRow: row, inComponent: component, forCell: self)
  }

}

// MARK: - UIPickerViewDataSource

extension PickerTableViewCell: UIPickerViewDataSource {

  public func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return dataSource!.numberOfComponents(in: pickerView, forCell: self)
  }

  public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return dataSource!.pickerView(pickerView, numberOfRowsInComponent: component, forCell: self)
  }

}

/// Hook of delegate of `UIPickerView`
public protocol PickerTableCellDelegate: class {

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int, forCell cell: PickerTableViewCell) -> String?

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int, forCell cell: PickerTableViewCell)

  /// Called when the picker open.
  ///
  /// - Parameter cell: the target cell.
  func onPickerOpen(_ cell: PickerTableViewCell)

  /// Called when the picker close.
  ///
  /// - Parameter cell: the target cell.
  func onPickerClose(_ cell: PickerTableViewCell)

}

/// Hook of datasource of `UIPickerView`
public protocol PickerTableCellDataSource: class {

  func numberOfComponents(in pickerView: UIPickerView, forCell cell: PickerTableViewCell) -> Int

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int, forCell cell: PickerTableViewCell) -> Int

}
