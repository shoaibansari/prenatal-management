<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading">
                <a href="<?= base_url('website/section/create') ?>" class="btn btn-success"><i class="fa fa-plus"></i> <?php echo display('new_section') ?></a>
            </div>

            <div class="panel-body">
                <table width="100%" class="datatable table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('picture') ?></th>
                            <th><?php echo display('menu_name') ?></th>
                            <th><?php echo display('title') ?></th>
                            <th><?php echo display('description') ?></th>
                            <th><?php echo display('action') ?></th> 
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($sections)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($sections as $section) { ?>
                                <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">
                                    <td><?php echo $sl; ?></td>
                                    <td><img src="<?php echo (!empty($section->featured_image)?base_url($section->featured_image):null); ?>"  width="65" height="50"></td>
                                    <td><?php echo $section->name; ?></td>
                                    <td><?php echo $section->title; ?></td>
                                    <td><?php echo character_limiter($section->description, 120); ?></td>
                                    <td class="center">
                                        <a href="<?php echo base_url("website/section/edit/$section->id") ?>" class="btn btn-xs btn-primary"><i class="fa fa-edit"></i></a> 
                                        <a href="<?php echo base_url("website/section/delete/$section->id") ?>" onclick="return confirm('<?php echo display('are_you_sure') ?>')" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i></a> 
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


