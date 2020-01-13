//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

class ___VARIABLE_ModuleName___ViewController: UIViewController {

    var viewModel: ___VARIABLE_ModuleName___ViewModel?
    
    init(viewModel: BaseViewModel) {
        self.viewModel = viewModel as? ___VARIABLE_ModuleName___ViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.2641104293, green: 0.6212216815, blue: 0.9411764741, alpha: 1)
    }
    
}
