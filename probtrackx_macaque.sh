for subj in 032125 032126 032127 032128 032130 032131 032132 032133 032134 032135 032136 032137 032138 032140 032141 032142 032143; do

studyDir=/project/2420132.01/data/macaques/sub-$subj/

#echo "module unload cuda
#module unload fsl
#module load cuda/9.1
#module load fsl/6.0.5
#probtrackx2_gpu -x $studyDir/${subj}_Lwhite_dwi_fsl.surf.gii -s $studyDir/bedpostx.bedpostX/merged -m $studyDir/bedpostx.bedpostX/nodif_brain_mask.nii.gz --target2=$studyDir/anat_to_dwib0.nii.gz --seedref=$studyDir/anat_to_dwib0.nii.gz --opd --omatrix2 --dir=$studyDir/fdtmatrix2_L --nsamples=2500 --steplength=0.2 --meshspace='first'" > /project/2420132.01/scripts/macaques/probtrackx/${subj}_probtrackx

echo "module unload cuda
module unload fsl
module load cuda/9.1
module load fsl/6.0.5
probtrackx2_gpu -x $studyDir/${subj}_Rwhite_dwi_fsl.surf.gii -s $studyDir/bedpostx.bedpostX/merged -m $studyDir/bedpostx.bedpostX/nodif_brain_mask.nii.gz --target2=$studyDir/anat_to_dwib0.nii.gz --seedref=$studyDir/anat_to_dwib0.nii.gz --opd --omatrix2 --dir=$studyDir/fdtmatrix2_R --nsamples=2500 --steplength=0.2 --meshspace='first'" > /project/2420132.01/scripts/macaques/probtrackx/${subj}_probtrackx_right


done
