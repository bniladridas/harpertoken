# Installation

[![Python](https://img.shields.io/badge/Python-3.14+-blue.svg)](https://www.python.org/downloads/)
[![Version](https://img.shields.io/badge/Version-0.1.0-orange.svg)]()
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## Setup

1. **Clone or set up the project** (assuming local setup):
    ```sh
    # Project is already in /Users/niladri/Desktop/model
    cd /Users/niladri/Desktop/model
    ```

2. **Create Virtual Environment**:
    ```sh
    python3 -m venv venv
    ```

3. **Activate Virtual Environment**:
    ```sh
    source venv/bin/activate
    ```

4. **Install Dependencies**:
    ```sh
    pip install -r requirements.txt
    # Optional: Install code quality tools
    pip install black flake8 mypy
    ```

## Requirements

- Python >= 3.14
- PyTorch with MPS support (Mac M1)
- 8GB RAM minimum
- Supported runtimes: macOS with Apple Silicon