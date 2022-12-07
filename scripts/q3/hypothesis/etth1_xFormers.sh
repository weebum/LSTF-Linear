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

prefix='taskset --cpu-list 16,17,18,19,20,21,22,23'

for model_name in Autoformer Informer Transformer
do 
for pred_len in 96
do
for e_layers in 1 2 3 4
do
for d_layers in 1 2 3 4
do
  $prefix python -u run_longExp.py \
      --gpu 2 \
      --test_flop \
      --e_layers $e_layers \
      --is_training 1 \
      --root_path ./dataset/ \
      --data_path ETTh1.csv \
      --model_id ETTh1_96_$pred_len \
      --model $model_name \
      --data ETTh1 \
      --features M \
      --seq_len 96 \
      --label_len 48 \
      --pred_len $pred_len \
      --e_layers $e_layers \
      --d_layers $d_layers \
      --factor 3 \
      --enc_in 7 \
      --dec_in 7 \
      --c_out 7 \
      --des 'Exp' \
      --itr 1  >logs/q3/hypothesis/$model_name'_Etth1_'$pred_len'_e'$e_layers'_d'$d_layers.log
  
done
done
done
done
