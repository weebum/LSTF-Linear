# ALL scripts in this file come from Autoformer
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

prefix='taskset --cpu-list 56,57,58,59,60,61,62,63'

for model_name in Autoformer Informer Transformer
do 
for pred_len in 24 36 48 60
do
  $prefix python -u run_longExp.py \
    --gpu 7 \
    --test_flop \
    --is_training 1 \
    --root_path ./dataset/ \
    --data_path national_illness.csv \
    --model_id ili_36_$pred_len \
    --model $model_name \
    --data custom \
    --features M \
    --seq_len 36 \
    --label_len 18 \
    --pred_len $pred_len \
    --e_layers 2 \
    --d_layers 1 \
    --factor 3 \
    --enc_in 7 \
    --dec_in 7 \
    --c_out 7 \
    --des 'Exp' \
    --itr 1 >logs/LongForecasting/$model_name'_ili_'$pred_len.log
done
done
