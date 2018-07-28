<div class="row">

    <div class="col-sm-12" id="PrintMe">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-success" href="<?php echo base_url("patient/create") ?>"> <i class="fa fa-plus"></i>  <?php echo display('add_patient') ?> </a>  
                    <a class="btn btn-primary" href="<?php echo base_url("patient") ?>"> <i class="fa fa-list"></i>  <?php echo display('patient_list') ?> </a>  
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
                        <a href="#documents" aria-controls="documents" role="tab" data-toggle="tab"><?php echo display('documents') ?></a>
                    </li>
                </ul>  

                <!-- Tab panes --> 
                <div class="col-xs-12 tab-content">
                    <br>
                    <!-- INFORMATION -->
                    <div role="tabpanel" class="tab-pane active" id="home">
                        <div class="row">
                            <div class="col-sm-3" align="center"> 
                                <img alt="Picture" src="<?php echo (!empty($profile->picture)?base_url($profile->picture):base_url("assets/images/no-img.png")) ?>" class="img-thumbnail img-responsive">
                                <h3><?php echo "$profile->firstname $profile->lastname " ?></h3>
                            </div> 

                            <div class="col-sm-9"> 
                                <dl class="dl-horizontal">
                                            <dt><?php echo display('patient_id') ?></dt><dd><?php echo $profile->patient_id ?></dd>

                                            <dt><?php echo display('date_of_birth') ?></dt><dd><?php echo date('d M Y',strtotime($profile->date_of_birth)) ?></dd> 
                                            <dt><?php echo display('age') ?></dt><dd><?php echo date_diff(date_create($profile->date_of_birth), date_create('now'))->y; ?> <?php echo display('year') ?></dd> 
                                            <dt><?php echo display('sex') ?></dt><dd><?php echo $profile->sex ?></dd> 
                                            <dt><?php echo display('phone') ?></dt><dd><?php echo $profile->phone ?></dd> 
                                            <dt><?php echo display('create_date') ?></dt><dd><?php echo $profile->create_date ?></dd> 
                                        </dl>
                                        <hr>
                                            <div class="col-sm-12" align="center">  
                                                <h4>Patient Detail</h4>
                                            </div>
                                         <dl class="dl-horizontal">
                                            <dt>Name of village</dt><dd><?php echo $profile_detail->name_of_village ?></dd>
                                            <dt>Quarter</dt><dd><?php echo $profile_detail->quarter ?></dd>
                                            <dt>Income Per Month</dt><dd><?php echo $profile_detail->income ?></dd>
                                            <dt>Education level</dt><dd><?php echo $profile_detail->education ?></dd>
                                            <dt>Employment Status</dt><dd><?php echo $profile_detail->employment_status ?></dd>
                                            <dt>Occupation</dt><dd><?php echo $profile_detail->occupation ?></dd>
                                            <dt>Marital Status</dt><dd><?php echo $profile_detail->marital_status ?></dd>
                                            <dt>Language</dt><dd><?php echo $profile_detail->language ?></dd>
                                             <dt>Religion</dt><dd><?php echo $profile_detail->religion ?></dd>
                                             <dt>Place of residence</dt><dd><?php echo $profile_detail->residence ?></dd>
                                             <dt>Antenatal visits</dt><dd><?php echo $profile_detail->antenatal_visits ?></dd>
                                             <dt style="text-overflow: clip;">Place of antenatal visit</dt><dd><?php echo $profile_detail->place_visits ?></dd>

                                             <dt>Delivery</dt><dd><?php echo $profile_detail->delivery ?></dd>
                                             <dt>Head of Household</dt><dd><?php echo $profile_detail->head_of_household ?></dd>

                                             <dt style="width: auto;margin-left: -46px;">Number of deliveries/children </dt><dd><?php echo $profile_detail->alive, '/'.$profile_detail->dead ?></dd>

                                              <dt style="width: auto;">Number of Pregnancies</dt><dd><?php echo $profile_detail->total_pregnancies ?></dd>

                                             <dt>Medical History</dt><dd><?php echo $profile_detail->medical_history ?></dd>

                                             <dt>History of Diabetes</dt><dd><?php echo $profile_detail->history_of_diabetes ?></dd>

                                             <dt style="width: auto;margin-left: -5px;">History of Hypertension</dt><dd><?php echo $profile_detail->history_of_hypertension ?></dd>

                                             <dt>Examination</dt><dd><?php echo $profile_detail->examination ?></dd>

                                              <dt>Echography</dt><dd><?php echo $profile_detail->echography ?></dd>

                                              <dt>Foetal movements</dt><dd><?php echo $profile_detail->foetal_movements ?></dd>

                                              <dt>Feotal Presentation</dt><dd><?php echo (isset($profile_detail->foetal_presentation) && $profile_detail->foetal_presentation == 'Others - risky') ? $profile_detail->foetal_presentation .' '. $profile_detail->foetal_presentation_detail : $profile_detail->foetal_presentation  ?></dd>


                                              <dt>Drug History</dt><dd><?php echo $profile_detail->drug_history ?></dd>

                                              <dt>Antenatal History</dt><dd><?php echo $profile_detail->antenatal_history ?></dd>

                                               <dt>HIV/screening/test</dt><dd><?php echo $profile_detail->hiv_screening_test ?></dd>

                                               <dt style="width: auto;margin-left: -10px;">On ARV (Anti Retrovirial)</dt><dd><?php echo $profile_detail->on_arv_anti_retrovirial ?></dd>

                                               <dt>Malaria/screening/test</dt><dd><?php echo $profile_detail->malaria_screening_test ?></dd>

                                                <dt style="width: auto;margin-left: -22px;">Hepatitis B/screening/test</dt><dd><?php echo $profile_detail->hepatitis_b_screening_test ?></dd>

                                                <dt>Physical Exams</dt><dd><?php echo $profile_detail->physical_exams ?></dd>

                                                <dt>Treatments</dt><dd><?php echo $profile_detail->treatments ?></dd>

                                                <dt style="width: auto;margin-left: -30px;">PIH and Anaemia Screening</dt><dd><?php echo $profile_detail->pih_anaemia_screening ?></dd>

                                                <dt>Advise/Counsel</dt><dd><?php echo $profile_detail->advise_counsel ?></dd>

                                                <dt>Preventive Measures</dt><dd><?php echo $profile_detail->preventive_measures ?></dd>

                                                <dt style="width: auto;position: absolute;right: 577px;">Adherence to Treatment (HIV, malaria)</dt><dd><?php echo $profile_detail->adherence_to_treatment ?></dd>

                                                <dt style="width: auto;margin-left: -24px;">Bleeding during Pregnancy</dt><dd><?php echo $profile_detail->bleeding_during_pregnancy ?></dd>

                                                <dt>Vaccination Status</dt><dd><?php echo $profile_detail->vaccination_status ?></dd>

                                         </dl>            
                            </div>
                        </div>
                    </div> 

                    <div role="tabpanel" class="tab-pane" id="documents">
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
                                                    <td class="center no-print" width="110"> 
                                                        <a target="_blank" href="<?php echo base_url($document->hidden_attach_file) ?>" class="btn btn-xs btn-info"><i class="fa fa-eye"></i></a>
                                                        <a href="<?php echo base_url("patient/document_form/$document->patient_id") ?>" class="btn btn-xs btn-warning" title="Add Document"><i class="fa fa-plus"></i></a> 
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
