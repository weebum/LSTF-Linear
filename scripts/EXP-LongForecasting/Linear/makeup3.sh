# add --individual for DLinear-I
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/makeup3" ]; then
    mkdir ./logs/makeup3
fi
seq_len=104 # seq_len=336 is unfair ground for linear model.
model_name=DLinear

prefix='taskset --cpu-list 40,41,42,43,44,45,46,47'

for pred_len in 24 36 48 60
do
for dataset in ili
do
$prefix python -u run_longExp.py \
  --gpu 5 \
  --test_flop \
  --is_training 1 \
  --root_path ./dataset/ \
  --data_path national_illness.csv \
  --model_id ili_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --pred_len $pred_len \
  --enc_in 8 \
  --des 'Exp' \
  --itr 1 --batch_size 8 --learning_rate 0.0005 >logs/makeup3/$model_name'_ili_'$seq_len'_'$pred_len.log
done
done
