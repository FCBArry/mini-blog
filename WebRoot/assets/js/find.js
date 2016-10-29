function changefan(otheruid) {
	$.ajax({
    	url:"/miniblog/fans_changeFan.action",//要请求的servlet
		data:{method:"changeFan", otheruid:otheruid},//给服务器的参数
		type:"POST",
		dataType:"json",
		//async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		//cache:false,
		success:function(result) {
			var tmpspan = document.getElementById(otheruid + "fan");
			if(result){
				tmpspan.className = "label label-success";
				tmpspan.innerHTML = "<span class='glyphicon glyphicon-minus'></span> 取消关注";
			}
			else{
				tmpspan.className = "label label-default";
				tmpspan.innerHTML = "<span class='glyphicon glyphicon-plus'></span> 关注Ta吧";
			}
		}
    });
}

function statusFan(otheruid) {
	$.ajax({
    	url:"/miniblog/fans_status.action",//要请求的servlet
		data:{method:"status", otheruid:otheruid},//给服务器的参数
		type:"POST",
		dataType:"json",
		//async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		//cache:false,
		success:function(result) {
			var tmpspan = document.getElementById(otheruid + "fan");
			if(result){
				tmpspan.className = "label label-success";
				tmpspan.innerHTML = "<span class='glyphicon glyphicon-minus'></span> 取消关注";
			}
			else{
				tmpspan.className = "label label-default";
				tmpspan.innerHTML = "<span class='glyphicon glyphicon-plus'></span> 关注Ta吧";
			}
		}
    });
}