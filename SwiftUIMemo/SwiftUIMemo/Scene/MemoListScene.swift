//
//  MemoListScene.swift
//  SwiftUIMemo
//
//  Created by JH on 2021/02/01.
//

import SwiftUI

struct MemoListScene: View {
	// 뷰가 생성되는 시점에 공유데이터 목록을 확인하고 스토어 속성과 동일한 형식을 가진 객체가 등록되어 있다면 자동 저장해줌
	// 하나의 데이터를 여러 뷰에서 공유
	@EnvironmentObject var store: MemoStore
	@EnvironmentObject var formatter: DateFormatter
	
    var body: some View {
		NavigationView {
			List(store.list) { memo in
				// 뷰는 최대한 분리하는 게 좋습니다.
				// SwiftUI는 뷰를 분리한다고 오버헤드가 생기지 않는다고 합니다.
				MemoCell(memo: memo)
			}
			.navigationTitle("내 메모")
			// Modifier 메소드
			// SwiftUI에선 특별한 메소드 활용하여 필요한 속성을 바꾸거나 뷰를 조작함
		}
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
		MemoListScene()
			.environmentObject(MemoStore())
			.environmentObject(DateFormatter.memoDateFormatter)
    }
}
