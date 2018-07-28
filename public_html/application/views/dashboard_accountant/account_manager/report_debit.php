<div class="row">

    <div class="col-sm-12">
        <div  class="panel panel-default">
            <div class="panel-body"> 

                <form class="form-inline" action="<?php echo base_url('dashboard_accountant/account_manager/report/debit') ?>">

                    <div class="form-group">
                        <?php
                            $ReportOption = array(
                                '1' => display('all'), 
                                '2' => display('patient_wise'),
                                '3' => display('account_wise'),
                            );
                            echo form_dropdown('report_option',$ReportOption, $date->report_option, 'class="form-control" id="ReportOption"' );
                        ?>
                    </div> 

                    <div class="form-group hide" id="AccountWise">
                        <label class="sr-only" for="account_id"><?php echo display('account_id') ?></label>
                        <?php echo form_dropdown('account_id', $debit_acc_list, $date->account_id,'class="form-control"') ?> 
                    </div>   

                    <div class="form-group hide" id="PatientWise">
                        <label class="sr-only" for="patient_id"><?php echo display('patient_id') ?></label>
                        <input type="text" name="patient_id" class="form-control" id="patient_id" placeholder="<?php echo display('patient_id') ?>" value="<?php echo $date->patient_id ?>">
                    </div>

                    <div class="form-group">
                        <label class="sr-only" for="start_date"><?php echo display('start_date') ?></label>
                        <input type="text" name="start_date" class="form-control datepicker" id="start_date" placeholder="<?php echo display('start_date') ?>" value="<?php echo $date->start_date ?>">
                    </div> 

                    <div class="form-group">
                        <label class="sr-only" for="end_date"><?php echo display('end_date') ?></label>
                        <input type="text" name="end_date" class="form-control datepicker" id="end_date" placeholder="<?php echo display('end_date') ?>" value="<?php echo $date->end_date ?>">
                    </div>  

                    <button type="submit" class="btn btn-success"><?php echo display('filter') ?></button>

                </form>

            </div>
        </div>
    </div>
 


    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default">
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover" id="acmReport">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('date') ?></th>
                            <th><?php echo display('patient_id') ?></th>
                            <th><?php echo display('account_name') ?></th>
                            <th><?php echo display('description') ?></th>
                            <th><?php echo display('quantity') ?></th>
                            <th><?php echo display('price') ?></th>
                            <th><?php echo display('total') ?>
                        </tr>
                    </thead>
                <tfoot>
                    <tr>
                        <th></th>   
                        <th></th>   
                        <th></th>   
                        <th></th>   
                        <th></th>   
                        <th></th>   
                        <th></th>   
                        <th></th>    
                    </tr>
                </tfoot>

                    <tbody>
                        <?php  
                        if (!empty($invoice)) {
                            $sl = 1;
                            foreach ($invoice as $value) {
                        ?>
                            <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">
                                <td><?php echo $sl; ?></td>
                                <td><?php echo date('d-m-Y', strtotime($value->date)); ?></td>
                                <td><?php echo $value->patient_id; ?></td>
                                <td><?php echo $value->account_name; ?></td>
                                <td><?php echo character_limiter($value->description, 150); ?></td>
                                <td><?php echo  sprintf('%0.2f', $value->quantity); ?></td>
                                <td><?php echo sprintf('%0.2f', $value->price); ?></td>
                                <td><?php echo  sprintf('%0.2f', $value->subtotal); ?></td>
                            </tr>
                        <?php 
                            $sl++;

                            } 
                        } 
                        ?> 
                    </tbody>
                </table>  <!-- /.table-responsive -->
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
$(window).load(function(){
    var option = '<?php echo $this->input->get("report_option") ?>';
    reportFilter(option);
});

function reportFilter(option) 
{
    if (option == 2) {
        $("#PatientWise").removeClass('hide');
        $("#AccountWise").addClass('hide');
        $("#DebitAccount").addClass('hide'); 
        $("#CreditAccount").addClass('hide');
    } else if (option == 3) {
        $("#AccountWise").removeClass('hide');
        $("#PatientWise").addClass('hide');
    } else { 
        $("#AccountWise").addClass('hide');
        $("#PatientWise").addClass('hide');
        $("#DebitAccount").addClass('hide');
        $("#CreditAccount").addClass('hide');
    } 
}


$(document).ready(function() {

    $('#ReportOption').change(function(){
        var option = $(this).val();
        reportFilter(option);
    });

    $("#AccType").change(function() {
        var type = $(this).val();

        if (type == 1) { //debit wise
            $("#DebitAccount").removeClass('hide');
            $("#CreditAccount").addClass('hide');
        } else if (type == 2) { //credit wise
            $("#CreditAccount").removeClass('hide');
            $("#DebitAccount").addClass('hide');
        } else { 
            $("#CreditAccount").addClass('hide');
            $("#DebitAccount").addClass('hide'); 
        } 
    });


    $('#acmReport').DataTable( {
        responsive: true, 
        dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp", 
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]], 
        buttons: [ {extend: 'copy', className: 'btn-sm'}, 
        {extend: 'csv', title: 'ExampleFile', className: 'btn-sm'}, 
        {extend: 'excel', title: 'ExampleFile', className: 'btn-sm'}, 
        {extend: 'pdf', title: 'ExampleFile', className: 'btn-sm'}, 
        {extend: 'print', className: 'btn-sm'} ], 

        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
            // Remove the formatting to get integer data for summation
            var intVal = function (i) {
                return typeof i === 'string' ? i.replace(/[\$,]/g, '')*1:typeof i === 'number' ? i : 0;
            };   

            //#----------- Total over this page------------------#
            quantity = api.column( 5, { page: 'current'} ).data().reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                },0); 
            price = api.column(6, { page: 'current'} ).data().reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                },0);
            amount = api.column(7, { page: 'current'} ).data().reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                },0); 
            //#------ends of Total over this page------------------#
            // Update footer
            $( api.column(5).footer()).html(quantity.toFixed(2)); 
            $( api.column(6).footer()).html(price.toFixed(2));
            $( api.column(7).footer()).html(amount.toFixed(2));
        } 
    });
});

</script>
