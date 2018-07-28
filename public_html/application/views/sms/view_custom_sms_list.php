<div class="row">
    <div class="col-sm-12 ">
        <div class="panel panel-bd">
            <div class="panel-body">
                <div class="portlet-body form">
                    <?php echo form_open('sms/sms_report_controller/custom_sms_list', array('method'=>'get')); ?>
                    <div class="form-inline">
                        <div class="col-md-3">
                            <input type="text" name="start_date" placeholder="<?php echo display('start_date');?>" class="form-control datepicker" value="<?php echo $search->start_date ?>">
                        </div>
                        <div class="col-md-3">
                            <input type="text" name="end_date" placeholder="<?php echo display('end_date');?>" class="form-control datepicker" value="<?php echo $search->end_date ?>">
                        </div>

                        <div class="col-md-2">
                            <input type="submit" value="<?php echo display('filter');?>" class="btn btn-primary">
                        </div>
                    </div>
                    <?php echo form_close(); ?>
                </div>
            </div> 
        </div> 
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-body">
       
                <table width="100%" class="table table-striped table-bordered table-hover" id="sms">
                    <thead>
                        <tr>
                            <th><?php echo display('reciver');?></th>
                            <th><?php echo display('provider');?></th>
                            <th width="150"><?php echo display('date');?></th>
                            <th><?php echo display('message');?></th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach($custom_sms as $value) {?>
                        <tr>
                            <td><?php echo $value->reciver ?></td>
                            <td><?php echo $value->gateway ?></td>
                            <td><?php echo $value->sms_date_time ?></td>
                            <td><?php echo $value->message ?></td>
                        </tr>
                        <?php } ?>
                    </tbody>

                    <tfoot>
                        <tr>
                            <td colspan="4" class="text-right"><?php echo $links ?></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>  

 