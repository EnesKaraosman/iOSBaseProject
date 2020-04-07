//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import EKNetworkModule

class ___VARIABLE_ModuleName___Builder {
    class func build() -> ___VARIABLE_ModuleName___ViewController {
        let viewModel = ___VARIABLE_ModuleName___ViewModel(api: EKAPIClient.instance)
        let view = ___VARIABLE_ModuleName___ViewController(viewModel: viewModel)
        return view
    }
}
