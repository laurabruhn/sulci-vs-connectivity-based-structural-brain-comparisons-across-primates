#!/usr/bin/env bash

studyDir=/project/2420132.01/data/humans

for subj in 103111 103414 107321 108525 108828 114419 117324 118730 121618 123117 138231 144832 147030 150726 152831 153429 154936 156233 156637 158540 173536 173940 180129 188347 189450 193239 194645 198350 201111 210415 211316 211417 212116 212217 214423 214726 268850 285345 303119 304020 445543 530635 540436 545345 580044 583858 598568 673455 759869 788876; do

#mkdir -p /project/2420132.01/data/humans/$subj/bedpostx
#cp -r /project/3022017.01/S500-20140625/$subj/T1w/Diffusion/ /project/2420132.01/data/humans/$subj/bedpostx
#echo "module load cuda/9.1" > /project/2420132.01/scripts/humans/bedpostx/${subj}_bedpostx
#echo "bedpostx_gpu /project/2420132.01/data/humans/$subj/bedpostx/Diffusion -g" >> /project/2420132.01/scripts/humans/bedpostx/${subj}_bedpostx

#echo "flirt -in $studyDir/$subj/bedpostx/Diffusion.bedpostX/mean_f1samples.nii.gz -ref /opt/fsl/6.0.3/data/standard/MNI152_T1_1mm_brain.nii.gz -omat $studyDir/$subj/diff2std.mat -out $studyDir/$subj/diff2std_linear.nii.gz" > /project/2420132.01/scripts/humans/warp/${subj}_warp
#echo "fnirt --ref=/opt/fsl/6.0.3/data/standard/MNI152_T1_1mm_brain.nii.gz --in=$studyDir/$subj/bedpostx/Diffusion.bedpostX/mean_f1samples.nii.gz --aff=$studyDir/$subj/diff2std.mat --iout=$studyDir/$subj/diff2std_nonlinear.nii.gz --cout=$studyDir/$subj/bedpostx/Diffusion.bedpostX/xfms/diff2standard.nii.gz" >> /project/2420132.01/scripts/humans/warp/${subj}_warp
#echo "invwarp -w $studyDir/$subj/bedpostx/Diffusion.bedpostX/xfms/diff2standard.nii.gz -o $studyDir/$subj/bedpostx/Diffusion.bedpostX/xfms/standard2diff.nii.gz -r $studyDir/$subj/bedpostx/Diffusion.bedpostX/mean_f1samples.nii.gz" >> /project/2420132.01/scripts/humans/warp/${subj}_warp

#echo "module load cuda/10.0" > /project/2420132.01/scripts/humans/xtract/${subj}_xtract
#echo "module unload fsl" >> /project/2420132.01/scripts/humans/xtract/${subj}_xtract
#echo "module load fsl/6.0.3" >> /project/2420132.01/scripts/humans/xtract/${subj}_xtract
#echo "xtract -bpx $studyDir/$subj/bedpostx/Diffusion.bedpostX -out $studyDir/$subj/xtract_native -species HUMAN -ptx_options /project/2420132.01/scripts/xtract_scripts/probtrackx_options -native -gpu" >> /project/2420132.01/scripts/humans/xtract/${subj}_xtract

#echo "mkdir $studyDir/$subj/tracts" > /project/2420132.01/scripts/humans/xtract/${subj}_downsample
echo "for tract in ac af_l af_r ar_l ar_r atr_l atr_r cbd_l cbd_r cbp_l cbp_r cbt_l cbt_r cst_l cst_r fa_l fa_r fma fmi fx_l fx_r ifo_l ifo_r ilf_l ilf_r mcp mdlf_l mdlf_r or_l or_r slf1_l slf1_r slf2_l slf2_r slf3_l slf3_r str_l str_r uf_l uf_r vof_l vof_r; do" > /project/2420132.01/scripts/humans/xtract/${subj}_downsample
echo "flirt -in $studyDir/$subj/xtract_native/tracts/\$tract/densityNorm.nii.gz -ref $studyDir/$subj/xtract_native/tracts/\$tract/densityNorm.nii.gz -out $studyDir/$subj/tracts/\${tract}_2.5mm.nii.gz -applyisoxfm 2.5" >> /project/2420132.01/scripts/humans/xtract/${subj}_downsample
echo "done" >> /project/2420132.01/scripts/humans/xtract/${subj}_downsample

qsub -l walltime=2:00:00,mem=5gb -V /project/2420132.01/scripts/humans/xtract/${subj}_downsample
#qsub -l 'nodes=1:gpus=1, feature=cuda, walltime=5:00:00, mem=50gb, reqattr=cudacap>=5.0' /project/2420132.01/scripts/humans/xtract/${subj}_xtract

done
