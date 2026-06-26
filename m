Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98913F4848;
	Fri, 26 Jun 2026 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782476353; cv=fail; b=uAZG/iKBfMD1qwCHy3lqG8QK2vlNEjj13Vp9IOIDiKjxFZl+5GO/WwmaNxulq5fD+OSNau6sIICoTFwxeSWBxACRKJLhS8C7ZWqxKDjuz0djtzJjSvj8pnrFwaDVxloNM3ZRl+dPtUhp6V6aunwF/pjxJnO2xdOelm2Yy8m2hJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782476353; c=relaxed/simple;
	bh=5NQT5VwoLpi2pTGZTem99FrARTtWubsOszOP6AwFfGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7eAPt1z38cEsM58CYtJ2nh6OfPWhM6T/ac63iyGf41A98ohMRBBmRfTe6VXbCrMZrL4LNaadXST/EdLba+iKpGFAptx95YsxeJlFODaZdQ/kcnQGcWwCjSD4OI6M61jFk6X2610pQvFIepjMPA/tmk934ksM494bSLgQiyBYr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fgVdBpOJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=V1WDhs8i; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fgVdBpOJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="V1WDhs8i"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q3PP494090517;
	Fri, 26 Jun 2026 07:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=9BvzIm/r9szQhOIQ53
	ARXZrmvsrgPFPLZ08PtWqc+O4=; b=fgVdBpOJPu9uPcvwBfBBLlYG1HAKn7+IgX
	WVOwG0thmhUGFwtVE3VaX8SQ/2pK3O+awfT1ikeavPMg25vGI8Zn7SSXhMs4szeV
	stj/scEw9oYjO5g/wkwYN/CMa1iDl6mUNoUAwM0wsFRkeRtb2SRFhYjfkuZMm/j7
	gxWLlg0vQP6Wl94S8V/zQBq3ByvQ84xGtoLzRksQradKZAR4TMOah6nvtEaR46KN
	jc5YVYGE2lIaS5VM7GmeBCltJszNqTZ1jxjns0EYtJlX0xn/mTs97skIYB1Ddlok
	mbjjSCG5SiOasSH7AVyjrs06IozP+H437BVqVxuotWHX9XX2NJ7A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021100.outbound.protection.outlook.com [40.93.194.100])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f17gus8up-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 07:18:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rV0a6fG4FyjyjNQWvHWRoV6/4nomWf+FDyzK/3rLw+RrDPvK35OUznWyN5MJwn6dW5fJja7n5sED1xIyo6nAlGuNKdE1q0bUSDLeIwFX5pW+9rdjRfr6FwRDut2YSp906bmwuVs65C/ewhkmYLIXkQOafMqtGHfHXtfJUx+YTrGCrgKR3Gv/E2OMQPqqIU3qTPAkf97+YFTKflhPT59hSX2SgR8ovaCoBc65Czxy5Z4iE2AdKiLJ7dLE56kSY7N3SZfaAssT+MdK8ZQMj3td69zAAiVJIFuNd3M9fCgD62HOsTt7SB6bobc6X8NyP4PeweqVRm/tJhneYCfczkdysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BvzIm/r9szQhOIQ53ARXZrmvsrgPFPLZ08PtWqc+O4=;
 b=sm/uu7eNS0X50C0hgvdJphIcPFjXnNxQT4Yrtxh02y9INB/Slq5udrbsfyfd/YWiVn26gHl3UA/cJc1veU2+4aF7qirmxHpfMuKG+GjR0Cx0f8fOlj7GAM+EH/vVlphAr0YIsISE63LfU97idVau4wKJ+vIZfV+9HNtJ5hp+OfVmsWrjK3/2zg6rT3GtmxwKGH/WOrW50lZ8hLqNEmS/MDARMF40dcGYjCI6wewHe5kKIdQGWNgJgduFmBD6F8/6S4EHMNO662rCPak73KmzD4dWJ/ZG8cQpmNvcEBTOoLgDg/f+6oL5OrkPXDmZeDSHzWE/3ybT4PqsjEEtykD8rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BvzIm/r9szQhOIQ53ARXZrmvsrgPFPLZ08PtWqc+O4=;
 b=V1WDhs8ipA67YNZgHCAsYjG0W20CoxcARXvC87uOMWZjT+rX2EIt1zI2zLjPmkN0JS0rMTc1t3ocU5VjUkUaN3XHEeunY094jZmd+oYK10rkxud03PLdvoppJilJV7kokl7cryd0Qe9w0yUM/iuY96dmmeyhcdKBYNS93OHilDk=
Received: from BN0PR02CA0016.namprd02.prod.outlook.com (2603:10b6:408:e4::21)
 by BL1PR19MB5890.namprd19.prod.outlook.com (2603:10b6:208:399::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 12:18:52 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::1f) by BN0PR02CA0016.outlook.office365.com
 (2603:10b6:408:e4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.18 via Frontend Transport; Fri,
 26 Jun 2026 12:18:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 12:18:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 59C03406541;
	Fri, 26 Jun 2026 12:18:50 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4D97582254D;
	Fri, 26 Jun 2026 12:18:50 +0000 (UTC)
Date: Fri, 26 Jun 2026 13:18:49 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
        asahi@lists.linux.dev
Subject: Re: [PATCH 14/24] ASoC: codecs: cs42l42: Use guard() cleanup helpers
Message-ID: <aj5uKXN0FRnhvAq1@opensource.cirrus.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
 <20260626061329.23264-15-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626061329.23264-15-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|BL1PR19MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: 72575c63-530b-4a92-fd4d-08ded37d15a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|7416014|36860700016|23010399003|56012099006|11063799006|4143699003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	6iCZPFXNv07HKEw9JQqdYiYi9oFdJElfKWZVH5PVQF/Wrd3cjeoopkX5iQfaqadSeMPyIEQfrBj9M4Ck1vmMIw3eTSq9nHQaaXr9ihL/nkvgVQDgp+wx4dzavfSxdb9OGT2dvoL3F3H5/SxmA6ybKVBiRgmBW/nFKjtB8ZxfWXXZTIm46fron+ggJAUm5oDjj+ljYBkRZth2rsEqAwILBeVQcK6m34sX66Ecm4XqGBnODMU7E7woRCxr+2nfWq82PZ8Hub5XxsmaL7XHHwwh7hjLpM6NopOOMZ6YMhSVg8IV4H1DLdtaqGIZMlbh6DAHJY3qhkPO8gWZqrrN6jfXd5VE7+PVtadUQCwB+Wbwnmmi/8P5Eh/MJmtBHnSc8cjCFFHp8Oc2yeKv6JdmiZKT/eBGOWq+m/C8jjeo2/Jksn8nTK99cpuC+oIb0prkHfHjPY0FcZprrSyK45TGR4soCH7Ei0vqy+QS1k+mC0MZ3JbQTAS8sIsWykeTKGcnmATK7nf0FeYE9kO/sYtosRx+1fSeE2YD2QfW6IBkURcqfMqyFVZdqcK8bbSO9qse3SEJyS8V2MUwzb866AOnLlVUl+/+nhcFLKSjK/E/5kXi4sk06lGybr6YyyIneXwQ7GUfM/FVzgd+KVKw7dXGfrpi9T5IeWfTmT4aepae/hlagR67pqFTVHI1E0erXkBI4uJZiawoRlMIGaJvr+zyeLzy9g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(7416014)(36860700016)(23010399003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	++SCxGBz7P+RqfUoweRv+xTUfd1T4mmoRcS7NfcuGi6IujAOhTVKLg429x7qWOPHbhDjzx4i17RF894g1riSlu6ODHtdxIztGU7uk4D7IuY/wh4Xpuos7u8SLoBUESBjKoAwuGfvp5YJ0zvvZtSCl9T4lEnTEce1Sbq1svZx44BjCvAqfoQmG+hkdP9mhD7+nv8b+TZFH9o269fzOmU3qzBLXuLAVpJ585nvlxI4rZLKNMNAVSn3AaGWXmW7h9sVGVUwaQN1mQgVF0V8OMU5MxuiD0tYQEZ0y8NkyyLTh9PpllGMdYinQBk61O/zh62X6Gk9d2m8VoDo20Va6Cc8x9v1chwosP7nHqA4MOlP972OZYm+sSkChFPxmWoZGpjUcRAfHIamFoHRsL3rHozGvF2QalNskzgNQvNLMTME5bJ3E+O84N9fbxeWbOXZD33E
X-Exchange-RoutingPolicyChecked:
	o/xd/U8FGQ5lS4ZjTdiknnjszPBUsCIXtzIfUri7icwE/4CZwSsXQuII8CNuoDb2TpHfFGEFuGAhnZ3e6jnrdNXsz4ZBasJb277GuLn3HIJHLDFjRbf7pgfMvgyLSVMrOBGANiuwlryD3+dZscX00vEbaIAbvGzXnYrgaSrVUsKwI1mgcfz8XlwWvyw+EsQVUqd728O9eusdY3zZ7p4M1n/kBV7wAgXuK5g2F056woDrr1TryXvF2KpEDau2wvlvk0EgDdiE+8C6mgnhPTMHztWVIiocYlou29VUn5WZa5MmJ+Fhuw1gN/5yVuV+ROkgHYcxG2xke6CbAV0kno++Lg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:18:51.8427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72575c63-530b-4a92-fd4d-08ded37d15a2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5890
X-Authority-Analysis: v=2.4 cv=ZbEt8MVA c=1 sm=1 tr=0 ts=6a3e6e32 cx=c_pps
 a=q7lH8giswqu+5i8oUQ1grQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=9qsDjppQAyebv2Ev5vIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: ebzPcqYMCRseeR68D_573ZZFOKgjgi_3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwMCBTYWx0ZWRfX1M5XhI71Dq3q
 etshUyayfVSS2AH8VXq1S/3BPfKbEmYKv474+StSXTxonukU726nZffC7uKnFb/7HlUyxNfYTEx
 c/eCPF8Z6OHSc1rOMhMa6h7E5K8mQQ0=
X-Proofpoint-ORIG-GUID: ebzPcqYMCRseeR68D_573ZZFOKgjgi_3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwMCBTYWx0ZWRfX8atg3sRJtnH8
 nMBylfVG/7QFEYLgjSUhwMz4ba/SLt2u86QCLIKxhrGGgXXzzlfEuxQg9McW+BOjRuyhWHj6kQU
 tyBDwNcbrVxdTXJKpDtO7oGrLXrprJeih26yWhfwyN8vLQT5h/lQrAFh4M80S8BOQ/vdFH/AGqM
 WAxdlKlUo8nsczqnVfcSd1th/POW2Wkf3bU3YKtp6M//Pc5YjhS5KPOBJRWvWM57KwwkzKQkBB8
 FswrBKT1z0djbszqFG7y4dP5X+Xjm+dgZydGcyo6xRJoJ7onoidSzm51ymsGimPWHpDYoDWlfdv
 mJoYC0T5N/l4vonMFkTR5bhcnd/ZcVo1Fy0My8AHJVu4264n5EOs58+Zk1CMtM41l8cdpzozKsl
 vdTNZEt1n6veiEokdfU+7el45e8mp6pRppAl3j6Zey7PlON7PTfWyPX1ZHvAqo3to/2sLHDsOLg
 4Iow9yu1P049h3vGCwg==
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 26, 2026 at 01:13:19PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() helpers for mutex locking
> and PM runtime management.
> No functional change intended.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
