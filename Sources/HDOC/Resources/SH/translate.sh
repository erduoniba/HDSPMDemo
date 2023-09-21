# otool 获取 swift 类
otool_dispose() {
    # 输出类结构以及定义的方法
    otool -ov HDSwiftPMDemo > otool_data.txt

    otool_allclass=""
    # 使用while循环和read命令逐行读取文件并打印
    while IFS= read -r line
    do
        if [[ $line == "        name           "* ]]; then
            # 使用awk命令提取" "最后面的数据
            # name 0x100150a00 _TtC9Alamofire7Adapter 得到 _TtC9Alamofire7Adapter
            symbol=$(echo $line | awk -F" " '{print $NF}')
            # 对swift代码demangle得到源码
            swiftdata=$(xcrun swift-demangle $symbol)

            # 使用awk命令提取"--->"后面的数据
            data=$(echo $swiftdata | awk -F"--->" '{print $2}')
            echo $data

            if [[ $otool_allclass == *$data* ]]; then
                echo "已经包含了该 $data"
            else
                otool_allclass="$otool_allclass\n$data"
            fi
        fi
    done < "otool_data.txt"

    echo $otool_allclass > otool_classes.txt
}

otool_dispose