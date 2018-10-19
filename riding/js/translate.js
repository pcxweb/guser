var lan;
var language ="zh_CN"
$(".language_s").click(function(){
  language = $(this).attr("data-lan");
  setCookie('language',language,30);

  location.reload();

});


var datalan = getCookie("language");
if(!datalan){
  datalan = "zh_CN"
}else {
  datalan = datalan
}

if(datalan=="en_US"){
    lan = 'en'
    $('body').css("fontFamily","x-enfonts")
    $('input').css("fontFamily","x-enfonts")
    $('button').css("fontFamily","x-enfonts")
}else{
    lan = "zh"
    $('body').css("fontFamily","zhridingfonts")
    $('input').css("fontFamily","zhridingfonts")
    $('button').css("fontFamily","zhridingfonts")
}
$("#"+datalan).addClass("active").siblings('.language_s').removeClass("active")
// 从sessionStorage获取数据

// console.log(lan)
jQuery.i18n.properties({ 
    name:'string',// 资源文件名称
    path:'/riding/i18n/',// 资源文件所在目录路径
    mode:'map',// 模式：变量或 Map 
    language:lan,// 对应的语言
    async:false,
    encoding: 'UTF-8', 
    callback: function() {// 回调方法
        // console.log(666)
        var arr = $("[translate^=string]");
        for (var i = 0; i < arr.length; i++) {
            var tempID = arr[i];
            var trans = $(tempID).attr('translate');
            // $(tempID).text($.i18n.prop(trans));
            if($(tempID)[0].tagName=="INPUT"){
                // console.log($(tempID).tagName)
                $(tempID).attr("placeholder",$.i18n.prop(trans))
            }else{
                $(tempID).text($.i18n.prop(trans));
            }
        }
        
    }
});

function setCookie(cname,cvalue,exdays){
  var d = new Date();
  d.setTime(d.getTime()+(exdays*24*60*60*1000));
  var expires = "expires="+d.toGMTString();
  document.cookie = cname + "=" + cvalue + "; " + expires+"; path=/";
}
function getCookie(cname)
{
  var name = cname + "=";
  var ca = document.cookie.split(';');
  for(var i=0; i<ca.length; i++) 
  {
    var c = ca[i].trim();
    if (c.indexOf(name)==0) return c.substring(name.length,c.length);
  }
  return "";
  
}



