export BERT_BASE_DIR=multi_cased_L-12_H-768_A-12
export KORE_DIR=ko_re_data

python run_classifier.py \
  --do_lower_case=False \
  --task_name=KORE \
  --do_train=true \
  --do_eval=true \
  --data_dir=$KORE_DIR/ \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --max_seq_length=128 \
  --train_batch_size=32 \
  --learning_rate=2e-5 \
  --num_train_epochs=3.0 \
  --output_dir=/tmp/kore_output/
