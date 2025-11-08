---
language: en
license: mit
tags:
- question-answering
- distilbert
- squad
- fine-tuned
datasets:
- squad
---

# Model Card for HarpertokenConvAI-Finetuned

## Model Details

- **Model Name**: harpertoken/harpertokenConvAI-finetuned
- **Base Model**: harpertoken/harpertokenConvAI (DistilBERT-based)
- **Fine-tuned For**: Question Answering
- **Training Data**: Subset of SQuAD dataset
- **Framework**: Transformers
- **License**: MIT

## Intended Use

This model is fine-tuned for extractive question answering tasks. It can answer questions based on provided context passages.

### Usage

```python
from transformers import pipeline

qa_pipeline = pipeline("question-answering", model="harpertoken/harpertokenConvAI-finetuned")
result = qa_pipeline(question="What is the capital of France?", context="France is a country in Europe. Paris is the capital of France.")
print(result)
```

## Training

- **Epochs**: 1 (in CI, configurable)
- **Batch Size**: 1 (in CI, configurable)
- **Learning Rate**: 2e-5 (in CI, configurable)
- **Device**: MPS (if available) or CPU

## Limitations

- Trained on a small subset of SQuAD
- May not perform well on out-of-domain questions
- Requires context for accurate answers

## Performance

Trained for minimal epochs in CI environment. Evaluate on your data for actual metrics.

## Contact

For issues or contributions, see the main repository.