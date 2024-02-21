// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Alert {
    internal static let addToCart = ImageAsset(name: "Alert/add-to-cart")
  }
  internal enum AppColor {
    internal static let backgroundColor = ColorAsset(name: "AppColor/backgroundColor")
    internal static let mainTheme = ColorAsset(name: "AppColor/mainTheme")
    internal static let primary = ColorAsset(name: "AppColor/primary")
    internal static let primaryBackground = ColorAsset(name: "AppColor/primaryBackground")
    internal static let primaryButton = ColorAsset(name: "AppColor/primaryButton")
    internal static let primaryText = ColorAsset(name: "AppColor/primaryText")
    internal static let profileColor = ColorAsset(name: "AppColor/profileColor")
    internal static let searchBackground = ColorAsset(name: "AppColor/searchBackground")
    internal static let secondaryBackground = ColorAsset(name: "AppColor/secondaryBackground")
    internal static let secondaryButton = ColorAsset(name: "AppColor/secondaryButton")
    internal static let secondaryText = ColorAsset(name: "AppColor/secondaryText")
    internal static let selectedColor = ColorAsset(name: "AppColor/selectedColor")
    internal static let socialButton = ColorAsset(name: "AppColor/socialButton")
    internal static let stapperBackground = ColorAsset(name: "AppColor/stapperBackground")
    internal static let textFieldUnderLine = ColorAsset(name: "AppColor/textFieldUnderLine")
  }
  internal enum Onboarding {
    internal static let image1 = ImageAsset(name: "Onboarding/image-1")
    internal static let image2 = ImageAsset(name: "Onboarding/image-2")
    internal static let image3 = ImageAsset(name: "Onboarding/image-3")
    internal static let logo = ImageAsset(name: "Onboarding/logo")
    internal static let nextButton = ImageAsset(name: "Onboarding/next-button")
    internal static let splash1 = ImageAsset(name: "Onboarding/splash-1")
    internal static let splash2 = ImageAsset(name: "Onboarding/splash-2")
  }
  internal static let appLogo = ImageAsset(name: "app-logo")
  internal static let arrow = ImageAsset(name: "arrow")
  internal enum Cart {
    internal static let image1 = ImageAsset(name: "cart/image1")
    internal static let image2 = ImageAsset(name: "cart/image2")
    internal static let image3 = ImageAsset(name: "cart/image3")
  }
  internal static let cart = ImageAsset(name: "cart")
  internal enum Cart2 {
    internal static let image1 = ImageAsset(name: "cart2/image1")
    internal static let image2 = ImageAsset(name: "cart2/image2")
    internal static let image3 = ImageAsset(name: "cart2/image3")
  }
  internal enum Category {
    internal static let icon2 = ImageAsset(name: "category/icon-2")
    internal static let icon3 = ImageAsset(name: "category/icon-3")
    internal static let icon4 = ImageAsset(name: "category/icon-4")
    internal static let icon5 = ImageAsset(name: "category/icon-5")
    internal static let icon6 = ImageAsset(name: "category/icon-6")
    internal static let icon = ImageAsset(name: "category/icon")
  }
  internal enum Category2 {
    internal static let image1 = ImageAsset(name: "category2/image-1")
    internal static let image2 = ImageAsset(name: "category2/image-2")
    internal static let image3 = ImageAsset(name: "category2/image-3")
    internal static let image4 = ImageAsset(name: "category2/image-4")
    internal static let image5 = ImageAsset(name: "category2/image-5")
  }
  internal enum Category3 {
    internal static let image10 = ImageAsset(name: "category3/image-10")
    internal static let image5 = ImageAsset(name: "category3/image-5")
    internal static let image6 = ImageAsset(name: "category3/image-6")
    internal static let image7 = ImageAsset(name: "category3/image-7")
    internal static let image8 = ImageAsset(name: "category3/image-8")
    internal static let image9 = ImageAsset(name: "category3/image-9")
  }
  internal static let checkImage = ImageAsset(name: "checkImage")
  internal static let delete = ImageAsset(name: "delete")
  internal static let dots2 = ImageAsset(name: "dots-2")
  internal static let dots = ImageAsset(name: "dots")
  internal static let edit = ImageAsset(name: "edit")
  internal static let eye = ImageAsset(name: "eye")
  internal static let favourite = ImageAsset(name: "favourite")
  internal enum Icon {
    internal static let productDelete = ImageAsset(name: "icon/product-delete")
    internal static let profileArrow = ImageAsset(name: "icon/profile-arrow")
    internal static let usericon = ImageAsset(name: "icon/usericon")
    internal static let usericon2 = ImageAsset(name: "icon/usericon2")
    internal static let usericon3 = ImageAsset(name: "icon/usericon3")
  }
  internal static let iconAlertSuccessefulShopping = ImageAsset(name: "icon-alertSuccessefulShopping")
  internal static let iconApple = ImageAsset(name: "icon-apple")
  internal static let iconFacebook = ImageAsset(name: "icon-facebook")
  internal static let iconGoogle = ImageAsset(name: "icon-google")
  internal static let iconSuccess = ImageAsset(name: "icon-success")
  internal static let icon = ImageAsset(name: "icon")
  internal static let logout = ImageAsset(name: "logout")
  internal static let product = ImageAsset(name: "product")
  internal enum Products {
    internal static let image902 = ImageAsset(name: "products/image 90-2")
    internal static let image903 = ImageAsset(name: "products/image 90-3")
    internal static let image904 = ImageAsset(name: "products/image 90-4")
    internal static let image90 = ImageAsset(name: "products/image 90")
    internal static let image = ImageAsset(name: "products/image")
  }
  internal enum Profile {
    internal static let icon2 = ImageAsset(name: "profile/icon-2")
    internal static let icon3 = ImageAsset(name: "profile/icon-3")
    internal static let icon4 = ImageAsset(name: "profile/icon-4")
    internal static let icon5 = ImageAsset(name: "profile/icon-5")
    internal static let icon6 = ImageAsset(name: "profile/icon-6")
    internal static let icon7 = ImageAsset(name: "profile/icon-7")
    internal static let icon8 = ImageAsset(name: "profile/icon-8")
    internal static let icon9 = ImageAsset(name: "profile/icon-9")
    internal static let icon = ImageAsset(name: "profile/icon")
    internal static let user = ImageAsset(name: "profile/user")
  }
  internal static let profileImage = ImageAsset(name: "profileImage")
  internal static let rating = ImageAsset(name: "rating")
  internal enum Settings {
    internal static let icon2 = ImageAsset(name: "settings/icon-2")
    internal static let icon3 = ImageAsset(name: "settings/icon-3")
    internal static let icon4 = ImageAsset(name: "settings/icon-4")
    internal static let icon = ImageAsset(name: "settings/icon")
  }
  internal enum Tabbar {
    internal static let cartSelected = ImageAsset(name: "tabbar/cart-selected")
    internal static let cart = ImageAsset(name: "tabbar/cart")
    internal static let homeSelected = ImageAsset(name: "tabbar/home-selected")
    internal static let home = ImageAsset(name: "tabbar/home")
    internal static let notificationSelected = ImageAsset(name: "tabbar/notification-selected")
    internal static let notification = ImageAsset(name: "tabbar/notification")
    internal static let profileSelected = ImageAsset(name: "tabbar/profile-selected")
    internal static let profile = ImageAsset(name: "tabbar/profile")
  }
  internal static let verify = ImageAsset(name: "verify")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
