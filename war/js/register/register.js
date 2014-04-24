/**
 * Create by Vincent
 */
var check = {
		checkName:function(_dom){
			//验证姓名
			var dom = $(_dom);//转换对象
			var value = dom.val();
			var pattern = /^[\u4e00-\u9fa5]{1,10}[·.]{0,1}[\u4e00-\u9fa5]{1,10}$/; 
			if(pattern.test(value)){
				showTip.hideIncomplete($('#incompleteName'));
				return true;
			}else{
				showTip.showIncomplete($('#incompleteName'));
				return false;
			}
		},
		checkTelephone:function(_dom){
			//验证手机号码
			var dom = $(_dom);//转换对象
			var value = dom.val();
			var pattern=/(^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$)|(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;
            if(pattern.test(value)) { 
            	showTip.hideIncomplete($('#incompleteTelephone'));
                return true; 
            }else{ 
            	showTip.showIncomplete($('#incompleteTelephone'));
            	return false; 
            }
		},
		checkLeaveMessage:function(_dom){
			//验证留言
			var dom = $(_dom);//转换对象
			var value = dom.val();
			var pattern = /[@#\$%\^&\*]+/g;
			if(pattern.test(value) || value === ""){
				showTip.showIncomplete($('#incompleteLeaveMessage'));
				return false;
			}else{
				showTip.hideIncomplete($('#incompleteLeaveMessage'));
				return true;
			}
		}
}
function sendMsg(){
		var name = $("#name").val();
		var telephone = $("#telephone").val();
		var idleTime = $("#idleTime").val();
		var qq = $("#qq").val();
		var microLetter = $("#microLetter").val();
		var mail = $("#mail").val();
		var leaveMessage = $("#leaveMessage").val();
		
		var leaveMessageFlag = check.checkLeaveMessage($("#leaveMessage"));
		var telephoneFlag = check.checkTelephone($("#telephone"));
		var nameFlag = check.checkName($("#name"));
		if(nameFlag === false || telephoneFlag === false || leaveMessageFlag === false){
			return;
		}else{
			$.post("wantaddCustomer",{"name":name,"telephone":telephone,"idleTime":idleTime,"qq":qq,"microLetter":microLetter,"mail":mail,"leaveMessage":leaveMessage},function(flag){
				if(flag){
					showTip.showSuccess();
					setTimeout(function(){
						window.location.href='home';
					},5000);
					
				}else{
					showTip.showFail();
				}
			});
		}
};
var showTip = {
		showFail:function(){
			$('#TipForFail').removeClass("hidden");
			$('#TipForFail').addClass("show");
		},
		hideFail:function(){
			$('#TipForFail').removeClass("show");
			$('#TipForFail').addClass("hidden");
		},
		showSuccess:function(){
			$('#TipForSuccess').removeClass("hidden");
			$('#TipForSuccess').addClass("show");
			i = 4;
			setInterval(function(){
				$('#TipForSuccess').html('保存成功,我们会及时与您联系,'+i+'秒后返回首页!');
				i--;
			},1000);
		},
		hideSuccess:function(){
			$('#TipForSuccess').removeClass("show");
			$('#TipForSuccess').addClass("hidden");
		},
		showIncomplete:function(dom){
			dom.addClass('has-error');
			dom.find('input').focus();
		},
		hideIncomplete:function(dom){
			dom.removeClass('has-error');
			dom.addClass('has-success');
		}
}


