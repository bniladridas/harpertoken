import os
import yaml

# Load config from config.yaml if exists
config_file = 'config.yaml'
if os.path.exists(config_file):
    with open(config_file, 'r') as f:
        config = yaml.safe_load(f)
else:
    config = {}

# Set env vars with defaults
os.environ['FT_DATASET'] = config.get('dataset', 'squad')
os.environ['FT_TASK'] = config.get('task', 'qa')
os.environ['FT_EPOCHS'] = str(config.get('epochs', 1))
os.environ['FT_BATCH_SIZE'] = str(config.get('batch_size', 2))
os.environ['FT_LR'] = str(config.get('learning_rate', 2e-5))
os.environ['FT_UPLOAD'] = str(config.get('upload', False)).lower()
os.environ['FT_TUNE'] = str(config.get('tune', False)).lower()
hf_token = config.get('hf_token', '')
if hf_token:
    os.environ['HF_TOKEN'] = hf_token

print("Config loaded.")