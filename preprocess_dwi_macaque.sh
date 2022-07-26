#!/usr/bin/env bash

#modules needed: mrtrix, gcc, ANTs, cuda

MRCATDIR=/opt/mr-cat/latest
studyDir=/project/2420132.01/data/UC-Davis_Macaques

for subj in sub-032126; do

	
#convert to mif (takes few seconds)
command1="
mkdir $studyDir/$subj/Diffusion
mrconvert $studyDir/$subj/ses-001/dwi/${subj}_ses-001_run-1_dwi.nii.gz $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi.mif -fslgrad $studyDir/$subj/ses-001/dwi/${subj}_ses-001_run-1_dwi.bvec $studyDir/$subj/ses-001/dwi/${subj}_ses-001_run-1_dwi.bval -json_import $studyDir/$subj/ses-001/dwi/${subj}_ses-001_run-1_dwi.json -force"
command2="mrconvert $studyDir/$subj/ses-001/dwi/${subj}_ses-001_run-2_dwi.nii.gz $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi.mif -fslgrad $studyDir/$subj/ses-001/dwi/${subj}_ses-001_run-2_dwi.bvec $studyDir/$subj/ses-001/dwi/${subj}_ses-001_run-2_dwi.bval -json_import $studyDir/$subj/ses-001/dwi/${subj}_ses-001_run-2_dwi.json -force"
command3="mrconvert $studyDir/$subj/ses-001/dwi/${subj}_ses-001_acq-RevPol_run-1_dwi.nii.gz $studyDir/$subj/Diffusion/${subj}_ses-001_acq-RevPol_run-1_dwi.mif -fslgrad $studyDir/$subj/ses-001/dwi/${subj}_ses-001_acq-RevPol_run-1_dwi.bvec $studyDir/$subj/ses-001/dwi/${subj}_ses-001_acq-RevPol_run-1_dwi.bval -json_import $studyDir/$subj/ses-001/dwi/${subj}_ses-001_acq-RevPol_run-1_dwi.json -force"
command4="mrconvert $studyDir/$subj/ses-001/dwi/${subj}_ses-001_acq-RevPol_run-2_dwi.nii.gz $studyDir/$subj/Diffusion/${subj}_ses-001_acq-RevPol_run-2_dwi.mif -fslgrad $studyDir/$subj/ses-001/dwi/${subj}_ses-001_acq-RevPol_run-2_dwi.bvec $studyDir/$subj/ses-001/dwi/${subj}_ses-001_acq-RevPol_run-2_dwi.bval -json_import $studyDir/$subj/ses-001/dwi/${subj}_ses-001_acq-RevPol_run-2_dwi.json -force"

#DWIDENOISE (takes 40min): dMRI noise level estimation and denoising based on random matrix theory
command5="dwidenoise $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_denoised.mif -force"
command6="dwidenoise $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_denoised.mif -force"
command7="dwidenoise $studyDir/$subj/Diffusion/${subj}_ses-001_acq-RevPol_run-1_dwi.mif $studyDir/$subj/Diffusion/${subj}_ses-001_acq-RevPol_run-1_dwi_denoised.mif -force"
command8="dwidenoise $studyDir/$subj/Diffusion/${subj}_ses-001_acq-RevPol_run-2_dwi.mif $studyDir/$subj/Diffusion/${subj}_ses-001_acq-RevPol_run-2_dwi_denoised.mif -force"

#MRDEGIBBS (takes 20min): remove Gibbs ringing artefacts using the method of local subvoxel-shifts 
command9="mrdegibbs $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_denoised.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_degibbs.mif -force"
command10="mrdegibbs $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_denoised.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_degibbs.mif -force"
command11="mrdegibbs $studyDir/$subj/Diffusion/${subj}_ses-001_acq-RevPol_run-1_dwi_denoised.mif $studyDir/$subj/Diffusion/${subj}_ses-001_acq-RevPol_run-1_dwi_degibbs.mif -force"
command12="mrdegibbs $studyDir/$subj/Diffusion/${subj}_ses-001_acq-RevPol_run-2_dwi_denoised.mif $studyDir/$subj/Diffusion/${subj}_ses-001_acq-RevPol_run-2_dwi_degibbs.mif -force"

#concatenate (takes few seconds)
command13="mrcat -axis 3 $studyDir/$subj/Diffusion/${subj}_ses-001_acq-RevPol_run-1_dwi_degibbs.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_degibbs.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_pair.mif -force"
command14="mrcat -axis 3 $studyDir/$subj/Diffusion/${subj}_ses-001_acq-RevPol_run-2_dwi_degibbs.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_degibbs.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_pair.mif -force"

#DWIFSLPREPROC (takes around 24 hours): runs configurated topup and eddy by fsl
command15="dwifslpreproc $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_pair.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_geomcorr_AP.mif -rpe_all -pe_dir AP -scratch $studyDir/$subj/Diffusion -force"
command16="dwifslpreproc $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_pair.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_geomcorr_AP.mif -rpe_all -pe_dir AP -scratch $studyDir/$subj/Diffusion -force"

#BIAS REMOVAL (...): perform B1 field inhomogeneity correction
command17="dwibiascorrect ants $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_geomcorr_AP.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_biascorr.mif -force" 
command18="dwibiascorrect ants $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_geomcorr_AP.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_biascorr.mif -force"

#conversion of final output back to .nii.gz
command19="mrconvert $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_biascorr.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_preprocessed.nii.gz"
command20="mrconvert $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_biascorr.mif $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_preprocessed.nii.gz"

#register runs to each other based on average of six b0 volumes (first six volumes)
command21="
fslroi $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_preprocessed.nii.gz $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_preprocessed_b0.nii.gz 0 6
fslmaths $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_preprocessed_b0.nii.gz -Tmean $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_preprocessed_b0_mean.nii.gz
"
command22="
fslroi $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_preprocessed.nii.gz $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_preprocessed_b0.nii.gz 0 6
fslmaths $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_preprocessed_b0.nii.gz -Tmean $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_preprocessed_b0_mean.nii.gz
"
command23="
flirt -in $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_preprocessed_b0_mean.nii.gz -ref $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_preprocessed_b0_mean.nii.gz -omat $studyDir/$subj/Diffusion/transform_runs
flirt -in $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_preprocessed.nii.gz -ref $studyDir/$subj/Diffusion/${subj}_ses-001_run-2_dwi_preprocessed_b0_mean.nii.gz -applyxfm -init $studyDir/$subj/Diffusion/transform_runs -out $studyDir/$subj/Diffusion/${subj}_ses-001_run-1_dwi_preprocessed_registered.nii.gz
"


echo "Submitting to batch..."
  scriptname=/project/2420132.01/scripts/script_${subj}


  echo "module load mrtrix" > $scriptname
  echo "module load gcc" >> $scriptname
  echo "module load ANTs" >> $scriptname
  echo "$command1" >> $scriptname
  echo "$command2" >> $scriptname
  echo "$command3" >> $scriptname
  echo "$command4" >> $scriptname
  echo "$command5" >> $scriptname
  echo "$command6" >> $scriptname
  echo "$command7" >> $scriptname
  echo "$command8" >> $scriptname
  echo "$command9" >> $scriptname 
  echo "$command10" >> $scriptname
  echo "$command11" >> $scriptname
  echo "$command12" >> $scriptname
  echo "$command13" >> $scriptname
  echo "$command14" >> $scriptname
  echo "$command15" >> $scriptname
  echo "$command16" >> $scriptname
  echo "$command17" >> $scriptname
  echo "$command18" >> $scriptname
  echo "$command19" >> $scriptname
  echo "$command20" >> $scriptname
  echo "$command21" >> $scriptname
  echo "$command22" >> $scriptname
  echo "$command23" >> $scriptname
 


		chmod a+rwx $scriptname
		qsub -l walltime=48:00:00,mem=50gb -V $scriptname
		

done
