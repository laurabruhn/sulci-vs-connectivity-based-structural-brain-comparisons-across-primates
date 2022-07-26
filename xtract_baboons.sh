#!/usr/bin/env bash

studyDir=/project/2420132.01/data/baboon_adrien
maskDir=/project/2420132.01/data/baboon_adrien/xtract_baboon_masks

#for tract in ilf_l; do

#for subj in sub-Clara sub-Filosophie sub-Taline sub-Vanessa sub-Geraldine sub-Rubis sub-Alf sub-Arthur sub-Babar sub-Bibou sub-Fabienne sub-Brigitte sub-Falbala sub-Fidji sub-Fildar sub-Garcia sub-Icono sub-Pirouette sub-Tatie sub-Tuba sub-Calisto sub-Chet sub-Celine sub-IvarJr; do

command0="for tract in ac af_l af_r cc_myown ar_l ar_r atr_l atr_r cbd_l cbd_r cbp_l cbp_r cbt_l cbt_r cst_l cst_r fa_l fa_r fma fmi fx_l fx_r ifo_l ifo_r ilf_l ilf_r mcp mdlf_l mdlf_r or_l or_r ptr_l ptr_r slf1_l slf1_r slf2_l slf2_r slf3_l slf3_r str_l str_r uf_l uf_r vof_l vof_r; do"

command1="for subj in sub-Geraldine sub-Rubis sub-Alf sub-Arthur sub-Babar sub-Bibou sub-Fabienne sub-Brigitte sub-Falbala sub-Fidji sub-Fildar sub-Garcia sub-Icono sub-Pirouette sub-Tatie sub-Tuba sub-Calisto sub-Chet sub-Celine sub-IvarJr; do"
# 

#NATIVE SPACE: MASKS THAT WE CREATED (in maskDir) ARE WARPED FROM HAIKO SPACE TO NATIVE SPACE, WHERE TRACKING IS DONE AND TRACT RESULTS ARE SAVED

command2a="xtract -bpx $studyDir/$subj/bedpostx.bedpostX -out $studyDir/$subj/xtract_native -p $maskDir -str /project/2420132.01/scripts/xtract_scripts/tractfile_${tract} -ptx_options /project/2420132.01/scripts/xtract_scripts/probtrackx_options -stdwarp $studyDir/$subj/bedpostx.bedpostX/xfms/standard2diff.nii.gz $studyDir/$subj/bedpostx.bedpostX/xfms/diff2standard.nii.gz -native -gpu"

#STANDARD SPACE: WE LET XTRACT DO THE SAME BUT AT THE END XTRACT WARPS RESULTS BACK TO HAIKO SPACE (and then we average)

command2b="xtract -bpx $studyDir/$subj/bedpostx.bedpostX -out $studyDir/$subj/xtract_haiko -p $maskDir -str /project/2420132.01/scripts/xtract_scripts/tractfile_${tract} -ptx_options /project/2420132.01/scripts/xtract_scripts/probtrackx_options_baboon -stdwarp $studyDir/$subj/bedpostx.bedpostX/xfms/standard2diff.nii.gz $studyDir/$subj/bedpostx.bedpostX/xfms/diff2standard.nii.gz -gpu"

#usually use: -str $maskDir/structureList

#build averages (do not include subject-loop-commands in script!!)

command3="mkdir -p /project/2420132.01/data/baboon_atlas/average_tracts/tracts_new_new/\$tract"

command4="fsladd /project/2420132.01/data/baboon_atlas/average_tracts/tracts_new_new/\$tract/densityNorm.nii.gz -m $studyDir/*/xtract_haiko/tracts_new_new/\$tract/densityNorm.nii.gz"

command5="flirt -in $studyDir/$subj/xtract_native/tracts/\$tract/densityNorm.nii.gz -ref $studyDir/$subj/xtract_native/tracts/\$tract/densityNorm.nii.gz -out $studyDir/$subj/xtract_native/tracts/\${tract}_1mm.nii.gz -applyisoxfm 1"

command6="done"

command7="done"


#echo "Submitting to batch..."
  scriptname=/project/2420132.01/scripts/script_downsample_tracts_${subj}
  
 # echo "module load cuda/10.0" > $scriptname
  echo "module unload fsl" >> $scriptname
  echo "module load fsl/6.0.3" >> $scriptname
  echo "$command0" >> $scriptname
 # echo "$command1" >> $scriptname
 # echo "$command2a" >> $scriptname
 # echo "$command2b" >> $scriptname
 # echo "$command3" >> $scriptname
 # echo "$command4" >> $scriptname
  echo "$command5" >> $scriptname
  echo "$command6" >> $scriptname


chmod u+rwx $scriptname

#choose between cpu and gpu

#qsub -l walltime=1:00:00,mem=4gb -V $scriptname
#qsub -l 'nodes=1:gpus=1, feature=cuda, walltime=1:00:00, mem=50gb, reqattr=cudacap>=5.0' $scriptname

#done
#done