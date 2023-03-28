//  TodoListNotesApp
//  Created by Владимир on 18.03.2023.

import UIKit


class TableViewCellNoteTitle: UITableViewCell {
    
    @IBOutlet weak var noteTitle: UITextView!
    var onTitleEdit: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        noteTitle.becomeFirstResponder()
    }
    
    func configure() {
        noteTitle.delegate = self
        noteTitle.isEditable = true
        noteTitle.textContainer.lineFragmentPadding = 0
        noteTitle.textContainerInset = .zero
        noteTitle.font = UIFont.systemFont(ofSize: 17)
        noteTitle.textContainer.lineBreakMode = .byWordWrapping
        noteTitle.textContainerInset = UIEdgeInsets.zero
        noteTitle.isScrollEnabled = false
    }
    
    func updateTitle(with title: String) {
        noteTitle.text = title
    }
}

// MARK: - UITextFieldDelegate

extension TableViewCellNoteTitle: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        guard let noteText = noteTitle.text, !noteText.isEmpty else { return }
        onTitleEdit?(noteText)
    }
    
}