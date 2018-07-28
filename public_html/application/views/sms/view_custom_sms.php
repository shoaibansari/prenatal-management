<div class="row">
    <div class="col-md-12 ">
        <div  class="panel panel-default panel-form">
            <div class="panel-body">
                <div class="portlet-body form">
                
                <?php  
                    echo form_open_multipart('sms/sms_setup_controller/send_custom_sms', array('class' => 'form-horizontal','method'=>'post','id' => 'MyForm','role'=>'form'));  
                ?>
                    
                <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label"> <?php echo display('mobile');?> : </label>
                            <div class="col-md-5">
                                <input type="number" class="form-control" required="1" name="to" placeholder="<?php echo display('mobile');?>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label"> <?php echo display('provider');?> : </label>
                            <div class="col-md-5">
                                <select class="form-control" name="gateway" required="1">
                                    <?php 
                                    foreach ($gateway_list as $g_list) {
                                       echo '<option value="'.$g_list->gateway_id.'">'.$g_list->provider_name.'</option>';
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>  
                        

                        <div class="form-group view_tmp">
                            <label class="col-md-3 control-label"> <?php echo display('sms_template');?> : </label>
                            <div class="col-md-5">
                                 <textarea name="teamplate" required="1" class="form-control" rows="6"></textarea>
                            </div>
                        </div> 
                    </div>

                       <div class="form-group row">
                            <div class="col-sm-offset-3 col-sm-6">
                                
                                    <button type="reset" class="btn btn-danger"><?php echo display('reset');?></button>
                                    <button type="submit" class="btn btn-success sav_btn"><?php echo display('send');?></button>
                                
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>  
     </div>
</div>

<script>
    // load patient name
    function getTeamplate(){          
        var teamplate_id = document.getElementById('tmp').value;
        
            $.ajax({ 
                'url': '<?php echo base_url();?>' + 'admin/Ajax_controller/get_teamplate/'+teamplate_id,
                'type': 'GET', //the way you want to send data to your URL
                'data': {'teamplate_id': teamplate_id },
                'success': function(d) { 
                    var container = $(".view_tmp");
                    if(d){
                            container.html(d);
                        }else{ 
                            container.val(""); 
                        }
                }
            });
        
    }
</script>

