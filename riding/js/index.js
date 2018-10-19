$(function(){
    var typearr = getUrlArgObject();
    if(typearr.type){
        console.log(typearr.type)
        if(typearr.type==1){
            $("#typenum").text("￥1,500.00")
        }else if(typearr.type==2){
            $("#typenum").text("￥380.00")
        }

    }
})
//返回的是对象形式的参数    
function getUrlArgObject(){    
    var args=new Object();    
    var query=location.search.substring(1);//获取查询串    
    var pairs=query.split("&");//在逗号处断开    
    for(var i=0;i<pairs.length;i++){    
        var pos=pairs[i].indexOf('=');//查找name=value    
        if(pos==-1){//如果没有找到就跳过    
            continue;    
        }    
        var argname=pairs[i].substring(0,pos);//提取name    
        var value=pairs[i].substring(pos+1);//提取value   
        // console.log(decodeURI(value)) 
        args[argname]=decodeURI(value);//存为属性    
    }    
    return args;//返回对象    
}   