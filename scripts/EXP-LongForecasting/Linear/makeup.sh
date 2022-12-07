# add --individual for DLinear-I
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi
seq_len=96 # seq_len=336 is unfair ground for linear model.
model_name=DLinear

prefix='taskset --cpu-list 0,1,2,3,4,5,6,7'

seq_len=104

for pred_len in 24 36 48 60
do
for dataset in ili
do
$prefix python -u run_longExp.py \
  --test_flop \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path national_illness.csv \
  --model_id ili_104_$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len 104 \
  --pred_len $pred_len \
  --enc_in 8 \
  --des 'Exp' \
  --itr 1 --batch_size 8 --learning_rate 0.0005 >logs/LongForecasting/$model_name'_ili_'$seq_len'_'$pred_len.log
done
done
