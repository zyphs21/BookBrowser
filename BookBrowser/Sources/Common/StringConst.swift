// Generated using SwiftGen, template by Hanson

import Foundation

enum LocalizedStr {
  /// 需要您的允许来使用相机扫描二维码
  static let askForPermissionText = LocalizedStr.tr("Localizable", "ASK_FOR_PERMISSION_TEXT")
  /// 关闭
  static let buttonClose = LocalizedStr.tr("Localizable", "BUTTON_CLOSE")
  /// 设置
  static let buttonSettings = LocalizedStr.tr("Localizable", "BUTTON_SETTINGS")
  /// 请把条形码置于扫描框中
  static let infoDescriptionText = LocalizedStr.tr("Localizable", "INFO_DESCRIPTION_TEXT")
  /// 正在寻找信息...
  static let infoLoadingTitle = LocalizedStr.tr("Localizable", "INFO_LOADING_TITLE")
  /// 没有发现信息
  static let noProductErrorTitle = LocalizedStr.tr("Localizable", "NO_PRODUCT_ERROR_TITLE")
  /// 扫描条形码
  static let scanBarcodeTitle = LocalizedStr.tr("Localizable", "SCAN_BARCODE_TITLE")
}

extension LocalizedStr {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
