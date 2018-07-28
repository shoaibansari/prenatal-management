<div class="row">
    <div class="col-sm-12" id="PrintMe">
        <div  class="panel panel-default thumbnail"> 
            <div class="panel-heading no-print">
                 <div class="btn-group">
                    <button type="button" onclick="printContent('PrintMe')" class="btn btn-success" ><i class="fa fa-print"></i></button>
                </div>
            </div>

            <div class="panel-body">  
                <div class="row">
                    <div class="col-sm-12"> 
                        <dl class="dl-horizontal">  
                            <dt><?php echo display('patient_id') ?></dt><dd><?php echo $approval->patient_id ?></dd>
                            <dt><?php echo display('patient_name') ?></dt><dd><?php echo $approval->patient_name ?></dd>
                            <dt><?php echo display('address') ?></dt><dd><?php echo $approval->address ?></dd>
                            <dt><?php echo display('date_of_birth') ?></dt><dd><?php echo $approval->date_of_birth ?></dd>
                            <dt><?php echo display('sex') ?></dt><dd><?php echo $approval->sex ?></dd>
                            <dt><?php echo display('room_no') ?></dt><dd><?php echo $approval->room_no ?></dd>
                            <dt><?php echo display('disease_details') ?></dt>
                            <dd>
                                <?php 
                                $disease = json_decode($approval->disease_details, true);
                                echo "<table border='1' width='50%'>";
                                echo "<tr class='bg-primary'><th style='padding:2px 5px'>Name</th><th style='padding:2px 5px'>Charge</th></tr>";
                                if ($disease>0)
                                foreach ($disease as $key => $value)
                                echo "<tr style='padding:2px 5px'><td style='padding:2px 5px'>$key</td><td style='padding:2px 5px'>$value</td></tr>";
                                echo "</table>";
                                ?>
                            </dd> 
                            <dt><?php echo display('consultant_name') ?></dt><dd><?php echo $approval->consultant_name ?></dd>
                            <dt><?php echo display('policy_name') ?></dt><dd><?php echo $approval->policy_name ?></dd>
                            <dt><?php echo display('policy_no') ?></dt><dd><?php echo $approval->policy_no ?></dd>
                            <dt><?php echo display('policy_holder_name') ?></dt><dd><?php echo $approval->policy_holder_name ?></dd>
                            <dt><?php echo display('insurance_name') ?></dt><dd><?php echo $approval->insurance_name ?></dd>
                            <dt><?php echo display('approval_breakup') ?></dt> 
                            <dd>
                                <?php 
                                $disease = json_decode($approval->approval_breakup, true);
                                echo "<table border='1' width='50%'>";
                                echo "<tr class='bg-primary'><th style='padding:2px 5px'>Name</th><th style='padding:2px 5px'>Charge</th></tr>";
                                if ($disease>0)
                                foreach ($disease as $key => $value)
                                echo "<tr style='padding:2px 5px'><td style='padding:2px 5px'>$key</td><td style='padding:2px 5px'>$value</td></tr>";
                                echo "</table>";
                                ?>
                            </dd> 
                            <dt><?php echo display('total') ?></dt><dd><?php echo $approval->total ?></dd>
                            <dt><?php echo display('date') ?></dt><dd><?php echo $approval->date ?></dd>
                            
                            <dt><?php echo display('status') ?></dt><dd><?php echo (!empty($approval->status)?
                            display('active'):display('inactive')) ?></dd>
                        </dl> 
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

