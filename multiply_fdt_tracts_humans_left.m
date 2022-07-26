addpath(genpath('/opt/mr-cat/latest/'))

subj={'103111','103414','107321','108525','108828','114419','117324','118730','121618','123117','138231','144832','147030','150726','152831'}

for s=1:length(subj)

fdt=['/project/2420132.01/data/humans/' subj{s} '/fdtmatrix2_L/fdt_matrix2.dot']
ac=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/ac_2.5mm.nii.gz']
af_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/af_l_2.5mm.nii.gz']
ar_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/ar_l_2.5mm.nii.gz']
atr_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/atr_l_2.5mm.nii.gz']
cbd_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/cbd_l_2.5mm.nii.gz']
cbp_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/cbp_l_2.5mm.nii.gz']
cbt_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/cbt_l_2.5mm.nii.gz']
cst_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/cst_l_2.5mm.nii.gz']
fa_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/fa_l_2.5mm.nii.gz']
fma=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/fma_2.5mm.nii.gz']
fmi=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/fmi_2.5mm.nii.gz']
fx_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/fx_l_2.5mm.nii.gz']
ifo_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/ifo_l_2.5mm.nii.gz']
ilf_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/ilf_l_2.5mm.nii.gz']
mdlf_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/mdlf_l_2.5mm.nii.gz']
or_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/or_l_2.5mm.nii.gz']
slf1_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/slf1_l_2.5mm.nii.gz']
slf2_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/slf2_l_2.5mm.nii.gz']
slf3_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/slf3_l_2.5mm.nii.gz']
str_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/str_l_2.5mm.nii.gz']
uf_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/uf_l_2.5mm.nii.gz']
vof_l=['/project/2420132.01/data/humans/' subj{s} '/xtract_native/tracts/vof_l_2.5mm.nii.gz']
mask=['/project/2420132.01/data/humans/' subj{s} '/anat_to_dwib0_2.5mm.nii.gz']
out=['/project/2420132.01/data/humans/' subj{s} '_left_bp.dtseries.nii']

multiply_fdt('fdt_matrix2',fdt,'fdt_paths',ac,'fdt_paths',af_l,'fdt_paths',ar_l,'fdt_paths',atr_l,'fdt_paths',cbd_l,'fdt_paths',cbp_l,'fdt_paths',cbt_l,'fdt_paths',cst_l,'fdt_paths',fa_l,'fdt_paths',fma,'fdt_paths',fmi,'fdt_paths',fx_l,'fdt_paths',ifo_l,'fdt_paths',ilf_l,'fdt_paths',mdlf_l,'fdt_paths',or_l,'fdt_paths',slf1_l,'fdt_paths',slf2_l,'fdt_paths',slf3_l,'fdt_paths',str_l,'fdt_paths',uf_l,'fdt_paths',vof_l,'mask',mask,'outputname',out,'hemi','L','threshold',0.003,'eco','yes');

end