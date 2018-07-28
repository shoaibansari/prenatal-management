<div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div  class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" href="<?php echo base_url("prescription/case_study") ?>"> <i class="fa fa-list"></i>  <?php echo display('patient_case_study_list') ?> </a>  
                </div>
            </div> 


            <div class="panel-body panel-form">
                <div class="row">
                    <div class="col-md-9 col-sm-12">

                        <?php echo form_open('prescription/case_study/create','class="form-inner"') ?>

                            <?php echo form_hidden('id',$case_study->id) ?>

                            <div class="form-group row">
                                <label for="patient_id" class="col-xs-3 col-form-label"><?php echo display('patient_id') ?> <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input name="patient_id"  type="text" class="form-control" id="patient_id" placeholder="<?php echo display('patient_id') ?>" value="<?php echo $case_study->patient_id ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="food_allergies" class="col-xs-3 col-form-label"><?php echo display('food_allergies') ?></label>
                                <div class="col-xs-9">
                                    <input name="food_allergies"  type="text" class="form-control" id="food_allergies" placeholder="<?php echo display('food_allergies') ?>" value="<?php echo $case_study->food_allergies ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="tendency_bleed" class="col-xs-3 col-form-label"><?php echo display('tendency_bleed') ?></label>
                                <div class="col-xs-9">
                                    <input name="tendency_bleed"  type="text" class="form-control" id="tendency_bleed" placeholder="<?php echo display('tendency_bleed') ?>" value="<?php echo $case_study->tendency_bleed ?>">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="heart_disease" class="col-xs-3 col-form-label"><?php echo display('heart_disease') ?></label>
                                <div class="col-xs-9">
                                    <input name="heart_disease"  type="text" class="form-control" id="heart_disease" placeholder="<?php echo display('heart_disease') ?>" value="<?php echo $case_study->heart_disease ?>">
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="high_blood_pressure" class="col-xs-3 col-form-label"><?php echo display('high_blood_pressure') ?></label>
                                <div class="col-xs-9">
                                    <input name="high_blood_pressure"  type="text" class="form-control" id="high_blood_pressure" placeholder="<?php echo display('high_blood_pressure') ?>" value="<?php echo $case_study->high_blood_pressure ?>">
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="diabetic" class="col-xs-3 col-form-label"><?php echo display('diabetic') ?></label>
                                <div class="col-xs-9">
                                    <input name="diabetic"  type="text" class="form-control" id="diabetic" placeholder="<?php echo display('diabetic') ?>" value="<?php echo $case_study->diabetic ?>">
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="surgery" class="col-xs-3 col-form-label"><?php echo display('surgery') ?></label>
                                <div class="col-xs-9">
                                    <input name="surgery"  type="text" class="form-control" id="surgery" placeholder="<?php echo display('surgery') ?>" value="<?php echo $case_study->surgery ?>">
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="accident" class="col-xs-3 col-form-label"><?php echo display('accident') ?></label>
                                <div class="col-xs-9">
                                    <input name="accident"  type="text" class="form-control" id="accident" placeholder="<?php echo display('accident') ?>" value="<?php echo $case_study->accident ?>">
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="others" class="col-xs-3 col-form-label"><?php echo display('others') ?></label>
                                <div class="col-xs-9">
                                    <input name="others"  type="text" class="form-control" id="others" placeholder="<?php echo display('others') ?>" value="<?php echo $case_study->others ?>">
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="family_medical_history" class="col-xs-3 col-form-label"><?php echo display('family_medical_history') ?></label>
                                <div class="col-xs-9">
                                    <input name="family_medical_history"  type="text" class="form-control" id="family_medical_history" placeholder="<?php echo display('family_medical_history') ?>" value="<?php echo $case_study->family_medical_history ?>">
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="current_medication" class="col-xs-3 col-form-label"><?php echo display('current_medication') ?></label>
                                <div class="col-xs-9">
                                    <input name="current_medication"  type="text" class="form-control" id="current_medication" placeholder="<?php echo display('current_medication') ?>" value="<?php echo $case_study->current_medication ?>">
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="female_pregnancy" class="col-xs-3 col-form-label"><?php echo display('female_pregnancy') ?></label>
                                <div class="col-xs-9">
                                    <input name="female_pregnancy"  type="text" class="form-control" id="female_pregnancy" placeholder="<?php echo display('female_pregnancy') ?>" value="<?php echo $case_study->female_pregnancy ?>">
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="breast_feeding" class="col-xs-3 col-form-label"><?php echo display('breast_feeding') ?></label>
                                <div class="col-xs-9">
                                    <input name="breast_feeding"  type="text" class="form-control" id="breast_feeding" placeholder="<?php echo display('breast_feeding') ?>" value="<?php echo $case_study->breast_feeding ?>">
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="health_insurance" class="col-xs-3 col-form-label"><?php echo display('health_insurance') ?></label>
                                <div class="col-xs-9">
                                    <input name="health_insurance"  type="text" class="form-control" id="health_insurance" placeholder="<?php echo display('health_insurance') ?>" value="<?php echo $case_study->health_insurance ?>">
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="low_income" class="col-xs-3 col-form-label"><?php echo display('low_income') ?></label>
                                <div class="col-xs-9">
                                    <input name="low_income"  type="text" class="form-control" id="low_income" placeholder="<?php echo display('low_income') ?>" value="<?php echo $case_study->low_income ?>">
                                </div>
                            </div>
 
                            <div class="form-group row">
                                <label for="reference" class="col-xs-3 col-form-label"><?php echo display('reference') ?></label>
                                <div class="col-xs-9">
                                    <input name="reference"  type="text" class="form-control" id="reference" placeholder="<?php echo display('reference') ?>" value="<?php echo $case_study->reference ?>">
                                </div>
                            </div> 

                            <!--Radio-->
                            <div class="form-group row">
                                <label class="col-sm-3"><?php echo display('status') ?></label>
                                <div class="col-xs-9"> 
                                    <div class="form-check">
                                        <label class="radio-inline"><input type="radio" name="status" value="1" checked><?php echo display('active') ?></label>
                                        <label class="radio-inline"><input type="radio" name="status" value="0"><?php echo display('inactive') ?></label>
                                    </div>
                                </div>
                            </div>
                            

                              <div class="form-group row">
                                <label class="col-xs-3">Delivery <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <div class="form-check">
                                        <label class="radio-inline">
                                            <?php 
                                                $section ='';
                                                $normal = '';
                                                if(isset( $case_study->delivery) && $case_study->delivery == 'C-section' ){
                                                    $section = 'checked="checked" ';
                                                }else if(isset( $case_study->delivery) && $case_study->delivery == 'Normal'){
                                                    $normal =  'checked="checked" ';
                                                }
                                                
                                             ?>

                                         <input type="radio" name="delivery" value="C-section" <?php echo $section ?> >C-section
                                        </label>
                                        <label class="radio-inline">
                                        <input type="radio" name="delivery" value="Normal" <?php echo $normal ?>>Normal
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="head_of_household" class="col-xs-3 col-form-label">Head of Household <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                     <?php
                                            $householdList = array( 
                                                'Male'=> 'Male',
                                                'Female' => 'Female',
                                                'Grandparent' =>  'Grandparent',
                                                'In law' =>  'In law'                          
                                            );
                                            echo form_dropdown('head_of_household', $householdList, $case_study->head_of_household, 'class="form-control"'); 
                                        ?>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="antenatal_visits" class="col-xs-3 col-form-label">Number of deliveries/children <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <div class="row">
                                            <div class="col-sm-6">
                                                <input type="number" name="alive" class="form-control" placeholder="Alive" min="0" value="<?php echo  $case_study->alive ?>">                                        
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="number" name="dead" class="form-control" placeholder="Dead" min="0" value="<?php echo  $case_study->dead ?>">
                                            </div>
                                        </div>  
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="total_pregnancies" class="col-xs-3 col-form-label">Number of Pregnancies <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <input type="number" name="total_pregnancies" class="form-control" placeholder="Number of Pregnancies" min="0" value="<?php echo  $case_study->total_pregnancies ?>">  
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="medical_history" class="col-xs-3 col-form-label">Medical History <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <textarea name="medical_history" class="form-control" placeholder="Medical History" rows="7"><?php echo $case_study->medical_history ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="history_of_diabetes" class="col-xs-3 col-form-label">History of Diabetes <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <textarea name="history_of_diabetes" class="form-control" placeholder="History of Diabetes" rows="7"><?php echo $case_study->history_of_diabetes ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="history_of_hypertension" class="col-xs-3 col-form-label">History of Hypertension <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <textarea name="history_of_hypertension" class="form-control" placeholder="History of Hypertension" rows="7"><?php echo $case_study->history_of_hypertension ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="examination" class="col-xs-3 col-form-label">Examination <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                   <textarea name="examination" class="form-control" placeholder="Examination" rows="7"><?php echo $case_study->examination ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="echography" class="col-xs-3 col-form-label">Echography <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                   <textarea name="echography" class="form-control" placeholder="Echography" rows="7"><?php echo $case_study->echography ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="foetal_movements" class="col-xs-3 col-form-label">Foetal movements <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                     <?php
                                            $foetalList = array( 
                                                'Yes (good)'=> 'Yes (good)',
                                                'No (poor)' => 'No (poor)'                    
                                            );
                                            echo form_dropdown('foetal_movements', $foetalList, $case_study->foetal_movements, 'class="form-control"'); 
                                        ?> 
                                </div>
                            </div>

                             <div class="form-group row">
                                 <label for="foetal_presentation" class="col-xs-3 col-form-label">Feotal Presentation <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                     <?php
                                        $foetalpresentList = array( 
                                            'Cephalic – Good'=> 'Cephalic – Good',
                                            'Breach - risky' => 'Breach - risky',
                                            'Hand - risky' => 'Hand - risky',
                                            'Others - risky' => 'Others - risky'
                                        );
                                        echo form_dropdown('foetal_presentation', $foetalpresentList, $case_study->foetal_presentation, 'class="form-control" id="foetal_presentation"'); 
                                   ?> 
                                   <textarea name="foetal_presentation_detail" id="otherRisky" class="form-control" rows="7" placeholder="Foetal Presentation Detail"><?php echo $case_study->foetal_presentation_detail ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="drug_history" class="col-xs-3 col-form-label">Drug History <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                   <textarea name="drug_history" class="form-control" placeholder="Drug History" rows="7"><?php echo $case_study->drug_history ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="antenatal_history" class="col-xs-3 col-form-label">Antenatal History <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                    <textarea name="antenatal_history" class="form-control" placeholder="Antenatal History" rows="7"><?php echo $case_study->antenatal_history ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="hiv_screening_test" class="col-xs-3 col-form-label">HIV/screening/test <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                   <textarea name="hiv_screening_test" class="form-control" placeholder="HIV/screening/test" rows="7"><?php echo $case_study->hiv_screening_test ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="on_arv_anti_retrovirial" class="col-xs-3 col-form-label">On ARV (Anti Retrovirial) <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="on_arv_anti_retrovirial" class="form-control" placeholder="On ARV (Anti Retrovirial)" rows="7"><?php echo $case_study->on_arv_anti_retrovirial ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="malaria_screening_test" class="col-xs-3 col-form-label">Malaria/screening/test <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="malaria_screening_test" class="form-control" placeholder="Malaria/screening/test" rows="7"><?php echo $case_study->malaria_screening_test ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="hepatitis_b_screening_test" class="col-xs-3 col-form-label">Hepatitis B/screening/test <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="hepatitis_b_screening_test" class="form-control" placeholder="Hepatitis B/screening/test" rows="7"><?php echo $case_study->hepatitis_b_screening_test ?></textarea>
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="physical_exams" class="col-xs-3 col-form-label">Physical Exams <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="physical_exams" class="form-control" placeholder="Physical Exams" rows="7"><?php echo $case_study->physical_exams ?></textarea>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="treatments" class="col-xs-3 col-form-label">Treatments <i class="text-danger">*</i></label>
                                <div class="col-xs-9">
                                  <textarea name="treatments" class="form-control" placeholder="Treatments" rows="7"><?php echo $case_study->treatments ?></textarea>
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


                        <?php echo form_close() ?>

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>