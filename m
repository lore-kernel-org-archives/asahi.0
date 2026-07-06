Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E04F3F6C48;
	Mon,  6 Jul 2026 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329584; cv=fail; b=OM1Stv9fTb0e4z/X0csh/lc4Osn9bCuMBLlSxtdKrsPC+UZ6xj2vGD/VltcaZReb0tcgc+iuRhmejZBcgVL1cQXmaudQmgYWrPI8WYxzTbim7pKwiHjO0ugMGRH2VQeWTKLJYajvZzWk4NxsF63MfcOuzspK5G/Y/lNXRSwx0As=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329584; c=relaxed/simple;
	bh=LCCEZfCdNw5k0TdtxvAJPCaK3/t5FnxvS8SYPlXA/r0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qGhwn5H1QK3158txhepIvr5rn90rnY1L8qMPsDevlFohZCNpx1AUfym3Uy6KHsurdUL1zYCpVzIkE7QQtpjMjw36vVVH+NESUi9NWp49xHdWP3kPKCpwgOOjqyxuXnqrUa/pFt+/X8FT0Pvntc1VaP9/L6oplJqgycodPZ3qRhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gKyJOhUW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oIssY5g0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gKyJOhUW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oIssY5g0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6664tcMB949871;
	Mon, 6 Jul 2026 04:19:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=d6y3QbxCjM/8F5W1xkW1H5X+IZzeg50G8hs6ShGvKTQ=; b=
	gKyJOhUWP+uWVX4Gbqsiox/RDPBULDG3mqN4yh59EsufOKB0/137NgVRa0Ho8bTO
	/abyogPFoSpnO+gbZnF2DJDFCiiUmvOV2oY+14W1KiOCo1j1BCG/0VDkHVMU5+Ni
	3ZsdxMfVy6dEhDwokEskjLmAKqYvJEgCVitc+WgnyI4EM3imHgcMbqCUlpwpF9Hv
	UlCMLEjta2c/G7BfsbMtDDj+mBAGJJ0K2pAwKAYkoKRwLcgXwYWAKWBZ4zEgHLKY
	OrXvS+naP3lUfU/h/weEydRaC76yVqM6vb8G/4QDm7O0wZVbjSi5C3xA4QVdhA81
	hTg8qfPI01yfYhLXiRW9Sw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021107.outbound.protection.outlook.com [52.101.52.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjj3uq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 04:19:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gnb/PAhl/EceV4aGEZY/D36+rWgY772JBN5n+tKsmlZNnMsN0WtIeKO+9l81wVRhn/gWiWSxvfNnRHtDQcLHohWrrBL6iC0KsKbSUmF0P8EmeOQDi8iJfBt+lVmFyAUivI+PZ28J+I22MpBLm39eKhFYvzANqa4usAyxBBlQnmaMHutSRPL+Isb3n8XuNPcuCoi5m/4dv4b/pbMRDCeFTaISsKzamSeIwUNCVk444LOcdX/kUe4M7DaH1pcSh+RZsF+JnMGmL49tITV89MZRSgMHQbSqsQX6JLcEwwtLSpK76RfVP//zyXMumXhjuxMuXAt5Va5gsHscLD+LnWRGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6y3QbxCjM/8F5W1xkW1H5X+IZzeg50G8hs6ShGvKTQ=;
 b=IhxNHKxChkFrIBEwBXN1nYWaXsXPQ53Yom3I0JCqRt6v56x7827JG6YwuFOqpVStNwuui9IRJrnKI/iQ4JXBbRXKprE/90wHCIdEhP825HhFl6FjsmN3DwJOOobJ0GubTvcVC7ZvOPE223p7xYgcBVwnlv46sD2r0lMfGXQx8fQqrabOXvC96K0Q1qN8YJO9NoAhcJIKYNuxod5/nKiDxEhydAB7gSQo7JM/0iZSJxWJmAqW4aik+0pyATl+SigBUVE/me3tdNiG+x0mGkCsop/o1tE2QwjKiJIpiJ3tA18sv5rPbchgdYUr9icxC4b/Z3sk65aDfkZeEsDUP4npvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=chromium.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6y3QbxCjM/8F5W1xkW1H5X+IZzeg50G8hs6ShGvKTQ=;
 b=oIssY5g0vi+fKMujpleECgCTje4P42Rm/TXKaxyfHAJn2ocw2pBiCOMx+3oJgB7XLpkkKMaEC0lZp8gO+KNFq0d5lDlyFEWMRvkHastS+OVfwih7eQjzAxfSlxbdEUnmW0Y2+uCMI+J1yd4CIAnsfd5mNzzIp9m36e1kZ9en2/o=
Received: from PH0PR07CA0019.namprd07.prod.outlook.com (2603:10b6:510:5::24)
 by DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 09:19:29 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::62) by PH0PR07CA0019.outlook.office365.com
 (2603:10b6:510:5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 09:19:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 09:19:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5A609406541;
	Mon,  6 Jul 2026 09:19:26 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 40208820244;
	Mon,  6 Jul 2026 09:19:26 +0000 (UTC)
Message-ID: <c6bb6d40-d539-4018-82e8-7aadc28b98f5@opensource.cirrus.com>
Date: Mon, 6 Jul 2026 10:19:25 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime
 scope helpers
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
 <20260626061329.23264-14-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260626061329.23264-14-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|DS7PR19MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f00e492-4258-4de4-5a2d-08dedb3fae14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|61400799027|36860700016|7416014|376014|11063799006|56012099006|4143699003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	87M0vkyY8ql1dN1GJW+L0iEFVrTKwYVHwHt83tK9Tpq/XjMg7bP7uBPZ5fchdvLUAGZjTnV4CQnDMkGImqU6c3IerKjC7D6x07MhQbFEmNC5lO/v5aEifkjuUvGlRDwa51EPYIh6gFRjnhhB3RSzCuR/gWxWQPqvU0VfeoO1coqLm8bVEYa62W9YtjvvjT+/c90+tbpOjLBSzAy/OmFzgp+NoYvfx3/zsz+pt0VmsW2gT0Xej70vBqGpRCmuj+E5t21oNuWVMI7z/gHX8kDhpoyL/uxT+/E9dXm07U1MHlTfz3JdVAbIojqFdfGmwqNourH0nN8Ivd20fqCqCnn443FRkKn4AzpIfWSPJZzVPEJvcYi1/7Dro4FlZZXfNZ3opGMKty6PlCkkNkXDkoc7GwvaCA3I0kHRhtDaJHsYHUgbMXghWakyRcXaXHqhZWe9DVgq5oTbN1SMtds2zm5v+AX1wQy2DhUkWB+sf6EWpS9sTpJs4EEo/YWtazTWOMSuS1wCYkG0BWZTdd9GoBfsCxUdk6RlXoEgPxdvIoV66TUKpoL/T803sx2uTrNa6+K9Aav4EkiExL/1pw+G8rUS+bZyYrGqbj8qruzm2USCyd7XwpidFq+DBqcyHwmi90vBWl3u2Y1R2N5OPBLTnNOd8NeWCBFOEfEpwGX7a/oOiXmpHeMDTV/Fc6Fwf4t7ovGyeO5EHYfG5KLbVzRSqXTbHA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(61400799027)(36860700016)(7416014)(376014)(11063799006)(56012099006)(4143699003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DE3g01//YhHDRInaD/Kftb5Dmp0Mtz1MRnFP9E1Hq7pI/WUR0+BiB1aWrD9tBVMF6xB7AaLXVNds9mbET5JQ5GJa0Rt09r/VcjQSTaCdowai1AFEYcLxsjz5BX3Yl2ZOzGvTkkIuUF0UIPDg4J4CNP6YFcBOCtkxpStRXb++5EqAOyl5qcyacUg+AlcORp9S45eqa3h038ws1Nsotwqw6c8fnKg06EInUrNsYinhTNxI1UbZzJW6nW+xMjdn91deCazmOsFWl8siu9jsDBF0Y1oKNXUjo2QQjXQzdFDwTx346Kikmots8hkCRW4yW4XY/A/jBvCo9pSGhMPD7Dg4BrAtcddEoP4t02WxmkNNiNJwKBbqdVECsHYGegOC0/wD128wlW0eFSDtX+6jo9/UR8dFVSyEkEiie0w6DjamdeJHAkHaGDcLUpQCvYQ/InK8
X-Exchange-RoutingPolicyChecked:
	ZRX6g4bJreehAzBfLNjZfMyw/IWi2BfkeMJkMgDZUEeCfVp/bdU1IGGLZX1xeQBrlIBv9W/4HVv9Pa6X2jwUD8GWHycHG722AloYAngda41nRMs1hYlY9TofGlJEXAA7NcgVySgum4PKimuPmE5sIQTeTfdcfjDnV2dCv6oXcDItYO967yFXjswkrIF7YOrYhQKXpRCloXbMMKWGFHRWROyDk1Nx1TuUrzjy320vdcgNYJkff/vRZEu9ycqMwo1DmYR1VsfCQx3pQeNUUpalZh+hd+cV3d+PqPabsdtkZi/IXI5IURM9jdGL4DqpSCnl8llPjL1NHoTW7U42w9i9dw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 09:19:28.0231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f00e492-4258-4de4-5a2d-08dedb3fae14
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8883
X-Proofpoint-ORIG-GUID: AdusxngwxIU9GbDqIs6HyfF4mnhv-X6q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NCBTYWx0ZWRfX2B+c5sGC3gYd
 5brIeSiCqiz8EbC1qyV9ws6dnfT83UXqLibhG+WqBVAFkrzQuI3qluYO0Pe7sNG1EPldVDqel5o
 8KZ9NcWdiYjrEH6tkE8UK3WTTE9uDac=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4b7325 cx=c_pps
 a=xX5bFixAAzgdQQ8ihQiE1w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=kPVLe_SoSq5B7UODA7IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NCBTYWx0ZWRfXw1Ja1dEZrWx/
 /7mi2oRD7Kz3/+feoxM7KfCQpCWl7JMX7SrEYbTh5+DwRxMxTjT4IIw1JVcWk7IQPAo7YTGNheC
 UZ7O0S/7DE8L2or/mhLFYuUglmLNMblGMqezEl/8odFtpYtKS973OSlkwMz7lgxG2nxRWW4r0N1
 RA1Hipe42zni2GiMBnuIDcfvfgbgzRyDDLyXHR0sLVSHax7LF8SLJIi6oAOViGeKOtvLU74gWuJ
 BX5s3MZqQZje4Z9xBPnkKK6VjxlqmCWq7XXzsd9w7qeCxVqI4NZIXL5VQ5GFlz6PWLJ07n1Yjps
 GFpGvBdNBkR8I5bNOLP3qy59PXIPkWEYZtH7OTcHdZHe8tgd3mB8IAJZ0vD0fGuwH5H1jPFsj8T
 IilrgF3F7+9gBqIGl629AeJq0Kjrk4MKrSMoOgnDA97C1V4Juk1BmAlVPBdxDD9GTG7P4KQqs4R
 lK8rpX20MDYGU8p2lQQ==
X-Proofpoint-GUID: AdusxngwxIU9GbDqIs6HyfF4mnhv-X6q
X-Proofpoint-Spam-Reason: safe

On 26/06/2026 7:13 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Convert the interrupt handler to use guard(mutex) for automatic mutex
> unlocking and PM_RUNTIME_ACQUIRE_IF_ENABLED() to manage the runtime PM
> reference through scope-based cleanup.
> This removes the explicit cleanup paths while preserving the existing
> behavior.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/codecs/cs35l56-shared.c | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
> index f14e2eaaa4ee..73fe1cba3f5b 100644
> --- a/sound/soc/codecs/cs35l56-shared.c
> +++ b/sound/soc/codecs/cs35l56-shared.c
> @@ -645,18 +645,19 @@ irqreturn_t cs35l56_irq(int irq, void *data)
>   	if (!cs35l56_base->init_done)
>   		return IRQ_NONE;
>   
> -	mutex_lock(&cs35l56_base->irq_lock);
> +	guard(mutex)(&cs35l56_base->irq_lock);
>   
> -	rv = pm_runtime_resume_and_get(cs35l56_base->dev);
> +	PM_RUNTIME_ACQUIRE_IF_ENABLED(cs35l56_base->dev, pm);
> +	rv = PM_RUNTIME_ACQUIRE_ERR(&pm);
>   	if (rv < 0) {
>   		dev_err(cs35l56_base->dev, "irq: failed to get pm_runtime: %d\n", rv);
> -		goto err_unlock;
> +		return ret;

Should change all the error returns to directly return IRQ_NONE.
It looks like a bug that it checks rv but returns ret.

The reason for ret was so it could use common exit code to 
pm_runtime_put() and mutex_unlock() for the error and success cases.
But this isn't needed now.

The local ret variable can be deleted.

>   	}
>   
>   	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
>   	if ((val & CS35L56_IRQ1_STS_MASK) == 0) {
>   		dev_dbg(cs35l56_base->dev, "Spurious IRQ: no pending interrupt\n");
> -		goto err;
> +		return ret;
>   	}
>   
>   	/* Ack interrupts */
> @@ -680,7 +681,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
>   
>   	/* Check to see if unmasked bits are active */
>   	if (!status1 && !status8 && !status20)
> -		goto err;
> +		return ret;
>   
>   	if (status1 & CS35L56_AMP_SHORT_ERR_EINT1_MASK)
>   		dev_crit(cs35l56_base->dev, "Amp short error\n");
> @@ -688,14 +689,8 @@ irqreturn_t cs35l56_irq(int irq, void *data)
>   	if (status8 & CS35L56_TEMP_ERR_EINT1_MASK)
>   		dev_crit(cs35l56_base->dev, "Overtemp error\n");
>   
> -	ret = IRQ_HANDLED;
> +	return IRQ_HANDLED;
>   
> -err:
> -	pm_runtime_put(cs35l56_base->dev);
> -err_unlock:
> -	mutex_unlock(&cs35l56_base->irq_lock);
> -
> -	return ret;
>   }
>   EXPORT_SYMBOL_NS_GPL(cs35l56_irq, "SND_SOC_CS35L56_SHARED");
>   

