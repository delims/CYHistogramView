# CYHistogramView

[![CI Status](https://img.shields.io/travis/delims/CYHistogramView.svg?style=flat)](https://travis-ci.org/delims/CYHistogramView)
[![Version](https://img.shields.io/cocoapods/v/CYHistogramView.svg?style=flat)](https://cocoapods.org/pods/CYHistogramView)
[![License](https://img.shields.io/cocoapods/l/CYHistogramView.svg?style=flat)](https://cocoapods.org/pods/CYHistogramView)
[![Platform](https://img.shields.io/cocoapods/p/CYHistogramView.svg?style=flat)](https://cocoapods.org/pods/CYHistogramView)


## Installation

CYHistogramView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CYHistogramView'
```
## Example

```
CYHistogramView *graph = CYHistogramView.new;
graph.frame = CGRectMake(0, 88, UIScreen.mainScreen.bounds.size.width, 500);
    
graph.itemModels = @[
    [CYHistogramItemModel modelWithName:@"1月" percent:0.3],
    [CYHistogramItemModel modelWithName:@"2月" percent:0.8],
    [CYHistogramItemModel modelWithName:@"3月" percent:0.56],
    [CYHistogramItemModel modelWithName:@"4月" percent:0.4],
    [CYHistogramItemModel modelWithName:@"5月" percent:0.9],
    [CYHistogramItemModel modelWithName:@"6月" percent:0.7],
];
graph.selectedName = @"3月";

```
## Result

![image](https://delims.github.io/static/cocoapods/images/histogram.png)


## Author

delims, delims@qq.com

## License

CYHistogramView is available under the MIT license. See the LICENSE file for more info.
