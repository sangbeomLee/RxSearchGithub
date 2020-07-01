import RxSwift
import RxCocoa

class ViewModel {
    let searchText = BehaviorRelay(value: "")
    
    lazy var data: Driver<[Repository]> = {
        return Observable.of([Repository]()).asDriver(onErrorJustReturn: [])
    }()
}
