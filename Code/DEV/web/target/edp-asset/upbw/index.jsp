<%@ page contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html><html lang="zh-CN"><head><meta charset="UTF-8" />
<title>请升级您的浏览器</title><meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" >
<meta name="renderer" content="webkit"><base target="_blank" /><style type="text/css">
a{text-decoration:none;color:#0072c6;}a:hover{text-decoration:none;color:#004d8c;}
body{width:960px;margin:0 auto;padding:10px;font-size:14px;line-height:24px;color:#454545;font-family:'Microsoft YaHei UI','Microsoft YaHei',DengXian,SimSun,'Segoe UI',Tahoma,Helvetica,sans-serif;}
h1{font-size:30px;line-height:80px;font-weight:100;margin-bottom:10px;}
h2{font-size:20px;line-height:25px;font-weight:100;margin:10px 0;}
p{margin-bottom:10px;font-size:16px;}
hr{margin:20px 0;border:0;border-top:1px solid #dadada}
img{width:34px;height:34px;border:0;float:left;margin-right:10px;}
span{display:block;font-size:12px;line-height:12px;}
.browser{padding:10px 0;}
.browser li{width:180px;height:34px;line-height:22px;float:left;list-style:none;padding-left:25px}
.clean{clear:both;}
</style></head><body>
<h1>浏览器版本过低，是时候升级您的浏览器了</h1>
<p>您正在使用 Internet Explorer 的过期版本（IE6、IE7、IE8 内核的浏览器）。这意味着在升级浏览器前，您将无法继续访问。</p>
<hr>
<h2>为什么会出现这个页面？</h2>
<p>如果您不知道升级浏览器是什么意思，请请教一些熟练电脑操作的朋友。如果您使用的不是IE6/7/8，而是360、QQ、搜狗等，双核浏览器，出现这个页面可能是您切换到了兼容模式，请<strong style="color:#f00;">切换到极速模式</strong>下，如果还不行请升级至最新版浏览器。</p>
<hr>
<h2>请注意：微软（Microsoft）对  Windows XP 及 IE6、IE7、IE8 的支持已经结束</h2>
<p>自 2014 年 4 月 8 日起，微软（Microsoft）不再为 Windows XP 和 Internet Explorer 8 及以下版本提供相应支持和更新。如果您继续使用这些，您将可能受到病毒、间谍软件和其他恶意软件的攻击，无法确保个人信息的安全。请参阅 <a href="http://windows.microsoft.com/zh-cn/windows/end-support-help">Microsoft 关于 Windows XP 支持已经结束的说明</a> 。</p>
<hr>
<h2>您可以选择更先进的浏览器</h2>
<p>推荐使用以下浏览器的最新版本。如果您的电脑已有以下浏览器的最新版本则直接使用该浏览器访问 <b id="referrer"></b>即可。</p>
<div class="browser"><ul>
<li><img src="img/chrome360.jpg"><a href="http://chrome.360.cn/"> 360极速浏览器<span>360 Chrome</span></a></li>
<li><img src="img/chrome.jpg"><a href="http://www.google.cn/intl/zh-CN/chrome/browser/desktop/index.html"> 谷歌浏览器<span>Google Chrome</span></a></li>
<li><img src="img/firefox.jpg"><a href="http://www.firefox.com.cn/download/"> 火狐浏览器<span>Mozilla Firefox</span></a></li>
<li><img src="img/ie.jpg"><a href="http://windows.microsoft.com/zh-cn/internet-explorer/download-ie"> IE 11 浏览器<span>Internet Explorer</span></a></li>
</ul><div class="clean"></div></div>
<hr>
<br/>
<script type="text/javascript">
var referrer = document.referrer, url = requestParam("url");
if (!referrer == "") {
	document.getElementById("referrer").innerHTML = '<a href="'+referrer+'">' + referrer + '</a>&nbsp;';
} else if (!url == "") {
	document.getElementById("referrer").innerHTML = '<a href="'+url+'">' + url + '</a>&nbsp;';
}
function requestParam(name) {
	new RegExp("(^|&)" + name + "=([^&]*)").exec(window.location.search.substr(1));
	return RegExp.$2
}
</script>
</body></html>