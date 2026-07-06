Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6CA3E4C95;
	Mon,  6 Jul 2026 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783335516; cv=fail; b=WZPZf5LU0EhfviJs/bSmVnNBh6F9FnNgnxGPRa27DAr0oBj6ILUddp3dUhAlRVLHqNMDKMPE7JXCmtDKfSUPmVXBYrkOrHBV2XGUfN9nplNBW357/XABZNWnnzYMdigCFwO1JwR76/g0XlDTeUVKen+vPYXI3cHS3puSNienB3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783335516; c=relaxed/simple;
	bh=FDt0IY2OQ0KHzhDyQdMkyu9CEoi7e2gkuqZXevzqrFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n414RtFdDIvIH8C0OiPw5t+ruZA4kbgMOGQvQxsA0ofcBZsn2GWxXER1k1yjU5NRE07PRNrUvgjNvESrwn5grnsK0aHtx4hOYL53i3mHrMTHW/ziWFVVy+9MPiZL4AGcbcDeJofUwPyV0CVelZEojwPUlpWTn1NpoqMmx/Santo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lyhZ1/8w; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ybtkC7HH; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lyhZ1/8w";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ybtkC7HH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6665GP8H985285;
	Mon, 6 Jul 2026 05:58:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=1jJv1k1IFRqrE7kfoP4ezhaVK95cnOp2vIzz9h4q5IE=; b=
	lyhZ1/8wK0j4so/5rb5T3Nr5zzJI5ba97bNeLZ63+kNwX9JE6u+6gA3JthGJTCSr
	MdOYdm4SSx5l5aQevQnXMUYRNsz37RqvnyONXfRn3/p+afZxvSrB+GrzKQ+R0SW2
	ZSTm+1xsX0O1LHUzYI6WvPEeZtZRf2jkVbefDMEg2Kcfg7aZR469Ga2CKyjAfZ6x
	LsXbaVaqw5KPu5sbFaB5Ue5DiYSnETqUC7Ub3qhc+XfmtyoKRIgMbLHrDovUaPBK
	D+oR5jzTe3/YZpiRMpF3Kfvzq5WXK5jLaUf/Y/PxlLy2ef5dV7c8+1lNvrD2EP+C
	qiRW1Xsnex99tt35WWXb/Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020097.outbound.protection.outlook.com [52.101.61.97])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjj7wb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 05:58:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQqokTHgjZx+6ijCUen3XRUEzrnxrEiJa9sGLyKCcQ0My7N6+w3Xw4l+wpwrW28lr9NhNVctGJ4A9dyF983D1feCZjlTVM9oIkTXJUnHGdsI+Mpi3LhT4L3/HEisAbOu9GAuYGSMVfDS5PVl6vcPDMxHlZOIFoNQTxsP434NZ6ZFii/iGi9SEbOtSmiQN4gbEdGk/xf+J9nqGPREABDIMwJGr5arYlLXj9+gndzY8xFsnqbvq8VA/qLKzDZGSByMto71z9+Em0cJolzvvsN8nGVRpTRnJmizRTzs3hJsgFsm/81tFGR8oQ2CZMnYI5aaOTD9XNVItXTF0AhEQtK4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jJv1k1IFRqrE7kfoP4ezhaVK95cnOp2vIzz9h4q5IE=;
 b=r4Qqb8Q2uqlnH6Q112tS2IFbneEVGPt64cpfztg3oEbTRUfpWcqllz2D04AvpnZ331YpslqFDnWwHTMBamLl2e/wX9NWRV+uv+iJN6QfDd7JWu+0L9lZA+IrIYaEuBM8QRndzqkEbbDkv0ZnMqB87KTF9C64al7nIGAxqvJEpjS5jglsIm2hn8wmtufPllgVVxO/ljBFeKtIbhE3BG1XQBW2lW6N3rjflMUjQyodXsy29+MsYsowtd/liVbJeuqINK5JTuj4SwuUR6YTI5Ojp3zRFXNGAMgQDwpjSzeMcVfNWv7EamFf108aIK7f8Dntve/iJzn+N97S820X6d3c2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jJv1k1IFRqrE7kfoP4ezhaVK95cnOp2vIzz9h4q5IE=;
 b=ybtkC7HHzVOroNaLyF5Bo2GNDswRIfdf59vR/G6Ge3jdDoYpds9DwgsYsgFYNUvrAgYlguKNZ4d4+Eb8MO16s1CmewuniGSP8dv8OqPohnXNlEyIRISG2YMgP4gToI5Fq9qjBIxWuaciBtstJlRyhTJFQBno/1BrfFtOiJWWfaw=
Received: from CH5PR05CA0009.namprd05.prod.outlook.com (2603:10b6:610:1f0::15)
 by PH9PR19MB182460.namprd19.prod.outlook.com (2603:10b6:510:3ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 10:58:04 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::a) by CH5PR05CA0009.outlook.office365.com
 (2603:10b6:610:1f0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Mon, 6
 Jul 2026 10:58:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 10:58:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8D47E406541;
	Mon,  6 Jul 2026 10:58:02 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 71B63820244;
	Mon,  6 Jul 2026 10:58:02 +0000 (UTC)
Message-ID: <91335528-fe36-44c7-8e72-37bb0d4f2620@opensource.cirrus.com>
Date: Mon, 6 Jul 2026 11:58:02 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/24] ASoC: codecs: cs35l56: Use guard() and PM
 runtime scope helpers
To: Bui Duc Phuc <phucduc.bui@gmail.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Guenter Roeck
 <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>, povik+lin@cutebit.org,
        u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com,
        christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thorsten Blum <thorsten.blum@linux.dev>,
        Chris Morgan <macromorgan@hotmail.com>,
        Dan Carpenter <error27@gmail.com>,
        Marco Crivellari <marco.crivellari@suse.com>,
        Rosen Penev
 <rosenp@gmail.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>,
        Luca Weiss <luca.weiss@fairphone.com>,
        wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        chrome-platform@lists.linux.dev, asahi@lists.linux.dev,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-14-phucduc.bui@gmail.com>
 <934f9346-f530-4107-aac3-1cdd2829779c@intel.com>
 <CAABR9nGSRH3DmehUxQVmfJ4Po8TOhfHXDnjjkzVJDZZ1w0_51w@mail.gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <CAABR9nGSRH3DmehUxQVmfJ4Po8TOhfHXDnjjkzVJDZZ1w0_51w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|PH9PR19MB182460:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b127fc0-3cc1-4b51-878e-08dedb4d7404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|32650700020|36860700016|61400799027|7416014|376014|23010399003|11063799006|4143699003|56012099006|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	NCHxvbjgvw2Opi/2xAXeLukzZyqx5I+wUZV6ZX/1lJJnemUnE3M5IGK7t5XyQ5qtbVvOoZ/wo4FbKezNFOOm/j9CGS6eLfxG2jgTQjT40JpCq1RLW/+RotD24w+y1MPbFduG8WKPz0F7la1ACviksOHwqSUh83gStS4qtShJun04Oq/8OyP70j9UP9siOg8hgXgYXSyYTTZCsYvFrk7QDk8iaGwP86T+7MxLAuo9E3zHfhFPcPG4jIra6jzpAPR+/L5Q2r8hD5jKw4VZC2isiXsreNLUu4uffmfcL8mmz1GYftNYMaIoE8UD0zscnDGef5Li9Owm8uRDFogUSHcD81F6uBBcHoHozBUeq0JNwu360Etf1fzviDc341Wv39mwr45lShg63yOmJAkp8Qjf7PGwK+mTG4JF4yv99GJgLyqHk3fuk4xwaM+4k7pk5ydpPYqymJIQFsdueU6SRlgw8jv9PxetZ+Kx2R9sbRde5wdmz45Tv210UU0Naz+4kbzmyM4SwbfiJsOLKSBqYRTE/+Ob83/9qa9SE1UtjX4TWPEBb0GWB68hXA6xV+6iLP9Vuk4WG+B1DoZdG0wIMntWyBNqvbg1aWHPjDEqRN044bJvt1QxhoKZs3cr826kwFleLxHZeG9bh3rbvdrfGxiOKF9pgA2WHr1o68EfYnZBZevujjeZXQn9ur5r8mJV/fYe74Idu/zjgG+/KvFbVHk89w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(32650700020)(36860700016)(61400799027)(7416014)(376014)(23010399003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n19vJnKlizOcO/RiMAEoudJMlBxCBayJ+LDsYkUPu9JstRWDvozzKiBlHmssGsp5RDY1+ENExdJFRPIUwOIj+RptRKjltSlqJhq6l9k0YgUpGKvUUkWThsEbv2Fd45c0MdJkHr4Q1am0m+S/u5cYcDFzPv9Gr5IUxq/9SgZ41C7zDeyYE+7mB3OJZBzmorAZea4FWQOoVtwFwNnNAFpObgn8QqErxEgjJzKrcXz56NX44i44mDqKLDddS2gHXwj7/pA1cRzYYFZQ4gFoVlKjOwNe12RrvThUowURS3aZtCMHyer6W39h/ZcDGBd3H2k+5V8CVVW2awDtZnCOBQSjCmhRIauswgQU+D3AzWxTofNPtB/DU32tXH+UBzG8l1DHVN1G+bTMCnZBuDA6b8iO1FYG5Zai0CUWNQOx6RhFJLm6RnlAPUR3uYQ9oM1NuxaS
X-Exchange-RoutingPolicyChecked:
	s1XdObiCbkfvBssIkN9Cnkf4lDXivHNKuXMVAzM4MZt0mcbyT+I8cBgbkd0/WA6NmauPOhseMKDIlyiuTB7gC8d0QZOP1Px8cE9dgkbsF6B3uHsYKIKl3n862RJVLwJjOVG5A164qIiFyyN8DFr8a9ts12tdt9NRNqAW/m5tBDOSrYTK9d9YA38L6Q1XyoKfC7SLeiB03RsivbF2X7qjQkkg7WsS15nkM+h9GW0XxXeqseqbTISjbjD85dpyUSB+f+Lr7MJi+4/dYUqf+KvF/iy6O2ZtcvW0XYiONltGM1Ha0yzKxQ0sAyO8HoMaRQ7at436eVCgL65Rp+M3KxRzpQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 10:58:03.6262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b127fc0-3cc1-4b51-878e-08dedb4d7404
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR19MB182460
X-Proofpoint-ORIG-GUID: k-1bhoYe4ObYX6mPsgFe4FxZeEHiiD6-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMSBTYWx0ZWRfX21FIuiPy2uOM
 bc7qwyLxyYmq+qMg6ty11RIEFlfER8NMJVp0QPQwW6lpWQXtZ4P9FnWFwuJ5qtjSUjn7uYjhtMB
 xyBq/FY1BI7QpwEa1hFz9y2/QZUNr8E=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4b8a3f cx=c_pps
 a=67drJv3h0MZitt89ot57dA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DmpWY1iSrYWlQ5MLkOAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMSBTYWx0ZWRfX65sexjq7joc/
 ijpqrg4PYPjWTD0yrFMIwX1SMX8Ju3vRcisvuKqDweEkfF1p355IOpFJQ21X0/sY4sJU7ZylzTR
 MgNq9kJ1/oIp/q8luVRlP2Pn/f6qPzfRldaL6LJso5MoHabgXjhkuS0n/bcZrjGeBrBmY+b4zP5
 mXRk6HfZ8H57sLWMvJgmjSi2RSxEdcTIvuU9BjUMzl/UgMjGvgA6SI7tZvK4MNrl+L6QsjyLwz6
 3L4eD57BmgQ4S6hodWUvl2u00LzuoGEs+oBxaAbT3MgugUNl23iYIjqOlxLwAip5AdVkgbOLLNB
 h6p69/x+EHqs66dh0g5VOuQAMqqtqDV8oU5PWXQncqVZfDS1UGZtE+zfzfxROqeZhGiMMb3GCsL
 TA5Yh8WxNPkqZUDXVu40WzsmZUs6MNck/ukb4CT3+WcsfJkhdqvEnvPyp/Bz8Nzb7ZBwXbr15Ph
 o4L1b6/CfPfJB7YeBcA==
X-Proofpoint-GUID: k-1bhoYe4ObYX6mPsgFe4FxZeEHiiD6-
X-Proofpoint-Spam-Reason: safe

On 06/07/2026 11:46 am, Bui Duc Phuc wrote:
> Hi Cezary, Richard,
> 
> Thanks to both of you for the reviews!
> 
>>> -     ret = IRQ_HANDLED;
>>> +     return IRQ_HANDLED;
>>>
>>> -err:
>>> -     pm_runtime_put(cs35l56_base->dev);
>>> -err_unlock:
>>> -     mutex_unlock(&cs35l56_base->irq_lock);
>>> -
>>> -     return ret;
>>>    }
>> Nitpick: this will leave a superfluous newline.
> 
> You're right. I'll remove the extra blank line.
> 
>> It looks like a bug that it checks rv but returns ret.
> 
> I'm not sure I fully understand what you meant by that comment. This
> conversion preserves the existing behavior, so although checking rv
> and returning ret may look a bit odd, I don't think it changes the
> behavior or introduces a bug.
> 

I mean the code is correct but it looks wrong. Because it tests for
an error in rv but then returns a value in ret.

This can be cleaned up now. ret isn't needed because it can return
IRQ_NONE in all these places.

>> The local ret variable can be deleted.
>> Should change all the error returns to directly return IRQ_NONE.
> 
> As you suggested,
> I'll remove the ret variable entirely and return IRQ_NONE /
> IRQ_HANDLED directly.
> 
> Best regards,
> Phuc

