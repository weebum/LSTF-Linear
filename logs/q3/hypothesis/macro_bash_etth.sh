#for model_name in Autoformer Informer Transformer
for model_name in Informer Transformer
do
for e_layers in 1 2 3 4
do
for d_layers in 1 2 3 4
do
vi $model_name'_Etth1_96_e'$e_layers'_d'$d_layers.log
done
done
done
