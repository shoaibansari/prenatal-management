<div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">

            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" href="<?php echo base_url("website/item/") ?>"> <i class="fa fa-list"></i>  <?php echo display('section_item') ?> </a>  
                </div>
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
                    <div class="col-md-9 col-sm-12">

                        <?= form_open_multipart('website/item/create','class="form-inner"') ?>
                            
                            <input type="hidden" name="id" value="<?= $item->id ?>">

                            <div class="form-group row">
                                <label for="name" class="col-xs-3 col-form-label"><?php echo display('menu_name') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <?= form_dropdown('name',$menu_name,$item->name,'class="form-control" id="name" ') ?>
                                </div>
                            </div>

                            <!-- if icon_image is already uploaded -->
                            <?php if(!empty($item->icon_image)) {  ?>
                            <div class="form-group row">
                                <label for="logoPreview" class="col-xs-3 col-form-label"></label>
                                <div class="col-xs-9">
                                    <img src="<?= base_url($item->icon_image) ?>" alt="Logo" class="img-thumbnail" />
                                </div>
                            </div>
                            <?php } ?>

                            <div class="form-group row">
                                <label for="icon_image" class="col-xs-3 col-form-label"><?php echo display('icon_image') ?></label>
                                <div class="col-xs-9">
                                    <input name="icon_image"  type="file" id="icon_image" >
                                    <input type="hidden" name="old_image" value="<?= $item->icon_image ?>">
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="title" class="col-xs-3 col-form-label"><?php echo display('title') ?>  <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="title"  type="text" class="form-control" id="title" placeholder="<?php echo display('title') ?>" value="<?= $item->title ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="description" class="col-xs-3 col-form-label"><?php echo display('description') ?>  <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <textarea name="description" id="description" class="form-control tinymce"  placeholder="<?php echo display('description') ?>" maxlength="140" rows="7"><?= $item->description ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="position" class="col-xs-3 col-form-label"><?php echo display('item_position') ?></label>
                                <div class="col-xs-9">
                                    <input name="position"  type="text" class="form-control" id="position" placeholder="<?php echo display('item_position') ?>" value="<?= $item->position ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-3"><?php echo display('status') ?></label>
                                <div class="col-xs-9">
                                    <div class="form-check">
                                        <label class="radio-inline">
                                        <input type="radio" name="status" value="1" <?php echo  set_radio('status', '1', TRUE); ?> ><?php echo display('active') ?>
                                        </label>
                                        <label class="radio-inline">
                                        <input type="radio" name="status" value="0" <?php echo  set_radio('status', '0'); ?> ><?php echo display('inactive') ?>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-offset-3 col-sm-6">
                                    <div class="ui buttons">
                                        <button type="reset" class="ui button"><?php echo display('reset') ?></button>
                                        <div class="or"></div>
                                        <button class="ui positive button"><?php echo display('save') ?></button>
                                    </div>
                                </div>
                            </div>

                        <?= form_close() ?>

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
 
