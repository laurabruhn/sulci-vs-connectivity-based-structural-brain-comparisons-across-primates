#!/usr/bin/env bash

studyDir=/project/2420132.01/data/baboon_adrien

#beforehand, reorient with reorient.sh script

for subj in sub-Clara sub-Filosophie sub-Taline sub-Vanessa; do

command1="mkdir $studyDir/$subj/Diffusion"

#dwigradcheck requires 4D volume, so not applicable to PA
command2="
mrconvert -fslgrad $studyDir/$subj/ses-01/dwi/${subj}_ses-01_dir-PA_dwi.bvec $studyDir/$subj/ses-01/dwi/${subj}_ses-01_dir-PA_dwi.bval $studyDir/$subj/ses-01/dwi/${subj}_ses-01_dir-PA_dwi.nii.gz $studyDir/$subj/Diffusion/${subj}_ses-01_dir-PA_dwi.mif -force
mrconvert -fslgrad $studyDir/$subj/ses-01/dwi/${subj}_ses-01_dir-AP_dwi.bvec $studyDir/$subj/ses-01/dwi/${subj}_ses-01_dir-AP_dwi.bval $studyDir/$subj/ses-01/dwi/${subj}_ses-01_dir-AP_dwi.nii.gz $studyDir/$subj/Diffusion/${subj}_ses-01_dir-AP_dwi.mif -force
"

command3="
dwigradcheck $studyDir/$subj/Diffusion/${subj}_ses-01_dir-AP_dwi.mif -export_grad_fsl AP_bvecs AP_bvals
mrconvert -fslgrad AP_bvecs AP_bvals $studyDir/$subj/dwi_reorient/AP_reorient.nii.gz $studyDir/$subj/Diffusion/${subj}_ses-01_dir-AP_dwi.mif -force"


#dwidenoise requires 4D volume, so not applicable to PA
command4="dwidenoise $studyDir/$subj/Diffusion/${subj}_ses-01_dir-AP_dwi.mif $studyDir/$subj/Diffusion/${subj}_ses-01_dir-AP_dwi_denoised.mif -force"

#for those subjects with 6 PA volumes
command4PA="dwidenoise $studyDir/$subj/Diffusion/${subj}_ses-01_dir-PA_dwi.mif $studyDir/$subj/Diffusion/${subj}_ses-01_dir-PA_dwi_denoised.mif -force"

#degibbs AP and PA
command5="mrdegibbs $studyDir/$subj/Diffusion/${subj}_ses-01_dir-AP_dwi_denoised.mif $studyDir/$subj/Diffusion/${subj}_ses-01_dir-AP_dwi_degibbs.mif -force"

command6="mrdegibbs $studyDir/$subj/Diffusion/${subj}_ses-01_dir-PA_dwi.mif $studyDir/$subj/Diffusion/${subj}_ses-01_dir-PA_dwi_degibbs.mif -force"

#for those subjects with 6 PA volumes
command6PA="mrdegibbs $studyDir/$subj/Diffusion/${subj}_ses-01_dir-PA_dwi_denoised.mif $studyDir/$subj/Diffusion/${subj}_ses-01_dir-PA_dwi_degibbs.mif -force"

#pair first b0 of AP and b0 of PA
command7="mrconvert $studyDir/$subj/Diffusion/${subj}_ses-01_dir-AP_dwi_degibbs.mif -coord 3 0 -axes 0,1,2  $studyDir/$subj/Diffusion/${subj}_ses-01_dir-AP_dwi_degibbs_first-b0.mif -force"
command8="mrcat -axis 3 $studyDir/$subj/Diffusion/${subj}_ses-01_dir-AP_dwi_degibbs_first-b0.mif $studyDir/$subj/Diffusion/${subj}_ses-01_dir-PA_dwi_degibbs.mif $studyDir/$subj/Diffusion/${subj}_ses-01_dwi_b0-pair.mif -force"

#for those subjects with 6 PA volumes
command7PA="mrconvert $studyDir/$subj/Diffusion/${subj}_ses-01_dir-PA_dwi_degibbs.mif -coord 3 0 -axes 0,1,2  $studyDir/$subj/Diffusion/${subj}_ses-01_dir-PA_dwi_degibbs_first-b0.mif -force"
command8PA="mrcat -axis 3 $studyDir/$subj/Diffusion/${subj}_ses-01_dir-AP_dwi_degibbs_first-b0.mif $studyDir/$subj/Diffusion/${subj}_ses-01_dir-PA_dwi_degibbs_first-b0.mif $studyDir/$subj/Diffusion/${subj}_ses-01_dwi_b0-pair.mif -force"

#dwifslpreproc
#requirement for -align_seepi option: same TE, TR and flip angle for PA and AP series. Checked for Celine:
#AP series: TE=0.0884 TR=5.016 flip=85
#PA series: TE=0.0884 TR=5.016 flip=85

#The idea here is to first run dwifslpreproc without the eddy-mask specification to get a decent image to which a good, manually edited mask can be registered. 
#Then, I run dwifslpreproc again, specifying it such that it does not run topup again and giving it my own mask.

#This is faster if it is run on a GPU because eddy has a cuda version.

command9a="
dwifslpreproc $studyDir/$subj/Diffusion/${subj}_ses-01_dir-AP_dwi_degibbs.mif $studyDir/$subj/Diffusion/${subj}_ses-01_dwi_geomcorr_AP.mif -rpe_pair -se_epi $studyDir/$subj/Diffusion/${subj}_ses-01_dwi_b0-pair.mif -pe_dir AP -align_seepi -scratch $studyDir/$subj/Diffusion -eddy_options \" --slm=linear --data_is_shelled\" -force -nocleanup"

#Now, register mask -> reg_mask2dwi_baboon.sh

command9b="dwifslpreproc $studyDir/$subj/Diffusion/dwifslpreproc-*/dwi_pe_1_applytopup.mif $studyDir/$subj/Diffusion/${subj}_ses-01_dwi_geomcorr_AP.mif -rpe_none -pe_dir AP -scratch $studyDir/$subj/Diffusion -eddy_mask $studyDir/$subj/mask/brainmask_to_dwib0.nii.gz -eddy_options \" --slm=linear --data_is_shelled\" -force"

#dwibiascorrect
command10="dwibiascorrect ants $studyDir/$subj/Diffusion/${subj}_ses-01_dwi_geomcorr_AP.mif $studyDir/$subj/Diffusion/${subj}_ses-01_dwi_biascorr.mif -mask $studyDir/$subj/mask/brainmask_to_dwib0.nii.gz -force"

#prepare for bedpostx
command11="mkdir $studyDir/$subj/bedpostx"
command12="dwigradcheck $studyDir/$subj/Diffusion/${subj}_ses-01_dwi_biascorr.mif -export_grad_fsl $studyDir/$subj/bedpostx/bvecs $studyDir/$subj/bedpostx/bvals"
command13="cp $studyDir/$subj/mask/brainmask_to_dwib0.nii.gz $studyDir/$subj/bedpostx/nodif_brain_mask.nii.gz"
command14="mrconvert $studyDir/$subj/Diffusion/${subj}_ses-01_dwi_biascorr.mif $studyDir/$subj/bedpostx/data.nii.gz -force"

#This command only works on a gpu.
command15="bedpostx_gpu $studyDir/$subj/bedpostx"

#Add registration files "native-haiko" and "haiko-native" manually to bedpostx.bedpostX/xfms directory
command16="bash /project/2420132.01/scripts/do_reg_haiko.sh $studyDir/$subj/mask/anat_to_dwib0.nii.gz $studyDir/$subj/mask/T1toHaiko"
command17="cp $studyDir/$subj/mask/T1toHaiko_anat_to_haiko_warp.nii.gz $studyDir/$subj/bedpostx.bedpostX/xfms/diff2standard.nii.gz"
command18="cp $studyDir/$subj/mask/T1toHaiko_haiko_to_anat_warp.nii.gz $studyDir/$subj/bedpostx.bedpostX/xfms/standard2diff.nii.gz"

#Now, execute xtract script (this script is tract-wise so I keep it separate)

echo "Submitting to batch..."
  scriptname=/project/2420132.01/scripts/script_${subj}

  echo "module load mrtrix" > $scriptname
  echo "module load gcc" >> $scriptname
  echo "module load cuda/9.1" >> $scriptname
  echo "module load ANTs" >> $scriptname
  echo "cd $studyDir/$subj/Diffusion" >> $scriptname
 # echo "$command1" >> $scriptname
 # echo "$command2" >> $scriptname
 # echo "$command3" >> $scriptname
 # echo "$command4" >> $scriptname
 # echo "$command4PA" >> $scriptname
 # echo "$command5" >> $scriptname
 # echo "$command6PA" >> $scriptname
 # echo "$command7" >> $scriptname
 # echo "$command7PA" >> $scriptname
 # echo "$command8PA" >> $scriptname
 # echo "$command9b" >> $scriptname
 # echo "$command10" >> $scriptname
 # echo "$command11" >> $scriptname 
 # echo "$command12" >> $scriptname
 # echo "$command13" >> $scriptname
 # echo "$command14" >> $scriptname
 # echo "$command15" >> $scriptname
  echo "$command16" >> $scriptname
  echo "$command17" >> $scriptname
  echo "$command18" >> $scriptname


chmod u+rwx $scriptname

#choose between cpu and gpu

#qsub -l walltime=10:00:00,mem=10gb -V $scriptname
qsub -l 'nodes=1:gpus=1, feature=cuda, walltime=02:00:00, mem=10gb, reqattr=cudacap>=5.0' $scriptname

	
   done