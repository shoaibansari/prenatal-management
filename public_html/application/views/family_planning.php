
<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-success" href="<?php echo base_url("family_planning/create") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_audio') ?> </a>  
                </div>
            </div> 

            <div class="panel-body">
                <table class="datatable table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('name') ?></th>
                            <th><?php echo display('language') ?></th>
                            <th><?php echo 'File Name' ?></th>
                            <th><?php echo display('action')?></th>

                           
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($audio_lists)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($audio_lists as $list) { ?>
                                <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $list->name; ?></td>
                                    <td><?php echo $language[$list->language] ?></td>
                                    <td><?php echo $list->file_name; ?></td>
                                    <td>
                                        <div class="action-btn">
                                        <!-- <a href="<?php echo base_url("doctor/profile/$doctor->user_id") ?>" class="btn btn-xs btn-success"><i class="fa fa-eye"></i></a>  -->
                                        <a href="<?php echo base_url("family_planning/edit/$list->id") ?>" class="btn btn-xs btn-primary"><i class="fa fa-edit"></i></a> 
                                        <a href="<?php echo base_url("family_planning/delete/$list->id") ?>" class="btn btn-xs btn-danger" onclick="return confirm('<?php echo display('are_you_sure') ?> ')"><i class="fa fa-trash"></i></a>
                                        </div> 
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
