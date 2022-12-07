Code based on https://github.com/cure-lab/LTSF-Linear.

## Modifications
1. Resolved RuntimeEror raised by passing argument --gpu n with n > 1.
2. Parsed xFormer shell scripts into multiple scripts and concatenated xLinear model evaluation.
3. Concatenated input to xFormers and unpacked the inputs to measure flops. 

## Notice
0. Unzip the TSF benchmark dataset into *dataset* directory.

1. Bash commands

Linear
```
bash scripts/EXP-LongForecasting/Linear/DLinear_Long.sh
# [Default] GPU 0, CPU 0~7
```
xFormer
```
bash scripts/EXP-LongForecasting/Formers_Long/*dataset-name*.sh
# dataset-name = {electricity, etth1, etth2, ettm1, ettm2, exchange_rate, ili, traffic, weather}
# [Default] GPU n, CPU 8n ~ 8n+7
# e.g. etth2 -> GPU 3, GPU 24~31
```

Or alternatively, you can use the default shell script command from https://github.com/cure-lab/LTSF-Linear.
