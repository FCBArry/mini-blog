function changezan(pid) {
	$.ajax({
    	url:"/miniblog/favour_changeFavour.action",//要请求的servlet
		data:{method:"changeFavour", pid:pid},//给服务器的参数
		type:"POST",
		dataType:"json",
		//async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		//cache:false,
		success:function(result) {
			var tmpspan = document.getElementById(pid + "zan");
			if(result){
				tmpspan.className = "label label-success";
			}
			else{
				tmpspan.className = "label label-danger";
			}
		}
    });
}

function statusZan(pid) {
	$.ajax({
    	url:"/miniblog/favour_status.action",//要请求的servlet
		data:{method:"status", pid:pid},//给服务器的参数
		type:"POST",
		dataType:"json",
		//async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		//cache:false,
		success:function(result) {
			var tmpspan = document.getElementById(pid + "zan");
			if(result){
				tmpspan.className = "label label-success";
			}
			else{
				tmpspan.className = "label label-danger";
			}
		}
    });
}

function changecol(pid) {
	$.ajax({
    	url:"/miniblog/collection_changeCollection.action",//要请求的servlet
		data:{method:"changeCollection", pid:pid},//给服务器的参数
		type:"POST",
		dataType:"json",
		//async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		//cache:false,
		success:function(result) {
			var tmpspan = document.getElementById(pid + "col");
			if(result){
				tmpspan.className = "label label-success";
			}
			else{
				tmpspan.className = "label label-danger";
			}
		}
    });
}

function statusCol(pid) {
	$.ajax({
    	url:"/miniblog/collection_status.action",//要请求的servlet
		data:{method:"status", pid:pid},//给服务器的参数
		type:"POST",
		dataType:"json",
		//async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
		//cache:false,
		success:function(result) {
			var tmpspan = document.getElementById(pid + "col");
			if(result){
				tmpspan.className = "label label-success";
			}
			else{
				tmpspan.className = "label label-danger";
			}
		}
    });
}