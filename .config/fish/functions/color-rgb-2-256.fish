function index2levels4chroma -d "色インデックスを空白区切りにした3つのレベル値に変換"
    set -l index $argv[1] # ローカル変数の設定

    # 赤レベルの算出
    set -l red_level (math "$index / (6 ^ 2)")
    test $red_level -ge 6 # 6以上のとき
        and set red_level 5

    # 緑レベルの算出
    set -l green_level (math "($index - (6 ^ 2) * $red_level) / 6")
    test $grenn_level -ge 6
        and set green_level 5

    # 青レベルの算出
    set -l blue_level (math "$index - (6 ^ 2) * $red_level - 6 * $green_level")

    printf '%d %d %d' $red_level $green_level $blue_level
end

function level2hex4chroma -d "レベル値を16進数の明度値のコードに変換"
    switch $argv[1]
        case 0
            printf 00
        case 1 2 3 4 5
            printf '%02x' (math "95 + 40 * ($argv[1] - 1)")
    end
end

function index2code4chroma -d "色インデックスを24bitコードへ変換(有彩色用)"
    set -l levels (index2levels4chroma $argv[1])
    set -l list (string split ' ' "$levels")
    printf '#%s%s%s' \
        (level2hex4chroma $list[1]) \
        (level2hex4chroma $list[2]) \
        (level2hex4chroma $list[3])
end