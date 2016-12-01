#
# Be sure to run `pod lib lint PickerViewCell.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PickerViewCell'
  s.version          = '0.1.0'
  s.summary          = 'A library implement the UITableViewCell with a UIDatePicker or a UIPickerView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
We provide two type of UITableViewCell:
1. DatePickerTableViewCell: when you make this cell becomeFirstResponder, it will invoke a UIDatePicker and then you can use the delegate function to get the value of the picker.
2.PickerTableViewCell: when you make this cell becomeFirstResponder, it will invoke a UIPickerView. You should specify your datasource and delegate.
                       DESC

  s.homepage         = 'https://github.com/hijamoya/PickerViewCell'
  s.screenshots      = 'https://s3-ap-northeast-1.amazonaws.com/uploads-jp.hipchat.com/119782/912422/X5rdr3NDLQ9TprK/simulator-screen-shot-1-dec-20.png'
  s.license          = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author           = { 'jam_hsu' => 'hijamoya2004@hotmail.com' }
  s.source           = { :git => 'https://github.com/hijamoya/PickerViewCell.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'PickerViewCell/Classes/**/*'
  
end
