<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
  lang="en-GB" xml:lang="en-GB">
	<head>
		<title>The Copper Spoon</title>
		<meta charset="UTF-8"/>	
		<link rel="stylesheet" type="text/css" href="main.css"/>
		<link href="./lightbox.css" rel="stylesheet" />
		<link href='https://fonts.googleapis.com/css?family=Lily+Script+One' rel='stylesheet' type='text/css'/>
		<link href='https://fonts.googleapis.com/css?family=Allura' rel='stylesheet' type='text/css'/>
		<link href='https://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'/>
		<script src="./jquery-1.10.2.min.js"></script>
		<script src="./lightbox-2.6.min.js"></script>
		<script src="./main.js"></script>
		<!--[if IE]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
		<!--[if lte IE 7]>
	<script src="js/IE8.js" type="text/javascript"></script><![endif]-->
		<!--[if lt IE 7]>
 
	<link rel="stylesheet" type="text/css" media="all" href="css/ie6.css"/><![endif]-->
	</head>
	<body id="index" class="photos">

		<header id="banner" class="body">

<%@ include file = "nav_bar_01.jsp" %>

		<!-- SVG Main Logo -->
			<svg xmlns="http://www.w3.org/2000/svg"
			 xmlns:xlink="http://www.w3.org/1999/xlink" width="500" height="400">
				<g id="myLogo" transform="scale(0.8)">
					<defs>
						<path id="titlePath1" d="M 100 125 Q 320 -15 540 125" stroke="white" stroke-width="5" fill="none" />
						<path id="titlePath2" d="M 100 300 Q 320 450 540 300 q10 -10 50 0" stroke="white" stroke-width="5" fill="none" />
						<path id="bodyPath"  d="M 381.19724,458.76142 c -14.70278,-5.44844 -26.40754,8.11203 -32.79038,17.73248 -5.5809,9.81901 -17.27047,16.10308 -25.14943,24.80716 -8.40752,7.63064 -13.81951,16.5394 -17.9711,22.61603 -15.00321,-10.60265 -26.24849,-13.70148 -35.51526,-15.69284 -12.08149,-3.69921 -15.14853,-31.16081 -35.07046,-29.99336 -8.95977,-4.61356 -7.91672,11.65467 -6.33786,19.50317 10.06891,8.40297 18.86658,10.6861 29.04404,19.02192 12.30967,12.44774 42.9665,26.08819 53.27889,28.85294 4.23276,-7.52188 16.12889,-11.64997 23.96285,-17.7775 4.43106,-3.46586 8.88172,-6.92655 13.02381,-10.73308 8.67679,-7.97387 16.07215,-22.96962 24.70293,-25.2901 -3.53465,12.08476 -21.65311,17.85642 -21.38374,32.50795 3.65605,10.98788 18.83201,11.65675 7.81476,26.16905 -9.94886,12.63903 -51.2085,47.00931 -50.63267,52.46277 11.62291,0.73185 44.54632,11.42681 67.29362,11.33995 19.4817,-0.0744 67.01135,7.39505 57.55708,-10.15182 -7.22938,-13.41755 -2.14931,-22.65252 -9.10461,-35.0773 -8.67361,-4.11074 -3.70739,-12.14247 -3.05933,-18.28965 0.86958,-8.24837 3.23801,-17.31068 9.13242,-23.14572 6.36707,-6.30294 17.50429,-19.37351 25.10034,-9.61114 11.98823,10.895 18.82493,13.66926 30.37527,18.18258 19.62548,10.30012 15.36651,-1.53566 14.66289,7.8454 -4.60647,0.33521 -22.47574,15.51744 -36.43896,25.27519 -13.15754,12.07688 -29.94708,-2.11183 -44.00368,2.08873 17.69332,1.06519 -4.70657,40.824 14.44197,37.19542 8.87763,-10.58292 -6.76022,-0.22571 13.52745,-8.31511 -1.71755,-5.05272 16.98311,-15.86273 28.00547,-20.36099 10.86167,-4.43268 25.01194,-10.84398 32.69387,-20.4572 6.5495,-8.1961 14.48146,-11.52113 14.33315,-20.43103 -9.62383,-7.58056 -17.60423,-16.01181 -27.21264,-23.91923 -7.50148,-6.16363 -26.08788,-16.66214 -31.18266,-24.16349 -3.52747,-12.97025 -20.12336,-8.62159 -25.56788,-18.62405 -3.34189,-5.09182 -18.4002,-28.4593 -24.15194,-22.41922 -16.40425,4.96528 -19.13571,12.319 -33.37821,8.85209 z" 
						stroke="white" stroke-width="5" fill="none"/>
						<path id="hairPath" d="m 611.81392,469.14102 c -12.29824,18.11693 -32.80377,29.09791 -54.21662,32.14347 -34.51833,6.9077 -70.86382,-3.66122 -99.49412,-23.22648 -23.9414,-16.79085 -43.31684,-42.12141 -47.05852,-71.75964 -4.07275,-23.07192 -3.69276,-48.49557 9.43526,-68.77345 15.74933,-21.47749 49.0002,-23.72582 70.18144,-9.29784 12.06289,8.3586 16.56342,23.48321 16.30463,37.54851 1.16533,22.88318 9.57962,46.27959 27.58817,61.26151 11.9427,9.95358 27.37509,17.85668 43.27114,16.48582 14.48938,-2.33336 24.60344,-14.47478 23.00171,-30.20642 -5.82376,-12.37656 -15.094,-13.77565 -24.68225,-11.35319 -8.28202,3.08088 -9.56833,19.7103 1.49101,19.9435 -1.57894,8.15919 -17.48092,2.5026 -17.72546,-6.11084 -3.58016,-11.43033 1.61956,-25.84296 13.89172,-29.26904 16.46566,-6.03104 39.04882,-0.36923 48.73591,19.14504 11.16868,21.78469 1.73593,47.56585 -10.72402,63.46905 z"/>
						<path id="chefHat1" d="m 479.47449,273.01266 c 0.30807,0.002 0.59541,0.51696 0.94459,1.39432 0.34917,0.87735 0.79739,2.11281 1.21437,3.76851 0.47042,1.78446 0.9743,4.01783 0.97501,6.73076 -0.02,2.71766 -0.54294,5.62221 -1.4074,8.35907 -0.84452,2.5409 -2.03854,4.70816 -2.9976,6.52603 -0.95823,1.86997 -2.04693,3.83256 -3.36155,5.61604 -0.8661,1.2431 -1.79652,2.4189 -2.71703,3.40624 -0.92052,0.98734 -1.82637,1.78806 -2.55165,2.3635 0.41277,-0.13627 0.6446,-0.73749 0.82266,-1.29277 0.17806,-0.55528 0.2873,-1.04749 0.31521,-1.17175 0.002,-0.007 0.003,-0.0147 0.005,-0.0237 -0.0269,-0.12841 -0.1077,-0.51521 -0.22855,-0.93219 -0.12085,-0.41699 -0.27218,-0.85418 -0.52588,-0.92967 -0.0934,-0.0114 -0.12251,-0.006 -0.0167,0.0624 0.10581,0.0683 0.34867,0.19917 0.75096,0.46994 0.51434,0.2905 1.22757,0.56413 2.1696,0.8705 0.94203,0.30638 2.11359,0.64615 3.47908,1.15205 2.19441,0.83646 4.94348,1.72197 7.79292,3.14029 0,0 0,0 1e-5,1e-5 2.19002,1.11286 4.36229,2.45036 6.29566,3.99008 2.0732,1.66126 3.84543,3.49953 5.21698,5.28845 0,0 0,10e-6 0,10e-6 1.07325,1.38179 1.96043,2.85935 2.47532,4.22629 0.50133,1.37513 0.68339,2.59334 0.65649,3.43511 -0.0269,0.84177 -0.23835,1.30823 -0.50645,1.35278 -0.2681,0.0446 -0.5821,-0.31958 -1.02254,-0.91186 -0.44044,-0.59229 -1.03224,-1.40923 -1.8357,-2.35082 -0.72344,-0.83195 -1.72394,-1.68041 -2.94384,-2.63919 0,0 0,0 0,0 -1.54971,-1.19282 -3.36647,-2.38023 -5.3505,-3.41007 -1.77951,-0.92293 -3.74965,-1.68233 -5.76841,-2.33083 0,0 0,0 0,0 -2.28469,-0.73029 -4.88612,-1.13514 -7.45332,-1.74477 -0.98404,-0.20765 -2.10071,-0.37184 -3.25348,-0.60622 -1.15278,-0.23439 -2.34071,-0.53907 -3.46382,-0.92197 -0.74964,-0.20295 -1.54786,-0.57631 -2.29455,-1.0494 -0.74669,-0.47308 -1.44264,-1.04375 -2.03206,-1.60412 -0.75167,-0.62667 -1.19457,-1.61077 -1.45304,-2.43738 -0.25847,-0.82662 -0.34613,-1.49012 -0.37699,-1.71249 0.002,-0.0148 0.003,-0.0278 0.005,-0.039 0.025,-0.20459 0.11104,-1.00372 0.4278,-2.0329 0.31675,-1.02919 0.88714,-2.28028 1.90293,-3.04721 0.49932,-0.29068 1.16421,-0.74584 1.97012,-1.43173 0.80592,-0.6859 1.75244,-1.60736 2.86026,-2.71659 1.02854,-1.00884 2.09802,-2.46235 3.35743,-4.16568 1.28918,-1.8048 2.58268,-3.36619 3.3913,-4.92263 1.10314,-2.13978 1.99433,-4.30842 2.4827,-6.38361 0.49599,-1.95595 0.57922,-4.0588 0.7273,-5.86869 0.12764,-1.57065 0.23779,-2.98988 0.46883,-3.96612 0.23104,-0.97623 0.54553,-1.51091 0.8536,-1.50892 z"/>
						<path id="chefHat2" d="m 515.74801,269.79312 c 0.0768,0.0855 0.0828,0.24193 -0.0382,0.44934 -0.12096,0.20741 -0.38699,0.45827 -0.68144,0.65752 -0.38196,0.2696 -0.91217,0.54691 -1.55891,0.78401 -0.46153,0.18066 -1.00976,0.3543 -1.66216,0.4613 -0.6524,0.10701 -1.40933,0.14796 -2.284,0.0187 -1.67544,-0.27164 -3.55614,-0.92752 -5.39652,-2.08526 -1.84037,-1.15775 -3.63726,-2.81946 -5.08284,-4.92318 -2.56735,-3.60029 -5.50508,-7.48941 -8.7287,-11.05729 0,-1e-5 0,-1e-5 0,-1e-5 -1.5229,-1.67791 -2.98887,-3.32399 -4.44307,-4.79063 -1.45419,-1.46664 -2.89845,-2.75127 -4.36475,-3.75412 -2.05656,-1.30627 -3.65683,-2.60292 -4.91808,-3.41468 -1.26124,-0.81177 -2.1862,-1.1347 -2.89458,-0.90124 -1.58814,-0.0161 -2.92689,0.37138 -3.8119,0.71582 -0.88501,0.34444 -1.3534,0.64337 -1.42734,0.6813 -0.0498,0.0255 -0.30245,0.13339 -0.69684,0.3523 -0.39439,0.21891 -0.93327,0.5515 -1.48161,1.06329 -0.57235,0.44559 -1.17524,1.19368 -1.64649,2.28523 -0.47124,1.09155 -0.80944,2.53023 -0.84304,4.07598 0.019,0.95081 0.21064,1.99445 0.59721,2.98164 0.38656,0.98719 0.96788,1.91594 1.74728,2.59179 1.33669,1.27128 3.23759,2.31799 5.39137,3.46205 2.15377,1.14406 4.55185,2.39614 6.82109,4.05624 0,10e-6 0,10e-6 0,10e-6 2.33723,1.69879 4.43217,3.71364 6.09646,5.87527 1.6643,2.16164 2.89497,4.46759 3.6606,6.71312 0.62575,1.99033 0.79503,3.79486 0.77894,5.3627 -0.0161,1.56784 -0.21778,2.90023 -0.45266,3.9753 -0.23488,1.07507 -0.50567,1.89443 -0.75526,2.44309 -0.2496,0.54865 -0.48126,0.82747 -0.68586,0.8084 -0.40921,-0.0381 -0.66657,-1.29392 -0.97488,-3.34435 -0.15415,-1.02522 -0.3261,-2.24385 -0.62828,-3.53217 -0.30218,-1.28832 -0.73378,-2.64621 -1.50628,-3.88227 -0.90674,-1.61344 -2.17291,-3.19368 -3.76399,-4.65193 -1.59107,-1.45825 -3.50407,-2.79489 -5.55931,-3.96631 0,0 0,0 0,0 -1.79511,-0.99573 -3.96864,-1.75491 -6.33115,-2.69097 -2.36251,-0.93605 -4.90846,-2.06149 -7.40165,-3.74542 -2.00438,-1.47217 -3.57959,-3.32524 -4.69582,-5.34047 -1.11624,-2.01523 -1.77329,-4.19057 -2.00361,-6.33792 -0.40274,-3.04168 0.006,-5.9851 0.89123,-8.48507 0.88479,-2.49998 2.2381,-4.55946 3.61772,-6.11448 1.23196,-1.31284 2.37579,-2.18711 3.21363,-2.76373 0.83783,-0.57661 1.37107,-0.86225 1.48032,-0.92059 0.0812,-0.0434 0.39399,-0.20597 0.92561,-0.4399 0.53161,-0.23392 1.28341,-0.53801 2.24652,-0.8272 1.92622,-0.57839 4.73606,-1.10076 8.09391,-0.68599 2.63947,0.52507 5.12939,1.54244 7.2702,2.89315 2.14082,1.3507 3.93171,3.02982 5.38356,4.52615 1.83138,1.63141 3.48382,3.43299 4.98443,5.29761 1.50061,1.86463 2.85163,3.79006 4.12751,5.65053 0,0 0,0 0,0 3.01775,4.32263 5.53483,8.83876 7.53638,12.97063 0.78083,1.66415 1.81532,3.12583 2.95057,4.25739 1.13524,1.13156 2.37085,1.93402 3.55915,2.46013 0.77504,0.44466 1.83644,0.48726 2.71814,0.55215 0.58874,0.0342 1.07703,0.0464 1.47354,0.0533 0.352,-0.0189 0.58081,0.025 0.76095,0.0485 0.18013,0.0235 0.31606,0.0458 0.39286,0.1313 z"/>
						<path id="chefHat3" d="m 511.34795,267.11017 c 0.0615,-0.36456 0.98836,-0.55129 2.51887,-0.76768 1.53051,-0.21639 3.67114,-0.50816 6.28438,-0.88131 1.21705,-0.1855 2.55346,-0.51138 4.06362,-0.86773 1.51015,-0.35635 3.19548,-0.74075 5.12144,-0.9341 2.63138,-0.31062 5.72103,-0.65254 9.21371,-0.0842 3.12828,0.56719 6.09552,1.74264 8.68046,3.24345 1.58272,0.86213 3.16305,1.88102 4.61978,3.0744 1.45672,1.19338 2.78846,2.56174 3.92442,4.0595 1.32247,1.82817 2.22501,3.69676 2.82273,5.39135 0.59772,1.69458 0.89459,3.21531 1.04713,4.41561 0.22376,1.71202 0.1744,2.76623 0.16811,2.91792 -0.005,0.128 -0.0387,0.90829 -0.2682,2.18971 -0.22954,1.28143 -0.66855,3.07058 -1.61759,5.10535 -0.48388,1.18784 -1.20763,2.5605 -2.31687,3.97426 -1.10925,1.41375 -2.60555,2.86799 -4.63649,4.09615 -1.14365,0.77932 -2.61787,1.34866 -4.32947,1.53115 -1.71159,0.18249 -3.65975,-0.0231 -5.69997,-0.80872 -3.46316,-1.85833 -6.28345,-4.21345 -8.90924,-6.10073 -1.54004,-1.03896 -2.74993,-2.13324 -3.81599,-3.04441 -1.06606,-0.91118 -1.9912,-1.63585 -2.94307,-2.01124 -2.38506,-1.06363 -4.97976,-1.39522 -7.19528,-1.36863 -1.13046,0.0856 -2.15203,0.11072 -3.01888,0.1804 -0.86686,0.0697 -1.58203,0.18149 -2.16245,0.31952 -0.58041,0.13803 -1.02999,0.29776 -1.37513,0.39537 -0.34515,0.0976 -0.58899,0.12777 -0.71261,0.0139 -0.12362,-0.11386 -0.12144,-0.37182 0.0519,-0.74366 0.17338,-0.37184 0.52286,-0.85412 1.08586,-1.35793 0.56301,-0.5038 1.34377,-1.02496 2.30154,-1.47483 0.95778,-0.44987 2.09476,-0.82515 3.24297,-1.09492 2.59209,-0.72324 5.92043,-1.01733 9.47952,-0.18155 1.78837,0.50021 3.40727,1.28595 4.84987,2.10862 1.4426,0.82268 2.70985,1.67793 3.84333,2.25638 3.2971,1.69589 6.16303,3.56933 8.7798,4.51802 -0.0566,0.13016 0.15379,-0.0151 0.51803,-0.23656 0.36423,-0.22151 0.88158,-0.51813 1.45167,-0.73561 0.53859,-0.26645 0.94756,-0.91113 1.33262,-1.66935 0.38506,-0.75822 0.74618,-1.62878 1.11786,-2.44114 0.37862,-1.06913 0.50725,-2.02101 0.5616,-2.69701 0.0543,-0.676 0.039,-1.08356 0.0418,-1.1503 0.003,-0.0791 0.0744,-0.62399 0.051,-1.53677 -0.0213,-0.64574 -0.1003,-1.48232 -0.32867,-2.44373 -0.22837,-0.9614 -0.60794,-2.04874 -1.21837,-3.12483 -0.42135,-0.84216 -1.09836,-1.7017 -1.99915,-2.58679 -0.9008,-0.88509 -2.02416,-1.79645 -3.26267,-2.76127 -1.77552,-1.3229 -3.75841,-2.46574 -5.85278,-3.14684 -2.01703,-0.74861 -4.65441,-0.79766 -7.40043,-0.99836 -1.44565,-0.12447 -3.00088,-0.0454 -4.56905,0.008 -1.56818,0.0537 -3.14819,0.0795 -4.63993,-0.0418 -2.6932,-0.24738 -5.00361,-0.64429 -6.56919,-1.1295 -1.56559,-0.48522 -2.39407,-1.01325 -2.33258,-1.37781 z"/>
						<path id="chefHat4" d="m 505.44547,331.07173 c -0.3288,-0.27232 -0.20375,-1.02053 -0.0537,-2.08276 0.15008,-1.06223 0.28438,-2.48282 0.40863,-4.14779 0.0525,-1.07646 -0.12108,-2.30082 -0.31078,-3.72223 -0.1897,-1.42141 -0.37043,-3.04519 -0.30091,-4.781 0,0 0,0 0,0 0.0914,-3.21287 0.49732,-5.88508 0.68168,-7.02857 0.0454,-0.32187 0.0759,-0.52063 0.084,-0.55538 0.0156,-0.0668 0.21444,-0.70921 0.61045,-1.83178 0.39601,-1.12256 0.98665,-2.75162 2.0059,-4.62892 0.71094,-1.26781 1.58992,-2.71103 2.6577,-4.10838 1.06778,-1.39736 2.33017,-2.73761 3.70283,-3.79842 0.87257,-0.67321 1.81019,-1.25519 2.71684,-1.68576 0.90666,-0.43058 1.78045,-0.70964 2.5298,-0.84386 0.74934,-0.13422 1.37266,-0.12641 1.80943,-0.0295 0.43677,0.0969 0.6864,0.27814 0.7363,0.50256 0.0499,0.22443 -0.0971,0.48283 -0.35474,0.78542 -0.2576,0.30259 -0.62403,0.65397 -1.03712,1.09072 -0.4131,0.43675 -0.87275,0.9618 -1.3546,1.57955 -0.48185,0.61775 -0.98693,1.32836 -1.52123,2.08033 -0.67678,1.01527 -1.2297,2.21065 -1.71102,3.49985 -0.48132,1.2892 -0.9022,2.66654 -1.33201,3.96682 -0.37832,1.26896 -0.53805,2.60407 -0.68523,3.64195 -0.14718,1.03787 -0.26247,1.76122 -0.27982,1.83098 -0.009,0.0363 -0.0734,0.23399 -0.19128,0.57353 -0.34549,1.00348 -1.17013,3.29352 -1.91022,5.96953 0,0 0,0 0,0 -0.32026,1.02478 -0.50546,2.39853 -0.77464,3.93381 -0.26918,1.53529 -0.64498,3.2201 -1.27887,4.74436 -0.77766,1.7528 -1.82057,3.28251 -2.76979,4.16623 -0.94921,0.88373 -1.74884,1.15106 -2.07764,0.87874 z"/>

						<g id="spoon" transform="translate(180,250),rotate(-30)">  
							<ellipse cx="0" cy="00" rx="15" ry="20" style="fill:#C87533;stroke-width:2"/>
							<line x1="0" y1="0" x2="5" y2="130" style="stroke:#C87533;stroke-width:5;"/> 
							<path d="M-5,-10 Q -15, 2 0,15" style="stroke:#DF962E;stroke-width:4; fill:none"/>
						</g>
						<clipPath id="bodyClip">  
							<path id="bodyPath"  d="M 381.19724,458.76142 c -14.70278,-5.44844 -26.40754,8.11203 -32.79038,17.73248 -5.5809,9.81901 -17.27047,16.10308 -25.14943,24.80716 -8.40752,7.63064 -13.81951,16.5394 -17.9711,22.61603 -15.00321,-10.60265 -26.24849,-13.70148 -35.51526,-15.69284 -12.08149,-3.69921 -15.14853,-31.16081 -35.07046,-29.99336 -8.95977,-4.61356 -7.91672,11.65467 -6.33786,19.50317 10.06891,8.40297 18.86658,10.6861 29.04404,19.02192 12.30967,12.44774 42.9665,26.08819 53.27889,28.85294 4.23276,-7.52188 16.12889,-11.64997 23.96285,-17.7775 4.43106,-3.46586 8.88172,-6.92655 13.02381,-10.73308 8.67679,-7.97387 16.07215,-22.96962 24.70293,-25.2901 -3.53465,12.08476 -21.65311,17.85642 -21.38374,32.50795 3.65605,10.98788 18.83201,11.65675 7.81476,26.16905 -9.94886,12.63903 -51.2085,47.00931 -50.63267,52.46277 11.62291,0.73185 44.54632,11.42681 67.29362,11.33995 19.4817,-0.0744 67.01135,7.39505 57.55708,-10.15182 -7.22938,-13.41755 -2.14931,-22.65252 -9.10461,-35.0773 -8.67361,-4.11074 -3.70739,-12.14247 -3.05933,-18.28965 0.86958,-8.24837 3.23801,-17.31068 9.13242,-23.14572 6.36707,-6.30294 17.50429,-19.37351 25.10034,-9.61114 11.98823,10.895 18.82493,13.66926 30.37527,18.18258 19.62548,10.30012 15.36651,-1.53566 14.66289,7.8454 -4.60647,0.33521 -22.47574,15.51744 -36.43896,25.27519 -13.15754,12.07688 -29.94708,-2.11183 -44.00368,2.08873 17.69332,1.06519 -4.70657,40.824 14.44197,37.19542 8.87763,-10.58292 -6.76022,-0.22571 13.52745,-8.31511 -1.71755,-5.05272 16.98311,-15.86273 28.00547,-20.36099 10.86167,-4.43268 25.01194,-10.84398 32.69387,-20.4572 6.5495,-8.1961 14.48146,-11.52113 14.33315,-20.43103 -9.62383,-7.58056 -17.60423,-16.01181 -27.21264,-23.91923 -7.50148,-6.16363 -26.08788,-16.66214 -31.18266,-24.16349 -3.52747,-12.97025 -20.12336,-8.62159 -25.56788,-18.62405 -3.34189,-5.09182 -18.4002,-28.4593 -24.15194,-22.41922 -16.40425,4.96528 -19.13571,12.319 -33.37821,8.85209 z" />
						</clipPath>
						<clipPath id="hairClip">  
							<path d="m 611.81392,469.14102 c -12.29824,18.11693 -32.80377,29.09791 -54.21662,32.14347 -34.51833,6.9077 -70.86382,-3.66122 -99.49412,-23.22648 -23.9414,-16.79085 -43.31684,-42.12141 -47.05852,-71.75964 -4.07275,-23.07192 -3.69276,-48.49557 9.43526,-68.77345 15.74933,-21.47749 49.0002,-23.72582 70.18144,-9.29784 12.06289,8.3586 16.56342,23.48321 16.30463,37.54851 1.16533,22.88318 9.57962,46.27959 27.58817,61.26151 11.9427,9.95358 27.37509,17.85668 43.27114,16.48582 14.48938,-2.33336 24.60344,-14.47478 23.00171,-30.20642 -5.82376,-12.37656 -15.094,-13.77565 -24.68225,-11.35319 -8.28202,3.08088 -9.56833,19.7103 1.49101,19.9435 -1.57894,8.15919 -17.48092,2.5026 -17.72546,-6.11084 -3.58016,-11.43033 1.61956,-25.84296 13.89172,-29.26904 16.46566,-6.03104 39.04882,-0.36923 48.73591,19.14504 11.16868,21.78469 1.73593,47.56585 -10.72402,63.46905 z"/>
						</clipPath>
						<clipPath id="hatClip1">  
							<path id="chefHat1" d="m 479.47449,273.01266 c 0.30807,0.002 0.59541,0.51696 0.94459,1.39432 0.34917,0.87735 0.79739,2.11281 1.21437,3.76851 0.47042,1.78446 0.9743,4.01783 0.97501,6.73076 -0.02,2.71766 -0.54294,5.62221 -1.4074,8.35907 -0.84452,2.5409 -2.03854,4.70816 -2.9976,6.52603 -0.95823,1.86997 -2.04693,3.83256 -3.36155,5.61604 -0.8661,1.2431 -1.79652,2.4189 -2.71703,3.40624 -0.92052,0.98734 -1.82637,1.78806 -2.55165,2.3635 0.41277,-0.13627 0.6446,-0.73749 0.82266,-1.29277 0.17806,-0.55528 0.2873,-1.04749 0.31521,-1.17175 0.002,-0.007 0.003,-0.0147 0.005,-0.0237 -0.0269,-0.12841 -0.1077,-0.51521 -0.22855,-0.93219 -0.12085,-0.41699 -0.27218,-0.85418 -0.52588,-0.92967 -0.0934,-0.0114 -0.12251,-0.006 -0.0167,0.0624 0.10581,0.0683 0.34867,0.19917 0.75096,0.46994 0.51434,0.2905 1.22757,0.56413 2.1696,0.8705 0.94203,0.30638 2.11359,0.64615 3.47908,1.15205 2.19441,0.83646 4.94348,1.72197 7.79292,3.14029 0,0 0,0 1e-5,1e-5 2.19002,1.11286 4.36229,2.45036 6.29566,3.99008 2.0732,1.66126 3.84543,3.49953 5.21698,5.28845 0,0 0,10e-6 0,10e-6 1.07325,1.38179 1.96043,2.85935 2.47532,4.22629 0.50133,1.37513 0.68339,2.59334 0.65649,3.43511 -0.0269,0.84177 -0.23835,1.30823 -0.50645,1.35278 -0.2681,0.0446 -0.5821,-0.31958 -1.02254,-0.91186 -0.44044,-0.59229 -1.03224,-1.40923 -1.8357,-2.35082 -0.72344,-0.83195 -1.72394,-1.68041 -2.94384,-2.63919 0,0 0,0 0,0 -1.54971,-1.19282 -3.36647,-2.38023 -5.3505,-3.41007 -1.77951,-0.92293 -3.74965,-1.68233 -5.76841,-2.33083 0,0 0,0 0,0 -2.28469,-0.73029 -4.88612,-1.13514 -7.45332,-1.74477 -0.98404,-0.20765 -2.10071,-0.37184 -3.25348,-0.60622 -1.15278,-0.23439 -2.34071,-0.53907 -3.46382,-0.92197 -0.74964,-0.20295 -1.54786,-0.57631 -2.29455,-1.0494 -0.74669,-0.47308 -1.44264,-1.04375 -2.03206,-1.60412 -0.75167,-0.62667 -1.19457,-1.61077 -1.45304,-2.43738 -0.25847,-0.82662 -0.34613,-1.49012 -0.37699,-1.71249 0.002,-0.0148 0.003,-0.0278 0.005,-0.039 0.025,-0.20459 0.11104,-1.00372 0.4278,-2.0329 0.31675,-1.02919 0.88714,-2.28028 1.90293,-3.04721 0.49932,-0.29068 1.16421,-0.74584 1.97012,-1.43173 0.80592,-0.6859 1.75244,-1.60736 2.86026,-2.71659 1.02854,-1.00884 2.09802,-2.46235 3.35743,-4.16568 1.28918,-1.8048 2.58268,-3.36619 3.3913,-4.92263 1.10314,-2.13978 1.99433,-4.30842 2.4827,-6.38361 0.49599,-1.95595 0.57922,-4.0588 0.7273,-5.86869 0.12764,-1.57065 0.23779,-2.98988 0.46883,-3.96612 0.23104,-0.97623 0.54553,-1.51091 0.8536,-1.50892 z"/>
						</clipPath>
						<clipPath id="hatClip2">  
							<path id="chefHat2" d="m 515.74801,269.79312 c 0.0768,0.0855 0.0828,0.24193 -0.0382,0.44934 -0.12096,0.20741 -0.38699,0.45827 -0.68144,0.65752 -0.38196,0.2696 -0.91217,0.54691 -1.55891,0.78401 -0.46153,0.18066 -1.00976,0.3543 -1.66216,0.4613 -0.6524,0.10701 -1.40933,0.14796 -2.284,0.0187 -1.67544,-0.27164 -3.55614,-0.92752 -5.39652,-2.08526 -1.84037,-1.15775 -3.63726,-2.81946 -5.08284,-4.92318 -2.56735,-3.60029 -5.50508,-7.48941 -8.7287,-11.05729 0,-1e-5 0,-1e-5 0,-1e-5 -1.5229,-1.67791 -2.98887,-3.32399 -4.44307,-4.79063 -1.45419,-1.46664 -2.89845,-2.75127 -4.36475,-3.75412 -2.05656,-1.30627 -3.65683,-2.60292 -4.91808,-3.41468 -1.26124,-0.81177 -2.1862,-1.1347 -2.89458,-0.90124 -1.58814,-0.0161 -2.92689,0.37138 -3.8119,0.71582 -0.88501,0.34444 -1.3534,0.64337 -1.42734,0.6813 -0.0498,0.0255 -0.30245,0.13339 -0.69684,0.3523 -0.39439,0.21891 -0.93327,0.5515 -1.48161,1.06329 -0.57235,0.44559 -1.17524,1.19368 -1.64649,2.28523 -0.47124,1.09155 -0.80944,2.53023 -0.84304,4.07598 0.019,0.95081 0.21064,1.99445 0.59721,2.98164 0.38656,0.98719 0.96788,1.91594 1.74728,2.59179 1.33669,1.27128 3.23759,2.31799 5.39137,3.46205 2.15377,1.14406 4.55185,2.39614 6.82109,4.05624 0,10e-6 0,10e-6 0,10e-6 2.33723,1.69879 4.43217,3.71364 6.09646,5.87527 1.6643,2.16164 2.89497,4.46759 3.6606,6.71312 0.62575,1.99033 0.79503,3.79486 0.77894,5.3627 -0.0161,1.56784 -0.21778,2.90023 -0.45266,3.9753 -0.23488,1.07507 -0.50567,1.89443 -0.75526,2.44309 -0.2496,0.54865 -0.48126,0.82747 -0.68586,0.8084 -0.40921,-0.0381 -0.66657,-1.29392 -0.97488,-3.34435 -0.15415,-1.02522 -0.3261,-2.24385 -0.62828,-3.53217 -0.30218,-1.28832 -0.73378,-2.64621 -1.50628,-3.88227 -0.90674,-1.61344 -2.17291,-3.19368 -3.76399,-4.65193 -1.59107,-1.45825 -3.50407,-2.79489 -5.55931,-3.96631 0,0 0,0 0,0 -1.79511,-0.99573 -3.96864,-1.75491 -6.33115,-2.69097 -2.36251,-0.93605 -4.90846,-2.06149 -7.40165,-3.74542 -2.00438,-1.47217 -3.57959,-3.32524 -4.69582,-5.34047 -1.11624,-2.01523 -1.77329,-4.19057 -2.00361,-6.33792 -0.40274,-3.04168 0.006,-5.9851 0.89123,-8.48507 0.88479,-2.49998 2.2381,-4.55946 3.61772,-6.11448 1.23196,-1.31284 2.37579,-2.18711 3.21363,-2.76373 0.83783,-0.57661 1.37107,-0.86225 1.48032,-0.92059 0.0812,-0.0434 0.39399,-0.20597 0.92561,-0.4399 0.53161,-0.23392 1.28341,-0.53801 2.24652,-0.8272 1.92622,-0.57839 4.73606,-1.10076 8.09391,-0.68599 2.63947,0.52507 5.12939,1.54244 7.2702,2.89315 2.14082,1.3507 3.93171,3.02982 5.38356,4.52615 1.83138,1.63141 3.48382,3.43299 4.98443,5.29761 1.50061,1.86463 2.85163,3.79006 4.12751,5.65053 0,0 0,0 0,0 3.01775,4.32263 5.53483,8.83876 7.53638,12.97063 0.78083,1.66415 1.81532,3.12583 2.95057,4.25739 1.13524,1.13156 2.37085,1.93402 3.55915,2.46013 0.77504,0.44466 1.83644,0.48726 2.71814,0.55215 0.58874,0.0342 1.07703,0.0464 1.47354,0.0533 0.352,-0.0189 0.58081,0.025 0.76095,0.0485 0.18013,0.0235 0.31606,0.0458 0.39286,0.1313 z"/>
						</clipPath>
						<clipPath id="hatClip3">  
							<path id="chefHat3" d="m 511.34795,267.11017 c 0.0615,-0.36456 0.98836,-0.55129 2.51887,-0.76768 1.53051,-0.21639 3.67114,-0.50816 6.28438,-0.88131 1.21705,-0.1855 2.55346,-0.51138 4.06362,-0.86773 1.51015,-0.35635 3.19548,-0.74075 5.12144,-0.9341 2.63138,-0.31062 5.72103,-0.65254 9.21371,-0.0842 3.12828,0.56719 6.09552,1.74264 8.68046,3.24345 1.58272,0.86213 3.16305,1.88102 4.61978,3.0744 1.45672,1.19338 2.78846,2.56174 3.92442,4.0595 1.32247,1.82817 2.22501,3.69676 2.82273,5.39135 0.59772,1.69458 0.89459,3.21531 1.04713,4.41561 0.22376,1.71202 0.1744,2.76623 0.16811,2.91792 -0.005,0.128 -0.0387,0.90829 -0.2682,2.18971 -0.22954,1.28143 -0.66855,3.07058 -1.61759,5.10535 -0.48388,1.18784 -1.20763,2.5605 -2.31687,3.97426 -1.10925,1.41375 -2.60555,2.86799 -4.63649,4.09615 -1.14365,0.77932 -2.61787,1.34866 -4.32947,1.53115 -1.71159,0.18249 -3.65975,-0.0231 -5.69997,-0.80872 -3.46316,-1.85833 -6.28345,-4.21345 -8.90924,-6.10073 -1.54004,-1.03896 -2.74993,-2.13324 -3.81599,-3.04441 -1.06606,-0.91118 -1.9912,-1.63585 -2.94307,-2.01124 -2.38506,-1.06363 -4.97976,-1.39522 -7.19528,-1.36863 -1.13046,0.0856 -2.15203,0.11072 -3.01888,0.1804 -0.86686,0.0697 -1.58203,0.18149 -2.16245,0.31952 -0.58041,0.13803 -1.02999,0.29776 -1.37513,0.39537 -0.34515,0.0976 -0.58899,0.12777 -0.71261,0.0139 -0.12362,-0.11386 -0.12144,-0.37182 0.0519,-0.74366 0.17338,-0.37184 0.52286,-0.85412 1.08586,-1.35793 0.56301,-0.5038 1.34377,-1.02496 2.30154,-1.47483 0.95778,-0.44987 2.09476,-0.82515 3.24297,-1.09492 2.59209,-0.72324 5.92043,-1.01733 9.47952,-0.18155 1.78837,0.50021 3.40727,1.28595 4.84987,2.10862 1.4426,0.82268 2.70985,1.67793 3.84333,2.25638 3.2971,1.69589 6.16303,3.56933 8.7798,4.51802 -0.0566,0.13016 0.15379,-0.0151 0.51803,-0.23656 0.36423,-0.22151 0.88158,-0.51813 1.45167,-0.73561 0.53859,-0.26645 0.94756,-0.91113 1.33262,-1.66935 0.38506,-0.75822 0.74618,-1.62878 1.11786,-2.44114 0.37862,-1.06913 0.50725,-2.02101 0.5616,-2.69701 0.0543,-0.676 0.039,-1.08356 0.0418,-1.1503 0.003,-0.0791 0.0744,-0.62399 0.051,-1.53677 -0.0213,-0.64574 -0.1003,-1.48232 -0.32867,-2.44373 -0.22837,-0.9614 -0.60794,-2.04874 -1.21837,-3.12483 -0.42135,-0.84216 -1.09836,-1.7017 -1.99915,-2.58679 -0.9008,-0.88509 -2.02416,-1.79645 -3.26267,-2.76127 -1.77552,-1.3229 -3.75841,-2.46574 -5.85278,-3.14684 -2.01703,-0.74861 -4.65441,-0.79766 -7.40043,-0.99836 -1.44565,-0.12447 -3.00088,-0.0454 -4.56905,0.008 -1.56818,0.0537 -3.14819,0.0795 -4.63993,-0.0418 -2.6932,-0.24738 -5.00361,-0.64429 -6.56919,-1.1295 -1.56559,-0.48522 -2.39407,-1.01325 -2.33258,-1.37781 z"/>
						</clipPath>
						<clipPath id="hatClip4">  
							<path id="chefHat4" d="m 505.44547,331.07173 c -0.3288,-0.27232 -0.20375,-1.02053 -0.0537,-2.08276 0.15008,-1.06223 0.28438,-2.48282 0.40863,-4.14779 0.0525,-1.07646 -0.12108,-2.30082 -0.31078,-3.72223 -0.1897,-1.42141 -0.37043,-3.04519 -0.30091,-4.781 0,0 0,0 0,0 0.0914,-3.21287 0.49732,-5.88508 0.68168,-7.02857 0.0454,-0.32187 0.0759,-0.52063 0.084,-0.55538 0.0156,-0.0668 0.21444,-0.70921 0.61045,-1.83178 0.39601,-1.12256 0.98665,-2.75162 2.0059,-4.62892 0.71094,-1.26781 1.58992,-2.71103 2.6577,-4.10838 1.06778,-1.39736 2.33017,-2.73761 3.70283,-3.79842 0.87257,-0.67321 1.81019,-1.25519 2.71684,-1.68576 0.90666,-0.43058 1.78045,-0.70964 2.5298,-0.84386 0.74934,-0.13422 1.37266,-0.12641 1.80943,-0.0295 0.43677,0.0969 0.6864,0.27814 0.7363,0.50256 0.0499,0.22443 -0.0971,0.48283 -0.35474,0.78542 -0.2576,0.30259 -0.62403,0.65397 -1.03712,1.09072 -0.4131,0.43675 -0.87275,0.9618 -1.3546,1.57955 -0.48185,0.61775 -0.98693,1.32836 -1.52123,2.08033 -0.67678,1.01527 -1.2297,2.21065 -1.71102,3.49985 -0.48132,1.2892 -0.9022,2.66654 -1.33201,3.96682 -0.37832,1.26896 -0.53805,2.60407 -0.68523,3.64195 -0.14718,1.03787 -0.26247,1.76122 -0.27982,1.83098 -0.009,0.0363 -0.0734,0.23399 -0.19128,0.57353 -0.34549,1.00348 -1.17013,3.29352 -1.91022,5.96953 0,0 0,0 0,0 -0.32026,1.02478 -0.50546,2.39853 -0.77464,3.93381 -0.26918,1.53529 -0.64498,3.2201 -1.27887,4.74436 -0.77766,1.7528 -1.82057,3.28251 -2.76979,4.16623 -0.94921,0.88373 -1.74884,1.15106 -2.07764,0.87874 z"/>
						</clipPath>

					</defs>
					<!-- Ellipse Clip path - outside of defs because it didn't work for some reason -->
					<clipPath id="clipEllipse">  
						<ellipse cx="415" cy="446" rx="200" ry="120" style="fill:#B1AC8F;stroke-width:2" />
					</clipPath>
					<!-- /Ellipse Clip path -->	
					<!-- Swirly background -->
					<g transform="translate(0, 60)">
						<g transform="translate(-50,-220), scale(1.02, 1)">
							<use xlink:href="./logo_detail.svg#layer3"/>
						</g>
					<!-- /Swirly background-->
<!-- Page title - link back to home page -->
						<a xlink:href="./index.html">
							<text x="20" class="title">
								<textPath  xlink:href="#titlePath1" >
						The Copper Spoon
								</textPath>
							</text>
						</a>
						<!-- /Page Title -->
					
					<!-- Logo background ellipse -->
						<!-- Shadow -->
						<ellipse cx="320" cy="200" rx="200" ry="120" style="stroke-width:2" transform="translate(2,4)"/>
						<!-- Main Colour -->
						<ellipse cx="320" cy="200" rx="200" ry="120" style="fill:#B1AC8F;stroke-width:2" />
					<!-- /Logo background ellipse -->
					</g>

					<!-- Spoon -->
					<use xlink:href="#spoon">
						<animateTransform attributeName="transform" type="rotate" values="0,215,310;30,215,310;0,215,310" repeatCount="indefinite" fill="freeze" dur="2s"/> 
					</use>
					<!-- /Spoon -->
										
					<!-- Character -->	
					<g transform="translate(30,-16), scale(0.7)">
						<!-- Text for missing character -->	
						<g transform="translate(28,-25)" clip-path="url(#bodyClip)">

							<text class="bodyText" clip-path="url(#clipEllipse)">
								<textPath  xlink:href="#bodyPath">
								"After a good dinner one can forgive anybody, even one's own relatives." "All you need is love, but a little chocolate now and then doesn't hurt."
								</textPath>
							</text>
						</g>
						<g clip-path="url(#hairClip)">
							<text class="hairText">
								<textPath  xlink:href="#hairPath" dy="10">
								ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
								</textPath>
							</text>
						</g>

						<text x="430" y="350" class="alertText">
								If you  
							<tspan x="420" y="370">can see</tspan>
							<tspan x="415" y="390">this text,</tspan>
							<tspan x="420" y="410">my logo</tspan>
							<tspan x="420" y="430">isn't being</tspan>
							<tspan x="440" y="450">displayed</tspan>
							<tspan x="460" y="470">properly.</tspan>
						</text>

						<text class="hatText" clip-path="url(#hatClip1)">
							<textPath  xlink:href="#chefHat1">
								dddddddddddddddddddddddddddddddddddddd
							</textPath>
						</text>
						<text class="hatText" clip-path="url(#hatClip2)">
							<textPath  xlink:href="#chefHat2">
								dddddddddddddddddddddddddddddddddddddd
							</textPath>
						</text>
						<text class="hatText" clip-path="url(#hatClip3)">
							<textPath  xlink:href="#chefHat3">
								dddddddddddddddddddddddddddddddddddddd
							</textPath>
						</text>
						<text class="hatText" clip-path="url(#hatClip4)">
							<textPath  xlink:href="#chefHat4">
								dddddddddddddddddddddddddddddddddddddd
							</textPath>
						</text>
					<!-- Text for missing character -->	

					<!-- Imports from Inkscape files -->	
						<use xlink:href="./logo.svg#path3012" clip-path="url(#clipEllipse)"/>
						<use xlink:href="./logo.svg#path3868"/>
						<use xlink:href="./logo.svg#layer3"/>
						<use xlink:href="./logo.svg#layer4"/>
					<!-- /Imports from Inkscape files -->		
					</g>
					<!-- /Character -->
					
					
					<!-- Subtitle -->
					<g transform="translate(0, 60)">
						<text x="10" class="subtitle">
							<textPath  xlink:href="#titlePath2" >
					Made for Tea..........And Biscuits
							</textPath>
						</text>
					</g>
					<!-- /Subtitle -->
					<g transform="translate(30,130)">
					<a class='go-to-content' href='#content' title='Photos'>
						<text x="50" class="super_sub_title">
							<textPath  xlink:href="#titlePath1" >
						Photo's
							</textPath>
						</text>
						</a>
					</g>

				</g>

			</svg>

<%@ include file = "nav_bar_02.jsp" %>
		</header>
		<!-- /#banner -->

		<section id="content" class="body">
			<ul class="image_grid columns-4">
			
			
				<li>
				<a href="./apple.png" data-lightbox="foodPics" title="Apples: Red? Or Green?">
					<img src="./apple.png" alt="Apple" title="Apples: Red? Or Green?"/>
					</a>
				</li>
				
				<li>
				<a href="./banana.png" data-lightbox="foodPics" title="Why bananas are the best snack food ever">
					<img src="./banana.png" alt="Banana" title="Why bananas are the best snack food ever"/>
					</a>
				</li>
				<li>
				<a href="./food_01_large.png" data-lightbox="foodPics" title="The Traffic Light System">
					<img src="./food_01.png" alt="Food1" title="The Traffic Light System"/>
					</a>
				</li>
				<li>
				<a href="./food_02.png" data-lightbox="foodPics" >
					<img src="./food_02.png" alt="Fruity Dessert" title="Defining 'treats'"/>
					</a>
				</li>
				<li>
				<a href="./redappleLarge.png" data-lightbox="foodPics" title="Apples: Red? Or Green?">
					<img src="./redappleSmall.png" alt="Apple" title="Apples: Red? Or Green?"/>
					</a>
				</li>
				<li>
				<a href="./apple.png" data-lightbox="foodPics" title="Apples: Red? Or Green?">
					<img src="./apple.png" alt="Apple" title="Apples: Red? Or Green?"/>
					</a>
				</li>
				
				<li>
				<a href="./banana.png" data-lightbox="foodPics" title="Why bananas are the best snack food ever">
					<img src="./banana.png" alt="Banana" title="Why bananas are the best snack food ever"/>
					</a>
				</li>
				<li>
				<a href="./food_01_large.png" data-lightbox="foodPics" title="The Traffic Light System">
					<img src="./food_01.png" alt="Food1" title="The Traffic Light System"/>
					</a>
				</li>
			</ul>
		</section>
		<!-- /#content -->
		<!-- Subscribe form and Social links -->
<%@ include file = "subscribe.jsp" %>
<!-- Footer info -->
<%@ include file = "footer.jsp" %>
	</body>
</html>