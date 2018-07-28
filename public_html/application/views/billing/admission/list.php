<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-success" href="<?php echo base_url("billing/admission/form") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_admission') ?> </a>  
                </div>
            </div>
            <div class="panel-body">
                <table class="datatable2 table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead> 
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('admission_id') ?></th>
                            <th><?php echo display('patient_id') ?></th>
                            <th><?php echo display('admission_date') ?></th>
                            <th><?php echo display('discharge_date') ?></th>
                            <th><?php echo display('doctor_name') ?></th>
                            <th><?php echo display('package_name') ?></th>
                            <th><?php echo display('insurance_name') ?></th>
                            <th><?php echo display('policy_no') ?></th>
                            <th><?php echo display('agent_name') ?></th>
                            <th><?php echo display('guardian_name') ?></th>
                            <th><?php echo display('guardian_relation') ?></th>
                            <th><?php echo display('guardian_contact') ?></th>
                            <th><?php echo display('guardian_address') ?></th>
                            <th><?php echo display('status') ?></th>
                            <th><?php echo display('action') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($admissions)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($admissions as $admission) { ?>
                                <tr>
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $admission->admission_id; ?></td>
                                    <td><?php echo $admission->patient_id; ?></td>
                                    <td><?php echo $admission->admission_date; ?></td>
                                    <td><?php echo $admission->discharge_date; ?></td>
                                    <td><?php echo $admission->doctor_name; ?></td>
                                    <td><?php echo $admission->package_name; ?></td>
                                    <td><?php echo $admission->insurance_name; ?></td>
                                    <td><?php echo $admission->policy_no; ?></td>
                                    <td><?php echo $admission->agent_name; ?></td>
                                    <td><?php echo $admission->guardian_name; ?></td>
                                    <td><?php echo $admission->guardian_relation; ?></td>
                                    <td><?php echo $admission->guardian_contact; ?></td>
                                    <td><?php echo $admission->guardian_address; ?></td>
                                    <td><?php echo (($admission->status==1)?display('active'):display('inactive')); ?></td>
                                    <td class="center">
                                        <a href="<?php echo base_url("billing/admission/edit/$admission->admission_id") ?>" class="btn btn-xs  btn-primary"><i class="fa fa-edit"></i></a> 
                                        <a href="<?php echo base_url("billing/admission/delete/$admission->admission_id") ?>" onclick="return confirm('<?php echo display("are_you_sure") ?>')" class="btn btn-xs  btn-danger"><i class="fa fa-trash"></i></a> 
                                    </td>
                                </tr>
                                <?php $sl++; ?>
                            <?php } ?> 
                        <?php } ?> 
                    </tbody>
                </table>  <!-- /.table-responsive -->
                <?php echo (!empty($links)?$links:null); ?>
            </div>
        </div>
    </div>
</div>
