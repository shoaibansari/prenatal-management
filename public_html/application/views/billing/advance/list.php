<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-success" href="<?php echo base_url("billing/advance/form") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_advance') ?> </a>  
                </div>
            </div>
            <div class="panel-body">
                <table class="datatable2 table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead> 
                        <tr> 
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('admission_id') ?></th>
                            <th><?php echo display('patient_id') ?></th>
                            <th><?php echo display('amount') ?></th>
                            <th><?php echo display('payment_method') ?></th>
                            <th><?php echo display('cash_card_or_cheque') ?></th>
                            <th><?php echo display('receipt_no') ?></th>
                            <th><?php echo display('date') ?></th>
                            <th><?php echo display('action') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($advances)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($advances as $advance) { ?>
                                <tr>
                                    <td><?php echo $sl++; ?></td>
                                    <td><?php echo $advance->admission_id; ?></td>
                                    <td><?php echo $advance->patient_id; ?></td>
                                    <td><?php echo $advance->amount; ?></td>
                                    <td><?php echo $advance->payment_method; ?></td>
                                    <td><?php echo $advance->cash_card_or_cheque; ?></td>
                                    <td><?php echo $advance->receipt_no; ?></td>
                                    <td><?php echo $advance->date; ?></td>
                                    <td class="center">
                                        <a href="<?php echo base_url("billing/advance/form/$advance->id") ?>" class="btn btn-xs  btn-primary"><i class="fa fa-edit"></i></a> 
                                        <a href="<?php echo base_url("billing/advance/delete/$advance->id") ?>" onclick="return confirm('<?php echo display("are_you_sure") ?>')" class="btn btn-xs  btn-danger"><i class="fa fa-trash"></i></a> 
                                    </td>
                                </tr>
                            <?php } ?> 
                        <?php } ?> 
                    </tbody>
                </table>  <!-- /.table-responsive -->
                <?php echo (!empty($links)?$links:null); ?>
            </div>
        </div>
    </div>
</div>
