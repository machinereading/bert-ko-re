#!/usr/bin/env bash
export BERT_BASE_DIR=multi_cased_L-12_H-768_A-12
export KORE_DIR=ko_re_data
export TRAINED_CLASSIFIER=trained_model/ko_re_output_all_50

python run_classifier.py \
    --do_lower_case=False \
    --task_name=KORE \
    --do_predict=True \
    --data_dir=$KORE_DIR \
    --vocab_file=$BERT_BASE_DIR/vocab.txt \
    --bert_config_file=$BERT_BASE_DIR/bert_config.json \
    --init_checkpoint=$TRAINED_CLASSIFIER \
    --max_seq_length=128 \
    --output_dir=$TRAINED_CLASSIFIER
