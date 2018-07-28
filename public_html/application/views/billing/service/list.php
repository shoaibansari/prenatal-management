<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-success" href="<?php echo base_url("billing/service/form") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_service') ?> </a>  
                </div>
            </div>
            <div class="panel-body">
                <table class="datatable2 table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('service_name') ?></th>
                            <th><?php echo display('description') ?></th>
                            <th><?php echo display('quantity') ?></th>
                            <th><?php echo display('rate') ?></th>
                            <th><?php echo display('status') ?></th>
                            <th><?php echo display('action') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($services)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($services as $service) { ?>
                                <tr>
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $service->name; ?></td>
                                    <td><?php echo character_limiter($service->description, 60); ?></td>
                                    <td><?php echo $service->quantity; ?></td>
                                    <td><?php echo $service->amount; ?></td>
                                    <td><?php echo (($service->status==1)?display('active'):display('inactive')); ?></td>
                                    <td class="center">
                                        <a href="<?php echo base_url("billing/service/form/$service->id") ?>" class="btn btn-xs  btn-primary"><i class="fa fa-edit"></i></a> 
                                        <a href="<?php echo base_url("billing/service/delete/$service->id") ?>" onclick="return confirm('<?php echo display("are_you_sure") ?>')" class="btn btn-xs  btn-danger"><i class="fa fa-trash"></i></a> 
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
