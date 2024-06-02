//
//  ImageLoaderDelegate.swift
//  HW7
//
//  Created by Aliia Satbakova  on 02.06.2024.
//

import Foundation
import UIKit.UIImage

protocol ImageLoaderDelegate: AnyObject {
    func didLoadImage(_ image: UIImage)
    func didFailWithError(_ error: String)
    func didUpdateProgress(_ progress: Float)
}
