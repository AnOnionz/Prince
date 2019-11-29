<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prince - Trợ giúp</title>
	<link rel="icon" type="image/png" sizes="192x192" href="assets/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="assets/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="assets/favicon/favicon-16x16.png">
	<link rel="manifest" href="assets/favicon/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="assets/favicon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,300,600);
html,
body,
div,
span,
applet,
object,
iframe,
h1,
h2,
h3,
h4,
h5,
h6,
p,
blockquote,
pre,
a,
abbr,
acronym,
address,
big,
cite,
code,
del,
dfn,
em,
img,
ins,
kbd,
q,
s,
samp,
small,
strike,
strong,
sub,
sup,
tt,
var,
b,
u,
i,
center,
dl,
dt,
dd,
ol,
ul,
li,
fieldset,
form,
label,
legend,
table,
caption,
tbody,
tfoot,
thead,
tr,
th,
td,
article,
aside,
canvas,
details,
embed,
figure,
figcaption,
footer,
header,
hgroup,
menu,
nav,
output,
ruby,
section,
summary,
time,
mark,
audio,
video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}


/* HTML5 display-role reset for older browsers */

article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
menu,
nav,
section {
  display: block;
}

body {
  line-height: 1;
}

ol,
ul {
  list-style: none;
}

blockquote,
q {
  quotes: none;
}

blockquote:before,
blockquote:after,
q:before,
q:after {
  content: '';
  content: none;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
}

body {
  font-family: 'Open Sans', sans-serif;
  background: #337af0;
  overflow: hidden;
}

h2 {
  text-align: center;
  display: block;
  margin-top: 200px;
  width: 100%;
  color: #fff;
  font-size: 32px;
  height: 40px;
  font-weight: 300;
}
.home {
  text-align: center;
  display: block;
  margin-top: 200px;
  color: #fff;
  font-size: 32px;
  height: 40px;
  font-weight: 700;
  text-decoration: none;
  border: 1px solid teal;
  padding: .5rem;
  border-radius: 1rem;
  left:42%;
}

.secondTitle {
  opacity: 0;
  margin: 0;
  position: absolute;
  top: 247px;
  transition: all .3s ease;
}

h2.thirdTitle {
  opacity: 0;
  margin: 0;
  position: absolute;
  top: 350px;
  transition: all .3s 2.4s ease;
}
.home {
  opacity: 0;
  margin: 0;
  position: absolute;
  top: 380px;
  transition: all .3s 2.4s ease;
}

h2.addTitleThird {
  opacity: 1;
  top: 298px;
  transition: all .6s 9.5s ease;
}
.addHome {
  opacity: 1;
  top: 348px;
  transition: all .6s 9.5s ease;
}

.subtitle {
  text-align: center;
  display: block;
  margin-top: 17px;
  width: 100%;
  color: #fff;
  font-size: 20px;
  opacity: .4;
}

.formScreenRaper #removeTitle {
  opacity: 0;
  transition: all .3s 1s ease;
}

.addTitle {
  opacity: 1;
  top: 197px;
  transition: all .6s 2.7s ease;
}

h3.addSubtitle {
  opacity: .4;
  top: 250px;
  transition: all .6s 2.7s ease;
}

.secondSubtitle {
  opacity: 0;
  margin: 0;
  position: absolute;
  top: 254px;
  transition: all .3s ease;
  color: #fff;
  font-size: 20px;
  text-align: center;
  width: 100%;
}

.formScreenRaper {
  position: absolute;
  z-index: 9999;
  width: 1000px;
  height: 100%;
  left: 50%;
  margin-left: -500px;
  transform-style: preserve-3D;
  perspective: 1000px;
}

#supaForm {
  background: #fff;
  width: 560px;
  height: 109px;
  position: absolute;
  transform: translate3D(39%, 80%, 0) scale(.7, .7);
  z-index: 9999;
  box-shadow: rgba(0, 0, 0, 0.27) 0px 18px 57px;
  transition: transform .3s cubic-bezier(0.45, -0.01, 0.18, 0.98), background .3s ease;
  overflow: hidden;
}

#supaForm:hover {
  background: #EAEAEA;
}

#activateForm {
  width: 100%;
  padding: 8% 0px;
  text-align: center;
  display: block;
  color: #333;
  text-decoration: none;
  font-size: 22px;
  font-weight: 600;
  position: relative;
  z-index: 9999;
}

fieldset {
  opacity: 0;
  width: 0;
  position: absolute;
  top: 0;
  left: 0;
}

#supaForm fieldset label {
  transition: all .2s 2s ease;
  font-weight: 400;
  z-index: 10;
  font-size: 35px;
  color: #464646;
  top: 36px;
  left: 20px;
}

fieldset .inputText {
  width: 80%;
  height: 115px;
  font-size: 35px;
  font-weight: 400;
  padding-left: 19px;
  border: none;
  outline: 0;
  opacity: 0;
  transition: all .3s 1.8s ease;
}

fieldset svg {
  width: 34px;
  height: 34px;
  right: 0;
  top: 50%;
  position: absolute;
  margin-top: -38px;
  padding: 20px;
  fill: #909090;
  opacity: 0;
  cursor: pointer;
  transition: all .4s ease;
}

fieldset svg:hover {
  fill: #676767;
}

#supaForm fieldset textarea {
  height: 338px;
  margin-top: 43px;
  font-size: 25px;
  resize: none;
}

.displayBlock {
  opacity: 1;
}

hr {
  background: #206ae4;
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 0%;
  border: none;
  z-index: 1;
  margin: 0;
  padding: 0;
  transition: width .3s ease;
}

.quarter {
  animation: quarter .3s forwards ease;
}

.threeQuarters {
  animation: threeQuarters .3s forwards ease;
}

.full {
  animation: full .3s forwards ease;
}

@keyframes quarter {
  from {
    width: 0;
  }
  to {
    width: 33.3%;
  }
}

@keyframes threeQuarters {
  from {
    width: 33.3%;
  }
  to {
    width: 66.6%;
  }
}

@keyframes full {
  from {
    width: 66.6%;
  }
  to {
    width: 100%;
  }
}


/* form activation and transition styles */

#supaForm.formActive {
  transform: translate3D(39%, 75%, 0) scale(1, 1);
}

#supaForm.formActive:hover {
  background: #fff;
}

.formActive #activateForm {
  display: none;
}


/* .formActive:active				{ transform: translate3D(40%,100%,0) rotateX(0deg) rotateY(7deg) skew(0deg,1deg) scale(.9,.9);} */

.formActive .stepOff {
  opacity: 0;
  transition: opacity .5s ease, left .7s ease;
  left: -100px;
}

.stepOn {
  opacity: 1;
  width: 100%;
  transition: opacity .6s .9s ease;
}

#supaForm .stepOn label {
  transition: all .2s 2.6s ease;
  position: absolute;
  animation: labelAnimation .2s 2.6s ease forwards;
}

@keyframes labelAnimation {
  0% {
    font-weight: 400;
    z-index: 10;
    font-size: 35px;
    color: #464646;
    top: 36px;
    left: 20px;
  }
  100% {
    top: 20px;
    font-size: 13px;
    font-weight: 300;
    color: #A0A0A0;
  }
}

.stepOn .inputText {
  opacity: 1;
  transition: all .3s 2.5s ease;
}

#supaForm.messageStep {
  height: 380px;
  transform: translate3D(39%, 20%, 0);
  transition: all .5s 2.6s cubic-bezier(0.45, -0.01, 0.18, 0.98), transform .6s 2.4s ease;
}

.messageAway {
  animation: shrinkForm 1.5s 1s ease forwards;
}


/* form activation transition styles */

.skyContainer {
  overflow: hidden;
  position: absolute;
  z-index: 9998;
  width: 100%;
  height: 100%;
  max-height: 996px;
  min-height: 996px;
  top: 0;
  left: 0;
}

.skyBG {
  background: url(http://128.199.49.84/codepen/supaform/spaceBG.svg) center bottom no-repeat;
  width: 100%;
  height: 1024px;
  position: absolute;
  top: -1000px;
  left: 0;
  z-index: 9997;
}

.sateliteRap {
  position: absolute;
  bottom: 420px;
  left: 50%;
  margin-left: 25px;
  z-index: 9999;
}

#activeSky .sateliteRap {
  margin-left: -1000px;
  transition: margin 16s 4s linear;
}

#activeSky .sateliteRap svg {
  margin-left: -240px;
  transition: margin 4s 6.3s ease-out;
  animation: sateliteRotate 3.3s 6.3s ease-out forwards;
  transform: rotate(0deg);
}

.sateliteRap svg #hitSpark {
  opacity: 0;
}

#activeSky .sateliteRap svg #hitSpark {
  animation: hitSpark .5s 6.3s ease-out forwards;
}

@keyframes sateliteRotate {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(-540deg);
  }
}

@keyframes hitSpark {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}

.clouds {
  background: url(http://128.199.49.84/codepen/supaform/clouds.svg) center top no-repeat;
  width: 100%;
  height: 352px;
  z-index: 9999;
  position: absolute;
  left: 0;
  top: -350px;
}

#activeSky {
  top: -8px;
  transition: all 5s 3s ease;
}

#activeClouds {
  top: 651px;
  transition: all 5s 3s ease;
}

.rocketContainer {
  width: 90px;
  height: 150px;
  position: absolute;
  z-index: 9998;
  transition: all 2s ease;
  top: 1300px;
  transform: rotate(20deg);
  left: 50%;
  margin-left: -45px;
  animation: rocketShake 1s ease infinite;
  opacity: 0;
}

.rocketContainer svg {
  left: -94px;
  position: relative;
}

#flame {
  animation: shake .2s linear infinite;
}


/* rocket mechanism */

.liftOff {
  top: 255px;
  transition: top 2.4s linear, opacity .3s ease;
  opacity: 1;
  animation: flyRocketFly 8s 2.4s ease forwards;
}


/* rocket mechanism */

@keyframes shrinkForm {
  0% {
    transform: translate3D(39%, 20%, 0) scale3D(1, 1, 1);
    opacity: 1;
  }
  50% {
    transform: translate3D(70%, 54%, 0px) scale3D(1.05, 1.05, 1) rotate(-33deg);
    opacity: 1;
  }
  99% {
    transform: translate3D(40%, -47%, 0px) scale3D(0.01, 0.01, 0.01) rotate(-197deg);
    opacity: 1;
  }
  100% {
    transform: translate3D(40%, -47%, 0px) scale3D(0.01, 0.01, 0.01) rotate(-197deg);
    opacity: 0;
  }
}

@keyframes shake {
  0% {
    transform: translate(55px, 135px) rotate(7deg);
  }
  20% {
    transform: translate(55px, 135px) rotate(0deg);
  }
  40% {
    transform: translate(55px, 135px) rotate(-7deg);
  }
  60% {
    transform: translate(55px, 135px) rotate(0deg);
  }
  100% {
    transform: translate(55px, 135px) rotate(0deg);
  }
}

@keyframes rocketShake {
  0% {
    transform: rotate(14deg);
  }
  50% {
    transform: rotate(24deg);
  }
  100% {
    transform: rotate(14deg);
  }
}

@keyframes flyRocketFly {
  0% {
    top: 255px;
    left: 50%;
  }
  50% {
    top: 498px;
    left: 50%;
    transform: rotate(20deg);
    -webkit-filter: blur(0);
    -moz-filter: blur(0);
    -o-filter: blur(0);
    -ms-filter: blur(0);
    filter: blur(0);
  }
  60% {
    top: 498px;
    left: 50%;
    transform: rotate(34deg);
    -webkit-filter: blur(0);
    -moz-filter: blur(0);
    -o-filter: blur(0);
    -ms-filter: blur(0);
    filter: blur(0);
  }
  69% {
    top: 498px;
    left: 50%;
    transform: rotate(14deg);
    -webkit-filter: blur(0);
    -moz-filter: blur(0);
    -o-filter: blur(0);
    -ms-filter: blur(0);
    filter: blur(0);
  }
  80% {
    top: 498px;
    left: 50%;
    transform: rotate(18deg);
    -webkit-filter: blur(0);
    -moz-filter: blur(0);
    -o-filter: blur(0);
    -ms-filter: blur(0);
    filter: blur(0);
  }
  100% {
    top: -400px;
    left: 50%;
    transform: rotate(24deg);
    -webkit-filter: blur(5px);
    -moz-filter: blur(5px);
    -o-filter: blur(5px);
    -ms-filter: blur(5px);
    filter: blur(5px);
  }
}
</style>
</head>
<body>
<!-- progress bar background -->
<hr />
<!-- //progress bar background -->
<div class="formScreenRaper">
  <h2 class="firstTitle">Bạn muốn liên hệ về Prince</h2>
  <h2 class="secondTitle">hãy hoàn tất bước này!	</h2>
  <h2 class="thirdTitle">Tuyệt vời, chúng tôi sẽ phản hồi bạn sau.</h2>
  <h3 class="subtitle">- nhấn vào nút liên hệ -</h3>
  <h3 class="secondSubtitle">và lời nhắn của bạn sẽ theo tên lửa bay đi</h3>
  <a class = "home" href="${pageContext.request.contextPath}/Home">Trang chủ</a>
  <form id="supaForm">
    <a id="activateForm" href="#">Liên hệ với chúng tôi</a>
    <fieldset id="step1">
      <label>Xin chào, hãy cho chúng tôi biết tên của bạn</label>
      <input type="text" class="inputText" autocomplete="off" />
      <svg class="nextArrow" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="306px" height="306px" viewBox="0 0 306 306" style="enable-background:new 0 0 306 306;" xml:space="preserve">
                    <g>
                        <g id="chevron-right">
                            <polygon points="94.35,0 58.65,35.7 175.95,153 58.65,270.3 94.35,306 247.35,153" />
                        </g>
                    </g>
                </svg>
    </fieldset>
    <fieldset id="step2">
      <label>Wow, chúng tôi cần cả email của bạn nữa</label>
      <input type="text" class="inputText" autocomplete="off" pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$" />
      <svg class="nextArrow" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="306px" height="306px" viewBox="0 0 306 306" style="enable-background:new 0 0 306 306;" xml:space="preserve">
                    <g>
                        <g id="chevron-right">
                            <polygon points="94.35,0 58.65,35.7 175.95,153 58.65,270.3 94.35,306 247.35,153" />
                        </g>
                    </g>
                </svg>
    </fieldset>
    <fieldset id="step3">
      <label>Rất tốt, cho chúng tôi biết bạn muốn nói điều gì</label>
      <textarea class="inputText"></textarea>
      <svg class="nextArrow" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="306px" height="306px" viewBox="0 0 306 306" style="enable-background:new 0 0 306 306;" xml:space="preserve">
                    <g>
                        <g id="chevron-right">
                            <polygon points="94.35,0 58.65,35.7 175.95,153 58.65,270.3 94.35,306 247.35,153" />
                        </g>
                    </g>
                </svg>
    </fieldset>
  </form>
</div>
<div class="skyContainer">
  <div class="skyBG">
    <div class="sateliteRap">
      <svg width="140px" height="96px" viewBox="0 0 140 96" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
					<defs>
						<polygon id="path-1" points="0.000561038961 48 47.5356779 48 47.5356779 0.464602597 0.000561038961 0.464602597 0.000561038961 48"></polygon>
					</defs>
					<g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
						<g id="Desktop-HD" transform="translate(-769.000000, -475.000000)">
							<g id="satelite" transform="translate(764.000000, 457.000000)">
								<g id="Group-5" transform="translate(66.500000, 66.000000) rotate(-109.000000) translate(-66.500000, -66.000000) translate(15.000000, 14.000000)">
									<path d="M57.6631565,29.9742705 C55.8666314,31.7707691 55.8666314,34.694643 57.6631565,36.491771 L66.5085561,45.3364107 C68.3050812,47.1329093 71.2296277,47.1329093 73.0255233,45.3364107 L100.337237,18.0257295 C102.133133,16.2292309 102.133133,13.305357 100.336607,11.5088584 L91.4912078,2.66358927 C89.6953122,0.867090683 86.7707657,0.867090683 84.9748701,2.66358927 L57.6631565,29.9742705 Z M101.267603,18.956711 L73.9571481,46.2673923 C71.6463409,48.5775359 67.8877385,48.5775359 65.5775608,46.2673923 L56.7321612,37.4227526 C54.4226129,35.112609 54.4226129,31.3534326 56.7321612,29.043289 L84.0432453,1.7326077 C86.353423,-0.577535899 90.1126549,-0.577535899 92.4228326,1.7326077 L101.267603,10.5772474 C103.577151,12.887391 103.57778,16.6465674 101.267603,18.956711 L101.267603,18.956711 Z" id="Fill-1" fill="#7189C5"></path>
									<polygon id="Fill-3" fill="#7189C5" points="96 4.93908074 60.9390807 40 60 39.0609193 95.0609193 4"></polygon>
									<polygon id="Fill-5" fill="#7189C5" points="100 9.93908074 64.9390973 45 64 44.0609193 99.0609027 9"></polygon>
									<polygon id="Fill-7" fill="#7189C5" points="76 42.0811315 75.0811315 43 59 26.9188685 59.9182473 26"></polygon>
									<polygon id="Fill-9" fill="#7189C5" points="82 37.0811315 81.0811315 38 65 21.9188685 65.9182473 21"></polygon>
									<polygon id="Fill-11" fill="#7189C5" points="88 31.0811315 87.0811315 32 71 15.9188685 71.9188685 15"></polygon>
									<polygon id="Fill-13" fill="#7189C5" points="94 25.0811315 93.0810979 26 77 9.91886855 77.9182808 9"></polygon>
									<polygon id="Fill-15" fill="#7189C5" points="100 19.0811315 99.0811315 20 83 3.91886855 83.9188685 3"></polygon>
									<g id="Group-19" transform="translate(0.000000, 55.000000)">
										<mask id="mask-2" fill="white">
											<use xlink:href="#path-1"></use>
										</mask>
										<g id="Clip-18"></g>
										<path d="M2.63837922,30.1488623 C0.859262338,31.9279792 0.859262338,34.8235636 2.63837922,36.6033039 L11.3974442,45.3623688 C13.1771844,47.1414857 16.0721455,47.1414857 17.8512623,45.3623688 L44.8977039,18.3165506 C46.6774442,16.5368104 46.6774442,13.641226 44.8977039,11.8621091 L36.138639,3.10242078 C34.3595221,1.3233039 31.4639377,1.3233039 29.6848208,3.10304416 L2.63837922,30.1488623 Z M45.8203013,19.2385247 L18.7738597,46.2843429 C16.4860675,48.5721351 12.7632623,48.5721351 10.4754701,46.2843429 L1.71640519,37.5252779 C-0.571387013,35.2374857 -0.571387013,31.5146805 1.71640519,29.2268883 L28.7622234,2.18044675 C31.0500156,-0.107345455 34.7734442,-0.107345455 37.0612364,2.18044675 L45.8203013,10.9401351 C48.1074701,13.2273039 48.1074701,16.9507325 45.8203013,19.2385247 L45.8203013,19.2385247 Z" id="Fill-17" fill="#7189C5" mask="url(#mask-2)"></path>
									</g>
									<polygon id="Fill-20" fill="#7189C5" points="40 60.9390807 4.93906418 96 4 95.0609193 39.0609358 60"></polygon>
									<polygon id="Fill-22" fill="#7189C5" points="45 64.9390807 9.9384458 100 9 99.0615542 44.0609193 64"></polygon>
									<polygon id="Fill-24" fill="#7189C5" points="20 99.0811315 19.0810979 100 3 83.9188685 3.91890213 83"></polygon>
									<polygon id="Fill-26" fill="#7189C5" points="26 93.0811315 25.0811315 94 9 77.9194898 9.91824727 77"></polygon>
									<polygon id="Fill-28" fill="#7189C5" points="32 87.0811315 31.081165 88 15 71.9188685 15.918835 71"></polygon>
									<polygon id="Fill-30" fill="#7189C5" points="38 81.0811315 37.0811315 82 21 65.9188685 21.9182473 65"></polygon>
									<polygon id="Fill-32" fill="#7189C5" points="45 74.0811315 44.0810979 75 28 58.9188685 28.9182808 58"></polygon>
									<path d="M66.514765,66.5151668 C71.2011183,61.8286922 78.7991148,61.8280705 83.4854681,66.5145452 C88.1718214,71.2010199 88.1711998,78.7992133 83.4854681,83.4850663 C78.7984932,88.171541 71.2011183,88.171541 66.514765,83.4856879 C61.8284117,78.7992133 61.8284117,71.2016415 66.514765,66.5151668" id="Fill-34" fill="#56534F"></path>
									<path d="M83.4467058,66.6647471 C79.4817457,62.5722706 73.4641209,61.9128225 68.8224927,64.6591152 L66,71.5121779 C66,71.5121779 77.0891733,67.4677794 83.0218212,79 L87,75.4019472 C86.9678976,72.2359466 85.7870332,69.0803412 83.4467058,66.6647471" id="Fill-36" fill="#3A3835"></path>
									<path d="M27,25.8993646 L20.7854844,19.6844393 C21.4869572,18.491731 21.3367282,16.9361824 20.3123841,15.9118707 C19.0972249,14.6961441 17.1266801,14.6961441 15.9121267,15.9112649 C14.6963617,17.1269916 14.6957559,19.0968684 15.9115209,20.3119893 C16.935865,21.3363011 18.4914626,21.4865254 19.6848143,20.784469 L25.8999356,27 L27,25.8993646 Z" id="Fill-38" fill="#7189C5"></path>
									<path d="M32.5796123,53.246148 L49.6642035,70.3311851 L51.5930181,72.2606052 C55.2453743,75.912923 61.1669979,75.9135488 64.81998,72.2599794 L72.2604981,64.8201654 C75.9134802,61.1672218 75.9128544,55.2456606 72.2604981,51.592717 L70.3316835,49.6639227 L53.2458407,32.5795114 L43.66748,23 L23,43.6666366 L32.5796123,53.246148 Z" id="Fill-40" fill="#67645D"></path>
									<path d="" id="Fill-42" fill="#494742"></path>
									<path d="M72.3090571,52.0281015 L70.4144316,50.1430222 L55.193495,35 L49,46.7997893 L66.2329772,63.9459377 C66.2329772,63.9459377 69.2347475,66.3264467 66.2329772,71 L72.3090571,64.9557579 C75.8972883,61.385606 75.8966736,55.5982534 72.3090571,52.0281015" id="Fill-44" fill="#494742"></path>
									<path d="M43.1645102,22.8168024 L41.1971657,24.784123 C44.5748614,14.6117259 39.181146,6 39.181146,6 L22.5902649,22.5900645 L6,39.1807452 C6,39.1807452 14.6112138,44.5743953 24.78435,41.1967405 L22.8176217,43.163445 L36.6531115,57 L57,36.6533573 L43.1645102,22.8168024 Z" id="Fill-46" fill="#AFAEAC"></path>
									<path d="M49.6724976,46 L59,36.8844572 L44.736239,22.9442073 L42.7073612,24.9263599 C46.190247,14.6772717 40.6295717,6 40.6295717,6 L33,13.4568169 C34.5442085,15.7096299 39.1018788,23.4073097 35.7841489,31.6928688 L49.6724976,46 Z" id="Fill-48" fill="#9B9995"></path>
									<polygon id="Fill-50" fill="#7189C5" points="81.2044313 80 89 87.7954596 87.7942393 89 80 81.2052081"></polygon>
									<polygon id="Fill-52" fill="#AFAEAC" points="87.0428198 73 91 76.9583887 76.9584334 91 73 87.0422407"></polygon>
									<polygon id="Fill-54" fill="#8E8C88" points="82 77.6347265 86.1006318 82 91 77.1938639 86.7247292 73"></polygon>
								</g>
								<path d="M128.000938,111.2812 C128.000938,111.2812 132.718529,96.2536235 144.99899,94.6743566 C144.99899,94.6743566 133.606325,92.7024383 128.000938,77.6734183 C122.395551,92.7024383 111,94.6743566 111,94.6743566 C123.283348,96.2536235 128.000938,111.2812 128.000938,111.2812" id="hitSpark" fill="#FFFFFF"></path>
							</g>
						</g>
					</g>
				</svg>
    </div>
  </div>
  <div class="clouds"></div>
  <div class="rocketContainer">
    <svg width="600" height="400" viewBox="0 0 600 600" xmlns="http://www.w3.org/2000/svg">
                <g id="rocket" fill="none" fill-rule="evenodd">
                    <g id="flame" fill="none" fill-rule="evenodd">
                        <path d="M37.957.898s24.385 33.987 18.18 35.765c-6.203 1.78-15.15-12.215-15.174-3.03-.025 9.183 15.664 23.193 6.74 21.14-12.786-2.946-17.86-21.3-18.36-9.46-.5 11.838 3.24 24.093-7.87 13.83C10.36 48.88 12.706 29.31 10.8 36.675c-1.905 7.365-1.388 22.79-5.82 16.2C.55 46.282.147 14.62.147 14.62L37.957.9z" fill="#FF5B0D"/>
                        <path d="M30.482 3.97s17.482 18.04 13.224 18.796c-4.257.754-11.3-4.462-10.826 1.15.476 5.614 6.177 13.274.1 8.923-6.076-4.354-10.003-13.51-9.718-6.3.285 7.21 5.17 18.003-1.024 10.335C16.045 29.21 11.93 17.89 10.988 22.29c-.94 4.4.25 13.86-3.213 9.592-3.464-4.268-1.732-19-1.732-19l24.44-8.912z" fill="#FFD03D"/>
                    </g>
                    <path d="M96.008 81.165c-1.11-6.988-2.935-13.838-5.446-20.39C78.54 29.41 51.78 6.25 20.735.347c-.876-.167-1.78.18-2.322.89C-.722 26.373-5.145 61.487 6.876 92.85c2.433 6.348 5.528 12.494 9.213 18.276-1.78 3.96-3.277 8.263-4.458 12.817-.187.698-.035 1.45.42 2.024l31.82 40.84c.536.69 1.405 1.02 2.263.878.842-.153 1.55-.755 1.838-1.578 2.097-6.12 6.06-11.85 11.304-16.364l.934 2.44c.465 1.21 1.82 1.82 3.038 1.355l25.793-9.886c1.227-.47 1.83-1.833 1.366-3.04l-.715-1.865c6.92-.135 13.694 1.468 19.348 4.63.61.342 1.358.386 2.003.14.14-.055.284-.135.413-.22.734-.466 1.146-1.287 1.1-2.152l-3.634-51.657c-.038-.708-.427-1.37-1.026-1.78-3.918-2.586-7.91-4.79-11.89-6.543z" fill="#FFF"/>
                    <path d="M55.53 62.857c-3.134 5.73-9.136 9.295-15.68 9.295-6.22 0-11.89-3.165-15.172-8.447-1.73-2.807-2.652-6.017-2.652-9.295 0-9.776 7.996-17.73 17.823-17.73 9.83 0 17.82 7.954 17.82 17.73 0 2.955-.746 5.88-2.14 8.447z" fill="#75C9EC"/>
                    <path d="M27.543 59.59c1.013 2.168 2.63 4.02 4.66 5.35 3.84 2.504 8.6 2.838 12.73.91 4.363-2.038 7.255-6.273 7.56-11.07.14-2.15-.276-4.32-1.197-6.294-3.046-6.497-10.846-9.317-17.393-6.26-6.544 3.055-9.4 10.85-6.36 17.363z" fill="#0096D5"/>
                </g>
            </svg>
  </div>
</div>
</body>
<script type="text/javascript">
$('#activateForm').click(function() {
	  $('#supaForm').addClass('formActive');
	  $('#step1').addClass('stepOn');
	  $('#step1 input').focus();
	  return false
	});
	$('#step1 .nextArrow').click(function() {
	  $('#step1').addClass('stepOff');
	  $('#step2').addClass('stepOn');
	  $('#step2 input').focus();
	  $('hr').addClass('quarter');
	});
	$('#step2 .nextArrow').click(function() {
	  $('#step2').addClass('stepOff');
	  $('#step3').addClass('stepOn');
	  $('#step3 textarea').focus();
	  $('#supaForm').addClass('messageStep');
	  $('.firstTitle').attr('id', 'removeTitle');
	  $('.secondTitle').addClass('addTitle');
	  $('.subtitle').attr('id', 'removeTitle');
	  $('.secondSubtitle').addClass('addSubtitle');
	  $('hr').addClass('threeQuarters');
	});
	$('#step3 .nextArrow').click(function() {
	  $('#supaForm').addClass('messageAway');
	  $('.secondTitle').attr('id', 'removeTitle');
	  $('.thirdTitle').addClass('addTitleThird');
	  $('.home').addClass('addHome');
	  $('.secondSubtitle').attr('id', 'removeTitle');
	  $('hr').addClass('full');
	  $('.rocketContainer').addClass('liftOff');
	  $('.skyBG').attr('id', 'activeSky');
	  $('.clouds').attr('id', 'activeClouds');
	});

	// enter key for next step
	jQuery(document).on('keydown', '#step1 input', function(ev) {
	  if (ev.which === 13) {
	    // Will change backgroundColor to blue as example
	    $('#step1').addClass('stepOff');
	    $('#step2').addClass('stepOn');
	    $('#step2 input').focus();
	    $('hr').addClass('quarter');

	    // Avoid form submit
	    return false;
	  }
	})
	jQuery(document).on('keydown', '#step2 input', function(ev) {
	  if (ev.which === 13) {
	    // Will change backgroundColor to blue as example
	    $('#step2').addClass('stepOff');
	    $('#step3').addClass('stepOn');
	    $('#step3 textarea').focus();
	    $('#supaForm').addClass('messageStep');
	    $('.firstTitle').attr('id', 'removeTitle');
	    $('.secondTitle').addClass('addTitle');
	    $('.subtitle').attr('id', 'removeTitle');
	    $('.secondSubtitle').addClass('addSubtitle');
	    $('hr').addClass('threeQuarters');

	    // Avoid form submit
	    return false;
	  }
	})

	// input focus on next steps
	$('#step1 .inputText').keyup(function() {
	  var searchQuery = $(this).val();

	  if (searchQuery === '') {
	    $('#step1 .nextArrow').removeClass('displayBlock');

	  } else {
	    $('#step1 .nextArrow').addClass('displayBlock');

	  };
	});
	$('#step2 .inputText').keyup(function() {
	  var searchQuery = $(this).val();

	  if (searchQuery === '') {
	    $('#step2 .nextArrow').removeClass('displayBlock');

	  } else {
	    $('#step2 .nextArrow').addClass('displayBlock');

	  };
	});
	$('#step3 textarea').keyup(function() {
	  var searchQuery = $(this).val();

	  if (searchQuery === '') {
	    $('#step3 .nextArrow').removeClass('displayBlock');

	  } else {
	    $('#step3 .nextArrow').addClass('displayBlock');

	  };
	});
</script>
</html>