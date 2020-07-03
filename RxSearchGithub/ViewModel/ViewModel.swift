import RxSwift
import RxCocoa

class ViewModel {
    let searchText = BehaviorRelay(value: "")
    
    lazy var data: Driver<[Repository]> = {
        // Q throttle operator
        // Q distinctUntilChanged
        return self.searchText.asObservable()
            .throttle(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest(APIManager.repositoriesBy(_:))
            .asDriver(onErrorJustReturn: [])
    }()
}
