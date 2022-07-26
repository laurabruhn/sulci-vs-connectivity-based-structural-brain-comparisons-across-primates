addpath(genpath('/opt/mr-cat/latest/'))

species={'BABOON','CHIMP','HUMAN'};

for s=1:length(species)

hemi='L';

macaqueL=readimgfile('/project/2420132.01/data/AVERAGE_BLUEPRINTS/AVERAGE_MACAQUE_left_bp.dtseries.nii');
bpL=readimgfile(['/project/2420132.01/data/AVERAGE_BLUEPRINTS/AVERAGE_' species{s} '_left_bp.dtseries.nii']);
outL_min_macaque=['/project/2420132.01/data/AVERAGE_BLUEPRINTS/MACAQUE_vs_' species{s} '_left_KL_minimum_mac.dtseries.nii'];
outL_min_other=['/project/2420132.01/data/AVERAGE_BLUEPRINTS/MACAQUE_vs_' species{s} '_left_KL_minimum_' species{s} '.dtseries.nii'];
min_mac=min(calc_KL(macaqueL,bpL),[],2);
min_other=min(calc_KL(macaqueL,bpL),[],1);

saveimgfile(min_mac,outL_min_macaque,hemi);
saveimgfile(min_other',outL_min_other,hemi);


hemi='R';

macaqueR=readimgfile('/project/2420132.01/data/AVERAGE_BLUEPRINTS/AVERAGE_MACAQUE_right_bp.dtseries.nii');
bpR=readimgfile(['/project/2420132.01/data/AVERAGE_BLUEPRINTS/AVERAGE_' species{s} '_right_bp.dtseries.nii']);
outR_min_macaque=['/project/2420132.01/data/AVERAGE_BLUEPRINTS/MACAQUE_vs_' species{s} '_right_KL_minimum_mac.dtseries.nii'];
outR_min_other=['/project/2420132.01/data/AVERAGE_BLUEPRINTS/MACAQUE_vs_' species{s} '_right_KL_minimum_' species{s} '.dtseries.nii'];
min_mac=min(calc_KL(macaqueR,bpR),[],2);
min_other=min(calc_KL(macaqueR,bpR),[],1);

saveimgfile(min_mac,outR_min_macaque,hemi);
saveimgfile(min_other',outR_min_other,hemi);

end