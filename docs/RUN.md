# 运行命令

- 项目：GPT-SoVITS
- 生成时间：2026-09-09
- 运行方式：直接运行（优先项目 `.venv`；亦可 conda `GPTSoVits` / Docker）
- 硬件评估：**满足**（空卡约 15GB / RTX 4080 16GB）
  - 依据：推理默认半精度；V3 全量微调约 14GB、LoRA 约 8GB，均 ≤16GB。

## 环境准备

```powershell
$env:Path = "E:\Programs\ffmpeg-master-latest-win64-gpl\bin;" + $env:Path
cd E:\AI\local-voice\GPT-SoVITS

# 本次已用 uv 创建 .venv（Python 3.10）并安装 requirements（清华源）
# 注意：uv 从 cu124/cu128 index 常解析到 Windows CPU 轮；需用带 +cu124 的直链 wheel：
# uv venv --python 3.10 .venv
# uv pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple --python .\.venv\Scripts\python.exe
# uv pip install "https://download.pytorch.org/whl/cu124/torch-2.6.0%2Bcu124-cp310-cp310-win_amd64.whl" "https://download.pytorch.org/whl/cu124/torchaudio-2.6.0%2Bcu124-cp310-cp310-win_amd64.whl" --python .\.venv\Scripts\python.exe
# 当前 .venv：torch 2.6.0+cu124，cuda True。备用 conda：GPTSoVits（2.11.0+cu128）

# 官方 install.ps1 走 conda（会装 ffmpeg/cmake 进 conda，非项目目录）：
# pwsh -NoProfile -File .\install.ps1 -Device CU128 -Source HF-Mirror
```

预训练底模已在 `GPT_SoVITS\pretrained_models\`。本机另有可用 conda：`C:\Users\wang\miniconda3\envs\GPTSoVits`（torch cu128）。

## 启动

- 推荐：`pwsh -NoProfile -File .\start.ps1`
- 说明：菜单可选 `webui` / `api_v2` / `api`；默认 webui。不要默认全开。
- 端口：webui 起点 `47811`（环境变量 `GPT_SOVITS_WEBUI_PORT`）；api_v2 `9880`；api `47888`。
- 等价手动：

```powershell
.\.venv\Scripts\python.exe -I webui.py zh_CN
.\.venv\Scripts\python.exe api_v2.py -a 127.0.0.1 -p 9880
.\.venv\Scripts\python.exe api.py -a 127.0.0.1 -p 47888
```

`start.ps1` Python 查找顺序：`.venv` → conda `GPTSoVits` → `runtime\python.exe`。

## 验证

1. `.venv`：`torch 2.6.0+cu124`，`cuda True`（已确认）。
2. WebUI / API 能加载权重并合成；**未长时间启动 GPU 服务**。
3. 旧 `go-webui.ps1` 依赖 `runtime\python.exe`（本机无）；`start-webui.ps1` 指向 conda。

## 备注 / 发现问题

- **无官方 bundled `runtime\`**；原先 `go-webui.ps1` 无法直接用。
- **uv 从 PyTorch cu* index 易装到 `2.x+cpu`**：需用 `torch-2.6.0+cu124` 直链 wheel（见上方命令）。
- 官方 `install.ps1` 会 `conda install ffmpeg cmake`（全局/conda，勿再拷进项目）。
- ffmpeg 用本机 `E:\Programs\ffmpeg-master-latest-win64-gpl\bin`。
- PyPI 直连慢 → 清华；模型下载可用 HF-Mirror。
