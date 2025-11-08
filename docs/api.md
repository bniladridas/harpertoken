# API Serving

After training, serve the model via API:
```sh
pip install fastapi uvicorn
python scripts/api.py  # Or uvicorn scripts.api:app --reload
```

## API Endpoints

- `GET /`: API info
- `POST /predict`: QA prediction (json: {"question": "...", "context": "..."})

## Example Usage

```python
import requests

response = requests.post("http://localhost:8000/predict", json={
    "question": "What is the capital of France?",
    "context": "France is a country in Europe. Its capital is Paris."
})
print(response.json())
```
