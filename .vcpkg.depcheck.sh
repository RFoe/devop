#!/bin/bash

# 检查 vcpkg
if ! command -v vcpkg &> /dev/null; then
    echo "错误: vcpkg 未在 PATH 中。"
    exit 1
fi

# 获取包名参数（必须）
if [ $# -eq 0 ]; then
    echo "用法: $0 <target_pkg> [DEBUG=1 for verbose]"
    echo "示例: $0 boost-asio"
    echo "调试: DEBUG=1 $0 boost-asio"
    exit 1
fi

target_pkg="$1"
debug=${DEBUG:-0}

# 提取当前 triplet（仅显示，从第一行）
triplet=$(vcpkg list | tail -n +2 | head -1 | awk -F: '{print $2}' | awk '{print $1}' 2>/dev/null || echo "unknown")
echo "检测到 triplet: ${triplet}（使用完整 pkg:triplet）"

# 获取完整包列表（pkg:triplet，去重）
packages=$(vcpkg list | tail -n +2 | awk '{print $1}' | sort -u)
num_packages=$(echo "$packages" | wc -l)  # wc -l for lines
echo "总包数: ${num_packages}"

if [ -z "$packages" ]; then
    echo "无已安装包。"
    exit 1
fi

echo "快速检查 ${target_pkg} 的反向依赖（串行模式）..."
echo "==============================================="

# 串行循环：用完整 pkg:triplet
dependent_packages=()
if [ "$debug" = "1" ]; then
    echo "=== DEBUG MODE: 输出每个包的 depend-info (前100 chars) ==="
fi

for pkg in $packages; do
    output=$(vcpkg depend-info "$pkg" --format=list --max-recurse=0 2>/dev/null)
    if [ $? -ne 0 ] || [ -z "$output" ]; then
        [ "$debug" = "1" ] && echo "包 ${pkg}: 失败/空"
        continue
    fi
    [ "$debug" = "1" ] && echo "包 ${pkg}: ${output:0:100}..."
    if echo "$output" | grep -q -F "${target_pkg}"; then
        echo "✓ 匹配: ${pkg}"
        dependent_packages+=("$pkg")
    fi
done

if [ ${#dependent_packages[@]} -eq 0 ]; then
    echo "无包依赖 ${target_pkg}。"
else
    echo "依赖 ${target_pkg} 的包:"
    printf '%s\n' "${dependent_packages[@]}" | sort
    echo "总计: ${#dependent_packages[@]} 个"
fi
