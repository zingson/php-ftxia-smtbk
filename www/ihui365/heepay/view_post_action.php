﻿<?php
/*
 * 提交查询页面 
 */
	// 获取url 
	$url = $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
	$project_url = str_replace('view_post_action.php','',$url);
	
	$version = '1';
	$agent_id = $_POST['agent_id'];
	$agent_bill_id = $_POST['agent_bill_id'];
	$agent_bill_time = $_POST['agent_bill_time'];
	$remark = $_POST['remark'];
	$return_mode = $_POST['return_mode'];
	$sign_key = $_POST['sign_key'];
	/*
	以下仅为参考
	*/
	$sign_str = '';
	$sign_str  = $sign_str . 'version=' . $version;
	$sign_str  = $sign_str . '&agent_id=' . $agent_id;
	$sign_str  = $sign_str . '&agent_bill_id=' . $agent_bill_id;
	$sign_str  = $sign_str . '&agent_bill_time=' . $agent_bill_time;
	$sign_str  = $sign_str . '&return_mode=' . $return_mode;
	$sign_str  = $sign_str . '&key=' . $sign_key;

	$sign='';
	$sign = md5($signStr); //计算签名值
?>
<textarea name="cardData" id="cardData" rows="10" cols="70"><?php echo '签名原始数据：'.strtolower($sign_str) ?></textarea>
<textarea name="sign" id="sign" rows="10" cols="70"><?php echo '签名加密后数据数据：'.$sign ?></textarea>

<form id='frmSubmit1' method='get' name='frmSubmit1' action='<?php echo QUERY_URL;?>'>
<input type='hidden' name='version' value='<?php echo $version ?>' />
<input type='hidden' name='agent_id' value='<?php echo $agent_id ?>' />
<input type='hidden' name='agent_bill_id' value='<?php echo $agent_bill_id ?>' />
<input type='hidden' name='agent_bill_time' value='<?php echo $agent_bill_time ?>' />
<input type='hidden' name='return_mode' value='<?php echo $return_mode ?>' />
<input type='hidden' name='sign' value='<?php echo $sign ?>' />
<input type="button" value="提交查询" onclick="gatewayPaySubmit()">

</form>
<script language='javascript'>
function gatewayPaySubmit(){document.frmSubmit1.submit();}
</script>



