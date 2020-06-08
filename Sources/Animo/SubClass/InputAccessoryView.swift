//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 4/19/20.
//

import UIKit

@objc public protocol InputAccessoryViewDelegate: AnyObject {

    @objc optional func didTapPreviousButton(_ sender: UITextField)
    @objc optional func didTapNextButton(_ sender: UITextField)
    @objc optional func didTapReturnButton(_ sender: UITextField)
    @objc optional func didTapDoneButton(_ sender: UITextField)
}

public enum InputAccessoryItemType {
    case previous
    case next
    case returnItem
    case done
    case flexibleSpace
}

public class InputAccessoryView: UIToolbar {

    public weak var customDelegate: InputAccessoryViewDelegate?
    public var textField: UITextField?

    public convenience init(items typeArray: [InputAccessoryItemType], textField: UITextField, delegate: InputAccessoryViewDelegate?) {
        self.init()
        self.sizeToFit()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setUpItems(types: typeArray)
        self.customDelegate = delegate
        self.textField = textField
    }

    private func setUpItems(types: [InputAccessoryItemType]) {
        var items: [UIBarButtonItem] = []
        for type in types {
            switch type {
            case .previous:
                items.append(self.getPreviousItem())
            case .next:
                items.append(self.getNextItem())
            case .returnItem:
                items.append(self.getReturnItem())
            case .done:
                items.append(self.getDoneItem())
            case .flexibleSpace:
                items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
            }
        }
        self.setItems(items, animated: false)
    }
    
    private func getNextItem() -> UIBarButtonItem {
        var item: UIBarButtonItem
        if #available(iOS 13.0, *) {
            item = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), style: .done, target: self, action: #selector(didTapNextButton(_:)))
        } else {
            item = UIBarButtonItem(image: UIImage(named: "chevron.down"), style: .done, target: self, action: #selector(didTapNextButton(_:)))
        }
        return item
    }

    private func getPreviousItem() -> UIBarButtonItem {
        var item: UIBarButtonItem
        if #available(iOS 13.0, *) {
            item = UIBarButtonItem(image: UIImage(systemName: "chevron.up"), style: .done, target: self, action: #selector(didTapPreviousButton(_:)))
        } else {
            item = UIBarButtonItem(image: UIImage(named: "chevron.up"), style: .done , target: self, action: #selector(didTapPreviousButton(_:)))
        }
        return item
    }

    private func getReturnItem() -> UIBarButtonItem {
        return UIBarButtonItem(title: "Return", style: .done, target: self, action: #selector(didTapReturnButton(_:)))
    }

    private func getDoneItem() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDoneButton(_:)))
    }

    @objc func didTapPreviousButton(_ sender: Any) {
        guard let textField = self.textField else {
            return
        }
        self.customDelegate?.didTapPreviousButton?(textField)
    }

    @objc func didTapNextButton(_ sender: Any) {
        guard let textField = self.textField else {
            return
        }
        self.customDelegate?.didTapNextButton?(textField)
    }

    @objc func didTapReturnButton(_ sender: Any) {
        guard let textField = self.textField else {
            return
        }
        self.customDelegate?.didTapReturnButton?(textField)
    }

    @objc func didTapDoneButton(_ sender: Any) {
        guard let textField = self.textField else {
            return
        }
        self.customDelegate?.didTapDoneButton?(textField)
    }
}
