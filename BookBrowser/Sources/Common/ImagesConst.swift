//
//  VYImageAsset.swift
//  dingdong
//
//  Created by Hanson on 2017/12/7.
//  Copyright © 2017年 vanyun. All rights reserved.
//


// Generated using SwiftGen, using vy-templete created by Hanson

import UIKit.UIImage

typealias Image = UIImage

@available(*, deprecated, renamed: "ImageAsset")
typealias AssetType = ImageAsset

struct ImageAsset {
  fileprivate var name: String

  var image: Image {
    let bundle = Bundle(for: BundleToken.self)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

enum Asset {
  static let bigLogin = ImageAsset(name: "big-login")
  static let flashOff = ImageAsset(name: "flashOff")
  static let flashOn = ImageAsset(name: "flashOn")
  static let iconBack = ImageAsset(name: "icon-back")
  static let iconBook = ImageAsset(name: "icon-book")
  static let iconForward = ImageAsset(name: "icon-forward")
  static let iconHamburger = ImageAsset(name: "icon-hamburger")
  static let iconProfile = ImageAsset(name: "icon-profile")
  static let iconSearch = ImageAsset(name: "icon-search")
  static let iconBackWhite = ImageAsset(name: "icon_back_white")
  static let info = ImageAsset(name: "info")
  static let starEmpty = ImageAsset(name: "star_empty")
  static let starFull = ImageAsset(name: "star_full")
}


extension Image {
  convenience init!(asset: ImageAsset) {
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
  }
}


private final class BundleToken {}
