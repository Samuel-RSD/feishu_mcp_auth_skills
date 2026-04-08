#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
VENV_DIR="$ROOT_DIR/.venv"
PY_BIN="${PYTHON_BIN:-python3}"

echo "[1/5] 检查 Python..."
command -v "$PY_BIN" >/dev/null 2>&1 || { echo "未找到 python3"; exit 1; }

if [ ! -d "$VENV_DIR" ]; then
  echo "[2/5] 创建虚拟环境..."
  "$PY_BIN" -m venv "$VENV_DIR"
fi

# shellcheck disable=SC1091
source "$VENV_DIR/bin/activate"

echo "[3/5] 安装 Python 依赖..."
pip install -U pip
pip install playwright pillow opencv-python-headless rapidocr-onnxruntime

echo "[4/5] 安装 Playwright Chromium..."
python -m playwright install chromium || python -m playwright install --with-deps chromium

echo "[5/5] 检查系统浏览器..."
if command -v google-chrome >/dev/null 2>&1; then
  echo "检测到 google-chrome"
elif command -v chromium >/dev/null 2>&1; then
  echo "检测到 chromium"
elif command -v chromium-browser >/dev/null 2>&1; then
  echo "检测到 chromium-browser"
else
  echo "未检测到系统 Chrome/Chromium。"
  echo "建议安装其一："
  echo "  sudo apt update"
  echo "  sudo apt install -y chromium-browser"
fi

echo "安装完成。下一步执行："
echo "  source $VENV_DIR/bin/activate"
echo "  python $ROOT_DIR/scripts/configure_skill.py"
