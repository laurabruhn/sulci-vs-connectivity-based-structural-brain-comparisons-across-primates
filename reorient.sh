#!/usr/bin/env bash

studyDir=/project/2420132.01/data/baboon_adrien

module load afni
module load mrtrix
module load gcc

for subj in sub-Clara sub-Filosophie sub-Taline sub-Vanessa; do

#mkdir $studyDir/$subj/dwi_reorient

#for dir in AP PA; do

#cp $studyDir/$subj/ses-01/dwi/${subj}_ses-01_dir-${dir}_run-01_dwi.nii.gz $studyDir/$subj/dwi_reorient/${dir}_original.nii.gz
#cp $studyDir/$subj/ses-01/dwi/${subj}_ses-01_dir-${dir}_run-01_dwi.bvec $studyDir/$subj/dwi_reorient/${dir}_original.bvec
#cp $studyDir/$subj/ses-01/dwi/${subj}_ses-01_dir-${dir}_run-01_dwi.bval $studyDir/$subj/dwi_reorient/${dir}_original.bval

#REORIENT

#3drefit -deoblique -orient RPI $studyDir/$subj/dwi_reorient/${dir}_original.nii.gz
#fslreorient2std $studyDir/$subj/dwi_reorient/${dir}_original.nii.gz $studyDir/$subj/dwi_reorient/${dir}_reorient.nii.gz

#CHECK

#bet $studyDir/$subj/dwi_reorient/AP_reorient.nii.gz $studyDir/$subj/dwi_reorient/mask.nii.gz
#fslmaths $studyDir/$subj/dwi_reorient/mask.nii.gz -bin $studyDir/$subj/dwi_reorient/mask.nii.gz
#dtifit -k $studyDir/$subj/dwi_reorient/AP_reorient.nii.gz -r $studyDir/$subj/dwi_reorient/AP_original.bvec -b $studyDir/$subj/dwi_reorient/AP_original.bval -m $studyDir/$subj/dwi_reorient/mask.nii.gz -o $studyDir/$subj/dwi_reorient/reorient

#done

#USE NEW bval AND bvec TO CREATE .MIF FILES

mkdir $studyDir/$subj/Diffusion
mrconvert -fslgrad $studyDir/$subj/dwi_reorient/AP_original.bvec $studyDir/$subj/dwi_reorient/AP_original.bval $studyDir/$subj/dwi_reorient/AP_reorient.nii.gz $studyDir/$subj/Diffusion/${subj}_ses-01_dir-AP_dwi.mif -force
mrconvert $studyDir/$subj/dwi_reorient/PA_reorient.nii.gz $studyDir/$subj/Diffusion/${subj}_ses-01_dir-PA_dwi.mif -force

done
