@echo off
REM Fish Speech S2-Pro API + WebUI (http://localhost:8080/ui)
REM FISH_MAX_SEQ_LEN=4096 keeps S2-Pro within 16 GB VRAM.
REM --compile needs triton-windows; first start compiles for ~20 min, later starts use the cache.
cd /d "%~dp0"
set FISH_MAX_SEQ_LEN=4096
.venv\Scripts\python.exe tools\api_server.py --listen 127.0.0.1:8080 ^
  --llama-checkpoint-path checkpoints\s2-pro ^
  --decoder-checkpoint-path checkpoints\s2-pro\codec.pth ^
  --decoder-config-name modded_dac_vq ^
  --compile
