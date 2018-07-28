<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group">
                    <a class="btn btn-success" href="<?php echo base_url("dashboard_laboratorist/hospital_activities/investigation/form") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_investigation_report') ?> </a> 
                </div>
            </div> 
            <div class="panel-body">
                <table class="datatable table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('picture') ?></th>
                            <th><?php echo display('patient_id') ?></th>
                            <th><?php echo display('title') ?></th>
                            <th><?php echo display('description') ?></th>
                            <th><?php echo display('doctor_name') ?></th>
                            <th><?php echo display('status') ?></th>
                            <th><?php echo display('action') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($investigations)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($investigations as $investigation) { ?>
                                <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">
                                    <td><?php echo $sl; ?></td>
                                    <td><img src="<?php echo (!empty($investigation->picture) ? base_url($investigation->picture) : base_url("assets/images/no-img.png")) ?>" width="65" height="50"/></td>

                                    <td><?php echo $investigation->patient_id; ?></td>
                                    <td><?php echo $investigation->title; ?></td>
                                    <td><?php echo character_limiter($investigation->description, 60); ?></td>
                                    <td><?php echo $investigation->doctor_name; ?></td>
                                    <td><?php echo (($investigation->status==1)?display('active'):display('inactive')); ?></td>
                                    <td class="center" width="80">
                                        <a href="<?php echo base_url("dashboard_laboratorist/hospital_activities/investigation/details/$investigation->id") ?>" class="btn btn-xs btn-success"><i class="fa fa-eye"></i></a> 
                                        <a href="<?php echo base_url("dashboard_laboratorist/hospital_activities/investigation/form/$investigation->id") ?>" class="btn btn-xs  btn-primary"><i class="fa fa-edit"></i></a> 
                                        <a href="<?php echo base_url("dashboard_laboratorist/hospital_activities/investigation/delete/$investigation->id") ?>" onclick="return confirm('<?php echo display("are_you_sure") ?>')" class="btn btn-xs  btn-danger"><i class="fa fa-trash"></i></a> 
                                    </td>
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
