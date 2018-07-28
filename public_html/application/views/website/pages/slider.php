<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading">
                <a href="<?= base_url('website/slider/create') ?>" class="btn btn-success"><i class="fa fa-plus"></i> <?php echo display('new_slide') ?></a>
            </div>

            <div class="panel-body">
                <table width="100%" class="datatable table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('picture') ?></th>
                            <th><?php echo display('title') ?></th>
                            <th><?php echo display('subtitle') ?></th>
                            <th><?php echo display('description') ?></th>
                            <th><?php echo display('slide_position') ?></th>
                            <th><?php echo display('status') ?></th>
                            <th><?php echo display('action') ?></th> 
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($sliders)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($sliders as $slider) { ?>
                                <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">
                                    <td><?php echo $sl; ?></td>
                                    <td><img src="<?php echo (!empty($slider->image)?base_url($slider->image):null); ?>" width="65" height="50"></td>
                                    <td><?php echo $slider->title; ?></td>
                                    <td><?php echo $slider->subtitle; ?></td>
                                    <td><?php echo character_limiter(strip_tags($slider->description),70); ?></td>
                                    <td><?php echo $slider->position; ?></td>
                                    <td><?php echo (($slider->status==1)?display('active'):display('inactive')); ?></td>
                                    <td class="center">
                                        <a href="<?php echo base_url("website/slider/edit/$slider->id") ?>" class="btn btn-xs btn-primary"><i class="fa fa-edit"></i></a> 
                                        <a href="<?php echo base_url("website/slider/delete/$slider->id") ?>" onclick="return confirm('<?php echo display('are_you_sure') ?>')" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i></a> 
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