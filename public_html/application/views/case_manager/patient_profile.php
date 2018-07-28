<div class="row">
    <div class="col-sm-12" id="PrintMe">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-success" href="<?php echo base_url("case_manager/patient/form") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_patient') ?> </a>  
                    <a class="btn btn-primary" href="<?php echo base_url("case_manager/patient") ?>"> <i class="fa fa-list"></i>  <?php echo display('patient_list') ?> </a>  
                    <button type="button" onclick="printContent('PrintMe')" class="btn btn-danger" ><i class="fa fa-print"></i></button> 
                </div>
            </div> 

            <div class="panel-body"> 
                <!-- Nav tabs --> 
                <ul class="col-xs-12 nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#home" aria-controls="home" role="tab" data-toggle="tab"><?php echo display('patient_information') ?></a>
                    </li>
                    <li role="presentation">
                        <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><?php echo display('patient_status') ?></a>
                    </li>
                    <li role="presentation">
                        <a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><?php echo display('documents') ?></a>
                    </li>
                </ul>  

                <!-- Tab panes --> 
                <div class="col-xs-12 tab-content">

                    <br>
                    <!-- INFORMATION -->
                    <div role="tabpanel" class="tab-pane active" id="home">
                        <div class="row">
                            <div class="p-0 col-sm-3"> 
                                <img alt="Picture" src="<?php echo (!empty($profile->picture)?base_url($profile->picture):base_url("assets/images/no-img.png")) ?>" class="img-thumbnail img-responsive">
                                <h3><?php echo "$profile->firstname $profile->lastname " ?></h3>
                            </div> 

                            <div class="col-sm-9"> 
                                <dl class="dl-horizontal">
                                    <dt><?php echo display('patient_id') ?></dt><dd><?php echo $profile->patient_id ?></dd> 
                                    <dt><?php echo display('date_of_birth') ?>
                                        
                                    </dt><dd><?php echo date('d M Y',strtotime($profile->date_of_birth)) ?> (<?php echo date_diff(date_create($profile->date_of_birth), date_create('now'))->y; ?> Years)</dd> 

                                    <dt><?php echo display('blood_group') ?></dt><dd><?php echo $profile->blood_group ?></dd> 
                                    <dt><?php echo display('sex') ?></dt><dd><?php echo $profile->sex ?></dd>  
                                    <dt><?php echo display('mobile') ?></dt><dd><?php echo $profile->mobile ?>, <?php echo $profile->phone ?></dd> 
                                    <dt><?php echo display('address') ?></dt><dd><?php echo $profile->address ?></dd>


                                    <dt><?php echo display('ref_doctor_name') ?></dt><dd><?php echo $profile->ref_doctor_name ?></dd> 
                                    <dt><?php echo display('case_manager') ?></dt><dd><?php echo $profile->case_manager ?></dd> 

                                    <dt><?php echo display('hospital_name') ?></dt><dd><?php echo $profile->hospital_name ?></dd> 
                                    <dt><?php echo display('hospital_address') ?></dt><dd><?php echo $profile->hospital_address ?></dd> 
                                    <dt><?php echo display('doctor_name') ?></dt><dd><?php echo $profile->doctor_name ?></dd> 
                                    <dt><?php echo display('date') ?></dt><dd><?php echo date('d M Y',strtotime($profile->date)) ?></dd> 
                                </dl> 
                            </div>
                        </div>
                    </div>


                    <!-- STATUS -->
                    <div role="tabpanel" class="tab-pane" id="profile">
                        <div class="row">
                            <!-- STARTS STATUS FORM -->
                            <div class="col-sm-12 no-print">
                                <?php echo form_open_multipart('case_manager/patient/profile/'.$profile->id) ?>
                                    <?php echo form_hidden('cm_patient_id',$profile->id) ?>
                                    <?php echo form_hidden('id',$status->id) ?>

                                    <div class="form-group">
                                        <label for="critical_status" class="form-label"><?php echo display('status') ?> <i class="text-danger">*</i></label>
                                        <input name="critical_status" type="text" class="form-control" id="critical_status" placeholder="<?php echo display('critical_status') ?>" value="<?php echo $status->critical_status ?>" >
                                    </div>

                                    <div class="form-group">
                                        <label for="description" class="form-label"><?php echo display('description') ?></label>
                                        <textarea name="description" class="form-control" id="description"  placeholder="<?php echo display('description') ?>" rows="7"><?php echo $status->description ?></textarea>
                                    </div>

                                    <div class="form-group"> 
                                        <div class="text-right">
                                            <div class="ui buttons">
                                            <?php if ($status->id) { ?>
                                                <a href="<?php echo base_url('case_manager/patient/profile/'.$profile->id) ?>" class="ui  btn-info btn"><?php echo display('add_new_status') ?></a>
                                                <div class="or"></div>
                                            <?php } ?>
                                                <button type="reset" class="ui button"><?php echo display('reset') ?></button>
                                                <div class="or"></div>
                                                <button class="ui positive button"><?php echo display('save') ?></button> 
                                            </div>
                                        </div>
                                    </div>
                                <?php echo form_close() ?>
                            </div>

                            <!-- STATUS DATA  -->
                            <div class="col-sm-12">
                                <table class="datatable table table-striped table-bordered" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th><?php echo display('serial') ?></th>
                                            <th><?php echo display('status') ?></th>
                                            <th><?php echo display('description') ?></th>
                                            <th width="150"><?php echo display('date') ?></th>
                                            <th class="no-print"><?php echo display('action') ?></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php if (!empty($statuss)) { ?>
                                            <?php $sl = 1; ?>
                                            <?php foreach ($statuss as $status) { ?>
                                                <tr>
                                                    <td><?php echo $sl; ?></td>
                                                    <td><?php echo $status->critical_status; ?></td>
                                                    <td><?php echo character_limiter($status->description, 60); ?></td>
                                                    <td><?php echo date('d-m-Y H:i:s', strtotime($status->datetime )) ?></td>

                                                    <td class="no-print" width="80">
                                                        <a href="<?php echo base_url("case_manager/patient/profile/$profile->id/$status->id") ?>" onclick="return confirm('<?php echo display("are_you_sure") ?>')" class="btn btn-xs  btn-primary"><i class="fa fa-edit"></i></a>

                                                        <a href="<?php echo base_url("case_manager/patient/delete_status/$status->id") ?>" onclick="return confirm('<?php echo display("are_you_sure") ?>')" class="btn btn-xs  btn-danger"><i class="fa fa-trash"></i></a> 
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


                    <div role="tabpanel" class="tab-pane" id="messages">
                        <div class="row">
                            <div class="col-sm-12">
                                <table width="100%" class="datatable table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th><?php echo display('serial') ?></th>
                                            <th><?php echo display('doctor_name') ?></th>
                                            <th><?php echo display('description') ?></th>
                                            <th><?php echo display('date') ?></th>
                                            <th><?php echo display('upload_by') ?></th>
                                            <th class="no-print"><?php echo display('action') ?></th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php if (!empty($documents)) { ?>
                                            <?php $sl = 1; ?>
                                            <?php foreach ($documents as $document) { ?>
                                                <tr>
                                                    <td><?php echo $sl; ?></td>
                                                    <td><?php echo $document->doctor_name; ?></td>
                                                    <td><?php echo character_limiter(strip_tags($document->description),50); ?></td>
                                                    <td><?php echo date('d-m-Y',strtotime($document->date)); ?></td> 
                                                    <td><?php echo $document->upload_by; ?></td> 
                                                    <td class="center no-print" width="80">
                                                        <a target="_blank" href="<?php echo base_url($document->hidden_attach_file) ?>" class="btn btn-xs btn-info"><i class="fa fa-eye"></i></a>
                                                        <a download target="_blank" href="<?php echo base_url($document->hidden_attach_file) ?>" class="btn btn-xs btn-success"><i class="fa fa-download"></i></a>
                                                        <a href="<?php echo base_url("patient/document_delete/$document->id?file=$document->hidden_attach_file") ?>" class="btn btn-xs btn-danger" onclick="return confirm('<?php echo display('are_you_sure') ?>') "><i class="fa fa-trash"></i></a> 
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
            </div>

            <div class="panel-footer">
                <div class="text-center">
                    <strong><?php echo $this->session->userdata('title') ?></strong>
                    <p class="text-center"><?php echo $this->session->userdata('address') ?></p>
                </div>
            </div>

        </div>
    </div>
</div>
 