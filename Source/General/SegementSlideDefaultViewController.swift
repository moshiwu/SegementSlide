//
//  SegementSlideDefaultViewController.swift
//  SegementSlide
//
//  Created by Jiar on 2020/5/6.
//

import UIKit

open class SegementSlideDefaultViewController: SegementSlideViewController {
    
    private let defaultSwitcherView = SegementSlideDefaultSwitcherView()
    
    public override func segementSlideSwitcherView() -> SegementSlideSwitcherDelegate {
        defaultSwitcherView.delegate = self
        defaultSwitcherView.dataSource = self
        return defaultSwitcherView
    }
    
    internal override func setupSwitcher() {
        super.setupSwitcher()
        defaultSwitcherView.config = switcherConfig
    }
    
    open var switcherConfig: SegementSlideDefaultSwitcherConfig {
        return SegementSlideDefaultSwitcherConfig.shared
    }
    
    open override var switcherHeight: CGFloat {
        return 44
    }
    
    open var titlesInSwitcher: [String] {
        return []
    }
    
    open func showBadgeInSwitcher(at index: Int) -> BadgeType {
        return .none
    }
    
    /// reload badges in SwitcherView
    public func reloadBadgeInSwitcher() {
        defaultSwitcherView.reloadBadges()
    }
    
}

extension SegementSlideDefaultViewController: SegementSlideSwitcherDataSource {
    
    public var height: CGFloat {
        return switcherHeight
    }
    
    public var titles: [String] {
        return titlesInSwitcher
    }
    
}

extension SegementSlideDefaultViewController: SegementSlideDefaultSwitcherViewDelegate {
    
    public var titlesInSegementSlideSwitcherView: [String] {
        return switcherView.dataSource?.titles ?? []
    }
    
    public func segementSwitcherView(_ segementSlideSwitcherView: SegementSlideDefaultSwitcherView, didSelectAtIndex index: Int, animated: Bool) {
        if contentView.selectedIndex != index {
            contentView.scrollToSlide(at: index, animated: animated)
        }
    }
    
    public func segementSwitcherView(_ segementSlideSwitcherView: SegementSlideDefaultSwitcherView, showBadgeAtIndex index: Int) -> BadgeType {
        return showBadgeInSwitcher(at: index)
    }
    
}