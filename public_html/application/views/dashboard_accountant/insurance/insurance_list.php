<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-success" href="<?php echo base_url("dashboard_accountant/insurance/insurance/form") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_insurance') ?> </a>  
                </div>
            </div> 
            <div class="panel-body">
                <table width="100%" class="datatable2 table table-striped table-bordered table-hover">
                    <thead> 
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('insurance_name') ?></th>
                            <th><?php echo display('service_tax') ?></th>
                            <th><?php echo display('remark') ?></th>
                            <th><?php echo display('insurance_no') ?></th>
                            <th><?php echo display('insurance_code') ?></th>
                            <th><?php echo display('hospital_rate') ?></th>
                            <th><?php echo display('insurance_rate') ?></th>
                            <th><?php echo display('total') ?></th>
                            <th><?php echo display('status') ?></th>
                            <th width="80"><?php echo display('action') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($insurances)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($insurances as $insurance) { ?>
                                <tr>
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $insurance->insurance_name; ?></td>
                                    <td><?php echo $insurance->service_tax; ?></td>
                                    <td><?php echo $insurance->discount; ?></td>
                                    <td><?php echo $insurance->insurance_no; ?></td>
                                    <td><?php echo $insurance->insurance_code; ?></td> 
                                    <td><?php echo $insurance->hospital_rate; ?></td> 
                                    <td><?php echo $insurance->insurance_rate; ?></td> 
                                    <td><?php echo $insurance->total; ?></td> 
                                    <td><?php echo (($insurance->status==1)?display('active'):display('inactive')); ?></td>
                                    <td class="center">
                                        <a href="<?php echo base_url("dashboard_accountant/insurance/insurance/view/$insurance->id") ?>" class="btn btn-xs btn-success"><i class="fa fa-eye"></i></a> 
                                        <a href="<?php echo base_url("dashboard_accountant/insurance/insurance/update/$insurance->id") ?>" class="btn btn-xs btn-primary"><i class="fa fa-edit"></i></a> 
                                        <a href="<?php echo base_url("dashboard_accountant/insurance/insurance/delete/$insurance->id") ?>" class="btn btn-xs btn-danger" onclick="return confirm('<?php echo display('are_you_sure') ?>')"><i class="fa fa-trash"></i></a> 
                                    </td>
                                </tr>
                                <?php $sl++; ?>
                            <?php } ?> 
                        <?php } ?> 
                    </tbody>
                </table>  <!-- /.table-responsive -->
                <?php echo $links; ?>
            </div>
        </div>
    </div>
</div>