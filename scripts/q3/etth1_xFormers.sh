# ALL scripts in this file come from Autoformer
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/q3" ]; then
    mkdir ./logs/q3
fi

if [ ! -d "./logs/q3/hypothesis" ]; then
    mkdir ./logs/q3/hypothesis
fi

prefix='taskset --cpu-list 24,25,26,27,28,29,30,31'

for model_name in Autoformer Informer Transformer
do 
for pred_len in 96
do
for d_model in 128 256 512 1024
do
  $prefix python -u run_longExp.py \
      --gpu 3 \
      --test_flop \
      --is_training 1 \
      --d_model $d_model \
      --root_path ./dataset/ \
      --data_path ETTh1.csv \
      --model_id ETTh1_96_$pred_len \
      --model $model_name \
      --data ETTh1 \
      --features M \
      --seq_len 96 \
      --label_len 48 \
      --pred_len $pred_len \
      --e_layers 2 \
      --d_layers 1 \
      --factor 3 \
      --enc_in 7 \
      --dec_in 7 \
      --c_out 7 \
      --des 'Exp' \
      --itr 1  >logs/q3/$model_name'_Etth1_'$pred_len'_emb'$d_model.log
  
done
done
done
