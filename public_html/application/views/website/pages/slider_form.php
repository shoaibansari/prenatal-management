<div class="row">
    <!--  form area -->
    <div class="col-sm-12">

       <div  class="panel panel-default thumbnail">

            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" href="<?php echo base_url("website/slider/") ?>"> <i class="fa fa-list"></i>  <?php echo display('slider') ?> </a>  
                </div>
            </div> 

            <div class="panel-body  panel-form"> 
                <div class="row">
                    <div class="col-md-9 col-sm-12">

                        <?= form_open_multipart('website/slider/create','class="form-inner"') ?>
                            
                            <input type="hidden" name="id" value="<?= $slider->id ?>">
 

                            <div class="form-group row">
                                <label for="title" class="col-xs-3 col-form-label"><?php echo display('title') ?> </label>
                                <div class="col-xs-9">
                                    <input name="title"  type="text" class="form-control" id="title" placeholder="<?php echo display('title') ?>" value="<?= $slider->title ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="subtitle" class="col-xs-3 col-form-label"><?php echo display('subtitle') ?> </label>
                                <div class="col-xs-9">
                                    <input name="subtitle"  type="text" class="form-control" id="subtitle" placeholder="<?php echo display('subtitle') ?>" value="<?= $slider->subtitle ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="description" class="col-xs-3 col-form-label"><?php echo display('description') ?></label>
                                <div class="col-xs-9">
                                    <textarea name="description" class="form-control tinymce"  placeholder="<?php echo display('description') ?>"  rows="7"><?= $slider->description ?></textarea>
                                </div>
                            </div>

                            <!-- if featured image is already uploaded -->
                            <?php if(!empty($slider->image)) {  ?>
                            <div class="form-group row">
                                <label for="logoPreview" class="col-xs-3 col-form-label"></label>
                                <div class="col-xs-9">
                                    <img src="<?= base_url($slider->image) ?>" alt="Logo" class="img-thumbnail" />
                                </div>
                            </div>
                            <?php } ?>

                            <div class="form-group row">
                                <label for="image" class="col-xs-3 col-form-label"><?php echo display('picture') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="image"  type="file" id="image" >
                                    <input type="hidden" name="old_image" value="<?= $slider->image ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="position" class="col-xs-3 col-form-label"><?php echo display('slide_position') ?></label>
                                <div class="col-xs-9">
                                    <input name="position"  type="text" class="form-control" id="position" placeholder="Slide Position" value="<?= (!empty($slider->position)?$slider->position:1) ?>">
                                </div>
                            </div>


                            <!--Radios-->
                            <div class="form-group row">
                                <label class="col-sm-3">Status</label>
                                <div class="col-xs-9"> 
                                    <div class="form-check">
                                        <label class="radio-inline">
                                            <input type="radio" name="status" value="1" <?= set_radio('status', '1', true); ?> >Active
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="status" value="0" <?= set_radio('status', '0'); ?> >Inactive
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