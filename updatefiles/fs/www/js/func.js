var HelpOptionsVar = "width=480,height=420,scrollbars,toolbar,resizable,dependent=yes";
var GlossOptionsVar = "width=420,height=180,scrollbars,toolbar,resizable,dependent=yes";
var bigsub   = "width=700,height=440,scrollbars,menubar,resizable,status,dependent=yes";
var macfiltersub = "width=700,height=550,scrollbars,menubar,resizable,status,dependent=yes";
var pclistsub = "width=700,height=620,scrollbars,menubar,resizable,status,dependent=yes";
var summarysub  = "width=700,height=500,scrollbars,menubar,resizable,status,dependent=yes";
var smallsub = "width=440,height=320,scrollbars,resizable,dependent=yes";
var sersub   = "width=500,height=380,scrollbars,resizable,status,dependent=yes";
var multisub   = "width=630,height=470,scrollbars,menubar,resizable,status,dependent=yes";
var bigsubwin   = "width=820,height=605,scrollbars,menubar,resizable,status,dependent=yes";
var helpWinVar = null;
var glossWinVar = null;
var datSubWinVar = null;
var ValidStr = 'abcdefghijklmnopqrstuvwxyz-';
var ValidStr_ddns = 'abcdefghijklmnopqrstuvwxyz-1234567890';
var hex_str = "ABCDEFabcdef0123456789";
var DEBUG = 0;
var arrSwitch = new Array();
var nTrunks;

function dw(message)
{
    document.write(message);
}

function showLogType(logtype)
{
    if(logtype=="System Log")
        dw(va_log_type2);
    else if (logtype=="Access Log")
        dw(va_log_type3);
    else if (logtype=="Firewall Log")
        dw(va_log_type4);
    else if (logtype=="VPN Log")
        dw(va_log_type5);
    else
        dw(va_log_type1);
}

function showMsg()
{
    var msgVar=document.forms[0].message.value;
    if (msgVar.length > 1)
        alert(msgVar);
}


function closeWin(win_var)
{
    if ( ((win_var != null) && (win_var.close)) || ((win_var != null) && (win_var.closed==false)) )
        win_var.close();
}

function openHelpWin(file_name)
{
    helpWinVar = window.open(file_name,'help_win',HelpOptionsVar);
    if (helpWinVar.focus)
        setTimeout('helpWinVar.focus()',200);
}

function openGlossWin()
{
    glossWinVar = window.open('','gloss_win',GlossOptionsVar);
    if (glossWinVar.focus)
        setTimeout('glossWinVar.focus()',200);
}

function closeSubWins()
{
    closeWin(helpWinVar);
    closeWin(glossWinVar);
    closeWin(datSubWinVar);
}

function openDataSubWin(filename,win_type)
{
    closeWin(datSubWinVar);
    datSubWinVar = window.open(filename,'datasub_win',win_type);
    if (datSubWinVar.focus)
        setTimeout('datSubWinVar.focus()',200);
}

function showHelp(helpfile)
{
    if(top.frames.length == 0)
        return;
    top.helpframe.location.href = helpfile;
}


function addstr(input_msg)
{
    var last_msg = "";
    var str_location;
    var temp_str_1 = "";
    var temp_str_2 = "";
    var str_num = 0;
    temp_str_1 = addstr.arguments[0];
    while(1)
    {
        str_location = temp_str_1.indexOf("%s");
        if(str_location >= 0)
        {
            str_num++;
            temp_str_2 = temp_str_1.substring(0,str_location);
            last_msg += temp_str_2 + addstr.arguments[str_num];
            temp_str_1 = temp_str_1.substring(str_location+2,temp_str_1.length);
            continue;
        }
        if(str_location < 0)
        {
            last_msg += temp_str_1;
            break;
        }
    }
    return last_msg;
}

function checkMsg(msg)
{
    if(msg.length > 1)
    {
        alert(msg);
        return false;
    }
    return true;
}

function setHTML(windowObj, el, htmlStr)  // el must be str, not reference
{
    if (document.all)
    {
        if (windowObj.document.all(el) )
            windowObj.document.all(el).innerHTML = htmlStr;
    }
    else if (document.getElementById)
    {
        if (windowObj.document.getElementById(el) )
            windowObj.document.getElementById(el).innerHTML = htmlStr;
    }
}


//  High-level test functions - generate messages

function checkBlank(fieldObj, fname)
{
    var msg = "";
    if (fieldObj.value.length < 1){
        msg = addstr(msg_blank,fname);
    }
    return msg;
}

function checkNoBlanks(fObj, fname)
{
    var space = " ";
    if (fObj.value.indexOf(space) >= 0 )
        return addstr(msg_space, fname);
    else return "";
}

function checkMail(fobj, fname)
{
    var tmp_str = fobj.value;
    var msg = "";

    //matching Email address format(regular expression)
    var pattern = /^[a-zA-Z0-9]{1}[\.a-zA-Z0-9_-]*[a-zA-Z0-9]{1}@([a-zA-Z0-9]+[-]{0,1}[a-zA-Z0-9]+[\.]{1}){1,2}[a-zA-Z]+$/;

    if(!pattern.test(tmp_str))
        msg = addstr(msg_invalid_email, fname);

    return msg;
}

function isTrueIp(s)
{
    var patrn=/^[\.0-9]+$/;

    if (!patrn.exec(s)) return false

    return true
}

function checkHostName(fobj, fname)
{
    var tmp_str = fobj.value;
    var msg = "";
    var pattern = /^([a-zA-Z0-9]+[-]{0,1}[a-zA-Z0-9]+[\.]{1}){1,2}[a-zA-Z]+$/;

    if(isTrueIp(tmp_str))
    {
        if(isIP(tmp_str)==false)
            msg = addstr(msg_invalid_ipaddr, fname);
    }else
    {
        if(!pattern.test(tmp_str))
            msg = addstr(msg_invalid_domain, fname);
    }
    return msg;
}

function checkAllSpaces(fieldObj, fname)
{
    var msg = "";
    if(fieldObj.value.length == 0)
        return "";
    var tstr = makeStr(fieldObj.value.length," ");
    if (tstr == fieldObj.value)
        msg = addstr(msg_allspaces,fname);
    return msg;
}

function checkValid(text_input_field, field_name, Valid_Str, max_size, mustFill)
{
    var error_msg= "";
    var size = text_input_field.value.length;
    var str = text_input_field.value;

    if ((mustFill) && (size != max_size) )
        error_msg = addstr(msg_blank_in,field_name);
    for (var i=0; i < size; i++)
    {
        if (!(Valid_Str.indexOf(str.charAt(i)) >= 0))
        {
            error_msg = addstr(msg_invalid,field_name,Valid_Str);
            break;
        }
    }
    return error_msg;
}

function checkInt(text_input_field, field_name, min_value, max_value, required)
// NOTE: Doesn't allow negative numbers, required is true/false
{
    var str = text_input_field.value;
    var error_msg= "";

    if (text_input_field.value.length==0) // blank
    {
        if (required)
            error_msg = addstr(msg_blank,field_name);
    }
    else // not blank, check contents
    {
        for (var i=0; i < str.length; i++)
        {
            if ((str.charAt(i) < '0') || (str.charAt(i) > '9'))
                error_msg = addstr(msg_check_invalid,field_name);
        }
        if (error_msg.length < 2) // don't parse if invalid
        {
            var int_value = parseInt(str,10);
            if (int_value < min_value || int_value > max_value)
                error_msg = addstr(msg_valid_range,field_name,min_value,max_value);
        }
    }
    return(error_msg);
}

function checkInt_str(text_input_field, field_name, min_value, max_value, min_value_str, max_value_str, required)
// NOTE: Doesn't allow negative numbers, required is true/false
{
    var str = text_input_field.value;
    var error_msg= "";

    if (text_input_field.value.length==0) // blank
    {
        if (required)
            error_msg = addstr(msg_blank,field_name);
    }
    else // not blank, check contents
    {
        for (var i=0; i < str.length; i++)
        {
            if ((str.charAt(i) < '0') || (str.charAt(i) > '9'))
                error_msg = addstr(msg_check_invalid,field_name);
        }
        if (error_msg.length < 2) // don't parse if invalid
        {
            var int_value = parseInt(str,10);
            if (int_value < min_value || int_value > max_value)
                error_msg = addstr(msg_valid_range,field_name,min_value_str,max_value_str);
        }
    }
    return(error_msg);
}

function checkMAC(fObj, fname, removeSeparators)
{
    var msg = "";
    if(badMac(fObj, removeSeparators))
        msg = addstr(msg_invalid_mac, fname);
    return msg;
}


// Low-level test functions - return true or false ============================


function blankIP(ip1, ip2, ip3, ip4) // ip fields, true if 0 or blank
{
    return ((ip1.value == "" || ip1.value == "0")
        && (ip2.value == "" || ip2.value == "0")
        && (ip3.value == "" || ip3.value == "0")
        && (ip4.value == "" || ip4.value == "0"))
}

function badIP(ip1, ip2, ip3, ip4, max)   // ip fields, 1.0.0.1 to 254.255.255.max
{
    if(!(isInteger(ip1.value,1,254,false))) return true;
    if(!(isInteger(ip2.value,0,255,false))) return true;
    if(!(isInteger(ip3.value,0,255,false))) return true;
    if(!(isInteger(ip4.value,1,max,false))) return true;
    return false;
}
function badSubnetIP(ip1, ip2, ip3, ip4, max)   // ip fields 1.0.0.0. to 255.255.255.max
{
    if(!(isInteger(ip1.value,1,254,false))) return true;
    if(!(isInteger(ip2.value,0,255,false))) return true;
    if(!(isInteger(ip3.value,0,255,false))) return true;
    if(!(isInteger(ip4.value,0,max,false))) return true;
    return false;
}


function badMask(ip1, ip2, ip3, ip4)   // mask fields 0 to 255
{
    if(!(isInteger(ip1.value,0,255,false))) return true;
    if(!(isInteger(ip2.value,0,255,false))) return true;
    if(!(isInteger(ip3.value,0,255,false))) return true;
    if(!(isInteger(ip4.value,0,255,false))) return true;
    return false;
}


function badMac(macfld, removeSeparators) // macfld is form field, removeSeparators true/false
{
    var myRE = /[0-9a-fA-F]{12}/;
    var MAC = macfld.value;

    MAC = MAC.toUpperCase();
    MAC = MAC.replace(/:/g,"");
    MAC = MAC.replace(/-/g,"");
    if (removeSeparators)
        macfld.value = MAC;
    if((MAC.length != 12) || (MAC == "000000000000") || (MAC == "FFFFFFFFFFFF") ||(myRE.test(MAC)!=true))
        return true;
    else
        return false;
}

function ValidMacAddress(macAddr)
{
    //	alert("ValidMacAddress(): Use badMac(macfld, removeSeparators) instead!");
    //	return;

    var i;
    if ((macAddr.indexOf(':')!=-1)||(macAddr.indexOf('-')!=-1))
    {
        macAddr = macAddr.replace(/:/g,"");
        macAddr = macAddr.replace(/-/g,"");
    }

    if ((macAddr.length == 12) && (macAddr != "000000000000"))
    {
        for(i=0; i<macAddr.length;i++)
        {
            var c = macAddr.substring(i, i+1);
            if(("0" <= c && c <= "9") || ("a" <= c && c <= "f") || ("A" <= c && c <= "F"))
                continue;
            else
                return false;
        }

        return true;
    }

    return false;
}



function badIpRange(from1,from2,from3,from4,to1,to2,to3,to4)
// parameters are form fields, returns true if invalid ( from > to )
{
    var total1 = 0;
    var total2 = 0;

    total1 += parseInt(from4.value,10);
    total1 += parseInt(from3.value,10)*256;
    total1 += parseInt(from2.value,10)*256*256;
    total1 += parseInt(from1.value,10)*256*256*256;

    total2 += parseInt(to4.value,10);
    total2 += parseInt(to3.value,10)*256;
    total2 += parseInt(to2.value,10)*256*256;
    total2 += parseInt(to1.value,10)*256*256*256;
    if(total1 >= total2)
        return true;
    return false;
}

function isIllegal(s)
{
    //var reg = /^(\w| |\(|\)|[\u4E00-\u9FA5])+$/;
    var reg =/^[A-Za-z0-9]{1,16}$/;

    if(s.match(reg))
    {
        if(fucCheckLength(s)>16)
            return false;
        else
            return true;
    }

    return false;
}

function is_Illegal(s)
{
    var reg = /^(\w| |\(|\)|[\u4E00-\u9FA5])+$/;
    var reg_space = /^\s+$/g;

    if(s.match(reg_space))
        return false;

    if(s.match(reg))
    {
        if(fucCheckLength(s)>32)
            return false;
        else
            return true;
    }

    return false;
}

function isIllegalOid(s)
{
	var reg =/^(\.\d+)+$/;
    if(s.match(reg))
    {
        if(fucCheckLength(s)>128)
            return false;
        else
            return true;
    }

    return false;


}

function isIllegalEngineId(s)
{
	//var reg =/\b0[xX]([0-9a-fA-F]{2})+\b/;
	var reg = /\b0[xX]([0-9a-fA-F]{2}){5,15}\b/;
    if(s.match(reg))
    {
        if(fucCheckLength(s)>32)
            return false;
        else
            return true;
    }

    return false;
}

function isIllegaluser(s)
{
    //    var reg = /^(\w| |\(|\)|[\u4E00-\u9FA5])*$/;
    var reg = /^[\w| ]*$/;//disable multi-byte characters
    if(s.match(reg))
    {
        if(fucCheckLength(s)>16)
            return false;
        else
            return true;
    }
    return false;
}

function isIllegalpassword(s)
{
    var reg = /^([\x21-\x7e]|[A-Za-z0-9])+$/;
    if(s.match(reg))
    {
        if(fucCheckLength(s)<5)
            return false;
        else
            return true;
    }
    return false;
}

function is_illegal_acl_id(s)
{
    var reg = /^[\w]*$/;
    if(s.match(reg))
    {
        if(fucCheckLength(s) > 8)
            return false;
        else
            return true;
    }
    return false;
}

function isIllegalvlan(s)
{
    //var reg = /^(\w|[\u4E00-\u9FA5])+$/;
    var reg =/^[A-Za-z0-9]{1,16}$/;
    if(s.match(reg))
    {
        if(fucCheckLength(s)>16)
            return false;
        else
            return true;
    }

    return false;
}

function isIllegalwithAt(s)
{
    var reg = /^(\w|[\u4E00-\u9FA5]|@|\.)+$/;

    if(s.match(reg))
    {
        if(fucCheckLength(s)>16)
            return false;
        else
            return true;
    }

    return false;
}

function isIllegalKey(s)
{
    var reg = /^(\w|[\u4E00-\u9FA5]|@|\.)+$/;

    if(s.match(reg))
    {
        if((fucCheckLength(s)>64) || (fucCheckLength(s)<6))
            return false;
        else
            return true;
    }

    return false;
}

function fucCheckLength(strTemp)
{
    var i,sum;
    sum=0;
    for(i=0;i<strTemp.length;i++)
    {
        if ((strTemp.charCodeAt(i)>=0) && (strTemp.charCodeAt(i)<=255))
            sum=sum+1;
        else
            sum=sum+2;
    }
    return sum;
}

function CheckChinese(strTemp)
{
    var i,sum;
    sum=0;
    for(i=0;i<strTemp.length;i++)
    {
        if ((strTemp.charCodeAt(i)>=19968) && (strTemp.charCodeAt(i)<=40959))
            return true;
    }
    return false;
}


function isBlank(str)
{
    return (str.length == 0 );
}


function isBigger(str_a, str_b)
//  true if a bigger than b
{
    var int_value_a = parseInt(str_a);
    var int_value_b = parseInt(str_b);
    return (int_value_a > int_value_b);
}

function isInteger(str,min_value,max_value,allowBlank)  // allowBlank = true or false
// return true if positive Integer, false otherwise
{
    if(str.length == 0)
        if(allowBlank)
            return true;
        else
            return false;
    for (var i=0; i < str.length; i++)
    {
        if ((str.charAt(i) < '0') || (str.charAt(i) > '9'))
            return false;
    }
    var int_value = parseInt(str,10);
    if ((int_value < min_value) || (int_value > max_value))
        return false;
    return true;
}


function isHex(str) {
    var i;
    for(i = 0; i<str.length; i++) {
        var c = str.substring(i, i+1);
        if(("0" <= c && c <= "9") || ("a" <= c && c <= "f") || ("A" <= c && c <= "F")) {
            continue;
        }
        return false;
    }
    return true;
}

function isTelephoneNum(str)
{
    var c;
    if(str.length == 0)
        return false;
    for (var i = 0; i < str.length; i++)
    {
        c = str.substring(i, i+1);
        if (c>= "0" && c <= "9")
            continue;
        if ( c == '-' && i !=0 && i != (str.length-1) )
            continue;
        if ( c == ',' ) continue;
        if (c == ' ') continue;
        if (c>= 'A' && c <= 'Z') continue;
        if (c>= 'a' && c <= 'z') continue;
        return false;
    }
    return true;
}

function checkDay(year,month,day)  // check if valid date
{
    var isleap = false;
    if(year%400 == 0 || (year%4 == 0 && year%100 != 0))
        isleap = true;
    if(month%2)
    {
        if((month<=7)&&(day>31))
            return false;
        if((month>7)&&(day>30))
            return false;
    }
    else
    {
        if(month<=6)
        {
            if(month == 2)
            {
                if((isleap)&&(day>29))
                {
                    return false;
                }
                if((!isleap)&&(day>28))
                {
                    return false;
                }
            }
            else
            {
                if(day > 30)
                    return false;
            }
        }
        else
        if(day>31)
            return false;
    }
    return true;
}

function CheckSpaceInName(text_input_field)
//not allow space in name,
{
    if (text_input_field.value.length>1)
    {
        for (var i=0;i<text_input_field.value.length;i++)
        {
            if (text_input_field.value.charAt(i) == ' ')
                return false;
        }
    }
    return true;
}

// Utility & Misc functions ===================================================
//Input Output Ip Address-KelV!n y0u@2004/Oct/24------------------------------------------------------
function IP_T2R(ipbox, ipvar)
{
    var ipstr;
    ipstr= eval("document.forms[0]."+ipbox+"1").value+"."
    +eval("document.forms[0]."+ipbox+"2").value+"."
    +eval("document.forms[0]."+ipbox+"3").value+"."
    +eval("document.forms[0]."+ipbox+"4").value;
    eval("document.forms[0]."+ipvar).value = ipstr;
}
function IP_R2T(ipbox, ipvar)
{
    var ipArray = new Array();
    var i;
    var str;

    str = eval("document.forms[0]."+ipvar).value
    if(str.length == 0)
        return;
    ipArray = str.split(".");
    for(i=1; i<=ipArray.length; i++)
    {
        eval("document.forms[0]."+ipbox+i).value = ipArray[i-1];
    }
}
function IP_STRING_R2T(ipbox, ipstr)
{
    var ipArray = new Array();
    var i;
    var str;

    if(ipstr.length == 0)
        return;

    ipArray = ipstr.split(".");
    for(i=1; i<=ipArray.length; i++)
    {
        eval("document.forms[0]."+ipbox+i).value = ipArray[i-1];
    }
}
function IP_STRING_T2R(ipbox)
{
    return  eval("document.forms[0]."+ipbox+"1").value+"."
    +eval("document.forms[0]."+ipbox+"2").value+"."
    +eval("document.forms[0]."+ipbox+"3").value+"."
    +eval("document.forms[0]."+ipbox+"4").value;
}
// Utility & Misc functions ===================================================
//false: valide ip address, true: invalid ip address
function checkIPAddress(ipbox, max, bAllowBlank)
{
    if(bAllowBlank == true)
    {
        if((eval("document.forms[0]."+ipbox+"1").value == "0"||eval("document.forms[0]."+ipbox+"1").value == "")
            && (eval("document.forms[0]."+ipbox+"2").value == "0"||eval("document.forms[0]."+ipbox+"2").value == "")
            && (eval("document.forms[0]."+ipbox+"3").value == "0"||eval("document.forms[0]."+ipbox+"3").value == "")
            && (eval("document.forms[0]."+ipbox+"4").value == "0"||eval("document.forms[0]."+ipbox+"4").value == ""))
            return false;
    }

    return check_vip(	eval("document.forms[0]."+ipbox+"1"),
        eval("document.forms[0]."+ipbox+"2"),
        eval("document.forms[0]."+ipbox+"3"),
        eval("document.forms[0]."+ipbox+"4"), max);
}

function check_vip(ip1, ip2, ip3, ip4, max)
{
    if(checkIPMain(ip1,255)) return true;
    if(checkIPMain(ip2,255)) return true;
    if(checkIPMain(ip3,255)) return true;
    if(checkIPMain(ip4,max)) return true;
    if((parseInt(ip1.value)==0)||(parseInt(ip1.value)==0)&&(parseInt(ip2.value)==0)&&(parseInt(ip3.value)==0)&&(parseInt(ip4.value)==0))
        return true;
    return false;
}

/* Check IP Address Format*/
function checkIPMain(ip,max)
{
    if( false == isNumeric(ip, max) )
    {
        ip.focus();
        return true;
    }

    return false;
}

/* Check Numeric*/
function isNumeric(str, max)
{
    if(str.value.length <= 3){
        str.value = str.value.replace(/^000/g,"0");
        str.value = str.value.replace(/^00/g,"0");
        if(str.value.length > 1)
            str.value = str.value.replace(/^0/g,"");
    }

    if(str.value.length == 0 || str.value == null || str.value == "") {
        str.focus();
        return false;
    }

    var i = parseInt(str.value);

    if(i>max) {
        str.focus();
        return false;
    }
    for(i=0; i<str.value.length; i++) {
        var c = str.value.substring(i, i+1);
        if("0" <= c && c <= "9") {
            continue;
        }
        str.focus();
        return false;
    }
    return true;
}

function isIE()
{
    if(navigator.appName.indexOf("Microsoft") != -1)
        return true;
    else return false;
}

function setDisabled(OnOffFlag,formFields)
{
    for (var i = 1; i < setDisabled.arguments.length; i++)
        setDisabled.arguments[i].disabled = OnOffFlag;
}

function makeStr(strSize, fillChar)
{
    var temp = "";
    for (i=0; i < strSize ; i ++)
        temp = temp + fillChar;
    return temp;
}

var showit = "block";
var hideit = "none";

function show_hide(el,shownow)  // IE & NS6; shownow = true, false
{
    //	alert("el = " + el);
    if (document.all)
        document.all(el).style.display = (shownow) ? showit : hideit ;
    else if (document.getElementById)
        document.getElementById(el).style.display = (shownow) ? showit : hideit ;
}


function printPage()
{
    location.href="javascript:print();";
}



ie4 = ((navigator.appName == "Microsoft Internet Explorer") && (parseInt(navigator.appVersion) >= 4 ))
ns4 = ((navigator.appName == "Netscape") && (parseInt(navigator.appVersion) < 6 ))
ns6 = ((navigator.appName == "Netscape") && (parseInt(navigator.appVersion) >= 6 ))

// 0.0.0.0
var ZERO_NO = 1;	// 0x0000 0001
var ZERO_OK = 2;	// 0x0000 0010
// x.x.x.0
var MASK_NO = 4;	// 0x0000 0100
var MASK_OK = 8;	// 0x0000 1000
// 255.255.255.255
var BCST_NO = 16;	// 0x0001 0000
var BCST_OK = 32;	// 0x0010 0000

var SPACE_NO = 1;
var SPACE_OK = 2;

function choose_disable(dis_object)
{
    if(!dis_object)	return;
    dis_object.disabled = true;

    if(!ns4)
        dis_object.style.backgroundColor = "#e0e0e0";
}

function isIP(strIP)
{
    var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g;
    re.lastIndex = 0;
    if(re.test(strIP))
    {
        if(RegExp.$1 >0 && RegExp.$1 <255 && RegExp.$2>=0 && RegExp.$2<256 && RegExp.$3>=0 && RegExp.$3<256 && RegExp.$4>0 && RegExp.$4<255)
            return true;
    }

    return false;
}
function check_uni_ip(fobj)
{
    var tmp = fobj.value;
    var ip = new RegExp("^([0-9]+).([0-9]+).([0-9]+).([0-9]+)$");
    if (tmp.match(ip) == null)
        return false;

    var ipaddr = tmp.split(".");
    tmp = "";
    if(!(ipaddr[0] > 0 && ipaddr[0] < 224 && ipaddr[1]>=0 && ipaddr[1]<=255 && ipaddr[2]>=0 && ipaddr[2]<=255 && ipaddr[3]>0 && ipaddr[3]<255))
        return false;
    for(var i = 0; i < ipaddr.length; i++)
    {
        var num = parseInt(ipaddr[i], 10);//trim the unwanted leading '0'
        tmp += String(num);
        if(i < ipaddr.length - 1)
            tmp += ".";
    }
    fobj.value = tmp;
    return true;
}

function check_ip(fobj)
{
    var tmp = fobj.value;
    var ip = new RegExp("^([0-9]+).([0-9]+).([0-9]+).([0-9]+)$");
    if (tmp.match(ip) == null)
        return false;

    var ipaddr = tmp.split(".");
    tmp = "";
    if(!(ipaddr[0] >0 && ipaddr[0] <255 && ipaddr[1]>=0 && ipaddr[1]<=255 && ipaddr[2]>=0 && ipaddr[2]<=255 && ipaddr[3]>0 && ipaddr[3]<255))
        return false;
    for(var i = 0; i < ipaddr.length; i++)
    {
        var num = parseInt(ipaddr[i], 10);//trim the unwanted leading '0'
        tmp += String(num);
        if(i < ipaddr.length - 1)
            tmp += ".";
    }
    fobj.value = tmp;
    return true;
}

function check_mask(fobj)
{
    var tmp = fobj.value;
    var ip = new RegExp("^([0-9]+).([0-9]+).([0-9]+).([0-9]+)$");
    if (tmp.match(ip) == null)
        return false;

    var ipaddr = tmp.split(".");
    tmp = "";
    if(!(ipaddr[0] >0 && ipaddr[0] <=255 && ipaddr[1]>=0 && ipaddr[1]<=255 && ipaddr[2]>=0 && ipaddr[2]<=255 && ipaddr[3]>=0 && ipaddr[3]<=255))
        return false;
    for(var i = 0; i < ipaddr.length; i++)
    {
        var num = parseInt(ipaddr[i], 10);//trim the unwanted leading '0'
        tmp += String(num);
        if(i < ipaddr.length - 1)
            tmp += ".";
    }
    fobj.value = tmp;
    return true;
}

function check_intf(fobj)
{
    var tmp = fobj.value;
    var ip = new RegExp("^eth1.[0-9]{1,4}$");
    if (tmp.match(ip) == null)
        return false;

    var ipaddr = tmp.split(".");
    if(ipaddr[1]>=0 && ipaddr[1]<=4095)
        return ipaddr[1];

    return false;
}


function isMulticastMac(mac)
{
    var head = mac.substring(0,2);
    if(parseInt(head,16)%2 ==1)
        return true;
    return false;
}

function classBase(switchType, port_bits, g_port_bits, f_port_bits, ring_bits)
{
    this.switchType = switchType;
    this.port_bits = port_bits;
    this.g_port_bits = g_port_bits;
    this.f_port_bits = f_port_bits;
    this.ring_bits = ring_bits;
}
function initTrunks(strType)
{
    if((strType.indexOf("NMIE6") >= 0) || (strType.indexOf("MIEN6") >= 0))
    {
        nTrunks = 2;
        return ;
    }else if( ((strType.indexOf("NMIE6") >= 0) || (strType.indexOf("MIEN8") >= 0))
        && (strType.indexOf("MIGE7028") < 0) )
    {
        nTrunks = 3;
        return ;
    }else
    {
        nTrunks = 8;
        return ;
    }
}

function getTrunks()
{
    return nTrunks;
}

function comCreateElement(ports, gPorts, objTb, inputType, inputName, portNoType, inputId, inputValue, inputStyle, others, onclick, enableEnglish)
{
    var count = 0, n = 0, i = 0, t = 0, b = 0, a = 0;
    var tmpPorts;
    var objTr1, objTr2, objTmp;
    var strPort;

    tmpPorts = ports;
    while(tmpPorts)
    {
        if( tmpPorts & 1 )//visible
            count++;
        tmpPorts >>= 1;
    }

    if(count <= 14 )
        n = count;
    else
    {
        n = count / 2;
        if(count % 2)  n = n + 1;
    }
    objTr1 = objTb.insertRow(0);
    objTr1.insertCell(0).innerHTML = "&nbsp;&nbsp;";
    if( n != count)
    {
        objTr2 = objTb.insertRow(1);
        objTr2.insertCell(0).innerHTML = "&nbsp;&nbsp;";
    }

    i = 0;  t = 0; b = 0; tmpPorts = ports;
    while(tmpPorts)//a is g port number, b is normal port number, i is inner port number, t is cell number
    {
        if(tmpPorts & 1)//visible
        {
            if(gPorts & 1)//G
                strPort = "G" + (++a);
            else
            {
                if(portNoType == undefined)
                    strPort = "XG" + (++b);
                else
                    strPort = "LAG" + (i+1);
            }
            if(portNoType == undefined)
            {
                if( a+b == 1 )
                {
                    t = 0;
                    objTmp = objTr1;
                }
                if( ( n != count ) && ( a+b == (count - n + 1) ) )
                {
                    t = 0;
                    objTmp = objTr2;
                }
            } else
                objTmp = objTr1;

            if(objTmp == undefined)
                return;

            var objTd = objTmp.insertCell(t*2 + 1);
            objTd.innerHTML = "<div align='center'>" + strPort + "</div>";
            objTd.width = "15";
            var objTd = objTmp.insertCell(t*2 + 2);
            /*var objInput = document.createElement("input");//create
            objInput.type = inputType;
            objInput.name = inputName;
            if(inputId != undefined)
                objInput.id = inputId;
            if(inputValue != undefined)
                objInput.value = inputValue + i;
            else
                objInput.value = i;
            if(inputStyle != undefined)
                objInput.styleName = inputStyle;
            else
                objInput.styleName = "margin-bottom:2px";
            if(onclick != undefined)
                objInput.onclick = Function(onclick);
            objTd.appendChild(objInput);//append*/
            var strInput = "<input type='" + inputType + "' " + "name='" + inputName + "' ";
            if(inputId != undefined)
                strInput += ("id='" + inputId + "' ");
            if(inputValue != undefined)
                strInput += ("value='" + inputValue + i + "' ");
            else
                strInput += ("value='" + i + "' ");
            if(inputStyle != undefined)
                strInput += ("style='" + inputStyle + "' ");
            else
                strInput += " style=margin-bottom:2px ";
            if(onclick != undefined)
                strInput += " onClick='" + onclick + "' ";
            strInput += ">";
            objTd.innerHTML = strInput;
            t++;
        }
        tmpPorts >>= 1;
        gPorts >>= 1;
        i++;
    }
    if(n == count)
        objTmp = objTr1;
    else
        objTmp = objTr2;
    if(others == undefined) return;
	
    if(others == 1)//if 1 then add button checkall ; if 2 then add button checkall&&checknoused
    {    
        objTmp.insertCell(objTmp.cells.length).innerHTML = "&nbsp;&nbsp;";
		if(enableEnglish == undefined)
	        objTmp.insertCell(objTmp.cells.length).innerHTML = "<input name='check_all' type='button' value='全选' class='stdbutton4' onclick='checkAllPorts()' />";
		else
			objTmp.insertCell(objTmp.cells.length).innerHTML = "<input name='check_all' type='button' value='Check All' class='stdbutton4' onclick='checkAllPorts()' />";
    }
	
	if(others == 2)
    {
        objTmp.insertCell(objTmp.cells.length).innerHTML = "&nbsp;&nbsp;";
		if(enableEnglish == undefined)
	        objTmp.insertCell(objTmp.cells.length).innerHTML = "<input name='check_all' type='button' value='全选' class='stdbutton4' onclick='checkAllPorts()' />";
		else
			objTmp.insertCell(objTmp.cells.length).innerHTML = "<input name='check_all' type='button' value='Check All' class='stdbutton4' onclick='checkAllPorts()' />";

		objTmp.insertCell(objTmp.cells.length).innerHTML = "&nbsp;&nbsp;";
		if(enableEnglish == undefined)
            objTmp.insertCell(objTmp.cells.length).innerHTML = "<input name='check_unused' type='button' value='选择未用端口' class='stdbutton_log' onclick='checkUnusedPorts()' />";
		else
			objTmp.insertCell(objTmp.cells.length).innerHTML = "<input name='check_unused' type='button' value='Unused Port' class='stdbutton_log' onclick='checkUnusedPorts()' />";
    }
	
	if(others == 3)
    {
		if(enableEnglish == undefined)
	        objTmp.insertCell(objTmp.cells.length).innerHTML = "<input name='check_all_lag' type='button' value='全选' class='stdbutton4' onclick='checkAllLags()' />";
		else
			objTmp.insertCell(objTmp.cells.length).innerHTML = "<input name='check_all_lag' type='button' value='Check All' class='stdbutton4' onclick='checkAllLags()' />";
	}

}

function comCreateTableElementById(nRows, ports, gPorts, objTb, arrType, arrName, arrClassName, arrWidth, arrInputType)
{
    var tmpPorts = ports;
    var i = 0, j = 0, a = 0, b = 0, n = 0, t = 0, count = 0;
    var strPort;
    var objTdTmp;

    while(tmpPorts)
    {
        if(tmpPorts & 1)
            count++;
        tmpPorts >>= 1;
    }
    if(count % nRows)//
        n = parseInt(count/nRows + 1);
    else
        n = count/nRows;
    for(i=0; i < n; i++)
    {
        //<tr align="center" valign="middle" class="table_right">
        var objTr = objTb.insertRow(i);//define the rows of the inserting
        objTr.align = "center";
        objTr.valign = "middle";
        if(i % 2)
            objTr.className = "table_right";
        else
            objTr.className = "table_black";
    }
    i = 0; n = 1; j = 0;//n is row number of inputs
    while(ports)
    {
        if(ports & 1)//visible
        {
            if(gPorts & 1)//G
                strPort = "G" + (++a);
            else
                strPort = "XG" + (++b);
            if( n > nRows)
            {
                n = 1;
                j = 0;
                i++;
            }
            /* insert two tds begin */
            //<td width="10%" height="25">1</td>
            var objTdPortNo = objTb.rows[i].insertCell(j++);
            objTdPortNo.width = "10%";
            objTdPortNo.height = 25;
            objTdPortNo.align = "center";
            objTdPortNo.innerHTML = strPort;

            for(t=0; t < arrName.length; t++)
            {
                //<td  height="25" width="15%" align="center" valign="middle">
                objTdTmp = objTb.rows[i].insertCell(j++);
                objTdTmp.height = 25;
                if( arrWidth == undefined )
                    objTdTmp.width = "15%";
                else
                    objTdTmp.width = arrWidth[t];
                objTdTmp.align = "center";
                objTdTmp.valign = "middle";
                if(arrType[t] != "input")
                {
                    /*var objTmp = document.createElement(arrType[t]);
                    if( (arrName != undefined) && (arrName.length > 0) )
                        objTmp.name = arrName[t];
                    if( (arrClassName != undefined) && (arrClassName[t].length > 0) )
                        objTmp.className = arrClassName[t];
                    if(arrInputType != undefined && arrInputType[t].length > 0)
                        objTmp.type = arrInputType[t];
                    objTmp.style.color = "#000000";
                    objTmp.align = "center";
                    //if(arrType[t] == "select")
                    //objTmp.options.add(new Option(objTmp.name, objTmp.name));
                    objTdTmp.appendChild(objTmp);*/
                    var strInput = "<" + arrType[t] + " ";
                    strInput += "align='center' style='color:#000000' ";
                    if( (arrName != undefined) && (arrName.length > 0) )
                        strInput += "name='" + arrName[t] + "' ";
                    if( (arrClassName != undefined) && (arrClassName[t].length > 0) )
                        strInput += ("class='" + arrClassName[t] + "' ");
                    if(arrInputType != undefined && arrInputType[t].length > 0)
                        strInput += " type='" + arrInputType[t] + "' ";
                    strInput += "></" + arrType[t] + ">";
                    objTdTmp.innerHTML = strInput;
                }else
                {
                    var strInput = "<input align='center' style='color:#000000' ";
                    if( (arrName != undefined) && (arrName.length > 0) )
                        strInput += "name='" + arrName[t] + "' ";
                    if( (arrClassName != undefined) && (arrClassName[t].length > 0) )
                        strInput += ("class='" + arrClassName[t] + "' ");
                    if(arrInputType != undefined && arrInputType[t].length > 0)
                        strInput += " type='" + arrInputType[t] + "' ";
                    strInput += ">";
                    objTdTmp.innerHTML = strInput;
                }
            }
            /* insert two tds end */
            n++;
        }
        ports >>= 1;
        gPorts >>= 1;
    }
}

function CreateTableElementByCount(nRows, count, begin, objTb, arrType, arrName, arrClassName, arrWidth, arrInputType)
{
    var i = 0, j = 0, n = 0, t = 0;
    var strPort;
    var objTdTmp;
    var a = begin;

    if(count % nRows)//
        n = parseInt(count/nRows + 1);
    else
        n = count/nRows;

    for(i=0; i < n; i++)
    {
        var objTr = objTb.insertRow(i);
        objTr.align = "center";
        objTr.valign = "middle";
        if(i % 2)
            objTr.className = "table_right";
        else
            objTr.className = "table_black";
    }
    
    i = 0; n = 1; j = 0;//n is row number of inputs
    while(count)
    {
        strPort = "" + (a++);

        if( n > nRows)
        {
            n = 1;
            j = 0;
            i++;
        }
        /* insert two tds begin */
        //<td width="10%" height="25">1</td>
        var objTdPortNo = objTb.rows[i].insertCell(j++);
        objTdPortNo.width = "10%";
        objTdPortNo.height = 25;
        objTdPortNo.align = "center";
        objTdPortNo.innerHTML = strPort;

        for(t=0; t < arrName.length; t++)
        {
            //<td  height="25" width="15%" align="center" valign="middle">
            objTdTmp = objTb.rows[i].insertCell(j++);
            objTdTmp.height = 25;
            if( arrWidth == undefined )
                objTdTmp.width = "15%";
            else
                objTdTmp.width = arrWidth[t];
            objTdTmp.align = "center";
            objTdTmp.valign = "middle";
            if(arrType[t] != "input")
            {
                
                var strInput = "<" + arrType[t] + " ";
                strInput += "align='center' style='color:#000000' ";
                if( (arrName != undefined) && (arrName.length > 0) )
                    strInput += "name='" + arrName[t] + "' ";
                if( (arrClassName != undefined) && (arrClassName[t].length > 0) )
                    strInput += ("class='" + arrClassName[t] + "' ");
                if(arrInputType != undefined && arrInputType[t].length > 0)
                    strInput += " type='" + arrInputType[t] + "' ";
                strInput += "></" + arrType[t] + ">";
                objTdTmp.innerHTML = strInput;
            }else
            {
                var strInput = "<input align='center' style='color:#000000' ";
                if( (arrName != undefined) && (arrName.length > 0) )
                    strInput += "name='" + arrName[t] + "' ";
                if( (arrClassName != undefined) && (arrClassName[t].length > 0) )
                    strInput += ("class='" + arrClassName[t] + "' ");
                if(arrInputType != undefined && arrInputType[t].length > 0)
                    strInput += " type='" + arrInputType[t] + "' ";
                strInput += ">";
                objTdTmp.innerHTML = strInput;
            }
        }
        /* insert two tds end */
        n++;
        count--;
    }
}

function comCreateTdElementById(objsFromName, beginIndex, endIndex, nType, elementValue, onChangeName, onClickName, arrValue, arrText)
{
    var i, j;
    var objTmp;

    if( beginIndex < 0 || endIndex > (objsFromName.length - 1) || beginIndex > endIndex)
        return false;
    //if( typeOf(objsFromName) == "undefined" )
    //return false;
    for(i = beginIndex; i <= endIndex; i++)
    {
        objTmp = objsFromName[i];
        if(nType == 1)//input checkbox
        {
            //objTmp.type = "checkbox";
            //objTmp.name = elementName;
            if(onClickName != undefined && onClickName.length > 0)
                objTmp.onclick = Function(onClickName);
            objTmp.styleName = "margin-bottom:2px ";
            if(elementValue != undefined && elementValue.length > 0)
                objTmp.value = elementValue;
        }else if(nType == 2)//select
        {
            //objTmp = document.createElement("select");
            //objTmp.name = elementName;
            objTmp.className = "select1";
            if(onChangeName != undefined && onChangeName.length > 0)
                objTmp.onchange = Function(onChangeName);
            for(j=0; j<arrText.length; j++)
                objTmp.options.add( new Option( arrText[j], arrValue[j] ) );
        }else if(nType == 3)//normal text value
        {
            objTmp = document.createNodeText("<div align='center'>" + value + "</div>");
        }else if(nType == 4)//text
        {
            objTmp.type = "text";
        }else if(nType == 5)//div
        {
            objTmp.innerHTML = arrText[i];
        }
		else if(nType == 6)
		{
			objTmp.value = arrText[i];
		}
    //objsFromName[i].appendChild(objTmp);
    }
    return true;
}

function comCreateTdElementById_Select(objsFromName, beginIndex, endIndex, nType, elementValue, onChangeName, onClickName, arrValue, arrText, arrSelect)
{
    var i, j;
    var objTmp;

    if( beginIndex < 0 || endIndex > (objsFromName.length - 1) || beginIndex > endIndex)
        return false;
    //if( typeOf(objsFromName) == "undefined" )
    //return false;
    for(i = beginIndex; i <= endIndex; i++)
    {
        objTmp = objsFromName[i];
        if(nType == 1)//input checkbox
        {
            //objTmp.type = "checkbox";
            //objTmp.name = elementName;
            if(onClickName != undefined && onClickName.length > 0)
                objTmp.onclick = Function(onClickName);
            objTmp.styleName = "margin-bottom:2px ";
            if(elementValue != undefined && elementValue.length > 0)
                objTmp.value = elementValue;
        }else if(nType == 2)//select
        {
            //objTmp = document.createElement("select");
            //objTmp.name = elementName;
            objTmp.className = "select1";
            if(onChangeName != undefined && onChangeName.length > 0)
                objTmp.onchange = Function(onChangeName);
            for(j=0; j<arrText.length; j++)
                objTmp.options.add( new Option( arrText[j], arrValue[j] ) );
            if(arrSelect != undefined && arrSelect.length > 0)
            {
            	objTmp.options[parseInt(arrSelect[i])].selected = true;
            }
        }else if(nType == 3)//normal text value
        {
            objTmp = document.createNodeText("<div align='center'>" + value + "</div>");
        }else if(nType == 4)//text
        {
            objTmp.type = "text";
        }else if(nType == 5)//div
        {
            objTmp.innerHTML = arrText[i];
        }
        else if(nType == 6)
        {
        	objTmp.value = arrText[i];
        }
    //objsFromName[i].appendChild(objTmp);
    }
    return true;
}

function getSwitchChipType(from_boj)
{
    var switch_chip_type = 0;

    if(from_boj.rd_code.value.substring(6,7) == "2")
        switch_chip_type = 2;
    else if(from_boj.rd_code.value.substring(6,7) == "3")
        switch_chip_type = 3;

    return switch_chip_type;
}
