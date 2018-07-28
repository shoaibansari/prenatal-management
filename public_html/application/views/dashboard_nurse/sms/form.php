<div class="row">
    <div class="col-md-12 ">
        <div  class="panel panel-success panel-form">
            <div class="panel-heading">
                <h3><?php echo display('send_sms') ?></h3>
            </div>

            <div class="panel-body">
                <div class="portlet-body">
                
                <?php  
                    echo form_open_multipart('dashboard_nurse/sms/sms/send', array('class' => 'form-horizontal'));  
                ?>
                    
                    <div class="form-body">
                        <div class="form-group">
                        <label class="col-md-3 control-label"> <?php echo display('mobile');?> : </label>
                            <div class="col-md-5">
                                <input type="number" class="form-control" required="1" name="receiver" placeholder="<?php echo display('mobile');?>">
                            </div>
                        </div>
  

                        <div class="form-group view_tmp">
                            <label class="col-md-3 control-label"> <?php echo display('message');?> : </label>
                            <div class="col-md-5">
                                 <textarea name="message" required="1" class="form-control" rows="6" placeholder="<?php echo display('message') ?>"></textarea>
                            </div>
                        </div>
                    </div>

                   <div class="form-group row">
                        <div class="col-sm-offset-3 col-sm-6">
                            
                                <button type="reset" class="btn btn-danger"><?php echo display('reset');?></button>
                                <button type="submit" class="btn btn-success sav_btn"><?php echo display('send');?></button>
                            
                        </div>
                    </div>
                    <?php echo form_close() ?>
                </div>
            </div>
        </div>  
     </div>
</div>
