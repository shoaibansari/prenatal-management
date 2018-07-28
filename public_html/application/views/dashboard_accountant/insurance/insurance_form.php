<div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" href="<?php echo base_url("dashboard_accountant/insurance/insurance") ?>"> <i class="fa fa-list"></i>  <?php echo display('insurance_list') ?> </a>  
                </div>
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                        <?php echo form_open_multipart('dashboard_accountant/insurance/insurance/form') ?>
                            <div class="form-group row">
                                <label for="insurance_name" class="col-xs-3 col-form-label"><?php echo display('insurance_name') ?> <i class="text-danger"> *</i></label>
                                <div class="col-xs-9">
                                    <input name="insurance_name" type="text" class="form-control" id="insurance_name" placeholder="<?php echo display('insurance_name') ?>" value="<?php echo $insurance->insurance_name ?>" >
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="service_tax" class="col-xs-3 col-form-label"><?php echo display('service_tax') ?></label>
                                <div class="col-xs-9">
                                    <input name="service_tax" type="text" class="form-control" id="service_tax" placeholder="<?php echo display('service_tax') ?>" value="<?php echo $insurance->service_tax ?>" >
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="discount" class="col-xs-3 col-form-label"><?php echo display('discount') ?></label>
                                <div class="col-xs-9">
                                    <input name="discount" type="text" class="form-control" id="discount" placeholder="<?php echo display('discount') ?>" value="<?php echo $insurance->discount ?>" >
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="remark" class="col-xs-3 col-form-label"><?php echo display('remark') ?></label>
                                <div class="col-xs-9">
                                    <textarea name="remark" class="form-control"  placeholder="<?php echo display('remark') ?>"  rows="7"><?php echo $insurance->remark ?></textarea>
                                </div>
                            </div> 
 
                            <div class="form-group row">
                                <label for="insurance_no" class="col-xs-3 col-form-label"><?php echo display('insurance_no') ?></label>
                                <div class="col-xs-9">
                                    <input name="insurance_no" type="text" class="form-control" id="insurance_no" placeholder="<?php echo display('insurance_no') ?>" value="<?php echo $insurance->insurance_no ?>" >
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="insurance_code" class="col-xs-3 col-form-label"><?php echo display('insurance_code') ?></label>
                                <div class="col-xs-9">
                                    <input name="insurance_code" type="text" class="form-control" id="insurance_code" placeholder="<?php echo display('insurance_code') ?>" value="<?php echo $insurance->insurance_code ?>" >
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="disease_charge" class="col-xs-3 col-form-label"><?php echo display('disease_charge') ?></label>
                                <div class="col-xs-9" id="disease_charge">
                                    <div class="row" style="margin-bottom:10px">
                                        <div class="col-xs-4">
                                            <input name="disease_name[]" type="text" class="form-control"  placeholder="<?php echo display('disease_name') ?>" value="" >
                                        </div>
                                        <div class="col-xs-4">
                                            <input name="disease_charge[]" type="text" class="form-control"  placeholder="<?php echo display('disease_charge') ?>" value="" >
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="btn-group">
                                                <button type="button" class="btn  btn-info add-disease">+</button>
                                                <button type="button" class="btn  btn-danger remove-disease">-</button>
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="hospital_rate" class="col-xs-3 col-form-label"><?php echo display('hospital_rate') ?></label>
                                <div class="col-xs-9">
                                    <input name="hospital_rate" type="text" class="form-control" id="hospital_rate" placeholder="<?php echo display('hospital_rate') ?>" value="<?php echo $insurance->hospital_rate ?>" >
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="insurance_rate" class="col-xs-3 col-form-label"><?php echo display('insurance_rate') ?></label>
                                <div class="col-xs-9">
                                    <input name="insurance_rate" type="text" class="form-control" id="insurance_rate" placeholder="<?php echo display('insurance_rate') ?>" value="<?php echo $insurance->insurance_rate ?>" >
                                </div>
                            </div>
  
                            <div class="form-group row">
                                <label for="total" class="col-xs-3 col-form-label"><?php echo display('total') ?></label>
                                <div class="col-xs-9">
                                    <input name="total" type="text" class="form-control" id="total" placeholder="<?php echo display('total') ?>" value="<?php echo $insurance->total ?>" >
                                </div>
                            </div> 
 
                            <div class="form-group row">
                                <label class="col-sm-3"><?php echo display('status') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <div class="form-check">
                                        <label class="radio-inline">
                                        <input type="radio" name="status" value="1" <?php echo  set_radio('status', '1', TRUE); ?> ><?php echo display('active') ?>
                                        </label>
                                        <label class="radio-inline">
                                        <input type="radio" name="status" value="0" <?php echo  set_radio('status', '0'); ?> ><?php echo display('inactive') ?>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-offset-3 col-sm-6">
                                    <div class="ui buttons">
                                        <button type="reset" class="ui button"><?php echo display('reset') ?></button>
                                        <div class="or"></div>
                                        <button class="ui positive button"><?php echo display('save') ?></button>
                                    </div>
                                </div>
                            </div>
                        <?php echo form_close() ?>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
$(document).ready(function() {
    var html = $("#disease_charge").html(); 
    $('body').on('click', '.add-disease', function() {
        $("#disease_charge").append(html);
    });
    $('body').on('click', '.remove-disease', function() {
       $(this).parent().parent().parent().remove();
    });
});
</script>