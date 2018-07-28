<div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" href="<?php echo base_url("billing/package/index") ?>"> <i class="fa fa-list"></i>  <?php echo display('package_list') ?> </a>  
                </div>
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
                    <div class="col-sm-12">

                        <?php echo form_open('billing/package/edit/'.$package->id,'class="form-inner"') ?>
                            <?php echo form_hidden('id',$package->id) ?>

                            <div class="form-group row">
                                <label for="name" class="col-sm-3 col-form-label"><?php echo display('package_name') ?> <i class="text-danger">*</i></label>
                                <div class="col-sm-9">
                                    <input name="name"  type="text" class="form-control" id="name" placeholder="<?php echo display('package_name') ?>" value="<?php echo $package->name ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="description" class="col-sm-3 col-form-label"><?php echo display('description') ?></label>
                                <div class="col-sm-9">
                                    <textarea name="description" description="description"  type="text" class="form-control" id="description" placeholder="<?php echo display('description') ?>"><?php echo $package->description ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="services" class="col-sm-3 col-form-label">Package Including <i class="text-danger">*</i></label>
                                <div class="col-sm-9">
                                    <table id="services" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th><?php echo display('service') ?></th>
                                                <th><?php echo display('quantity') ?></th>
                                                <th><?php echo display('Rate') ?></th>
                                                <th><?php echo display('add_or_remove') ?></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php 
                                                $services = json_decode($package->services, true);  
                                                for($i=0;$i<count($services);$i++)
                                                {
                                                    if(isset($services[$i])) 
                                                    { 
                                                        echo "<tr>";
                                                        echo "<td><input name=\"service_name[]\" class=\"form-control service_name service_data\" type=\"text\" placeholder=".display('service_name')." value='".$services[$i]['name']."'><input type=\"hidden\" name=\"service_id[]\" class=\"service_id\" value='".$services[$i]['id']."'></td>";
                                                        echo "<td><input name=\"quantity[]\" class=\"form-control quantity\" type=\"text\" placeholder=".display('quantity')." value='".$services[$i]['quantity']."'></td>";
                                                        echo "<td><input name=\"amount[]\" class=\"form-control amount\" type=\"text\" placeholder=".display('amount')." value='".$services[$i]['amount']."'></td>";
                                                        echo "<td><div class=\"btn btn-group\">
                                                            <button type=\"button\" class=\"addMore btn btn-sm btn-success\">+</button>
                                                            <button type=\"button\" class=\"remove btn btn-sm btn-danger\">-</button>
                                                            </div></td>"; 
                                                        echo "</tr>";
                                                    } 
                                                } 
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="discount" class="col-sm-3 col-form-label"><?php echo display('discount') ?> <i class="text-danger">*</i></label>
                                <div class="col-sm-9">
                                    <input name="discount"  type="text" class="form-control" id="discount" placeholder="<?php echo display('discount') ?>" value="<?php echo $package->discount ?>">
                                </div>
                            </div>

                            <!--Radio-->
                            <div class="form-group row">
                                <label class="col-sm-4"><?php echo display('status') ?></label>
                                <div class="col-sm-4"> 
                                    <div class="form-check">
                                        <label class="radio-inline"><input type="radio" name="status" value="1" checked><?php echo display('active') ?></label>
                                        <label class="radio-inline"><input type="radio" name="status" value="0"><?php echo display('inactive') ?></label>
                                    </div>
                                </div> 
                                <div class="col-sm-4">
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
$(document).ready(function() 
{

    // add or remove item
    var services_html = "<tr>"+
    "<td><input name=\"service_name[]\" class=\"form-control service_name service_data\" type=\"text\" placeholder=\"<?php echo display('service_name') ?>\"><input name=\"service_id[]\" type=\"hidden\" class=\"service_id\"></td>"+
    "<td><input name=\"quantity[]\" class=\"form-control quantity\" type=\"text\" placeholder=\"<?php echo display('quantity') ?>\"></td>"+
    "<td><input name=\"amount[]\" class=\"form-control amount\" type=\"text\" placeholder=\"<?php echo display('amount') ?>\"></td>"+
    "<td><div class=\"btn btn-group\">"+
        "<button type=\"button\" class=\"addMore btn btn-sm btn-success\">+</button>"+
        "<button type=\"button\" class=\"remove btn btn-sm btn-danger\">-</button>"+
    "</div></td>"+
    "</tr>";

    $("#services").append(services_html);
    $('body').on('click', '.addMore', function() {
        $("#services").append(services_html);
    });
    $('body').on('click', '.remove', function() {
       $(this).parent().parent().parent().remove();
    });
 


    // auto complete 
    var options = {
      minLength: 0,
      source: [
        <?php 
        if (!empty($service_list))
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
            return false;
        }
    } 

    $('body').on('keydown.autocomplete', '.service_data', function() {
        $(this).autocomplete(options);
    });

});
</script>
</head>
<body>
  
