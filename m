Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0213A7F73
	for <asahi@lists.linux.dev>; Fri, 15 May 2026 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840356; cv=fail; b=lGuq5VaByjYS7jz1CE+vcqnOan3JXGV0pW0KsWJ6NYmTCRUYEBaSJSMFYFsziAU31XDBxwausBTzcmJUwG/Muk8cwDmmUISC1NJKxUvDhD6PvLLazrX1ktvaODaiMb9VdWS38bJuepo7tPB70oESBvrFGaLj9LBlYcJCUNuv0/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840356; c=relaxed/simple;
	bh=Zdi0x0ktJqt7ij/mTdXcI2qY91LyUY7qeA3PgJib4rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWFCPFH6cNUQxUz9qq/3YUdq77JfA0yiqIQeOUD7gOIWUQlswTbYyfH/SQgo1HmuLJ8CR873M/oNVglHP9GNUpJOdhL9O4UgcIjnhZLQpaRHN3Ph6Euvcmm+IOr42+bWq7HWoc1kmhCCNelw+8I+bLjnpPyiIJC6hNkZTz5nrxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Tnjz8y4c; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wzv3ZRvy reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Tnjz8y4c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wzv3ZRvy"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4MvGk3863696;
	Fri, 15 May 2026 05:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ktnoy4EiBafipnGFaL3Uq/0JMnz43wWgrtsXIMNdV5o=; b=
	Tnjz8y4cV9aVzKgEjAUOU6hC8hw24UNsDChvJpC4GOEyyGCUxWHisHvHc2XHajKV
	cKpa1UY649Bn6hBIed3dedqFpvTqpiHiJieRXr6fj1KAHzGTLeg+kmgcvtFsWwX1
	Z0xH4mpXqN09BLAeypszg7Obk3tqSie7DVRr6anLHOo63JUL97RiOuc+dVARMnnw
	9nIWx23pnzYgt9zrn4nnq7P3XDReH1XlZ7D0h5yhL2Z0oszY1BE0A+cNUBoMp6F4
	y8Oh3UkLjpfeEPsydxbyFkXg/iQYDbASt/Dmx+eDiXwV1YaSFYrWOnyba0uAywyU
	ixxcRS+DQ41bIPf9xFFcog==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021088.outbound.protection.outlook.com [40.93.194.88])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e5m2krst1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 05:18:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fElagapotH9N43X4eake8F/AmLQnFOp3BNTnnW4bJwHUheiUXgD6NcLWn9HmhAl3mKJwAcp1nNEBd1wijbVtzasprNhIkSg0352HSc4nKggYDigEOmFTXanjiyQyeCkcy5jkXezijBW1szbwVnbRuwUh1isAl6m01km5Kp7/P4BGDgnbgetPslill00uJUO5adRmedr+na6u6Lq3BZFw5QskokKuXDPVrz/oRjV8NmOSejyDuY+SaxGbHBAN9twlC0OCj1FS4TiFP6Rxj6e5rFhVzGn50RD2UKVcPGjfRIzqEdLHDw3bCICOtT3V1N4XtCVrU3Q3O1TSdemyQWvuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBKnmMyrqF98BRIoYOZ//t8NEy9KJMvZcc5Q7W4hWts=;
 b=oD+Qjai/0Xqf8TJUCJVxs/5yp0qzQ4N9FiHjr73YQxM4hXtsT3gIi+jlyYebHBdaidNcKYMv5NiCN59g6H7lQwxNkLF/H2B+CWEvozbrezlgWf/VXPcBkfN9IUun4VdWJgp5eAYD672EkAyd7mmESmSK/GKpeZ9g0sJOAdmeyyzFLQ48ITsHFSUWakRpvoumd4gcqBJH/rDLqHrHutiLgOPwM+rTTerRUi6XJqAHPsDKVYlM9B3trcDFLXHN8D7bRhBpUd4i3OgSlTkQuQMJsJ5gxQwDmDxLCQNmme2JuCT82WMhu+UUWwKJp0jJZ1/uTghNlm0o7PJODhyiq7+c2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBKnmMyrqF98BRIoYOZ//t8NEy9KJMvZcc5Q7W4hWts=;
 b=wzv3ZRvyzPlMJW5rvqPwbOjhiNZAR5vgsAFCwN+WSGE717ZOkZ9rVDRRV05ygWWBFk6rrFGZKKYDn3dBCSOyYHQ5UVOQK1toMhulvDoUzhLwL2CXDVNSZoGMb6CguOcJjwESkNYsM/sXNF7AbOKKq4v735EZOFmro3An1Vhnvv0=
Received: from MW4PR03CA0134.namprd03.prod.outlook.com (2603:10b6:303:8c::19)
 by SA0PR19MB4320.namprd19.prod.outlook.com (2603:10b6:806:81::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 10:18:12 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::5a) by MW4PR03CA0134.outlook.office365.com
 (2603:10b6:303:8c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Fri,
 15 May 2026 10:18:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Fri, 15 May 2026 10:18:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6356A406540;
	Fri, 15 May 2026 10:18:10 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 49704820244;
	Fri, 15 May 2026 10:18:10 +0000 (UTC)
Date: Fri, 15 May 2026 11:18:09 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Nick Li <nick.li@foursemi.com>,
        M R Swami Reddy <mr.swami.reddy@ti.com>,
        Vishwas A Deshpande <vishwas.a.deshpande@ti.com>,
        Peter Rosin <peda@axentia.se>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Kiseok Jo <kiseok.jo@irondevice.com>,
        Kevin Cernekee <cernekee@chromium.org>,
        Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Thorsten Blum <thorsten.blum@linux.dev>,
        Chris Morgan <macromorgan@hotmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Marco Crivellari <marco.crivellari@suse.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Aaron Kling <webgeek1234@gmail.com>, Teguh Sobirin <teguh@sobir.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        Hsieh Hung-En <hungen3108@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Shimrra Shai <shimrrashai@gmail.com>,
        Zhang Yi <zhangyi@everest-semi.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Qasim Ijaz <qasdev00@gmail.com>,
        Sharique Mohammad <sharq0406@gmail.com>, Chen Ni <nichen@iscas.ac.cn>,
        Neo Chang <YLCHANG2@nuvoton.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Kees Cook <kees@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>,
        Tim Bird <tim.bird@sony.com>,
        Bram Vlerick <bram.vlerick@openpixelsystems.org>,
        Peter Korsgaard <peter@korsgaard.com>,
        Linus Walleij <linusw@kernel.org>, Wenyuan Li <2063309626@qq.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Xichao Zhao <zhao.xichao@vivo.com>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v1 2/2] ASoC: Use named initializers for arrays of
 i2c_device_data
Message-ID: <agby4VvKu2XSS2FB@opensource.cirrus.com>
References: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
 <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|SA0PR19MB4320:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd440a6-eab8-4c8a-8e91-08deb26b44e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|7416014|376014|36860700016|32650700020|4143699003|16102099003|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	p3xP2x/EUMc4D/PEt7zCm0KNkzzx6ZsawxH/5MSnxjodIvRTkdlb9ZDYSMnsgmRJahIa5YwneggBggR0c8rtRM2Ff3PqxqPlp7U++vVHlPnwvu/YUtZ4Zo3yO+VxucKZgfuY/UoKdYIYeh/kCugJ2y44I2oXf2mTA8tXDWknFeP8fECDdGkskHk9pw5FxoCzJf7P7xZCQhLbFmp/0t/DssAbyaCkgqAO2VpOU/8euZjQZp3T0woTOQDfnlhC3gP35j/rmc1ZZjULQ5/bkQZxDKzfV5T0BgnPpMTogEMMifC8hxHpn9TFYFqixuDSeSZ+hs84qsSV/3G+5VoGMnqhMHJnOKMRZ956FbTQ2zwlLbeGgEtroOLM29qcdlHxrXmjsuBy4L85INQsiYJzAiiMLYlBj6i9jscY2eETueNJRxa0qXVVv3kNsq3H32RSM4JiRRM28go/G1GxVIdT2QQ+kzYsHcGOFR5D7T3c3UPdbiV/bkO93fAcHixeB7wbQfPv9TvzzWNkR8zRDlvhlDyt9DDsmzSPho9eY1huP2uEoGfE4et3lKMrYKAifhGyoypqjquzLC8xqiq8sjdCdrZyvKoA6aAfxku+FLqeSu7wo86S3jNsBK7O+EqrexVCZfDg/9IWnVcyb9Td02Eev13rYJemT/KkBBNJbmTpXdP/y5A6CYknbLMDBwIA5xzF2DMWK2W+vnkL5ucce+1jUYB/hkakJgv5EUU+9R2DK+NX/7Q=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(7416014)(376014)(36860700016)(32650700020)(4143699003)(16102099003)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DtkTK9cSfxwtoealsW+hxhwdH6uwQBEGVU07Vvws2iO+JCcA1FLJ81eUYoZd7qjSTZ6RN13ALjSaAp9OuFhe0qTvx5y6wRGjeALk/kz2RXjyirGcYPhG4bKE3QIWdZMK+qXnRYE4tVCvR/3y7UJhRXKe45UEIDSYg2M0wnDyVjDAcFO8z4XjRGtQJoQaYVe1S4+LQB5dzV/zhKWK2WwmOKdq0bS0PQAbLfS6P99BxRsOx8YpASHQL7pe0KfGQxeGUu5MaxPCu4GUSBddzTBnlFDq8M6+V5/8Vzqe0DXGUlIQ4jAS99kPPuanzVnBkzwj2s8kUtv5Yhj334jWu5ZIqHtOC6u6QrT3XXHmzyQ+J4dBQCvCV1z+PN61SLODH8Qw+rLLbKDjSb28lAtTniCqwtzZWYL3ZnR3sqMgvQuSugNY33t+HYPGX9mOdyxxuBNT
X-Exchange-RoutingPolicyChecked:
	Ppk/7iR5hnTw/HqKRtZsFmoRwChZel+Mr9di/6lFhHYT3ZlLEFF6i0kEtDP7o6PqYCvejptUNL1fHGks8N8R5nbd/pr7g2SzepzRgcSudWGNo0+y8xZSJ6cD1+QfRde78MLh76VAyuTRF0cj75PpSh6ekvN2CzrZFVMnB8HyJvq/HNKCPJmnojbnkC/S6ohayWf8eWz1N3Ma6uROPt7GG9xY+bawbOW661W7S1s82N+DXBN6c/VjVXXv7rFkkTaq1mYIgJzAVIa9IaYNNEKejt9hk8p5wBwgKHc+Fi/Yt7B3xNAA5GJdlBtdRgWeWPBd6t7wwf1TFWAu8VHcEi0RzA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 10:18:11.7512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd440a6-eab8-4c8a-8e91-08deb26b44e7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4320
X-Proofpoint-ORIG-GUID: VFQxl3XQhrDgTlDijADyfXN7NcQWoaHp
X-Authority-Analysis: v=2.4 cv=KOdqylFo c=1 sm=1 tr=0 ts=6a06f2ea cx=c_pps
 a=msPUCbsZKHGyBhhyaqynTw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=-W4hE_00JRDff0mwMXEA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: VFQxl3XQhrDgTlDijADyfXN7NcQWoaHp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfX7M5wfFoq2nQA
 cbiTA+omXBbo98COsEV6xPol5AYm8peDmxFroGWLev+h9djqsqxYyZFoEEQq48Vwv/iFriLpwTz
 X8HiHgJWX2PunzeezkqqCuYBo6ON2U+Dcu/FnWH2ZTK0j5CZG4Yc0lLXR1kcNGnO4dBaLtBXOBr
 w2ZvfRLErVhI+Z9D8AZV58y8O4+Gc/EJX3P7h0uU9hNmfK/UgK/Im0SMfjcUSPQmb1Qbs80yXx4
 J5U0uY2gmt+x66Sc590gpMptWOzqbboYiNLTO0g2H+cyuAucDX+9M0JdAQN2TxF2bovoerEtOZT
 LwavDpDE1CIsqg5MQwP6VTd/Re0JkdTOiROzX1X5gj4Wwb4lAgbTyEBmplZ+hxZaTEj0UAqoCke
 PEDyRPjT2rJJHWykaBgzCfe6fT0BgiEOm6E3TDC0TwWpUh1ff0vFYNhKH8SFbLXhdk2XTp44b8D
 TDFjyBAttTWktwjH0Rw==
X-Proofpoint-Spam-Reason: safe

On Wed, May 13, 2026 at 07:23:04PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> While touching all these arrays, unify indention and usage of commas.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---

For the Wolfson/Cirrus bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
