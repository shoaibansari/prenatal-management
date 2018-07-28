
<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
           
            
            <div class="panel-body">
                <table class="datatable table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>

                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('patient_id') ?></th>
                            <th><?php echo display('patient_name') ?></th>
                            <th><?php echo display('type') ?></th>
                            <th><?php echo display('address') ?></th>
                            <th><?php echo 'is_read' ?></th>
                            <th><?php echo display('action') ?></th>

                    </thead>
                    <tbody>
                        <?php if (!empty($audio_lists)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($audio_lists as $list) { ?>
                                <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $list->patient_id; ?></td>
                                    <td><?php echo $list->patient_name; ?></td>
                                    <td><?php echo $list->type; ?></td>
                                    <td><?php echo $list->location; ?></td>
                                    <td><?php echo $list->is_read; ?></td>

                                      <td>
                                        <div class="action-btn">
                                        <!-- <a href="<?php echo base_url("doctor/profile/$doctor->user_id") ?>" class="btn btn-xs btn-success"><i class="fa fa-eye"></i></a>  -->
                                        <?php if($list->is_read == 1 ) { ?>
                                             <a href="<?php echo base_url("Emergency_alert/markedAsRead/$list->id") ?>" class="btn btn-xs btn-primary">read</a> 
                                              <a href="<?php echo base_url("Emergency_alert/delete/$list->id") ?>" class="btn btn-xs btn-danger" onclick="return confirm('<?php echo display('are_you_sure') ?> ')"><i class="fa fa-trash"></i></a>
                                        <?php }else{ ?>
                                        <a href="<?php echo base_url("Emergency_alert/markedAsRead/$list->id") ?>" class="btn btn-xs btn-primary">Unread</a> 
                                        <a href="<?php echo base_url("Emergency_alert/delete/$list->id") ?>" class="btn btn-xs btn-danger" onclick="return confirm('<?php echo display('are_you_sure') ?> ')"><i class="fa fa-trash"></i></a>

                                        <?php } ?>
                                        </div> 
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
