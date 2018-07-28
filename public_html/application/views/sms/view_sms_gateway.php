<div class="row">

    <div class="col-md-12">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3>SMS Setting</h3> 
            </div>
            <div class="panel-body">
                <?php echo form_open('sms/sms_setup_controller/sms_setting') ?>
                    <?php echo form_hidden('id', $sms_setting->id) ?>
                    
                  <div class="checkbox checkbox-success">
                        <input id="appointment" type="checkbox" name="appointment" <?php echo (($sms_setting->appointment==1)?'checked':null) ?>>
                        <label for="appointment"><?php echo display('appointment') ?></label>
                  </div>
                  <div class="checkbox checkbox-success">
                        <input id="registration" type="checkbox" name="registration" <?php echo (($sms_setting->registration==1)?'checked':null) ?>>
                        <label for="registration"><?php echo display('registration') ?></label>
                  </div>
                  <div class="checkbox checkbox-success">
                        <input id="schedule" type="checkbox" name="schedule" <?php echo (($sms_setting->schedule==1)?'checked':null) ?>>
                        <label for="schedule"><?php echo display('schedule') ?></label>
                  </div>

                <button type="submit" class="btn btn-success"><?php echo display('save') ?></button>
                <?php echo form_close() ?>
            </div>
        </div>
    </div>


    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr class="center bg-success">
                            <th><?php echo display('status');?></th>
                            <th><?php echo display('provider');?> </th>
                            <th><?php echo display('username');?> </th>
                            <th><?php echo display('password');?> </th>
                            <th><?php echo display('sender');?> </th>
                            <th><?php echo display('action');?> </th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($gateway_list as $value) { ?> 
                        <?php echo form_open('sms/sms_setup_controller/save_gateway', array('method'=>'post','role'=>'form')); ?>   
                        <tr> 
                            <input type="hidden" name="id" value="<?php echo $value->gateway_id;?>">
                            <td><input type="radio" <?php echo $value->default_status==1?'checked':''?> class="form-control"></td>
                            <td><?php echo '<a target="_blank" href="'.$value->link.'">'.$value->provider_name.'</a>'?></td>
                            <td><input type="text" class="form-control" value="<?php echo $value->user;?>" name="user"></td>
                            <td><input type="text" class="form-control" value="<?php echo $value->password?>" name="password"></td>
                            <td><input type="text" class="form-control" value="<?php echo $value->authentication?>" name="authentication"></td>
                            <td width="70">
                                <input type="submit" value="<?php echo display('update');?>" class="btn btn-xs btn-warning">
                            </td>
                        </tr>
                        </form>
                        <?php } ?>
                       
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>