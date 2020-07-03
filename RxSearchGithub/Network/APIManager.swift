//
//  APIManager.swift
//  RxSearchGithub
//
//  Created by 이상범 on 2020/07/01.
//  Copyright © 2020 sangbeomLee. All rights reserved.
//

import RxSwift

class APIManager {
    static func repositoriesBy(_ githubID: String) -> Observable<[Repository]> {
        // url가져오는 부분 따로 빼야할 듯 하다.
        // URL 생성에 실패하면 빈 Observable 배열이 반환될 것이다.
        guard !githubID.isEmpty, let url = URL(string: "https://api.github.com/users/\(githubID)/repos") else {
            return Observable.just([])
        }
        // urlsession의 싱글톤에서 rx.json 사용
        return URLSession.shared.rx.json(url: url)
        .retry(3)
        .map(parse(json:))
            // 에러핸들링을 따로 하지않은것은 Driver 이기 때문이다 (메인 쓰레드에서 UI관련 동작을 할때는 에러가 났다고 앱을 종료시키거나 할 수 없기때문에 그냥 지나간다.)
        .catchErrorJustReturn([])
    }
    
    // parse jsonData
    static func parse(json: Any) -> [Repository] {
        guard let items = json as? [[String: Any]] else {
            return []
        }
        var repositories = [Repository]()

        items.forEach {
            guard let name = $0["name"] as? String,
                let url = $0["html_url"] as? String else {
                    return
            }
            repositories.append(Repository(name: name, url: url))
        }
        return repositories
    }
}
