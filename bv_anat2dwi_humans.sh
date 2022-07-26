#!/usr/bin/env bash

studyDir=/project/2420132.01/data/humans

for subj in 103414 107321 108525 108828 114419 117324 118730 121618 123117 138231 144832 147030 150726 152831 153429 154936 156233 156637 158540 173536 173940 180129 188347 189450 193239 194645 198350 201111 210415 211316 211417 212116 212217 214423 214726 268850 285345 303119 304020 445543 530635 540436 545345 580044 583858 598568 673455 759869 788876; do

#brainmask: /envau/work/meca/data/HCP/data/BV_database/subjects/103111/t1mri/HCP_pipeline_modified/default_analysis/segmentation/brain_$subj.nii.gz
#anat: /envau/work/meca/data/HCP/data/BV_database/subjects/103111/t1mri/HCP_pipeline_modified/$subj.nii.gz

#copy to subject directory

#mv $studyDir/${subj}.nii.gz $studyDir/${subj}/${subj}_bv_T1.nii.gz
#mv $studyDir/brain_${subj}.nii.gz $studyDir/${subj}/${subj}_bv_mask.nii.gz
cd $studyDir/${subj}

brainmask=$studyDir/${subj}/${subj}_bv_mask.nii.gz
anat=$studyDir/${subj}/${subj}_bv_T1.nii.gz
dwi=$studyDir/${subj}/bedpostx/Diffusion.bedpostX/mean_f1samples.nii.gz
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

