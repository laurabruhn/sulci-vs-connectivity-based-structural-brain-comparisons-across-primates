addpath(genpath('/opt/mr-cat/latest/'))

subj={'Bo','Callie','Cissie','Elvira','Evelyne','Fiona','Foxy','Frannie','Jewelle','Leslie','Marietta','Sabrina','Wenka'}

for s=1:length(subj)

fdt=['/project/2420132.01/data/chimps/' subj{s} '/fdtmatrix2_R/fdt_matrix2.dot']
ac=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/ac_r/densityNorm.nii.gz']
af_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/af_r/densityNorm.nii.gz']
ar_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/ar_r/densityNorm.nii.gz']
atr_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/atr_r/densityNorm.nii.gz']
cbd_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/cbd_r/densityNorm.nii.gz']
cbp_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/cbp_r/densityNorm.nii.gz']
cbt_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/cbt_r/densityNorm.nii.gz']
cst_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/cst_r/densityNorm.nii.gz']
fa_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/fa_r/densityNorm.nii.gz']
fma=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/fma/densityNorm.nii.gz']
fmi=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/fmi/densityNorm.nii.gz']
fx_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/fx_r/densityNorm.nii.gz']
ifo_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/ifo_r/densityNorm.nii.gz']
ilf_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/ilf_r/densityNorm.nii.gz']
mdlf_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/mdlf_r/densityNorm.nii.gz']
or_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/or_r/densityNorm.nii.gz']
slf1_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/slf1_r/densityNorm.nii.gz']
slf2_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/slf2_r/densityNorm.nii.gz']
slf3_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/slf3_r/densityNorm.nii.gz']
str_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/str_r/densityNorm.nii.gz']
uf_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/uf_r/densityNorm.nii.gz']
vof_r=['/project/2420132.01/data/chimps/' subj{s} '/xtract_native/tracts/vof_r/densityNorm.nii.gz']
mask=['/project/2420132.01/data/chimps/' subj{s} '/anat_to_dwib0.nii.gz']
out=['/project/2420132.01/data/chimps/' subj{s} '_right_bp.dtseries.nii']

multiply_fdt('fdt_matrix2',fdt,'fdt_paths',ac,'fdt_paths',af_r,'fdt_paths',ar_r,'fdt_paths',atr_r,'fdt_paths',cbd_r,'fdt_paths',cbp_r,'fdt_paths',cbt_r,'fdt_paths',cst_r,'fdt_paths',fa_r,'fdt_paths',fma,'fdt_paths',fmi,'fdt_paths',fx_r,'fdt_paths',ifo_r,'fdt_paths',ilf_r,'fdt_paths',mdlf_r,'fdt_paths',or_r,'fdt_paths',slf1_r,'fdt_paths',slf2_r,'fdt_paths',slf3_r,'fdt_paths',str_r,'fdt_paths',uf_r,'fdt_paths',vof_r,'mask',mask,'outputname',out,'hemi','R','threshold',0.003,'eco','yes');

end