<div class="row">
    <!--  form area -->
    <div class="col-sm-12"> 

       <div  class="panel panel-default thumbnail">

            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" href="<?php echo base_url("website/section/") ?>"> <i class="fa fa-list"></i>  <?php echo display('section') ?> </a>  
                </div>
            </div> 

            <div class="panel-body  panel-form">
                <div class="row">
                    <div class="col-md-9 col-sm-12">

                        <?= form_open_multipart('website/section/create','class="form-inner"') ?>
                            
                            <input type="hidden" name="id" value="<?= $section->id ?>">

                            <div class="form-group row">
                                <label for="name" class="col-xs-3 col-form-label"><?php echo display('menu_name') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <?= form_dropdown('name',((!empty($section->name)?[$section->name => ucfirst($section->name)]:$section_slag)),$section->name,'class="form-control" id="name" ') ?>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="title" class="col-xs-3 col-form-label"><?php echo display('title') ?> </label>
                                <div class="col-xs-9">
                                    <input name="title"  type="text" class="form-control" id="title" placeholder="<?php echo display('title') ?>" value="<?= $section->title ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="description" class="col-xs-3 col-form-label"><?php echo display('subtitle_description') ?></label>
                                <div class="col-xs-9">
                                    <textarea name="description" class="form-control"  placeholder="<?php echo display('subtitle_description') ?>" rows="7"><?= $section->description ?></textarea>
                                </div>
                            </div>

                            <!-- if featured image is already uploaded -->
                            <?php if(!empty($section->featured_image)) {  ?>
                            <div class="form-group row">
                                <label for="logoPreview" class="col-xs-3 col-form-label"></label>
                                <div class="col-xs-9">
                                    <img src="<?= base_url($section->featured_image) ?>" alt="Logo" class="img-thumbnail" />
                                </div>
                            </div>
                            <?php } ?>

                            <div class="form-group row">
                                <label for="featured_image" class="col-xs-3 col-form-label"><?php echo display('featured_image') ?></label>
                                <div class="col-xs-9">
                                    <input name="featured_image"  type="file" id="featured_image" >
                                    <input type="hidden" name="old_image" value="<?= $section->featured_image ?>">
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