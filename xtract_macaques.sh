studyDir=/project/2420132.01/data/UC-Davis_Macaques

for subj in sub-032125 sub-032126 sub-032127 sub-032128 sub-032130 sub-032131 sub-032132 sub-032133 sub-032134 sub-032135 sub-032136 sub-032137 sub-032138 sub-032140 sub-032141 sub-032142 sub-032143; do

#sub-032129 

tract=cbp_r

#for tract in ac af_l af_r ar_l ar_r atr_l atr_r cbd_l cbd_r cbp_l cbp_r cbt_l cbt_r cst_l cst_r fa_l fa_r fma fmi fx_l fx_r ifo_l ifo_r ilf_l ilf_r mcp mdlf_l mdlf_r or_l or_r ptr_l ptr_r str_l str_r uf_l uf_r vof_l vof_r slf1_l slf1_r slf2_l slf2_r slf3_l slf3_r; do

echo "xtract -bpx $studyDir/$subj/bedpostx.bedpostX -out $studyDir/$subj/xtract_native -p /project/2420132.01/data/UC-Davis_Macaques/xtract_masks -str /project/2420132.01/scripts/xtract_scripts/tractfile_${tract} -ptx_options /project/2420132.01/scripts/xtract_scripts/probtrackx_options -stdwarp $studyDir/$subj/bedpostx.bedpostX/xfms/standard2diff.nii.gz $studyDir/$subj/bedpostx.bedpostX/xfms/diff2standard.nii.gz -gpu -native" >> /project/2420132.01/scripts/xtract_scripts/xtract_native_${tract}

#mkdir -p $studyDir/tracts/$tract
#fsladd $studyDir/tracts/$tract/densityNorm_${tract}.nii.gz -m $studyDir/*/xtract_f99/tracts/$tract/densityNorm.nii.gz

#add -native if needed
#submit with qsub -l walltime=00:05:00,mem=1gb -V ../xtract_macaques.sh

#done
done


