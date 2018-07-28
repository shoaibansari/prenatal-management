<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-success" href="<?php echo base_url("billing/package/form") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_package') ?> </a>  
                </div>
            </div>
            <div class="panel-body">
                <table class="datatable2 table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('package_name') ?></th>
                            <th><?php echo display('description') ?></th>
                            <th><?php echo display('discount') ?></th>
                            <th><?php echo display('status') ?></th>
                            <th><?php echo display('action') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($packages)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($packages as $package) { ?>
                                <tr>
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $package->name; ?></td>
                                    <td><?php echo character_limiter($package->description, 60); ?></td> 
                                    <td><?php echo $package->discount; ?></td>
                                    <td><?php echo (($package->status==1)?display('active'):display('inactive')); ?></td>
                                    <td class="center">
                                        <a href="<?php echo base_url("billing/package/view/$package->id") ?>" class="btn btn-xs  btn-primary"><i class="fa fa-eye"></i></a> 
                                        <a href="<?php echo base_url("billing/package/edit/$package->id") ?>" class="btn btn-xs  btn-warning"><i class="fa fa-edit"></i></a> 
                                        <a href="<?php echo base_url("billing/package/delete/$package->id") ?>" onclick="return confirm('<?php echo display("are_you_sure") ?>')" class="btn btn-xs  btn-danger"><i class="fa fa-trash"></i></a> 
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
