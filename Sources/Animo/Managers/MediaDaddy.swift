//
//  File.swift
//  
//
//  Created by Sako Hovaguimian on 12/8/19.
//

import UIKit

public enum MediaType: String {
    
    case pics, movies, all
    
    var chosenMedia: [String] {
        
        switch self {
            
            case .pics: return ["public.image"]
            case .movies: return ["public.movie"]
            case .all: return ["public.movie", "public.image"]
            
        }
    }
}

public protocol MediaPickerDelegate: class {
    func didSelect(image: UIImage?)
    func didSelect(meida: URL?)
}


public class MediaDaddy: NSObject {
    
    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private weak var delegate: MediaPickerDelegate?
    
    public var mediaType: MediaType?
    
    public init(presentationController: UIViewController, delegate: MediaPickerDelegate, mediaType: MediaType) {
        self.pickerController = UIImagePickerController()

        super.init()

        self.presentationController = presentationController
        self.delegate = delegate
    
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = mediaType.chosenMedia
    }
    
    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }
        
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }
    
    public func present(from sourceView: UIView) {

        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if let action = self.action(for: .camera, title: "Take photo") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .savedPhotosAlbum, title: "Camera roll") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .photoLibrary, title: "Photo library") {
            alertController.addAction(action)
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.presentationController?.present(alertController, animated: true)
    }
    
    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)
        
        self.delegate?.didSelect(image: image)
    }
    
}

extension MediaDaddy: UIImagePickerControllerDelegate {
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil)
    }

    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let video = info[.mediaURL] as? URL {
            print(video)
        }
        
        guard let image = info[.editedImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil)
        }
        
        
        self.pickerController(picker, didSelect: image)
    }
}

extension MediaDaddy: UINavigationControllerDelegate {
    
}
