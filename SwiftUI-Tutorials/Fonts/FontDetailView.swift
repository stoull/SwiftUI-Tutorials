//
//  FontDetailView.swift
//  SwiftUI-Tutorials
//
//  Created by hut on 2024/7/13.
//

import SwiftUI

struct FontDetailView: View {
    var font: MyFont
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading) {
                Spacer().frame(height: 20)
                Text("春风 夏雨 秋霜 冬雪\n春风吹 夏雨落 秋霜降 冬雪飘\n青草 红花 游鱼 飞鸟\n池草青 山花红 鱼出水 鸟入林\n")
                    .font(font.font)
                Text("村居（清 高鼎）\n草长莺飞二月天，拂堤杨柳醉春烟。\n儿童散学归来早，忙趁东风放纸鸢。\n")
                    .font(font.font)
                Text("Rain is falling all around\nIt falls on field and tree\nIt rains on the umbrella here\nAnd on the ships at sea\n")
                    .font(font.font)
                Text("森さんは　七時に　おきます。\n森さんは　先週　休みました。\nわたしは　昨日　働きませんでした。\n我庭の小草萌えいでぬ限りなき天地今やよみがへるらし. \n")
                    .font(font.font)
                Text("Peindre d'abord une cage\navec une porte ouverte\npeindre ensuite\nquelque chose de joli\nquelque chose de simple\nquelque chose de beau\nquelque chose d'utile\npour l'oiseau\n")
                    .font(font.font)
                Text("Inclinado en las tardes tiro mis tristes redes\na tus ojos oceánicos.\nInclinado en las tardes echo mis tristes redes\na ese mar que sacude tus ojos oceánicos.\n")
                    .font(font.font)
                Text("소시\n생명의 나무 위\n꽃 한 송이\n시들어 나의 품 안에 떨어져,\n내 마음에 가볍게 내려놓는다.\n그녀는 내 마음 가운데 음악과 녹아들어\n소시 한 송이가 되었다.\n")
                    .font(font.font)
                Text("Wer jetzt weint irgendwo in der Welt,\nohne Grund weint in der Welt,\nweint über mich.\nWer jetzt lacht irgendwo in der Nacht,vohne Grund lacht in der Nacht,\nlacht mich aus.\nWer jetzt geht irgendwo in der Welt,\nohne Grund geht in der Welt,\ngeht zu mir.\nWer jetzt stirbt irgendwo in der Welt,\nohne Grund stirbt in der Welt:\nsieht mich an.\n")
                    .font(font.font)
                Text("雨湿被子 Rain wet quilt 雨に濡れたキルト couette mouillée par la pluie")
                    .font(font.font)
            }
            .padding()
        }
        .navigationTitle(font.name)
    }
}

#Preview {
    FontDetailView(font: MyFont(id: "testId", name: "body", font: .body))
}
