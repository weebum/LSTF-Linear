for dataset in electricity ETTh1 ETTh2 ETTm1 ETTm2 exchange_rate traffic weather
do
for pred_len in 96 192 336 720
do
vi DLinear_$dataset'_96_'$pred_len.log
done
done

#for model_name in Autoformer Informer Transformer
for model_name in Informer Transformer
do
for dataset in electricity Etth1 Etth2 Ettm1 Ettm2 exchange_rate traffic weather
do
for pred_len in 96 192 336 720
do
vi $model_name'_'$dataset'_'$pred_len.log
done
done
done
