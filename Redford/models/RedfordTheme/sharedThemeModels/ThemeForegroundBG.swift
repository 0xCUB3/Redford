//
//  ThemeForegroundBG.swift
//  Redford
//
//  Created by Igor Marcossi on 21/11/23.
//

import Foundation

struct ThemeForegroundBG: Codable, Hashable, Equatable {
  var blurry: Bool
  var color: ColorSchemes<ThemeColor>
}
