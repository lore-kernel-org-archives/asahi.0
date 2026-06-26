Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4223DB327;
	Fri, 26 Jun 2026 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782471421; cv=fail; b=L1bVyE01qBEt7BVOsGOIg72x8Kh4rgaS9x4COsD4CC4aci84G/2yrQTLI1/9aHfUr5+8o0JpT+mzSj6tICRAFHdTFQrP/4Lh1CRCjFrSX5R1dLDWfpJBPlFi0Pkbvlk9+50rhYR07AlACcSp/nFCZxQ7q5JGciKZct6ajf7wWgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782471421; c=relaxed/simple;
	bh=jss2ytMZQ3S4AimZCg44rm6S6PBH8BUN5L+SJos1krI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8qT36/zle4Ixepp5yWRWQXRAldYHx4Arc3btX0bvy9gm4eB35YRkW46uIC5Nm750MhJ7f0xkJ4ySevO5AFcHuAY6yg9WutK0SiK7//ZUboyWT4qssPFuk/4Kxqi3kORmC/fsoXKgQ4ox6BNY4n2WSi/AzAeXt2c3S7vH9P0ifQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Tn815IUM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QpBVMpFE; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Tn815IUM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QpBVMpFE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q3PP054090517;
	Fri, 26 Jun 2026 05:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=SgIKQME56K+HobwCng
	hdlZ6vZ+7qOOfnnefvW2bDx9Y=; b=Tn815IUMWaKuDQu0YkSBN8dvZnCsoz38OX
	ybbSbo7SoA6CLRHOxnWisCmhC29O0z9RsYX0dqKbQRWOFWROzVpXkxgqIusmAjVR
	qF9VE6SB41BJTi9OnVvxoSbr3rh5JgI6SwG+oNRWF/sXmJOnFqfQ3oIOwhlNlXlG
	/HfdJPnpCUX+VAqVtL5lhu0ZeUKKpnUogxC3GzX7sn9qVB3/UVWTpiRUJQl59tSz
	YMPaZMpIKrshy4V47z2OHC0caShMSpFsFz4+bPnmavmvzWFqtyMLN5oL0p9Gt5Q8
	iWad+DheVbmUHyRChHWolQYODmhNsFcVkfIa/etsBvc79HvWEd2Q==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022107.outbound.protection.outlook.com [40.107.200.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f17gus656-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 05:56:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9BQ0YRcGef3Lj6xZjEFoyirQwe8+XBEYJOfg1FBpdbwI86WArILD0waohyMEt0w05FEXqm6ZS1wgGtpgLqNbNgE8YHtXBdZRby3Em1NivXKLp2/l5MkvOJJvgN2WLBilLKE+o/gPKp36k4LHSJ+zLSnib2ZxS9fSVSXoAJYHG7TEWwPKUxtzVAvkKaxgWy4IPyapBQc5RHUNwKMp9NuL7BBlYQHZkd8y6hpsooO14+6/ZdHxTCHYiRmIY+aWH7nO88sbKA0+caY6gpC9HaFSNGKxOmzRfF9V4ixiLecd6K/65bn4PqkHHhAhPppK7QobgMqEK6tCIVqIVZsGk6Aqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgIKQME56K+HobwCnghdlZ6vZ+7qOOfnnefvW2bDx9Y=;
 b=YljZS/7ebcjnDbdpXPmxw5C1kiDofRz6E1KEbGqzDmOM/iLAp0YZNyMPU4Xf6y8qBfJaYI/i4E92Pd+UITcVOMcXWfPE5wsxyBo39dcLyX9wgFZ9lDnUnRFStKzLRAo2PTqVSgTTkOeRB3jDDsHZLtL4w18c2VtzZTqh5gMLvnUPn0imPy+RRqCLDg/v2+FwEW0JZBVsl7T0QwZakAPJWRTWEB/9SpDnl53Zivmu5FxzhvrJEFMx2+b3dTNilTk0/6OTpN9pMXnwV/kzjGDyqJYqfJFYx9wODnK9e/ktlCrA9HMI68Pl1BMMprzhOO+urOHEIS3iLCXJH8oOhlrOQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgIKQME56K+HobwCnghdlZ6vZ+7qOOfnnefvW2bDx9Y=;
 b=QpBVMpFE+A2Z75Unk8Aovf8fzmUKKgxw02baGtF4btKtgvA+RdxSrG+EdPmyav+T0ME9crSW9ei5yLUodtcCUcyvdGyLe7CLv8WWX92pkr+0eiBd1RowFdzhYYzjV+0NXB8KNYAk2h4d37g7CNaqba2o2qsNhRHPPGM9rciispU=
Received: from SJ0PR03CA0225.namprd03.prod.outlook.com (2603:10b6:a03:39f::20)
 by CYXPR19MB8334.namprd19.prod.outlook.com (2603:10b6:930:e5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 10:56:49 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::5d) by SJ0PR03CA0225.outlook.office365.com
 (2603:10b6:a03:39f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 10:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 10:56:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 446A6406541;
	Fri, 26 Jun 2026 10:56:47 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 37E1182254D;
	Fri, 26 Jun 2026 10:56:47 +0000 (UTC)
Date: Fri, 26 Jun 2026 11:56:46 +0100
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
Subject: Re: [PATCH 15/24] ASoC: codecs: cs42l43: Use guard() and PM runtime
 scope helpers
Message-ID: <aj5a7pgaDoN30Gs5@opensource.cirrus.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
 <20260626061329.23264-16-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626061329.23264-16-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|CYXPR19MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e5eaef5-570a-4152-f111-08ded3719f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|61400799027|376014|7416014|4143699003|3023799007|18002099003|16102099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	YfQPXGkQSNFin3oEkoxAP3m7ljpAMRdEeuMsuTAEMMyRQ4SUgicTDKmnbReygaZfk5VPHVQLNkPj78GeDhaSY5MgiIJdVZqtc49tlhVVrlQUpiydlt7PkDysfeAPtB8vDoEbO1DLMgAqB863r8DBGSK6k56cjqDWwOfYUYbeHbrvc9JCfKBynjd8/Hm125jJ6uYAojataNir7xZnf4kYF+m4xjljl61Azb2TjJo4W9YJAdDf+Wqyo1stAt7/wGQlwfaS33ZgWiQJANTahBCUl7YkQep5L+KNGcVtIUMrG/co39xd6wwAZGPmcnK8W2zFO1gmmIdy5h5yE6nRtm12r/IYui0k9pi8F73wpCz4oqsZl4FI9OlTbMlZLvxyefGGbom37ZJ0KDUDOf42InWAnOJtkYTYIGNV1XdrZ+3ihzRMq0rPKROUbHvshLpbHxBadFmd9mB5Hs7yU6JoCx6CmG5fpOuSOzWjbmiUoda0HZdKS2nV7OKP02CC1eoyMkqor3mCw3YUwvrkMiyZHTG3WUJmTF8/MbG8s0RfDususWuAdDhXzNNGDEM1AUtwUuOYkOo/o2VO1BJ2ewGhb4uEmUbeirUKAP4+dO+I4T0kGzt36wF3nKm2iUXq8Dy7/tO7R4HwVtJ8Mj5Ht522TYG9Ma01n9Us8ovEoKtUrQjHqm503gXt72T+Ma/gV9NxXoDOeXuGIVxT64DdA1EwLqS06A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(61400799027)(376014)(7416014)(4143699003)(3023799007)(18002099003)(16102099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PHIQhzbKcGvS55Pd2y0I4vO0S61QFgI5zajYJCg4tYLk7TZ2/9dTtWoNJQRYjxMHojkIUv/xRavGf67PFbpW/bAm6RNbD7IsbWhz6rsSnTVhgGTi1H/awHmEZhiWZ+0gByoWyIlAmqn0TDiRU6hxtoM3QB3SQFWIUvTWTws5UAQ8TxRV+vnZTZwmE8gRcEdk0QG+A+dqWuVWLwqdwlRmSZmNI+2T5WmYVmy/TmSJQUTS9969f2rVSMf2s3A5zQimNkTJvRoapGCv1DQ++aVFFmUDTul1cHAb7C+14e+gSw+dDYyJxtW7I2KXbkuUbJPv1jvfR26meLltoavWs+FeFZtwjMQeQkwhURGyUS6b3LjcHL3Ckh1b6UI7IMGG8gjXHDHm/+rXKf6pka1MX5sZgUCGNqvtYfVaq2cam0fCTtOIU54Y/bBHnnrWupVkPXC0
X-Exchange-RoutingPolicyChecked:
	c1HQoRLvK8RhM6/kvmrpQGTFhl+Q7bysVFKpwsWE3i7GDRcdFqIwcW0U9hb16xb/4HYWnbpY6KjxiOjitXFEHglcgLyfp4mLjBqF58CPGVZ6pjYNxInsizLS9GkHkmcySvxZiHqSZeGkijLpsiKSQcmic60FTTMlcZaePAg951sdQgBvkXn/mtzKGDN2VKbBu5BGuj8Z4o3aHEEReCFwyyw1UredLAaeZ5cdr5L2+AU4naaePN44zhbRpTBX8lJCSjEoaSARZbVX9eBUZosCNWKTNo0ybbXeq/iQwhHRjhm7c7aWekGx53p4sow/UwWAF428F49hM8pTbQ6wubaGcQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 10:56:48.6693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5eaef5-570a-4152-f111-08ded3719f42
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR19MB8334
X-Authority-Analysis: v=2.4 cv=ZbEt8MVA c=1 sm=1 tr=0 ts=6a3e5af5 cx=c_pps
 a=TrU/2LxE+ZX2LRvKjn0IHQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=RdyYmrEnRuE0-oTRllEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 5HRERarvqfjOtzXKBeEg_FEVB3mlfRDk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA4OCBTYWx0ZWRfXzoQ/QL7pvlin
 D0aPP/80pz6SuDchdhpowJSs8W8APaF3LiDCOn8k9IWayB8T9RnbzLaF9Z1GxFvxjcCDNA0uLTE
 2Hr3Za8V8HO7jxsaB7R4cAWe+8dyzZk=
X-Proofpoint-ORIG-GUID: 5HRERarvqfjOtzXKBeEg_FEVB3mlfRDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA4OCBTYWx0ZWRfX/zGQi9NxMNmy
 gn6gwT3Dux5iWYfsjUzWI8fSG9vBGEY8xxFbH+waqnJYO/uGzrHUwSmQFm5P2fJSZj0+lM42H5I
 88AOtIrAkfLu0b/PI5v2HNwjcpjXeS2TsljlGE+khmG+gS/3VKxDUQUzNMzyj6i1wIQo8aQti3F
 5Ocsq99L3yfHW74+heX+umAH1+Lv4AFYN5f1iALCihs3wYG5LNxkCMMZDKAWipAuMm6eJsxy3lx
 vWJhqXifDOumBKQ+TG0y23ru+A7zkNx4ssqKAfwunik/wWxPRMY0adOl8o0uj5ciYEadilxyWre
 QfsUkmWw+oLb99GYZ1F7yc7Mpmg359WfCCkdI8/5DnT0Xo7xHo3Dhzn0rXKLGBmeQbrVkdrO0QG
 0akJn4B34WxEYzaXlnCgCtbshmApvKDXizgAWbHi7r7qrb8M9NpnCc+xjzNh8g8BD4JfZ+H//WO
 2wIoKtLnrOqFRnBVd8Q==
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 26, 2026 at 01:13:20PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Convert mutex locking to guard(mutex) and replace explicit runtime
> PM handling with runtime PM scope helpers.
> This simplifies the control flow by removing explicit cleanup paths
> and unnecessary 'goto' labels.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> -	if (!jack)
> -		goto done;
> +	if (!jack) {
> +		regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
> +				   CS42L43_JACKDET_MODE_MASK |
> +				   CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
> +				   CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
> +		regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
> +				   CS42L43_RING_SENSE_EN_MASK, pdncntl);
> +		dev_dbg(priv->dev, "Successfully configured accessory detect\n");
> +
> +		return 0;

I really don't like this duplicating of code blocks, it takes us
to a situation we always need to remember to update both blocks
in sync which feels like it makes reviewing future patches very
error prone.

Thanks,
Charles
