#!/bin/bash

# Activate venv
source venv/bin/activate

# Install deps if needed
python3 -c "import yaml, transformers, torch" 2>/dev/null || pip install -r requirements.txt

# Load version and config
VERSION=$(python3 -c "from __version__ import __version__; print(__version__)")
python3 scripts/load_config.py

# Header
echo "Harpertoken CLI v$VERSION"

# Prompt function
prompt() { read -p "$1 [$2]: " input; echo "${input:-$2}"; }

# Config prompts
DATASET=$(prompt "Dataset" "${FT_DATASET:-squad}")
TASK=$(prompt "Task" "${FT_TASK:-qa}")
TUNE_CHOICE=$(prompt "Tune" "$([ "${FT_TUNE:-false}" = "true" ] && echo "y" || echo "n")")
TUNE=$([ "$TUNE_CHOICE" = "y" ] && echo "true" || echo "false")
[ "$TUNE" = "false" ] && EPOCHS=$(prompt "Epochs" "${FT_EPOCHS:-1}") && BATCH_SIZE=$(prompt "Batch" "${FT_BATCH_SIZE:-2}") && LR=$(prompt "LR" "${FT_LR:-2e-5}")
UPLOAD_CHOICE=$(prompt "Upload" "$([ "${FT_UPLOAD:-false}" = "true" ] && echo "y" || echo "n")")
UPLOAD=$([ "$UPLOAD_CHOICE" = "y" ] && echo "true" || echo "false")

# Summary
echo "Config: $DATASET | $TASK | $EPOCHS epochs | $BATCH_SIZE batch | $LR lr | Upload: $UPLOAD"

# Confirm
[ "$(prompt "Proceed" "y")" != "y" ] && echo "Cancelled." && exit 0

# Set environment variables for scripts
export FT_DATASET=$DATASET
export FT_TASK=$TASK
export FT_TUNE=$TUNE
export FT_EPOCHS=$EPOCHS
export FT_BATCH_SIZE=$BATCH_SIZE
export FT_LR=$LR
export FT_UPLOAD=$UPLOAD
export PYTHONPATH=.

# Run training script
echo "Starting training..."
python scripts/train.py

# Run evaluation script
echo "Starting evaluation..."
python scripts/evaluate.py

echo "Build completed successfully!"
