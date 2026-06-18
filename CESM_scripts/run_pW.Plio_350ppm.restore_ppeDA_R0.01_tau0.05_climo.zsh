#!/bin/zsh
set -e
source ${0:A:h}/print_colors.zsh

# ==============================================
# Basic settings
# ----------------------------------------------
print_hint '>>> Basic settings'
R=0.01
CO2=350ppm
casetag=pW.Plio_${CO2}.restore_ppeDA_R${R}_tau0.05_climo
account=UAZN0034
priority=regular
casename=b.e13.B1850C5CN.ne30_g16.icesm131_ihesp.${casetag}
codebase=/glade/campaign/cesm/development/palwg/cesm_tags/iCESM1.3.1
res=ne30_g16
mach=derecho
compset=1850_CAM50_CLM40%SP_CICE_POP2_RTM_SGLC_SWAV
case_root=/glade/work/fengzhu/CESM_cases
output_root=/glade/derecho/scratch/fengzhu/CESM_output
archive_root=/glade/campaign/univ/uazn0034/fengzhu/CESM_output/archive

case_dir=${case_root}/${casename}
output_dir=${output_root}/${casename}
archive_dir=${archive_root}/${casename}

print_success ">>> casename: ${casename}"
print_success ">>> compset: ${compset}"
print_success ">>> resolution: ${res}"
print_success ">>> machine: ${mach}"
print_success ">>> case_dir: ${case_dir}"
print_success ">>> output_dir: ${output_dir}"
print_success ">>> archive_dir: ${archive_dir}"

branch_case=b.e13.B1850C5CN.ne30_g16.icesm131_ihesp.pW.Plio_${CO2}
branch_date=0781-01-01
branch_dir=/glade/campaign/univ/uazn0034/fengzhu/CESM_output/archive/${branch_case}/rest/${branch_date}-00000
branch_link=/glade/derecho/scratch/fengzhu/restoring/${branch_case}_${branch_date}
rm -f ${branch_link}
ln -sf ${branch_dir} ${branch_link}
cam_branch_file=${branch_link}/${branch_case}.cam.r.${branch_date}-00000.nc
print_success ">>> cam_branch_file: ${cam_branch_file}"

# clean existing case and output directories
print_warning '>>> Deleting the old case directory if existing'
if [[ -d ${case_dir} ]]; then
  rm -r ${case_dir}
fi
print_warning '>>> Deleting the old output directory if existing'
if [[ -d ${output_dir} ]]; then
  rm -r ${output_dir}
fi
# ==============================================

# ==============================================
# Create the case
# ----------------------------------------------
print_hint ">>> Creating the case"
export PROJECT=$account
export PRIORITY=$priority
clone_target_dirpath=/glade/work/fengzhu/CESM_cases/${branch_case}
${codebase}/cime/scripts/create_clone --case ${case_dir} --clone $clone_target_dirpath --cime-output-root ${output_root}
cd ${case_dir}
print_success ">>> cd to: ${case_dir}"
# ==============================================

# ==============================================
# Define the run type
# ----------------------------------------------
print_hint ">>> Define the run type"
./xmlchange RUN_TYPE=branch
./xmlchange GET_REFCASE=TRUE
./xmlchange RUN_REFCASE=${branch_case}
./xmlchange RUN_REFDATE=${branch_date}
./xmlchange RUN_REFDIR=${branch_link}
./xmlchange OCN_TRACER_MODULES="iage wiso"
./xmlchange CLM_FORCE_COLDSTART=off
./xmlchange CLM_BLDNML_OPTS="-ignore_warnings" --append
./xmlchange CIME_OUTPUT_ROOT=${output_root}
# ==============================================

# ==============================================
# Configure the PE layout
# ----------------------------------------------
print_hint ">>> Configure the PE layout"
ntasks_atm=$((2816))
ntasks_ocn=$((128))
ntasks_lnd=$((896))
ntasks_ice=$((1920))
nthreads=1
print_success ">>> nstasks_atm: ${ntasks_atm}"
print_success ">>> nstasks_ocn: ${ntasks_ocn}"
print_success ">>> nstasks_lnd: ${ntasks_ocn}"
print_success ">>> nstasks_ice: ${ntasks_ice}"
print_success ">>> nthreads: ${nthreads}"

./xmlchange NTASKS_CPL=${ntasks_atm},NTHRDS_CPL=${nthreads},ROOTPE_CPL=0
./xmlchange NTASKS_ATM=${ntasks_atm},NTHRDS_ATM=${nthreads},ROOTPE_ATM=0
./xmlchange NTASKS_LND=${ntasks_lnd},NTHRDS_LND=${nthreads},ROOTPE_LND=0
./xmlchange NTASKS_ICE=${ntasks_ice},NTHRDS_ICE=${nthreads},ROOTPE_ICE=${ntasks_lnd}
./xmlchange NTASKS_OCN=${ntasks_ocn},NTHRDS_OCN=${nthreads},ROOTPE_OCN=${ntasks_atm}
./xmlchange NTASKS_ROF=${ntasks_lnd},NTHRDS_ROF=${nthreads},ROOTPE_ROF=0
# ==============================================

# ==============================================
# Setup
# ----------------------------------------------
print_hint '>>> Set up the case'
./case.setup --reset
# ==============================================

# ==============================================
# Configure & preview the namelists
# ----------------------------------------------
print_hint '>>> Configure & preview the namelists'
cat << EOF >> user_nl_cam
cam_branch_file	= '${cam_branch_file}'
EOF

cat << EOF >> user_nl_pop
! namelists for restoring
pt_interior_data_type='monthly'
pt_interior_filename='/glade/work/fengzhu/Projects/paleoWeather_OnlineDA_method/data/restoring_target_ppeDA_R${R}_g16_TEMP_climo_${CO2}.nc'
pt_interior_file_fmt='nc'
pt_interior_variable_restore=.true.
pt_interior_restore_filename='/glade/work/fengzhu/Projects/paleoWeather_OnlineDA_method/data/restoring_mask_maxLev1_tau0.05_TEMP.nc'
pt_interior_restore_file_fmt='nc'

ltavg_ignore_extra_streams = .true.
pt_interior_surface_restore = .true.
EOF

./preview_namelists
# ==============================================

# ==============================================
# Build
# ----------------------------------------------
print_hint '>>> Build the case'
./case.build
# ==============================================

# ==============================================
# Configure the job
# ----------------------------------------------
print_hint '>>> Configure the job'
./xmlchange STOP_OPTION=nyears
./xmlchange STOP_N=10
./xmlchange REST_N=10
./xmlchange RESUBMIT=9
./xmlchange JOB_QUEUE=main
./xmlchange JOB_WALLCLOCK_TIME=12:00:00
./xmlchange DOUT_S_ROOT=${archive_dir}
./xmlchange PROJECT=${account}
./xmlchange BATCH_COMMAND_FLAGS="-q main -l walltime=0:20:00 -l job_priority=premium -A $PROJECT" --subgroup case.st_archive
# ==============================================

# ==============================================
# Submit
# ----------------------------------------------
print_hint '>>> Submit the job'
./case.submit
print_success '>>> Job submitted'
# ==============================================