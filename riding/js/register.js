$(function(){

    //获取省份
    $.ajax({
        url:"/giving/getProvide",
        type:"get",
        datatype:"json",
        success:function(res){
            console.log(res)
            var datalans = getCookie("language");
            console.log("语言"+datalans)
            var selectstr = ""
            if(datalans=="en_US"){
                selectstr = "Please select"
            }else{
                selectstr = "请选择"
            }
            var result="";
            for (var i = 0; i < res.length; i++) {
                result += '<option value="'+res[i].id+'">'+res[i].region_name+' '+res[i].pinyin+'</option>'
            }
            $("#city").html('<option value="" id="cityone">'+selectstr+'</option>'+result)
        }
    })
    // 选择省份后
    $("#city").change(function(){
        var chooseid = $(this).val()
        $.ajax({
            url:"/giving/getCityByProvideId",
            type:"get",
            datatype:"json",
            data:{provideId:chooseid},
            success:function(res){
                console.log(res)
                var selectstr = ""
                var datalans = getCookie("language");
                if(datalans=="en_US"){
                    selectstr = "Please select"
                }else{
                    selectstr = "请选择"
                }
                var result="";
                for (var i = 0; i < res.length; i++) {
                    result += '<option value="'+res[i].id+'">'+res[i].region_name+' '+res[i].pinyin+'</option>'
                }
                $("#area").html('<option value="" id="areaone">'+selectstr+'</option>'+result)
            }
        })
    })
    var typearr = getUrlArgObject();
    if(typearr.type){
        // 表单验证
        $("#nextbtn").click(function(){
            var name = $("#name").val() //姓名
            if(!name){
                // alert("姓名不能为空！")
                $("#name").focus()
                return false;
            }
            // 联系电话
            var phone = $("#phone").val()
            if(!phone){
                // alert("联系电话不能为空！")
                $("#phone").focus()
                return false;
            }
            // 证件号码
            var codenum = $("#idnumber").val()
            if(!codenum){
                // alert("证件号码不能为空！")
                $("#idnumber").focus()
                return false;
            }
            // birth 生日
            var bath_date = $("#bath_date").val()
            if(!bath_date){
                // alert("生日号码不能为空！")
                $("#bath_date").focus()
                return false;
            }
            // 城市不能为空
            var city = $("#city").val()
            if(!city){
                // alert("城市不能为空");
                $("#city").focus();
                return false;
            }
            // 所在机构
            var company = $("#company").val()
            if(!company){
                // alert("机构不能为空！")
                $("#company").focus()
                return false;
            }
            //邮箱
            var email = $("#email").val()
            var reg = /[@](.*)[\.]/;
            if(!email){
                // alert("邮箱不能为空！")
                $("#email").focus()
                return false;
            }else if(!reg.test(email)){
                // alert("邮箱格式不正确！")
                $("#email").focus()
                return false;
            }
            var formdata = $("#info-form").serialize()
            $.ajax({
                url:"/giving/saveCycling",
                type:"post",
                datatype:"json",
                data:formdata,
                success:function(res){
                    console.log(res)
                    if(res.status=="isok"){
                        window.location.href = "give_money.html?type="+typearr.type
                    }
                }
            })

            // window.location.href = "give_money.html?type="+typearr.type
        })
    }
})