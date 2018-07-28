<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">

            <div class="panel-heading">
                <h3><?php echo display('bed_assign_list') ?> </h3>
            </div>

            <div class="panel-body">
                <table class="datatable table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('patient_id') ?></th>
                            <th><?php echo display('bed_type') ?></th>
                            <th><?php echo display('description') ?></th>
                            <th><?php echo display('charge') ?></th> 
                            <th><?php echo display('day') ?></th> 
                            <th><?php echo display('total') ?></th> 
                            <th><?php echo display('assign_date') ?></th>
                            <th><?php echo display('discharge_date') ?></th>
                            <th><?php echo display('assign_by') ?></th>
                            <th><?php echo display('status') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($beds)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($beds as $bed) { ?>
                                <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $bed->patient_id; ?></td>
                                    <td><?php echo $bed->bed_name; ?></td>
                                    <td><?php echo character_limiter($bed->description, 60); ?></td>
                                    <td><?php echo $bed->charge; ?></td>
                                    <td><?php echo $bed->days; ?></td>
                                    <td><?php echo number_format($bed->charge * $bed->days, 2); ?></td>
                                    <td><?php echo $bed->assign_date; ?></td>
                                    <td><?php echo $bed->discharge_date; ?></td>
                                    <td><?php echo $bed->assign_by; ?></td>
                                    <td><?php echo (($bed->status==1)?display('active'):display('inactive')); ?></td>
                                </tr>
                                <?php $sl++; ?>
                            <?php } ?> 
                        <?php } ?> 
                    </tbody>
                </table>  <!-- /.table-responsive -->
            </div>
        </div>
    </div>
</div>
