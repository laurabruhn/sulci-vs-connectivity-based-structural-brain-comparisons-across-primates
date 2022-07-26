#!/usr/bin/env bash

#for running in directory containing all your input files

studyDir=/project/2420132.01/data/baboon_adrien

for subj in Clara Filosophie Taline Vanessa; do

#Step 1: Make brainmask (from preprocessing) with the same size as the anat (from brainvisa)

#this is the brainmask from my preprocessing, with manual editing, based on this anatomical volume.
command="
#brainmask=/hpc/meca/users/loh.k/baboon_cerimed/preproc/brainvisa_inputs/_session_01_subject_${subj}/_session_01_subject_${subj}_brainmask.nii.gz 
#anat=/hpc/meca/data/Baboons/BV_Baboons/Adrien/_session_01_subject_${subj}/t1mri/default_acquisition/_session_01_subject_${subj}.nii.gz

#copy to subject directory

#mkdir $studyDir/sub-${subj}/mask
cp $studyDir/sub-${subj}/mask/_session_01_subject_${subj}.nii.gz $studyDir/sub-${subj}/mask/anat_T1.nii.gz
cp $studyDir/sub-${subj}/mask/_session_01_subject_${subj}_brainmask.nii.gz $studyDir/sub-${subj}/mask/manual_mask.nii.gz

cd $studyDir/sub-${subj}/mask

brainmask=manual_mask.nii.gz
anat=anat_T1.nii.gz 

#run zeropad to make brainmask the same size as the anat (basically just padding zeros around the mask until the same as the anat)

3dZeropad -master anat_T1.nii.gz -prefix brainmask_zp.nii.gz manual_mask.nii.gz

#Step 2: Compute linear registrations

fslroi $studyDir/sub-${subj}/Diffusion/dwifslpreproc-tmp-*/dwi_pe_1_applytopup.nii.gz dwi_pe_1_applytopup_first_b0.nii.gz 0 1

dwib0=dwi_pe_1_applytopup_first_b0.nii.gz
mask=brainmask_zp.nii.gz

#try using anat_skullstripped to see if it gives better registration

fslmaths anat_T1.nii.gz -mas brainmask_zp.nii.gz anat_SS.nii.gz

#compute registration with dof 6 and cost mutual info (can play around with other options: mutualinfo,corratio,normcorr,normmi,leastsq,labeldiff,bbr)

flirt -in anat_SS.nii.gz -ref dwi_pe_1_applytopup_first_b0.nii.gz -omat anat_to_dwib0.mat -out anat_to_dwib0.nii.gz -dof 6 -cost corratio -searchcost corratio 

#compute inverse transformation from dwi to anat just for fun

convert_xfm -omat dwib0_to_anat.mat -inverse anat_to_dwib0.mat

#apply registration to tranform mask (anat) to dwib0

flirt -in brainmask_zp.nii.gz -ref dwi_pe_1_applytopup_first_b0.nii.gz -out brainmask_to_dwib0.nii.gz -init anat_to_dwib0.mat -applyxfm -interp nearestneighbour
"


echo "Submitting to batch..."
  scriptname=/project/2420132.01/scripts/script_baboon_mask_${subj}
echo "module load afni" > $scriptname
echo "$command" >> $scriptname


chmod a+rwx $scriptname

qsub -l walltime=2:00:00,mem=4gb -V $scriptname	

done

