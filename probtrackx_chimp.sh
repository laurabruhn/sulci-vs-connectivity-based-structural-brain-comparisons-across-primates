for subj in Bo Callie Cissie Elvira Evelyne Fiona Foxy Frannie Jewelle Leslie Marietta Sabrina Wenka; do

studyDir=/project/2420132.01/data/chimps/$subj/

echo "module unload cuda
module unload fsl
module load cuda/9.1
module load fsl/6.0.5
probtrackx2_gpu -x $studyDir/${subj}_Lwhite_dwi_fsl.surf.gii -s $studyDir/Diffusion_bpx_ARD.bedpostX/merged -m $studyDir/Diffusion_bpx_ARD.bedpostX/nodif_brain_mask.nii.gz --target2=$studyDir/anat_to_dwib0.nii.gz --seedref=$studyDir/anat_to_dwib0.nii.gz --opd --omatrix2 --dir=$studyDir/fdtmatrix2_L --nsamples=2500 --meshspace='first'" > /project/2420132.01/scripts/chimps/${subj}_fdt 

#echo "module unload cuda
#module unload fsl
#module load cuda/9.1
#module load fsl/6.0.5
#probtrackx2_gpu -x $studyDir/${subj}_Rwhite_dwi_fsl.surf.gii -s $studyDir/Diffusion_bpx_ARD.bedpostX/merged -m $studyDir/Diffusion_bpx_ARD.bedpostX/nodif_brain_mask.nii.gz --target2=$studyDir/anat_to_dwib0.nii.gz --seedref=$studyDir/anat_to_dwib0.nii.gz --opd --omatrix2 --dir=$studyDir/fdtmatrix2_R --nsamples=2500 --meshspace='first'" > /project/2420132.01/scripts/chimps/${subj}_fdt_right

done
