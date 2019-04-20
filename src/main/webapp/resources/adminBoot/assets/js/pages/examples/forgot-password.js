(function ($) {
    'use strict';
    $(function () {
        //Jquery validation
        $('#frmForgotPassword').validate({
            highlight: function (element) {
                $(element).closest('.form-group').addClass('has-error');
            },
            unhighlight: function (element) {
                $(element).closest('.form-group').removeClass('has-error');
            },
            errorPlacement: function (error, element) {
                element.parents('.form-group').append(error);
            }
        });
        
        $("#findButton").on("click", function(){
        	var id = $("#admin_ID").val();
        	var email = $("#admin_Email").val();
        	//$("#frmForgotPassword").submit();
        	$.ajax({
        		url:"findAdminPassword"
        		,data:{admin_ID:id, admin_Email:email}
        		,type:"post"
        		,success:function(message){
        			if (message != null) {
						alert(message);
					}else {
						alert(message);
					}
        		}
        	})//ajax
        	
        });
    });
}(jQuery))
