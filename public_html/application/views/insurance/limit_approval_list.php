<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-success" href="<?php echo base_url("insurance/limit_approval/form") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_limit_approval') ?> </a>  
                </div>
            </div> 
            <div class="panel-body">
                <table width="100%" class="datatable2 table table-striped table-bordered table-hover">
                    <thead> 
                        <tr> 
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('patient_id') ?></th>
                            <th><?php echo display('consultant_name') ?></th>
                            <th><?php echo display('policy_name') ?></th>
                            <th><?php echo display('policy_no') ?></th>
                            <th><?php echo display('policy_holder_name') ?></th>
                            <th><?php echo display('insurance_name') ?></th>
                            <th><?php echo display('total') ?></th>
                            <th><?php echo display('status') ?></th>
                            <th width="80"><?php echo display('action') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($approvals)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($approvals as $approval) { ?>
                                <tr>
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $approval->patient_id; ?></td>
                                    <td><?php echo $approval->consultant_name; ?></td>
                                    <td><?php echo $approval->policy_name; ?></td>
                                    <td><?php echo $approval->policy_no; ?></td>
                                    <td><?php echo $approval->policy_holder_name; ?></td>
                                    <td><?php echo $approval->insurance_name; ?></td>
                                    <td><?php echo $approval->total; ?></td> 
                                    <td><?php echo (($approval->status==1)?display('active'):display('inactive')); ?></td>
                                    <td class="center">
                                        <a href="<?php echo base_url("insurance/limit_approval/view/$approval->id") ?>" class="btn btn-xs btn-success"><i class="fa fa-eye"></i></a> 
                                        <a href="<?php echo base_url("insurance/limit_approval/update/$approval->id") ?>" class="btn btn-xs btn-primary"><i class="fa fa-edit"></i></a> 
                                        <a href="<?php echo base_url("insurance/limit_approval/delete/$approval->id") ?>" class="btn btn-xs btn-danger" onclick="return confirm('<?php echo display('are_you_sure') ?>')"><i class="fa fa-trash"></i></a> 
                                    </td>
                                </tr>
                                <?php $sl++; ?>
                            <?php } ?> 
                        <?php } ?> 
                    </tbody>
                </table>  <!-- /.table-responsive -->
                <?php echo $links; ?>
            </div>
        </div>
    </div>
</div>
