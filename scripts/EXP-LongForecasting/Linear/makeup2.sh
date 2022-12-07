# add --individual for DLinear-I
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/makeup2" ]; then
    mkdir ./logs/makeup2
fi

prefix='taskset --cpu-list 24,25,26,27,28,29,30,31'

seq_len=104
model_name=DLinear

for pred_len in 24 36 48 60
do
for dataset in ili
do
$prefix python -u run_longExp.py \
  --gpu 3 \
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
  --itr 1 --batch_size 8 --learning_rate 0.0005 >logs/makeup2/$model_name'_ili_'$seq_len'_'$pred_len.log
done
done
