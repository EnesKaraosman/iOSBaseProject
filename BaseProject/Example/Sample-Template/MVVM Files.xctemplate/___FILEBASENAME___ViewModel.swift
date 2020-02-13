//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

class ___VARIABLE_ModuleName___ViewModel: BaseViewModel, ViewModelContract {
    
    struct Input { }
    struct Output { }
    
    let input: Input
    let output: Output
    
    override init(api: APIClientProtocol? = nil) {
       input = Input()
       output = Output()
       super.init(api: api)
    }

}
