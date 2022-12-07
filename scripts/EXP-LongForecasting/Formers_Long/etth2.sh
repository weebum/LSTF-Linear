# ALL scripts in this file come from Autoformer
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

prefix='taskset --cpu-list 24,25,26,27,28,29,30,31'


for model_name in Autoformer Informer Transformer
do 
for pred_len in 96 192 336 720
do
  $prefix python -u run_longExp.py \
      --gpu 3 \
      --test_flop \
      --is_training 1 \
      --root_path ./dataset/ \
      --data_path ETTh2.csv \
      --model_id ETTh2_96_$pred_len \
      --model $model_name \
      --data ETTh2 \
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
      --itr 1  >logs/LongForecasting/$model_name'_Etth2_'$pred_len.log
done
done
