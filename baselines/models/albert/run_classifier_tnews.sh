CURRENT_DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
export CUDA_VISIBLE_DEVICES="0"
export ALBERT_XLARGE_DIR=$CURRENT_DIR/prev_trained_model/albert_xlarge_zh
export GLUE_DIR=$CURRENT_DIR/../../glue/chineseGLUEdatasets/
TASK_NAME="tnews"
python run_classifier.py \
  --task_name=$TASK_NAME \
  --do_train=true \
  --do_eval=true \
  --data_dir=$GLUE_DIR/$TASK_NAME \
  --vocab_file=$ALBERT_XLARGE_DIR/vocab.txt \
  --bert_config_file=$ALBERT_XLARGE_DIR/albert_config_xlarge.json \
  --init_checkpoint=$ALBERT_XLARGE_DIR/albert_model.ckpt \
  --max_seq_length=128 \
  --train_batch_size=32 \
  --learning_rate=2e-5 \
  --num_train_epochs=3.0 \
  --output_dir=$CURRENT_DIR/${TASK_NAME}_output/
