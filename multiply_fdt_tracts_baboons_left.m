addpath(genpath('/opt/mr-cat/latest/'))

subj={'sub-Alf','sub-Arthur','sub-Babar','sub-Falbala','sub-Fildar','sub-Garcia','sub-Icono','sub-IvarJr'}

%'sub-Celine'

for s=1:length(subj)

fdt=['/project/2420132.01/data/baboon_adrien/' subj{s} '/fdtmatrix2_L/fdt_matrix2.dot']
ac=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/ac/densityNorm.nii.gz']
af_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/af_l/densityNorm.nii.gz']
ar_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/ar_l/densityNorm.nii.gz']
atr_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/atr_l/densityNorm.nii.gz']
cbd_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/cbd_l/densityNorm.nii.gz']
cbp_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/cbp_l/densityNorm.nii.gz']
cbt_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/cbt_l/densityNorm.nii.gz']
cst_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/cst_l/densityNorm.nii.gz']
fa_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/fa_l/densityNorm.nii.gz']
fma=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/fma/densityNorm.nii.gz']
fmi=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/fmi/densityNorm.nii.gz']
fx_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/fx_l/densityNorm.nii.gz']
ifo_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/ifo_l/densityNorm.nii.gz']
ilf_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/ilf_l/densityNorm.nii.gz']
mdlf_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/mdlf_l/densityNorm.nii.gz']
or_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/or_l/densityNorm.nii.gz']
slf1_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/slf1_l/densityNorm.nii.gz']
slf2_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/slf2_l/densityNorm.nii.gz']
slf3_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/slf3_l/densityNorm.nii.gz']
str_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/str_l/densityNorm.nii.gz']
uf_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/uf_l/densityNorm.nii.gz']
vof_l=['/project/2420132.01/data/baboon_adrien/' subj{s} '/xtract_native/tracts/vof_l/densityNorm.nii.gz']
mask=['/project/2420132.01/data/baboon_adrien/' subj{s} '/anat_to_dwib0.nii.gz']
out=['/project/2420132.01/data/baboon_adrien/' subj{s} '/' subj{s} '_left_bp.dtseries.nii']

multiply_fdt('fdt_matrix2',fdt,'fdt_paths',ac,'fdt_paths',af_l,'fdt_paths',ar_l,'fdt_paths',atr_l,'fdt_paths',cbd_l,'fdt_paths',cbp_l,'fdt_paths',cbt_l,'fdt_paths',cst_l,'fdt_paths',fa_l,'fdt_paths',fma,'fdt_paths',fmi,'fdt_paths',fx_l,'fdt_paths',ifo_l,'fdt_paths',ilf_l,'fdt_paths',mdlf_l,'fdt_paths',or_l,'fdt_paths',slf1_l,'fdt_paths',slf2_l,'fdt_paths',slf3_l,'fdt_paths',str_l,'fdt_paths',uf_l,'fdt_paths',vof_l,'mask',mask,'outputname',out,'hemi','L','threshold',0.003,'eco','yes');

end