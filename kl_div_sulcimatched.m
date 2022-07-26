addpath(genpath('/opt/mr-cat/latest/'))

species={'BABOON','CHIMP','HUMAN'};

for s=1:length(species)

hemi='L';

macaqueL=readimgfile('/project/2420132.01/data/AVERAGE_BLUEPRINTS/AVERAGE_MACAQUE_left_bp.dtseries.nii');
bpL=readimgfile(['/project/2420132.01/data/AVERAGE_BLUEPRINTS/AVERAGE_' species{s} '_left_bp.dtseries.nii']);
outL_diag=['/project/2420132.01/data/AVERAGE_BLUEPRINTS/MACAQUE_vs_' species{s} '_left_KL_sulci-matched.dtseries.nii'];
bp2macaqueL=diag(calc_KL(macaqueL,bpL));

saveimgfile(bp2macaqueL,outL_diag,hemi);

hemi='R';

macaqueR=readimgfile('/project/2420132.01/data/AVERAGE_BLUEPRINTS/AVERAGE_MACAQUE_right_bp.dtseries.nii');
bpR=readimgfile(['/project/2420132.01/data/AVERAGE_BLUEPRINTS/AVERAGE_' species{s} '_right_bp.dtseries.nii']);
outR_diag=['/project/2420132.01/data/AVERAGE_BLUEPRINTS/MACAQUE_vs_' species{s} '_right_KL_sulci-matched.dtseries.nii'];
bp2macaqueR=diag(calc_KL(macaqueR,bpR));

saveimgfile(bp2macaqueR,outR_diag,hemi);

end