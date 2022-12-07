for model_name in Autoformer Informer Transformer
do
for d_model in 128 256 512 1024
do
vi $model_name'_Etth1_96_emb'$d_model.log
done
done
