#!/usr/bin/env bash

studyDir=/project/2420132.01/data/chimps

for subj in Barbara Callie Cissie Elvira Evelyne Fiona Foxy Frannie Jacqueline Jewelle Leslie Marietta Sabrina Wenka; do

#brainmask: /hpc/meca/data/Chimpanzees/ChimpsFromCAT12/subject3T/$subj/t1mri/default_acquisition/default_analysis/segmentation/brain_$subj.nii.gz
#anat: /hpc/meca/data/Chimpanzees/ChimpsFromCAT12/subject3T/Bo_Yerkes/t1mri/default_acquisition/$subj.nii.gz

#copy to subject directory

#mv $studyDir/${subj}.nii.gz $studyDir/${subj}/${subj}_bv_T1.nii.gz
#mv $studyDir/brain_${subj}.nii.gz $studyDir/${subj}/${subj}_bv_mask.nii.gz
cd $studyDir/${subj}

brainmask=$studyDir/${subj}/${subj}_bv_mask.nii.gz
anat=$studyDir/${subj}/${subj}_bv_T1.nii.gz
dwi=$studyDir/${subj}/Diffusion_bpx_ARD.bedpostX/mean_f1samples.nii.gz
ss=$studyDir/${subj}/${subj}_bv_T1_SS.nii.gz

#try using anat_skullstripped to see if it gives better registration

#fslmaths $anat -mas $brainmask $ss

#compute registration with dof 6 and cost mutual info (can play around with other options: mutualinfo,corratio,normcorr,normmi,leastsq,labeldiff,bbr)

#flirt -in $ss -ref $dwi -omat anat_to_dwib0.mat -out anat_to_dwib0.nii.gz -dof 6 -cost corratio -searchcost corratio 

#apply registration to tranform mask (anat) to dwib0

#flirt -in $brainmask -ref $dwi -out brainmask_to_dwib0.nii.gz -init anat_to_dwib0.mat -applyxfm -interp nearestneighbour

#qsub -l walltime=2:00:00,mem=4gb -V $scriptname	

cp anat_to_dwib0.nii.gz $studyDir/anat_to_dwib0_${subj}.nii.gz

done

