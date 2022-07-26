for subj in Alf Arthur Babar Celine Falbala Fildar Garcia Icono IvarJr; do

studyDir=/project/2420132.01/data/baboon_adrien/sub-$subj/

echo "module unload cuda
module unload fsl
module load cuda/9.1
module load fsl/6.0.5
probtrackx2_gpu -x $studyDir/${subj}_Rwhite_dwi_fsl.surf.gii -s $studyDir/bedpostx.bedpostX/merged -m $studyDir/bedpostx.bedpostX/nodif_brain_mask.nii.gz --target2=$studyDir/anat_to_dwib0.nii.gz --seedref=$studyDir/anat_to_dwib0.nii.gz --opd --omatrix2 --dir=$studyDir/fdtmatrix2_R --nsamples=2500 --steplength=0.2 --meshspace='first'" > /project/2420132.01/scripts/baboons/fdt_matrix/probtrackx_${subj}_right.sh

done
