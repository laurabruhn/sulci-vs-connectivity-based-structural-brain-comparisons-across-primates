for subj in 103111 103414 107321 108525 108828 114419 117324 118730 121618 123117 138231 144832 147030 150726 152831; do

studyDir=/project/2420132.01/data/humans

echo "module unload cuda
module unload fsl
module load cuda/9.1
module load fsl/6.0.5
probtrackx2_gpu -x $studyDir/${subj}_Lwhite_dwi_fsl.surf.gii -s $studyDir/$subj/bedpostx/Diffusion.bedpostX/merged -m $studyDir/$subj/bedpostx/Diffusion.bedpostX/nodif_brain_mask.nii.gz --target2=$studyDir/$subj/anat_to_dwib0_2.5mm.nii.gz --seedref=$studyDir/$subj/anat_to_dwib0_2.5mm.nii.gz --opd --omatrix2 --dir=$studyDir/$subj/fdtmatrix2_L --nsamples=2500 --meshspace='first'" > /project/2420132.01/scripts/humans/fdt_matrix/${subj}_fdt_left

echo "module unload cuda
module unload fsl
module load cuda/9.1
module load fsl/6.0.5
probtrackx2_gpu -x $studyDir/${subj}_Rwhite_dwi_fsl.surf.gii -s $studyDir/$subj/bedpostx/Diffusion.bedpostX/merged -m $studyDir/$subj/bedpostx/Diffusion.bedpostX/nodif_brain_mask.nii.gz --target2=$studyDir/$subj/anat_to_dwib0_2.5mm.nii.gz --seedref=$studyDir/$subj/anat_to_dwib0_2.5mm.nii.gz --opd --omatrix2 --dir=$studyDir/$subj/fdtmatrix2_R --nsamples=2500 --meshspace='first'" > /project/2420132.01/scripts/humans/fdt_matrix/${subj}_fdt_right


done
