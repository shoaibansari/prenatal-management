<div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div  class="panel panel-default">

            <div class="panel-body">

                <div class="alert"></div>

                <table width="100%" class="datatable table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th><?php echo display('serial') ?></th>
                            <th><?php echo display('post_title') ?></th>
                            <th><?php echo display('full_name') ?></th>
                            <th><?php echo display('email') ?></th>
                            <th><?php echo display('comments') ?></th>
                            <th><?php echo display('date') ?></th>
                            <th><?php echo display('add_to_website') ?></th>
                            <th><?php echo display('action') ?></th> 
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($comments)) { ?>
                            <?php $sl = 1; ?>
                            <?php foreach ($comments as $comment) { ?>
                                <tr class="<?php echo ($sl & 1)?"odd gradeX":"even gradeC" ?>">
                                    <td><?php echo $sl; ?></td>
                                    <td><?php echo $comment->title; ?></td>
                                    <td><?php echo $comment->name; ?></td>
                                    <td><?php echo $comment->email; ?></td>
                                    <td><?php echo character_limiter($comment->comment,100); ?></td> 
                                    <td><?php echo date('d F Y h.m a', strtotime($comment->date)) ?></td>
                                    <td>
                                        <input type="checkbox" id="add_to_website" data-value="<?= (($comment->add_to_website==1)?2:1) ?>" data-id="<?= $comment->id; ?>" <?= (($comment->add_to_website==1)?"checked":null) ?>>
                                    </td>
                                    <td class="center">
                                        <a href="<?php echo base_url("website/comment/delete/$comment->id") ?>" onclick="return confirm('<?php echo display('are_you_sure') ?>')" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i></a> 
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
 
 
<script type="text/javascript">
$(document).ready(function() {

    var source = $('input[id^="add_to_website"]');
    var target = $('.alert');
    source.on('change', function() {
        var id     = $(this).attr('data-id');
        var value  = $(this).attr('data-value'); 

        $.ajax({
            url      : '<?= base_url('website/comment/status') ?>',
            type     : 'post',
            dataType : 'json',
            data     : {
                '<?= $this->security->get_csrf_token_name(); ?>' : '<?= $this->security->get_csrf_hash(); ?>',
                id, 
                value
            },
            success : function(data) { 
                if (data.message) {
                    target.removeClass('alert-danger');
                    target.addClass('alert-info');
                    target.html(data.message);
                } else {
                    target.removeClass('alert-info');
                    target.addClass('alert-danger');
                    target.html(data.exception);
                } 

                setInterval(function(){ 
                    history.go(0);
                }, 1500);

            },
            error   : function(exc){
                alert('failed');
            }
        });
 

    }); 
});
</script>