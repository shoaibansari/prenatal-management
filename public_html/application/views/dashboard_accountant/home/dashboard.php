<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">

            <div class="panel-heading">
                <h3><?php echo display('noticeboard') ?></h3>
            </div>

            <div class="panel-body">
                <table width="100%" class="datatable table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('title') ?></th>
                            <th><?php echo display('description') ?></th>
                            <th><?php echo display('start_date') ?></th>
                            <th><?php echo display('end_date') ?></th>
                            <th><?php echo display('assign_by') ?></th>
                            <th><?php echo display('action') ?></th> 
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($notices)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($notices as $notice) { ?>
                                <tr>
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $notice->title; ?></td>
                                    <td><?php echo character_limiter(strip_tags($notice->description),50); ?></td>
                                    <td><?php echo $notice->start_date; ?></td> 
                                    <td><?php echo $notice->end_date; ?></td> 
                                    <td><?php echo $notice->assign_by; ?></td> 
                                    <td class="center">
                                        <a href="<?php echo base_url("dashboard_accountant/noticeboard/notice/details/$notice->id") ?>" class="btn btn-xs btn-success"><i class="fa fa-eye"></i></a> 
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




    <!--  table area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
            <div class="panel-heading">
                <h3><?php echo display('inbox') ?></h3>
            </div>

            <div class="panel-body">
                <table width="100%" class="datatable table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('sender') ?></th>
                            <th><?php echo display('subject') ?></th>
                            <th><?php echo display('message') ?></th>
                            <th><?php echo display('date') ?></th> 
                            <th><?php echo display('status') ?></th> 
                            <th><?php echo display('action') ?></th> 
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($messages)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($messages as $message) { ?>
                                <tr>
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $message->sender_name; ?></td>
                                    <td><?php echo $message->subject; ?></td>
                                    <td><?php echo character_limiter(strip_tags($message->message),50); ?></td>
                                    <td><?php echo date('d M Y h:i:s a', strtotime($message->datetime)); ?></td>  
                                    <td><?php echo (($message->receiver_status == 0) ? "<i class='label label-warning'>not seen</label>" : "<i class='label label-success'>seen</label>"); ?></td>
                                    <td class="center" width="80">
                                        <a href="<?php echo base_url("dashboard_accountant/messages/message/inbox_information/$message->id") ?>" class="btn btn-xs btn-success"><i class="fa fa-eye"></i></a> 
                                        <a href="<?php echo base_url("dashboard_accountant/messages/message/delete/$message->id/$message->sender_id/$message->receiver_id") ?>" class="btn btn-xs btn-danger" onclick="return confirm('<?php echo display('are_you_sure') ?>') "><i class="fa fa-trash"></i></a> 
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

      <div class="col-lg-12">
        <div class="panel panel-default" id="js-timer">
            <div class="panel-body">
                <div class="widget-title">
                    <h3><?= display('total_progress')?></h3>
                    <span><?= display('last_year_status') ?></span>
                </div>
                <canvas id="lineChart" height="170"></canvas>
            </div> <!-- /.panel-body -->
        </div>
    </div>
 

</div>
 
 <script src="http://local.hospital-managment.com/assets/js/Chart.min.js" type="text/javascript"></script>

 <script type="text/javascript">
    $(window).on('load', function(){
        var ctx = document.getElementById("lineChart");
          var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"],
            datasets: [
                {
                    label: "Total Invoices",
                    borderColor: "#2C3136",
                    borderWidth: "1",
                    backgroundColor: "rgba(0,0,0,.07)",
                    pointHighlightStroke: "rgba(26,179,148,1)",
                    data: [
                        <?php 
                        if (!empty($charts[0])) {
                            for ($i=0; $i < 12 ; $i++) { 
                               echo (!empty($charts[0][$i])?$charts[0][$i]->patient:0).", ";
                            }
                        }
                        ?>
                    ]
                },
                {
                    label: "Total Amount",
                    borderColor: "#73BC4D",
                    borderWidth: "1",
                    backgroundColor: "#73BC4D",
                    pointHighlightStroke: "rgba(26,179,148,1)",
                    data: [
                        <?php
                        if (!empty($charts[1])) {
                            for ($i=0; $i < 12 ; $i++) { 
                               echo (!empty($charts[1][$i])?$charts[1][$i]->TOTAL:0).", ";
                            }
                        } 
                        ?> 
                    ]
                }
            ]
        },
        options: {
            responsive: true,
            tooltips: {
                mode: 'index',
                intersect: false
            },
            hover: {
                mode: 'nearest',
                intersect: true
            }

        }
    });
    });
</script>
 