<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group">
                    <a class="btn btn-success" href="<?php echo base_url("website/item/create") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_item') ?> </a>  
                </div>
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
                            <th><?php echo display('item_position') ?></th>
                            <th><?php echo display('date') ?></th>
                            <th><?php echo display('action') ?></th> 
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($items)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($items as $item) { ?>
                                <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">
                                    <td><?php echo $sl; ?></td>
                                    <td><img src="<?php echo (!empty($item->icon_image)?base_url($item->icon_image):base_url('assets_web/images/icons/no-img.png')); ?>" width="65" height="50"></td>
                                    <td><?php echo $item->name; ?></td>
                                    <td><?php echo $item->title; ?></td>
                                    <td><?php echo character_limiter($item->description,100); ?></td>
                                    <td><?php echo $item->position; ?></td>
                                    <td><?php echo date('d, M Y',strtotime($item->date)); ?></td>
                                    <td class="center">
                                        <a href="<?php echo base_url("website/item/edit/$item->id") ?>" class="btn btn-xs btn-primary"><i class="fa fa-edit"></i></a> 
                                        <a href="<?php echo base_url("website/item/delete/$item->id") ?>" onclick="return confirm('<?php echo display('are_you_sure') ?>')" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i></a> 
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