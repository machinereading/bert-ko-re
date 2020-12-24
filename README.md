# Korean Relation Extraction using BERT

## About
Korean Relation Extraction using BERT Fine-tuning

## Introduction
It is based on [BERT](https://github.com/google-research/bert) model. 
We use "BERT-Base, Multilingual Cased" model for Korean.
We share training/test data, script, and a little modified source code in this repository.
You can download a [BERT](https://github.com/google-research/bert) and [MODEL](https://storage.googleapis.com/bert_models/2018_11_23/multi_cased_L-12_H-768_A-12.zip), then easily combine to adjust a Korean RE model.

## Licenses
* `CC BY-NC-SA` [Attribution-NonCommercial-ShareAlike](https://creativecommons.org/licenses/by-nc-sa/2.0/)
* If you want to commercialize this resource, [please contact to us](http://mrlab.kaist.ac.kr/contact)

## How to use
Train: ``sentence_classifier.sh``
<br>&nbsp;BERT_BASE_DIR: BERT Language Model, ``multi_cased_L-12_H-768_A-12``
<br>&nbsp;KORE_DIR: Dataset path
<br>&nbsp;TRAINED_CLASSIFIER: Path to trained model (save)
```
  --do_lower_case=False \    # boolean, lower case or not in BERT language model
  --task_name=KORE \         # String, task name (KORE: Korean Relation Extraction)
  --do_train=true \          # boolean, train or not
  --do_eval=true \           # boolean, evaluation or not
  --data_dir=$KORE_DIR/ \    # String, data file (train, dev, test) path
  --vocab_file=$BERT_BASE_DIR/vocab.txt \    # String, BERT language model vocabulary path
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \   # String, BERT config file path
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \     # String, BERT model check point path
  --max_seq_length=128 \     # Integer, max input sequence length
  --train_batch_size=32 \    # Integer, batch size
  --learning_rate=2e-5 \     # Double, learning rate
  --num_train_epochs=3.0 \   # Integer, train epoches
  --ngram=0 \                # Integer, N-gram centered by two entities (default: 0)
  --output_dir=$TRAINED_CLASSIFIER \       # String, Path to trained model (save)
  --output_csv=$KORE_DIR/output_200612.csv # String, Path to evaluation result
```
Test: ``sentence_prediction.sh``

### How to run
``input_formatter.py [INPUT_CSV] [OUTPUT_TSV]``
<br>and<br>
Set train/dev/test file path in ``class KoreProcessor - run_classifier.py`` 
<br>and<br>
``sentence_classifier.sh`` or ``sentence_prediction.sh``

### Data Example
```
22일 영국 <e2>맨체스터</e2>시 <e1>맨체스터 아레나</e1>에서 자폭 테러로 의심되는 폭탄 테러가 발생하면서 유럽이 다시 한번 테러 공포에 떨고 있다.,location
```
CSV format; sentence with two target entities, relation
<br>
```
location	맨체스터 아레나	맨체스터	22일 영국 <e2>맨체스터</e2>시 <e1>맨체스터 아레나</e1>에서 자폭 테러로 의심되는 폭탄 테러가 발생하면서 유럽이 다시 한번 테러 공포에 떨고 있다.
```
TSV format; relation, subject, object, and sentence with two entities


## Publisher
[Machine Reading Lab](http://mrlab.kaist.ac.kr/) @ KAIST

## Acknowledgement
This work was supported by Institute for Information & communications Technology Promotion(IITP) grant funded by the Korea government(MSIT) (2013-0-00109, WiseKB: Big data based self-evolving knowledge base and reasoning platform)
