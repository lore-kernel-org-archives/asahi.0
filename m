Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F0B1A681C;
	Fri, 26 Jun 2026 08:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782463649; cv=fail; b=B2PSs50RfibVE1ZquYmbuuIr8lIv1u8RnVKUJSyqANwqJqbdYP6X3l6l9snG3SzwoasimjHRhxIq9u6iOxIdET/hR5NGH3nFn6hhNu2pBpUhOHmfZ73sym4w70gN3h1lw0gpBFyEOdRrWCcwMVg8r1SRCaU1EKd21HZNRCTxsGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782463649; c=relaxed/simple;
	bh=xGMQDgzATJIj5j5/sVFqawwUpQOC1zkGI6bkzTRqUtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALeUYp04ayzVHNlJEERsX4NsUbqknin5TIsxW3CwDoOiu68VP8AxekDvQzOWg5+O7HdPmfznUjiWTArEyfF/mvON0E/4B7AA8F0hYI2K3PFdc6ZpPDr6Y42QkhLTJ0q5aVsrqxhmLOZtSlXBpWXEHF2HFbDnGa2sPP27FqHiLF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=T90nZRlc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Aw5JsMJM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="T90nZRlc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Aw5JsMJM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q4NNc34187582;
	Fri, 26 Jun 2026 03:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=RlFgZ+DSgqnpf0S6doo/DJzIvVpYEuAoicBlGWh7YB0=; b=
	T90nZRlcZDpqIImQz0AkOvK6x9TUexpfRDxvztyIK0U5MdfEAGF/cnGkJ8BZ6q55
	d2oPvcdO50a1690XsHdYMkmcT+bktAlv7u3Sj1nf2VCtmEFmT+wLl17czyDb6C39
	OXy7en+QU7CrZGoc4t7kG+5TzH2l0gNa16LQ/nNyQ0WWLhowh4mxxFzHanqor0pr
	Qv+Jv1CAm0Tgp51URdcyqml/5hBUylXx5l4/iYyZqVMyhvk9wPjMCJFQWAAJcqzw
	BbTyK1+2iJ0SjkX/AHkRyRFYzvNcx1EHVH19ThfkaIc2fAWV0lf15jMqO/sDdl+T
	74+RIegEHEsKCN6GqHqaHw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020118.outbound.protection.outlook.com [52.101.61.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f17gus2kk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 03:47:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5AJzYNqRqw5AA8Jqo7aUBWG1TdL8BZrSksinkxd2BV1v9VZY9ikwoj3+3LNFIDgMWcv4RmexKgNv5vR0/LdYfOtqzxfaPYnB/ivu2FwC36acYJCmqTgDqcC841V6cI+A1S/uE9WvsTi2UU5ibkyl1xxGk8u+RNTiKASBw4LKo1KAU85e+j4xDEsF3IO8/f98AJ76gYgcBfZzJ4SQLPEy0BUGD/lCVHhPMqHvVzbjCVtOvcvoEF/EZzVJb5qN5nn2GNpz+GzD31dclWc2EW/Esi00Hf9yIcx9Lglc8iYqzw11NuLxxaz3rnqh0wQoit0uQpZJRLvVaL6Jmz6Z7RxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlFgZ+DSgqnpf0S6doo/DJzIvVpYEuAoicBlGWh7YB0=;
 b=aSTJut3f1apQr/SX/ckkWyFa6eRaFpMUheeXyIZ98JvdvrAMpZ7dV4rHXwLLtn755MzstPjtjTrvbiGiWrVLgrXpg0HHlemfUePnN+r5UTNUn7I5Jx0U6tpodKnCE+fDbeE2+YRrKN8X+SIwsR9UrLB1R9QOyssnXYh+vTl4FnR8820H9IUgsOgAvoa1uCXdVMF5xdYWViE6EYdpdeH8ky5/kffL+eOI+c7QtbrYzVRUw5E7FuC6ASnSFLMb8T+B+vnGoZguuxFyXVkVIR/9x733dWWyHGZn0hkliYfHy3yurbSGVpFxr0STIUGwVfEQFx8Hxlf61rklgbNJ/hJ0DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlFgZ+DSgqnpf0S6doo/DJzIvVpYEuAoicBlGWh7YB0=;
 b=Aw5JsMJMnlqDZ3GcDZsDqGyjgiBbMGm5Kr0sPpF/WOp+8ozzBnAdidUvE3ZBDUGV/pb7t2Xcy2VaFWd6oUsVJc9f8Qj4lBEdVURC+QU70d9IBurPy1bW0B2WLvXXAxMDQ+XyHVJtu9YKCWQzSndFDIIOkT/NnyFAONKDRPqch1Y=
Received: from SJ0PR13CA0101.namprd13.prod.outlook.com (2603:10b6:a03:2c5::16)
 by MW4PR19MB7175.namprd19.prod.outlook.com (2603:10b6:303:224::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Fri, 26 Jun
 2026 08:47:09 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::94) by SJ0PR13CA0101.outlook.office365.com
 (2603:10b6:a03:2c5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.7 via Frontend Transport; Fri, 26
 Jun 2026 08:47:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 08:47:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 88457406541;
	Fri, 26 Jun 2026 08:47:06 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8613C820244;
	Fri, 26 Jun 2026 08:47:06 +0000 (UTC)
Message-ID: <9a31d81e-5656-4525-b5c0-89b02f179cc8@opensource.cirrus.com>
Date: Fri, 26 Jun 2026 09:47:06 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex
 locks
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Guenter Roeck
 <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>, povik+lin@cutebit.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
        asahi@lists.linux.dev
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
 <20260626061329.23264-13-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260626061329.23264-13-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|MW4PR19MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 93832425-74ef-4bcd-0b80-08ded35f819a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|23010399003|61400799027|82310400026|376014|56012099006|11063799006|4143699003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zdWvZJ2OA+TfcCmosEmvPu/TkRduRfatQGHnZMAzaZg+iorLFkZGAeyJmFhAclup9UmDC885mImbBBBr9N7Bum7XMbDmLJlvlh7EwUkwjUe08geLHmwnoPS3lZ/dQhZ4+CcDJw+O19i3QSCB7d0kNS8MecOl8Xloj8a7rvkEZiVuwj/XQsvKtMEWoKd0XadlWI8hbpeTTY2wFooJZOLfM2SHKCqOtDtkeIhpgXeESrezlyzn3EtDA6dxlhMlGf3ZKwfaGpv1b9GUPY9+/yUQGa+xiO77APCdsqHNI+pUowVZTHBnXBgNnR3i0CWEBRk3f6BPRGAZGoKznITjHs5P9DYLS6Rlrs91QZK/qis9MCFWDu3Xv40AvU0DZsRgPoDXypqnar3Xx3/0jC0TYGtp9+XmlmHWi1/VEFWkD+juatmjuH2LCe/m7qB1JKz/up5W+0QQ3ANfQWtM/3uJIUVjxzV1hu/xUzjYxVt3fYoshGfR3UIYOMSfmtdhRRZ32tPa2Pyf3I2/0jaiUYAMElubrZoqTVGkXoi1P608Hgr3DwtB4B1BkmEeY5YImrqd41kbqgHRwRpsu/rRlYKeRXbeBjdaZ8fg6rtbLhhDMXdtaWh1i+ciohHS/bz55FR6vrrRwCA1gk/6SqMYVYL3hGF9w3UxBHDShreyR2elCgZf+L4KZRc0L5k432GSHa2YocLplSZBh0iiXX54Qhvq6nzUNg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(23010399003)(61400799027)(82310400026)(376014)(56012099006)(11063799006)(4143699003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6KauakS6wmZcVumRBhvLkCB6iGoWSRts2TxcoFCC50EAsF0+KXdewPwrcnZKkiVW8AWiXs/P4NX9TA7/B1Zg9xbGIaoBndrHL/mPNUDxwDNe3YqfSRw7tOdVKpNHlLn14kQdnLob2tO5sEBq6RM2srgh7/IOLjus7f/Of/1H3f/WntncZtM4hTZ5sErnYmy7ELQU9Uxf4jMG7i82Jaahs9UEiGtK4YrAzHK8gubOPktXyVFKEJzOjuFXGJj6lzkIuFXjVicoQJtZTIbdZuV/N+0pforKyCMdz9E9zyk9jQJWLASJA3INT61F8CbvhC4L/dseMeCxgKcIx4+hcvWj46J34R6NKYcZbMGaNjEOY+fdvkdF/jsBykw6eT4nKJ/JWTm9SGFGJ3Nzpf2Z0n1vsGASr0r3gK0x29WrNVSNZT1aqEbEeT7XmYxnT9aXRSev
X-Exchange-RoutingPolicyChecked:
	FQX10sGBDS3Y1Ewhnz2du38CoETF73o9PsPlMDn2Uu6wFO74Gym3I+l5JPaJDp+iYIjfMRUFo89S6lLjJpGKspmE9qNds5uzqQh+XeUG3QDuhT5PKHXgnELLTCz+KjfrRIpU2C9DlA9BYgiTY1rXyFZFQ3J0Ud0hj3W88cM+dDHsQrbkbpyOs5X0w61GLG5jQY1/Q0EHA6hgtW0SPhQ6UK01f7hEmB49LyI9b30pFadYq8cDGXrYFOK894qD8+pmQvnVrCl/yjxMgqvRoMWLRjOVzq/M6AbsLu4qQTXuyP9HW/UdRGWNCI2OvMIz8wagCu6+8KePfDOPNawHVmc7tg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 08:47:07.9682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93832425-74ef-4bcd-0b80-08ded35f819a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB7175
X-Authority-Analysis: v=2.4 cv=ZbEt8MVA c=1 sm=1 tr=0 ts=6a3e3c91 cx=c_pps
 a=fMm6ob6OrxBSxP8bamoiPg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=YzK0GkagNc5e2jYrGFIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: _zxQc2DMeAIDPyUyfM8MXfIXziJ4ECHN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA2OSBTYWx0ZWRfX9f/u9HR72bgl
 4I+X106wzOfxbNDDASOkcrQQSpUgXKDsDql7EwdkywsQvTCqas2Kf11MSsfrZ/Urs1ExVCJxGAP
 R+dhi2qkgmDKRWqi1WZQUfFgPClyMoo=
X-Proofpoint-ORIG-GUID: _zxQc2DMeAIDPyUyfM8MXfIXziJ4ECHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA2OSBTYWx0ZWRfX+Hg32mBmrdCa
 zfxFIK/dxWY+t4M6KLjmqadunWC6YDLM2iB6GbI90puWrZpeTJqzVmMDWc7Nk53chOgfpTjTtK9
 ZJFXdU/pntT2GxGkyX4dnzLXYjP0Bh67+j1f8L7JC6fZ4DHYh5Lo71I2OLzFZu4XwCAQYg6OYw5
 l+mJ+Mx/TjPXgEiEZ6zdVVuAMTLb2OeBx6Laizu6Lz16zawQ1PvHcgUu5PZQ88Vt3m/aQO9Zv8X
 Qqz/fZ2GAtHIW48y/3IAbwt2AD5RW0tY2vkJq30P6SM71Kjj9X+d10QSDqHpgbLVSVCEX+TCU8A
 cDG5hKVCnuyP+DfIj/2OSTpzvJ5EmVseDvMljZR68Bx+BUSebrGvX8IaxCd33ZEODTwXRtb+TV0
 r4+aBtYt0bbERxOdh36kKG2TuFa/SrSuAxswusobcarEymZYFjf1V6UirAf9By+IrZiNr8aWg6m
 ItOBgq3J0Bnr4R4ocCA==
X-Proofpoint-Spam-Reason: safe

On 26/06/2026 7:13 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

It doesn't look cleaner.
But anyway,
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

> ---
>   sound/soc/codecs/cs-amp-lib.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
> index 371e99205b58..41a9a5b005c6 100644
> --- a/sound/soc/codecs/cs-amp-lib.c
> +++ b/sound/soc/codecs/cs-amp-lib.c
> @@ -7,6 +7,7 @@
>   
>   #include <asm/byteorder.h>
>   #include <kunit/static_stub.h>
> +#include <linux/cleanup.h>
>   #include <linux/debugfs.h>
>   #include <linux/dev_printk.h>
>   #include <linux/efi.h>
> @@ -83,10 +84,12 @@ static int cs_amp_write_cal_coeff(struct cs_dsp *dsp,
>   	KUNIT_STATIC_STUB_REDIRECT(cs_amp_write_cal_coeff, dsp, controls, ctl_name, val);
>   
>   	if (IS_REACHABLE(CONFIG_FW_CS_DSP)) {
> -		mutex_lock(&dsp->pwr_lock);
> -		cs_ctl = cs_dsp_get_ctl(dsp, ctl_name, controls->mem_region, controls->alg_id);
> -		ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
> -		mutex_unlock(&dsp->pwr_lock);
> +		scoped_guard(mutex, &dsp->pwr_lock) {
> +			cs_ctl = cs_dsp_get_ctl(dsp, ctl_name,
> +						controls->mem_region,
> +						controls->alg_id);
> +			ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
> +		}
>   
>   		if (ret < 0) {
>   			dev_err(dsp->dev, "Failed to write to '%s': %d\n", ctl_name, ret);

