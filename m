Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA091325494;
	Tue,  7 Jul 2026 08:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413066; cv=fail; b=B9eAugJlY8Oosv2BGxKSrnubGhctjeJaIX8+aqsMgJiH0x1qQC5TmtFPczY5a7fSu4u3vmKKDDoK513ByW26yK8NQVNUH207pl6EAvrlheQcKJvGAWZF0zqyo8hSLbuRKUHCR6gnednfrGj+Nchbojzfn7F8Jj6BU5RXzc7LFD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413066; c=relaxed/simple;
	bh=GSvEpLAYA7z6KI4hgdyviPS3JHstMIBSwtZXHwodrSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r/V0BbfGF8yzr6TbKml00VdEX0xzRI9xlT+MvRB0FnAO9mwsAq3pfQefhIQ9Cz9cZglMb6rPgDnOnH19JsBn5Xx7dgIRG4KpMl7q/oWOrBBq6bbs6wStjCYvWp/WzqdZt5/6ev89fP+s5xstiNCSQYcXpO15/C5/FBgeHU0jfhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HuPntKgF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=msWVUG7V; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HuPntKgF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="msWVUG7V"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748eYJ3313615;
	Tue, 7 Jul 2026 03:30:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9I2oa/raSk3x3czUjCWPT90VLj/Gv7HSh50XzIh+KvY=; b=
	HuPntKgF2YBt33Obh/8ZqL5YurU0sWyA8VidlrBFKRWVd9JdbV8A+UwwqLQxypiH
	9ewlGXtk6YXYB8XbrdMu/02+dtsiNqOQ5HY8Luwwn4FAs9+0wXRBnBRFn0CGWmEx
	wjp2MDGorNZ785V7tAwy2uPryKhjvZAc31GomYunxUb5RLP1DNRj7sDzwBiWSWSK
	0B2OGmz6lE0Jm/yCddw5hPvPn2G0f6ld3Z/AdDfsJOkpsfvQCiohstg53G2vRpqP
	b9eoNUEBZDtvAnqKGW+pIpVK+qfrf1kaXLEWwPTUOFnemuhRkmyM4SxulaADQbi1
	f82/zOXyvg+1T2mGyXviwA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023109.outbound.protection.outlook.com [40.93.196.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjkw3e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 03:30:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5xWbwwg3F9GXZtoje/t+QdDHxKdDYhtPmTWdA52cJMYzmxg0SMIda6cCYUwXLx03usx//cI4bSn3pHgp/qsvquwMt7T2H/GrU++ceR382t84T3n4T8o8UMwOqRxfGfto8liy4jM8mUJd8rzGWqmbeWbSkf5uEujULHfmy2kpmiCMBPNQvi75PbL1NfAHAj5/DsX8QSjrTe3qrZ+GDyn4ywZaTQ/sslXOdjJ1EwOjRnPfMydCJ7aWwpQJWshjqtCUzLDhjpc5fpzx6VeDy/8i8d1rz/42IEtONZH4RqTeP7A+QVesc0YA0Pmpgfy6F0hV2D+2xrMqrRTAgKWUmH8FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9I2oa/raSk3x3czUjCWPT90VLj/Gv7HSh50XzIh+KvY=;
 b=KibRDTS7tg6j7zYzMi1K7UrvaMbqRDnOXe0kEq8IdeJAqVkN26Axbkv6xQXMZvXBBEPSmEgEUsSAlXoVHdGdSicmj0dkHpEqau7gZ0YlmX9WtkGk77jesgnqNvUHVzlpqDTFsyQ0Q3zHv7mn8n2BlY3gUj+AxpKFer4yJqqp7wVA9ynHKxsFfNqHEFSPcnzbnp+n4pSXozkIo9c21f82VaWmuJiYd5NEww61VxyCfztLG3Prs65F+yEwsHu7DD9EKu5Ej5ww6bCDZSzKFFWWrCwUQzJYuDcWh/pbQu7X03IkCwnwLGQ6oy9DmSzwkLvSiA8sLBbc3xbQ1+33aUU1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9I2oa/raSk3x3czUjCWPT90VLj/Gv7HSh50XzIh+KvY=;
 b=msWVUG7V7GY8yIGfUbQp6AZlTBGjdkJyGs2fmHTbgD5VWIv0VYfVz6xOE/AKwsYd1bRQT+EcnQM+PRBDY6V4sgyFvyKVHvR6Kdv5wk1aPBd97hgLpqLnRUeRpP7xfygt7Vp3EMu0mSlKexr8IPAXvmkjxjCdpjwIkveKAM/zbMY=
Received: from SJ0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:33b::10)
 by DS0PR19MB6526.namprd19.prod.outlook.com (2603:10b6:8:c6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Tue, 7 Jul 2026 08:30:20 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::4b) by SJ0PR05CA0005.outlook.office365.com
 (2603:10b6:a03:33b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 08:30:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Tue, 7 Jul 2026 08:30:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 89F4F406541;
	Tue,  7 Jul 2026 08:30:17 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DDCEB820244;
	Tue,  7 Jul 2026 08:30:15 +0000 (UTC)
Message-ID: <1769b900-5e51-41e2-8cdf-d40945ca8377@opensource.cirrus.com>
Date: Tue, 7 Jul 2026 09:30:22 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/24] ASoC: codecs: cs35l56: Use guard() and PM
 runtime scope helpers
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
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
        Cezary Rojewski <cezary.rojewski@intel.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
 <20260707051006.20058-14-phucduc.bui@gmail.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260707051006.20058-14-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|DS0PR19MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e6a11d-b84d-46d3-3f2e-08dedc01faa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|82310400026|36860700016|376014|7416014|32650700020|4143699003|11063799006|56012099006|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	d0qieQMeVdzt3ouYKvwo+Scw0vL5G8pZgROEuN4YxByTUXHlBukr26aFaeZHYcAHCo7DcQV7fUfiHc3yXx10bW4B69YCaFJ0D1+DqCV1PPqzH5DpaB+ag1HG/rPpTrZMxdyBj4wHPvM2Kg7e5SY+8gO/fkw9uE4gu1owmxzxJeM7SZcaQKhu+uztFJmjKCs7I+cpBOkSPO+q+WWfC9MiOqYwDeebJHcvw6S9i9mUNKMNMJz+fu3oiU9pl1J5HuU8T7FnvlWEFjFOX5Fv+pMZ9wnnterhJVrTcfUXnOK6jdy5iQLOdSgn7Eua/FFypUkmgI6Urq4kvnt25Z8CFdFaBf9Vo5Aqp2bETXYaG5uNApD5og2H5RZMulMDEgruFHvlO0BEaTdp7+wFvVBRkj9ouQ+Z9STdWN2MONIJp2IESbZHaadagvi1Eu0bQQZ+Pz9OqMWjba5bVRTNA6fRrgHvk9T8yAnMHoVBHQ9KSU1lRsablTcEt0uagXsd9h5XG+ZqjEYKDDXrXcXeFwXdrWUNbClcoW+woo7ZY196mB0Pyxie54JB59azlgZl5Tvfr2icdMgnlMVU5ThuBlORsNnuEMB+iz4XMBbfyD936IgwckIj1WJG1qktElCs+OWQoG6FUPitx76O8feAu+jeP47Qi9j/zFJkU1X8AxJ9rAF39ky6i2moJWntp54iwGEUT/bro4jScN6VkcjRBpwCXcXq3Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(82310400026)(36860700016)(376014)(7416014)(32650700020)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hBbuj0avp2DhB+UZqvcuBnLg09LlWpOwGG2j+f4yUIdAgZwRfvWL0bAcNW9IUSfRWUtpKY0KUyb5lv/mY16vmgWM+JKQh9WzT/fTgZ2+yv8qDDNubyaNOg4uL0yaQc1ydgUdcFWSyIVGQcHtrgLqAuLXvaWAv+QD/f35Qj4VwubMM/9uvjFSt3xCRBjpKsPdGIirggaa5gjQQzQOxobJLOPo6UuHM2uY5jcx5tpatrO087Rl+RECMHTOcIFBgYROVZhkkO/h/HGL8S/UUm+CR2M5v0RuuD8VOb/7GOhBBJ1Mh7Rj2m5S5eH63T6kZysFEwk/dnawzVXydHD2GkHj0mPCPrtfq+RiNy55UXU2WOimBbs74cbiQCf+x75utLhPauHFLcUH1RDzFnocdpIMka0ZKKuPdc1KpPxpV3h3YLEpjw4137Q/4swS27hy2CNP
X-Exchange-RoutingPolicyChecked:
	UtbfDISOzgSX823vkP8lYH1hmGfeLNtLFXlF8g1wWVHoYNQqpiL7RkUxFCFSJ8z/Mr35856L6LWvhKhfCYeU4pkLUEuYjUfiOFIb0N9P5ttjVrae486z9izUwWwbhv6GJ54BNRvz/HbXjaipEiKtnD4AaPl2KKMiwac9Y15BZ8bDyVjQoqkEuxXrDqgQh86bGz0JEGZAUPfN/Jfy52SULQfXCPYOu3uXkSXEcJXnFvmUQ/rfRDA5trq+4RZ1Gu6QGCkSVsf7Co9jCVZjLTaue/PhA7cM6if7PT1ClAsRlLNK+u5Cn6iLWocmdAXExacohNgI0CUkB0k8Duy5tgG0Dg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 08:30:18.8572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e6a11d-b84d-46d3-3f2e-08dedc01faa7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB6526
X-Proofpoint-ORIG-GUID: oA_Qm2y3dpQCRyKyUUhPwR5hTTtfuZe_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MSBTYWx0ZWRfX2hwChOTzB8Os
 HpUXOjyRFNoO2yMdACnnbtA9mm8JRZnu1yh9+7IruY+Wt1wNDwTNbDXPBHJcgmqVWABtKQTj+p8
 TMYjNoe94KjI3Phy4pD/hgMpVK0eZT4=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4cb922 cx=c_pps
 a=V25D3nnXj/TfbbJZ4owJgQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=fLjB4cGMpuWRPE4S_WkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MSBTYWx0ZWRfX7/xa5FsB9udB
 RdcO6icQoJtrg6V0M14C4wQO5D1BDKdAABuIbVM88Kc/D0sGrfHSotTVh+FwF+m3ALxsryNkDz9
 6+teCENBedsxS60GzxGf/UbAIMmYe8HRxVaEjwKnRiP9hsRxIbYdNMrB+iX/Cr5UnnfY4zp1aK0
 IyFOsbbLqtnJbogZjzaXrYaF13Gbv/j92mGPVWE737PN4x19rkexJLpGnZMmBvB+7QlmAbXo+0D
 orNd+YW7BgJzLs72uTlrYrcLGOCu3AyboSV7U6t0A7wc/etTCC973BWDkjousARfQMISvpD29RZ
 O8ZycA5scoizCAvuuN/5/396+MIlxu0/ocYlV+RmE8aFvgYGXd2ekrOppi4eXgPLfk/ljUn5rDn
 ViOX4tS8CMPYltIuIQwJmB+/XS1Vh4Q/IOpbLVKjedh/82CcEMjAc3xmE8jqIgFLjcH6dGfmgzH
 5EwrSpc5Veaww0+yI2g==
X-Proofpoint-GUID: oA_Qm2y3dpQCRyKyUUhPwR5hTTtfuZe_
X-Proofpoint-Spam-Reason: safe

On 7/7/26 06:09, phucduc.bui@gmail.com wrote:
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
> 
> Changes in v3:
>   Remove unnecessary blank lines.
>   Remove temporary variables and return directly.
>   
> 
>   sound/soc/codecs/cs35l56-shared.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
> index f14e2eaaa4ee..d5817e420847 100644
> --- a/sound/soc/codecs/cs35l56-shared.c
> +++ b/sound/soc/codecs/cs35l56-shared.c
> @@ -640,23 +640,22 @@ irqreturn_t cs35l56_irq(int irq, void *data)
>   	unsigned int val;
>   	int rv;
>   
> -	irqreturn_t ret = IRQ_NONE;
> -
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
> +		return IRQ_NONE;
>   	}
>   
>   	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
>   	if ((val & CS35L56_IRQ1_STS_MASK) == 0) {
>   		dev_dbg(cs35l56_base->dev, "Spurious IRQ: no pending interrupt\n");
> -		goto err;
> +		return IRQ_NONE;
>   	}
>   
>   	/* Ack interrupts */
> @@ -680,7 +679,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
>   
>   	/* Check to see if unmasked bits are active */
>   	if (!status1 && !status8 && !status20)
> -		goto err;
> +		return IRQ_NONE;
>   
>   	if (status1 & CS35L56_AMP_SHORT_ERR_EINT1_MASK)
>   		dev_crit(cs35l56_base->dev, "Amp short error\n");
> @@ -688,14 +687,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
>   	if (status8 & CS35L56_TEMP_ERR_EINT1_MASK)
>   		dev_crit(cs35l56_base->dev, "Overtemp error\n");
>   
> -	ret = IRQ_HANDLED;
> -
> -err:
> -	pm_runtime_put(cs35l56_base->dev);
> -err_unlock:
> -	mutex_unlock(&cs35l56_base->irq_lock);
> -
> -	return ret;
> +	return IRQ_HANDLED;
>   }
>   EXPORT_SYMBOL_NS_GPL(cs35l56_irq, "SND_SOC_CS35L56_SHARED");
>   
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
