<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-success" href="<?php echo base_url("dashboard_midwife/appointment/appointment/create") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_appointment') ?> </a>  
                </div>
            </div> 
            <div class="panel-body">
                <table width="100%" class="datatable table  table-bordered">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('appointment_id') ?></th>
                            <th><?php echo display('patient_id') ?></th>
                            <th><?php echo display('department') ?></th>
                            <th><?php echo display('doctor_name') ?></th>
                            <th><?php echo display('serial_no') ?></th>
                            <th><?php echo display('problem') ?></th>
                            <th><?php echo display('appointment_date') ?></th>
                            <th><?php echo display('action') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($appointments)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($appointments as $appointment) { ?>
                                <tr class="<?php echo $appointment->isPrescribe; ?>">
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $appointment->appointment_id; ?></td>
                                    <td><?php echo $appointment->patient_id; ?></td>
                                    <td><?php echo $appointment->name; ?></td>
                                    <td><?php echo $appointment->firstname.' '.$appointment->lastname; ?></td>
                                    <td><?php echo $appointment->serial_no; ?></td>
                                    <td><?php echo $appointment->problem; ?></td>
                                    <td><?php echo $appointment->date; ?></td>
                                    <td class="center">
                                        <a href="<?php echo base_url("dashboard_midwife/appointment/appointment/view/$appointment->appointment_id") ?>" class="btn btn-xs btn-success" title="View Appointment"><i class="fa fa-eye"></i></a> 

                                        <?php if(!$appointment->isPrescribe): ?>

                                        <a href="<?php echo base_url("dashboard_midwife/prescription/prescription/create?aid=$appointment->appointment_id&pid=$appointment->patient_id") ?>" class="btn btn-xs btn-warning" title="Create Prescription"><i class="fa fa-plus"></i></a> 
    
                                        <?php else: ?>

                                        <a href="<?php echo base_url("dashboard_midwife/prescription/prescription/view/$appointment->prescription_id") ?>" class="btn btn-xs btn-primary" title="View Prescription"><i class="fa fa-file-text"></i></a> 
                                        <?php endif; ?>

                                    </td>
                                </tr>
                                <?php $sl++; ?>
                            <?php } ?> 
                        <?php } ?> 
                    </tbody>
                </table>  <!-- /.table-responsive -->
            </div>
        </div>
    </div>
</div>

