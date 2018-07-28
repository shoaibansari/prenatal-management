<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-success" href="<?php echo base_url("billing/bill/form") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_bill') ?> </a>  
                </div>
            </div>
            <div class="panel-body">
                <table id="billList" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr> 
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('patient_name') ?></th>
                            <th><?php echo display('admission_id') ?></th>
                            <th><?php echo display('bill_id') ?></th>
                            <th><?php echo display('bill_date') ?></th>
                            <th><?php echo display('total') ?></th>
                            <th><?php echo display('discount') ?></th> 
                            <th><?php echo display('tax') ?></th>
                            <th><?php echo display('status') ?></th>
                            <th><?php echo display('action') ?></th>
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
                            <th></th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <?php if (!empty($bills)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($bills as $bill) { ?>
                                <tr>
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $bill->patient_name; ?></td>
                                    <td><?php echo $bill->admission_id; ?></td>
                                    <td><?php echo $bill->bill_id; ?></td>
                                    <td><?php echo $bill->bill_date; ?></td>
                                    <td><?php echo $bill->total; ?></td>
                                    <td><?php echo $bill->discount; ?></td>
                                    <td><?php echo $bill->tax; ?></td>

                                    <td><?php echo (($bill->status==1)?"<span class=\"label labe-xs label-success\">".display('paid')."</span>":"<span class=\"label labe-xs label-danger\">".display('unpaid')."</span>"); ?></td>

                                    <td class="center">
                                        <a href="<?php echo base_url("billing/bill/view/$bill->bill_id") ?>" class="btn btn-xs  btn-primary"><i class="fa fa-eye"></i></a> 
                                        <a href="<?php echo base_url("billing/bill/edit/$bill->bill_id") ?>" class="btn btn-xs  btn-warning"><i class="fa fa-edit"></i></a> 
                                        <a href="<?php echo base_url("billing/bill/delete/$bill->bill_id") ?>" onclick="return confirm('<?php echo display("are_you_sure") ?>')" class="btn btn-xs  btn-danger"><i class="fa fa-trash"></i></a> 
                                    </td>
                                </tr>
                                <?php $sl++; ?>
                            <?php } ?> 
                        <?php } ?> 
                    </tbody>
                </table>  <!-- /.table-responsive -->
                <?php echo (!empty($links)?$links:null); ?>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function() {

    $('#billList').DataTable( {
        responsive: true, 
        paging:false,
        dom: "<'row'<'col-sm-4'B><'col-sm-4'l><'col-sm-4'f>>tp", 
        buttons: [  
            {extend: 'copy', className: 'btn-sm'}, 
            {extend: 'csv', title: 'ExampleFile', className: 'btn-sm'}, 
            {extend: 'excel', title: 'ExampleFile', className: 'btn-sm', title: 'exportTitle'}, 
            {extend: 'pdf', title: 'ExampleFile', className: 'btn-sm'}, 
            {extend: 'print', className: 'btn-sm'} 
        ], 

        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
            // Remove the formatting to get integer data for summation
            var intVal = function (i) {
                return typeof i === 'string' ? i.replace(/[\$,]/g, '')*1:typeof i === 'number' ? i : 0;
            };   

            //----------- Total over this page-----------          

            total = api.column(5, { page: 'current'} ).data().reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                },0);
         
            discount = api.column(6, { page: 'current'} ).data().reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                },0);
         
            tax = api.column(7, { page: 'current'} ).data().reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                },0);
          
            //---------ends of Total over this page----------
            // Update footer
            $( api.column(5).footer()).html((total).toFixed(2)); 
            $( api.column(6).footer()).html((discount).toFixed(2)); 
            $( api.column(7).footer()).html(tax.toFixed(2)); 
        } 
    });
});
</script>
