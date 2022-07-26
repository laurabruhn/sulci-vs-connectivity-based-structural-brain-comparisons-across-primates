addpath(genpath('/opt/mr-cat/latest/'))

subj={'sub-032126','sub-032127','sub-032128','sub-032130','sub-032131','sub-032132','sub-032133','sub-032134','sub-032135','sub-032136','sub-032137','sub-032138','sub-032140','sub-032141','sub-032142','sub-032143'}

for s=1:length(subj)

fdt=['/project/2420132.01/data/macaques/' subj{s} '/fdtmatrix2_L/fdt_matrix2.dot']
ac=['/project/2420132.01/data/macaques/' subj{s} '/tracts/ac/densityNorm.nii.gz']
af_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/af_l/densityNorm.nii.gz']
ar_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/ar_l/densityNorm.nii.gz']
atr_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/atr_l/densityNorm.nii.gz']
cbd_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/cbd_l/densityNorm.nii.gz']
cbp_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/cbp_l/densityNorm.nii.gz']
cbt_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/cbt_l/densityNorm.nii.gz']
cst_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/cst_l/densityNorm.nii.gz']
fa_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/fa_l/densityNorm.nii.gz']
fma=['/project/2420132.01/data/macaques/' subj{s} '/tracts/fma/densityNorm.nii.gz']
fmi=['/project/2420132.01/data/macaques/' subj{s} '/tracts/fmi/densityNorm.nii.gz']
fx_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/fx_l/densityNorm.nii.gz']
ifo_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/ifo_l/densityNorm.nii.gz']
ilf_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/ilf_l/densityNorm.nii.gz']
mdlf_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/mdlf_l/densityNorm.nii.gz']
or_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/or_l/densityNorm.nii.gz']
slf1_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/slf1_l/densityNorm.nii.gz']
slf2_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/slf2_l/densityNorm.nii.gz']
slf3_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/slf3_l/densityNorm.nii.gz']
str_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/str_l/densityNorm.nii.gz']
uf_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/uf_l/densityNorm.nii.gz']
vof_l=['/project/2420132.01/data/macaques/' subj{s} '/tracts/vof_l/densityNorm.nii.gz']
mask=['/project/2420132.01/data/macaques/' subj{s} '/anat_to_dwib0.nii.gz']
out=['/project/2420132.01/data/macaques/' subj{s} '_left_bp.dtseries.nii']

multiply_fdt('fdt_matrix2',fdt,'fdt_paths',ac,'fdt_paths',af_l,'fdt_paths',ar_l,'fdt_paths',atr_l,'fdt_paths',cbd_l,'fdt_paths',cbp_l,'fdt_paths',cbt_l,'fdt_paths',cst_l,'fdt_paths',fa_l,'fdt_paths',fma,'fdt_paths',fmi,'fdt_paths',fx_l,'fdt_paths',ifo_l,'fdt_paths',ilf_l,'fdt_paths',mdlf_l,'fdt_paths',or_l,'fdt_paths',slf1_l,'fdt_paths',slf2_l,'fdt_paths',slf3_l,'fdt_paths',str_l,'fdt_paths',uf_l,'fdt_paths',vof_l,'mask',mask,'outputname',out,'hemi','L','threshold',0.003,'eco','yes');

end