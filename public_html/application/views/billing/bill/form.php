<div class="row">
    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd billing-panel ">

            <div class="panel-heading no-print row">
                <div class="btn-group col-xs-2"> 
                    <a class="btn btn-primary" href="<?php echo base_url("billing/bill") ?>"> <i class="fa fa-list"></i>  <?php echo display('bill_list') ?> </a>  
                </div>
                <h2 class="col-xs-10 text-left text-success"><?php echo display('add_bill') ?></h2>
            </div> 
 
            <div class="panel-body">
            <?php echo form_open('billing/bill/form', array('class'=>'billig-form')) ?>
                <div class="row">
                    <div class="col-sm-9">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-6">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="admission_id" value="" name="admission_id" placeholder="<?php echo display('admission_id') ?>" required/>
                                            <span class="input-group-btn"></span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="patient_id" value="" placeholder="<?php echo display('patient_id') ?>" disabled/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6">
                                <div class="form-group">
                                    <input name="bill_date" type="text" class="form-control datepicker" id="bill_date"  placeholder="<?php echo display('bill_date') ?>" required/>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="patient_name" placeholder="<?php echo display('patient_name') ?>" disabled/>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="date_of_birth" placeholder="<?php echo display('date_of_birth') ?>" disabled/>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" rows="3" placeholder="<?php echo display('address') ?>" id="address" disabled></textarea>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6">
                                <div class="form-group row">
                                    <label for="sex" class="col-sm-4 col-md-2 col-form-label"><?php echo display('sex') ?></label>
                                    <div id="sex" class="col-sm-8 col-md-10">
                                        <div class="radio radio-info radio-inline">
                                            <input type="radio" id="male"  disabled>
                                            <label for="male"><?php echo display('male') ?></label>
                                        </div>
                                        <div class="radio radio-inline">
                                            <input type="radio" id="female" disabled>
                                            <label for="female"><?php echo display('female') ?></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="doctor_name"  placeholder="<?php echo display('doctor_name') ?>" disabled/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="avatar-img center-block">
                            <img id="picture" src="<?php echo base_url('assets/images/staff.png') ?>" style="max-height:178px" class="img-responsive" alt="">
                        </div> 
                    </div>
                </div>

                <!--<hr>-->
                <div class="form-horizontal">
                    <div class="row"> 
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="form-group row">
                                <label for="admission_date" class="col-sm-4 col-form-label"><?php echo display('admission_date') ?></label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" value="" placeholder="<?php echo display('admission_date') ?>" id="admission_date" disabled>
                                </div>
                            </div>
                        </div> 
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="form-group row">
                                <label for="package_name" class="col-sm-4 col-form-label"><?php echo display('package_name') ?></label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="package_name" type="text" value="" placeholder="<?php echo display('package_name') ?>" id="package_name" disabled>
                                    <input name="package_id" type="hidden" id="package_id">
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="form-group row">
                                <label for="total_days" class="col-sm-4 col-form-label"><?php echo display('total_days') ?><br/>&nbsp;</label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text"  placeholder="<?php echo display('total_days') ?>" id="total_days" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="form-group row">
                                <label for="discharge_date" class="col-sm-4 col-form-label"><?php echo display('discharge_date') ?></label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" value="" placeholder="<?php echo display('discharge_date') ?>" id="discharge_date" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="form-group row">
                                <label for="insurance_name" class="col-sm-4 col-form-label"><?php echo display('insurance_name') ?></label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" value="" placeholder="<?php echo display('insurance_name') ?>" id="insurance_name" disabled>
                                </div>
                            </div>
                        </div> 
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="form-group row">
                                <label for="policy_no" class="col-sm-4 col-form-label"><?php echo display('policy_no') ?></label>
                                <div class="col-sm-8">
                                    <input class="form-control" type="text" value="" placeholder="<?php echo display('policy_no') ?>" id="policy_no" disabled>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>

 
                <div id="parentx" class="table-responsive">
                    <table id="fixTable" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th width="100"><i class="fa fa-cogs"></i></th>
                                <th><?php echo display('service_name') ?></th>
                                <th><?php echo display('quantity') ?></th>
                                <th><?php echo display('rate') ?></th>
                                <th><?php echo display('subtotal') ?></th>
                            </tr>
                        </thead>
                        <tbody id="services">
                        </table>
                </div>


                <div class="row">
                    <div class="col-sm-4">
                        <h3 class="block-title-2"><?php echo display('advance_payment') ?></h3>
                        <div class="table-responsive table-height">
                            <table class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th><?php echo display('date') ?></th>
                                        <th><?php echo display('receipt_no') ?></th>
                                        <th><?php echo display('amount') ?></th>
                                    </tr>
                                </thead>
                                <tbody id="advance_data"> 
                                </tbody>
                            </table>
                        </div>
                    </div>



                    <div class="col-sm-4">
                        <div class="form-group row">
                            <label class="col-sm-4 col-md-4 col-form-label"><?php echo display('payment_method') ?></label>
                            <div class="col-sm-8 col-md-8">
                                <?php 
                                    $paymentList = array(
                                        ''    => display('select_option'),
                                        'Cash'=>display('cash'),
                                        'Card'=>display('card'),
                                        'Cheque'=>display('cheque'),
                                    );
                                    echo form_dropdown('payment_method', $paymentList, null, array('class'=>'form-control basic-single', 'required'=>'required'));
                                ?>  
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="card_cheque_no" class="col-sm-4 col-md-4 col-form-label"><?php echo display('card_cheque_no') ?></label>
                            <div class="col-sm-8 col-md-8">
                                <input name="card_cheque_no" class="form-control" type="text" id="card_cheque_no" placeholder="<?php echo display('card_cheque_no') ?>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="receipt_no" class="col-sm-4 col-md-4 col-form-label"><?php echo display('receipt_no') ?></label>
                            <div class="col-sm-8 col-md-8">
                                <input name="receipt_no" class="form-control" type="text" value="" id="receipt_no" placeholder="<?php echo display('receipt_no') ?>">
                            </div>
                        </div> 
                    </div>



                    <div class="col-sm-4">
                        <div class="table-responsive m-b-20">
                            <table class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th><?php echo display('total') ?></th>
                                        <th><?php echo display('receipt') ?></th>
                                    </tr>
                                </thead>
                                <tbody
                                    <tr>
                                        <td><?php echo display('total') ?></td>
                                        <td><input name="total" type="text" class="form-control grand-calc" id="total" value="0.00"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="input-group">
                                              <div class="input-group-addon"><?php echo display('discount') ?> %</div>
                                              <input type="text" id="discountPercent" required="" autocomplete="off" class="form-control tax-discount-calc" value="0">
                                            </div>
                                        </td>
                                        <td><input name="discount" type="text" class="form-control grand-calc" id="discount" value="0.00"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="input-group">
                                              <div class="input-group-addon"><?php echo display('tax') ?> %</div>
                                              <input type="text" id="taxPercent" required="" autocomplete="off" class="form-control tax-discount-calc" value="0">
                                            </div>
                                        </td>
                                        <td><input name="tax" type="text" class="form-control grand-calc" id="tax" value="0.00"></td>
                                    </tr>
                                    <tr>
                                        <td><?php echo display('pay_advance') ?></td>
                                        <td><input type="text" class="form-control grand-calc" id="pay_advance" value="0.00"></td> 
                                    </tr>
                                    <tr>
                                        <td><?php echo display('payable') ?></td>
                                        <td><input type="text" class="form-control grand-calc" id="payable" value="0.00"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <textarea name="note" class="form-control" rows="5" placeholder="<?php echo display('notes') ?>"></textarea>
                </div> 


                <div class="form-group">
                    <div class="form-check">
                        <label class="radio-inline"><input type="radio" name="status" value="0" checked><?php echo display('unpaid') ?></label>
                        <label class="radio-inline"><input type="radio" name="status" value="1"><?php echo display('paid') ?></label>
                    </div>
                </div> 


                <div class="panel-footer text-center"> 
                    <button type="submit" class="btn btn-success w-md"><?php echo display('save') ?></button>
                </div>

            <?php echo form_close() ?>
            </div>

        </div>
    </div>
</div>
   

<script type="text/javascript">
$(document).ready(function(){

    // Enable sidebar push menu
    if ($("body").hasClass('sidebar-collapse')) {
        $("body").removeClass('sidebar-collapse').trigger('expanded.pushMenu');
    } else {
        $("body").addClass('sidebar-collapse').trigger('collapsed.pushMenu');
    }


    // #---------------ADD OR REMOVE ITEM-------------------#
    var services_html = "<tr>"+
    "<td><div class=\"btn btn-group\">"+
        "<button type=\"button\" class=\"addMore btn btn-sm btn-success\">+</button>"+
        "<button type=\"button\" class=\"remove btn btn-sm btn-danger\">-</button>"+
    "</div></td>"+
    "<td><input name=\"service_name[]\" class=\"form-control service_name service_data\" type=\"text\" placeholder=\"<?php echo display('service_name') ?>\" required><input name=\"service_id[]\" type=\"hidden\" class=\"service_id\" required></td>"+
    "<td><input name=\"quantity[]\" class=\"form-control quantity item-calc\" type=\"text\" placeholder=\"<?php echo display('quantity') ?>\" value=\"1\" required></td>"+
    "<td><input name=\"amount[]\" class=\"form-control amount item-calc\" type=\"text\" placeholder=\"<?php echo display('amount') ?>\"  value=\"0.00\"  required></td>"+
    "<td><input name=\"subtotal[]\" class=\"form-control subtotal\" type=\"text\" placeholder=\"<?php echo display('subtotal') ?>\"  value=\"0.00\" required></td>"+
    "</tr>";

    $("#services").append(services_html);
    $('body').on('click', '.addMore', function() {
        $("#services").append(services_html); 

        //total   
        var total = 0;
        $('.subtotal').each(function(){ 
            total  += parseFloat($(this).val());
            $('#total').val(total.toFixed(2));
        });  

        $("#payable").val(
            (parseFloat($("#total").val())+parseFloat($("#tax").val())-parseFloat($("#discount").val())-parseFloat($("#pay_advance").val())).toFixed(2)
        );   

    });


    $('body').on('click', '.remove', function() {
       $(this).parent().parent().parent().remove();
 
        //total   
        var total = 0;
        $('.subtotal').each(function(){ 
            total  += parseFloat($(this).val());
            $('#total').val(total.toFixed(2));
        });  

        var tax = $("#tax").val();
        var discount = $("#discount").val();
        $("#taxPercent").val(parseFloat((tax/total) * 100).toFixed(2)); 
        $("#discountPercent").val(parseFloat((discount/total) * 100).toFixed(2));  

        $("#payable").val(
            (parseFloat($("#total").val())+parseFloat($("#tax").val())-parseFloat($("#discount").val())-parseFloat($("#pay_advance").val())).toFixed(2)
        );   
    });


    // #----------------------------------------------#
    var patient_id     = $("#patient_id");
    var admission_date = $("#admission_date");
    var discharge_date = $("#discharge_date");
    var total_days     = $("#total_days");
    var patient_name   = $("#patient_name");
    var address        = $("#address");
    var date_of_birth  = $("#date_of_birth");
    var male           = $("#male");
    var female         = $("#female"); 
    var doctor_name    = $("#doctor_name"); 
    var insurance_name = $("#insurance_name"); 
    var policy_no      = $("#policy_no"); 
    var picture        = $("#picture"); 
    var package_id     = $("#package_id"); 
    var package_name   = $("#package_name"); 
    var total_days     = $("#total_days"); 
    var advance_data   = $("#advance_data"); 
    var pay_advance    = $("#pay_advance"); 
    var discount       = $("#discount"); 
    // #----------------------------------------------#



    var aid = $("#admission_id");
    aid.on('keyup change',function(){

        patient_id.val('');
        admission_date.val('');
        discharge_date.val('');
        total_days.val('');
        patient_name.val('');
        address.val('');
        male.val('');
        female.val('');
        doctor_name.val('');
        insurance_name.val('');
        policy_no.val('');
        picture.attr('src','');
        package_id.val('');
        package_name.val('');
        total_days.val('0'); 
        advance_data.html(''); 
        pay_advance.val('0.00'); 
        discount.val('0.00'); 

        $.ajax({
            url: '<?php echo base_url('billing/bill/getInformation') ?>',
            method: 'post',
            dataType: 'json',
            data: {
                admission_id: $(this).val(),
                '<?= $this->security->get_csrf_token_name() ?>':'<?= $this->security->get_csrf_hash() ?>'
            },
            success: function(data)
            {  

                if (data.status==true)
                {
                    //patient information 
                    patient_id.val(data.result.patient_id);
                    patient_name.val(data.result.patient_name);
                    address.val(data.result.address);
                    date_of_birth.val(data.result.date_of_birth);
                    if(data.result.sex=="female")
                    {
                        male.removeAttr('checked');
                        female.attr('checked','checked'); 
                    }
                    else
                    {
                        male.attr('checked','checked');
                        female.removeAttr('checked');
                    }
                    picture.attr('src','<?= base_url() ?>'+data.result.picture);

                    //doctor information
                    doctor_name.val(data.result.doctor_name);

                    // admission information
                    admission_date.val(data.result.admission_date);
                    discharge_date.val(data.result.discharge_date);
                    total_days.val(data.result.total_days);


                    //insurance information
                    insurance_name.val(data.result.insurance_name);
                    policy_no.val(data.result.policy_no);

                    //package information
                    package_id.val(data.result.package_id);
                    package_name.val(data.result.package_name);
                    discount.val(data.result.discount);

                    var services_html = "";
                    var serviceObj = JSON.parse(data.result.services);
                    $.each(serviceObj, function(i,x){ 
                        services_html += "<tr>"+
                        "<td><div class=\"btn btn-group\">"+
                            "<button type=\"button\" class=\"addMore btn btn-sm btn-success\">+</button>"+
                            "<button type=\"button\" class=\"remove btn btn-sm btn-danger\">-</button>"+
                        "</div></td>"+
                        "<td><input name=\"service_name[]\" value='"+x.name+"' class=\"form-control service_name service_data\" type=\"text\" placeholder=\"<?php echo display('service_name') ?>\" required><input name=\"service_id[]\" type=\"hidden\" class=\"service_id\" value='"+x.id+"' required></td>"+
                        "<td><input name=\"quantity[]\" value='"+x.quantity+"' class=\"form-control quantity item-calc\" type=\"text\" placeholder=\"<?php echo display('quantity') ?>\" value=\"1\" required></td>"+
                        "<td><input name=\"amount[]\" value='"+x.amount+"' class=\"form-control amount item-calc\" type=\"text\" placeholder=\"<?php echo display('amount') ?>\"  value=\"0.00\" required></td>"+
                        "<td><input name=\"subtotal[]\" value='"+(x.quantity*x.amount).toFixed(2)+"' class=\"form-control subtotal\" type=\"text\" placeholder=\"<?php echo display('subtotal') ?>\"  value=\"0.00\" required></td>"+
                        "</tr>";
                    });
                    if (serviceObj && serviceObj.length > 0)
                    {
                        $("#services").html(services_html);
                    } 

                    //success state
                    aid.parent().removeClass('has-error').addClass('has-success');
                    aid.next().html('<button type="button" class="btn btn-success"><i class="fa fa-check"></i></button>');


                    //advance_data payment
                    advance_data.html(data.advance_data);
                    pay_advance.val(data.pay_advance.toFixed(2));
 

                    //total   
                    var total = 0;
                    $('.subtotal').each(function(){ 
                        total  += parseFloat($(this).val());
                        $('#total').val(total.toFixed(2));
                    });  


                    $("#discountPercent").val(parseFloat((data.result.discount/total) * 100).toFixed(2)); 
                    $("#taxPercent").val("0.00");


                    $("#payable").val(
                        (parseFloat($("#total").val())+parseFloat($("#tax").val())-parseFloat($("#discount").val())-parseFloat($("#pay_advance").val())).toFixed(2)
                    );   
                }
                else
                {
                    aid.parent().addClass('has-error').removeClass('has-success');
                    aid.next().html('<button type="button" class="btn btn-danger"><i class="fa fa-times"></i></button>');
                }
            },
            error: function(e)
            {
                alert('failed...');
            }
        });
    });


 
    // #---------------SERVICE LIST-------------------#
    var options = {
      minLength: 0,
      source: [
        <?php 
        foreach ($service_list as $service):
            echo "{label:'$service->name', service_id:'$service->id', quantity:'$service->quantity', amount:'$service->amount'}, "; 
        endforeach;
        ?>
        ],
        focus: function( event, ui ) {
            $(this).val(ui.item.label);
            return false;
        },
        select: function( event, ui ) {
            $(this).parent().parent().find(".service_name").val(ui.item.label);
            $(this).parent().parent().find(".service_id").val(ui.item.service_id);
            $(this).parent().parent().find(".quantity").val(ui.item.quantity);
            $(this).parent().parent().find(".amount").val(ui.item.amount);
            $(this).parent().parent().find(".subtotal").val(parseFloat(ui.item.amount)*parseFloat(ui.item.quantity));

            //total   
            var total = 0;
            $('.subtotal').each(function(){ 
                total  += parseFloat($(this).val());
                $('#total').val(total.toFixed(2));
            });  

            var tax = $("#tax").val();
            var discount = $("#discount").val();
            $("#taxPercent").val(parseFloat((tax/total) * 100).toFixed(2)); 
            $("#discountPercent").val(parseFloat((discount/total) * 100).toFixed(2)); 


            $("#payable").val(
                (parseFloat($("#total").val())+parseFloat($("#tax").val())-parseFloat($("#discount").val())-parseFloat($("#pay_advance").val())).toFixed(2)
            );  
            return false;
        }
    } 

    $('body').on('keydown.autocomplete', '.service_data', function() {
        $(this).autocomplete(options);
    });


    // total summation
    $('body').on('keyup', '.item-calc', function() {
        var qty = $(this).parent().parent().find(".quantity").val();
        var amt = $(this).parent().parent().find(".amount").val();
        $(this).parent().parent().find(".subtotal").val((qty*amt).toFixed(2));

        //total   
        var total = 0;
        $('.subtotal').each(function(){ 
            total  += parseFloat($(this).val());
            $('#total').val(total.toFixed(2));
        }); 

        var tax = $("#tax").val();
        var discount = $("#discount").val();
        $("#taxPercent").val(parseFloat((tax/total) * 100).toFixed(2)); 
        $("#discountPercent").val(parseFloat((discount/total) * 100).toFixed(2));  

        $("#payable").val(
            (parseFloat($("#total").val())+parseFloat($("#tax").val())-parseFloat($("#discount").val())-parseFloat($("#pay_advance").val())).toFixed(2)
        );  
    });
 
    
    // grand total summation
    $('body').on('keyup', '.grand-calc', function() {  

        var total       = $('#total').val();
        var tax         = $('#tax').val();
        var discount    = $('#discount').val(); 
        $("#taxPercent").val(parseFloat((tax/total) * 100).toFixed(2)); 
        $("#discountPercent").val(parseFloat((discount/total) * 100).toFixed(2)); 

        $("#payable").val(
            (parseFloat($("#total").val())+parseFloat($("#tax").val())-parseFloat($("#discount").val())-parseFloat($("#pay_advance").val())).toFixed(2)
        );  
    });

    // tax-discount-calc
    $('body').on('keyup', '.tax-discount-calc', function() 
    {   
        var total = $("#total").val();
        var discountPercent = $("#discountPercent").val(); 
        $("#discount").val(((parseFloat(discountPercent)/100)*parseFloat(total)).toFixed(2));

        var taxPercent = $("#taxPercent").val(); 
        $("#tax").val(((parseFloat(taxPercent)/100)*parseFloat(total)).toFixed(2));
 

        $("#payable").val(
            (parseFloat($("#total").val())+parseFloat($("#tax").val())-parseFloat($("#discount").val())-parseFloat($("#pay_advance").val())).toFixed(2)
        );  
    });



});
</script>