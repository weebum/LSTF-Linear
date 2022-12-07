# ALL scripts in this file come from Autoformer
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

prefix='taskset --cpu-list 48,49,50,51,52,53,54,55'


for model_name in Autoformer Informer Transformer
do 
for pred_len in 96 192 336 720
do
  $prefix python -u run_longExp.py \
    --gpu 6 \
    --test_flop \
    --is_training 1 \
    --root_path ./dataset/ \
    --data_path exchange_rate.csv \
    --model_id exchange_96_$pred_len \
    --model $model_name \
    --data custom \
    --features M \
    --seq_len 96 \
    --label_len 48 \
    --pred_len $pred_len \
    --e_layers 2 \
    --d_layers 1 \
    --factor 3 \
    --enc_in 8 \
    --dec_in 8 \
    --c_out 8 \
    --des 'Exp' \
    --itr 1 \
    --train_epochs 1 >logs/LongForecasting/$model_name'_exchange_rate_'$pred_len.log
done
done
