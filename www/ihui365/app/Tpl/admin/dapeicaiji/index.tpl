<include file="public:header" />
<div class="subnav">
	<div class="content_menu ib_a blue line_x">
    		<a class="add fb " href="{:U('setting/aitaobao')}"><em>穿衣搭配设置</em></a>
		<a class="add fb " href="{:U('dapeicaiji/index')}"><em>搭配采集</em></a>
	</div>
</div>
<div class="subnav">
	<h1 class="title_2 line_x">爱淘宝穿衣搭配采集器</h1>
</div>
<div class="pad_lr_10">
    <form id="J_info_form" action="{:U('dapeicaiji/setting')}" method="post">
    <table width="100%" cellspacing="0" class="table_form">
	<tr>
		<th width="150">穿衣搭配目录 :</th>
		<td>
			<select name="cat">
				<option value="0">全部</option>
				<option value="3001">日韩</option>
				<option value="3002">欧美</option>
				<option value="3003">复古</option>
				<option value="3004">学院</option>
				<option value="3005">休闲</option>
				<option value="3006">潮品</option>
				<option value="3007">清新</option>
				<option value="3008">甜美</option>
				<option value="3009">BF风</option>
				<option value="3010">轻熟</option>
				<option value="3023">明星</option>
			</select>
		</td>
	</tr>
	<tr>
		<th width="150">入库分类 :</th>
		<td>
			<select class="J_cate_select mr10" data-pid="0" data-uri="{:U('dapei_cate/ajax_getchilds', array('type'=>0))}"></select>
			<span class="red ml10">请选择采集后要写入的分类。</span>
		</td>			
        </tr>
	<tr>
		<th width="150">每页采集数量 :</th>
		<td>
			<input name="num" type="text" class="input-text" size="8" value="30"/>
			<span class="red ml10">数量越小采集速度越快，第一次采集建议设置120 以后更新只需要30即可，最多120个！</span>
		</td>
	</tr>
        <tr>
		<th></th>
		<td><input type="submit" value="开始采集" name="dosubmit" class="smt mr10"></td>
	</tr>
    </table>
    <input type="hidden" name="cate_id" id="J_cate_id" value="0" />	
    </form>	
</div>
<include file="public:footer" />
<script>
$(function(){
    var collect_url = "{:U('dapeicaiji/collect')}";
    $('#J_info_form').ajaxForm({success:complete, dataType:'json'});
    var p = 2;
    function complete(result){
        if(result.status == 1){
            $.dialog({id:'dapeicaiji', title:result.msg, content:result.data, padding:'', lock:true});
            p = 2;
            collect_page();
        } else {
            $.ftxia.tip({content:result.msg, icon:'alert'});
        }
    }
    function collect_page(){
        $.getJSON(collect_url, {p:p}, function(result){
            if(result.status == 1){
                $.dialog.get('dapeicaiji').content(result.data);
                p++;
                collect_page(p);
            }else{
                $.dialog.get('dapeicaiji').close();
                $.ftxia.tip({content:result.msg});
            }
        });
    }
    $('.J_cate_select').cate_select({field:'J_cate_id'});
});
</script>
</body>
</html>