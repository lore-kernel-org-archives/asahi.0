Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEF840A93D;
	Mon,  6 Jul 2026 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343924; cv=fail; b=ZA28AQTj+Pw8vIhR5FmfJ/2foaGZjDkI4UY/QmwaucRDwcY2lZTHo2wpDGjoT09VV4SsdwPVtXJKr+yTlojFIs9g4RkrSolyO6+YYAQAUpURb4/E1/yGqCqPlpkPGDrB7Oa/Qd5bw1a9WMJhd/VG0+9mE9ZbSq/xYkQ8NaYi47w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343924; c=relaxed/simple;
	bh=rWBH5bmp+vkbX6Wngez6kTga0yMWHP7E+GDUVZwvhc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3e4oJPFLpYGOwInkmsvk3oTjdWnbmO/Y/Bg0wI9iqUpQyUdwjZKHQ4Q31PC0DPoZQ3GICCH1u/9BhKwVTsrx6B4s8hgMCHIIcZ2C6EGQba6GWZSEr7BHZwpKpbta+LLrIFJuOerqTPPc6hiKa4ZniVvJkqBXw2PeHWeK28TnyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QUbWkmOE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tVAq1V1N; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QUbWkmOE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tVAq1V1N"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665NnnYs437052;
	Mon, 6 Jul 2026 08:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=QbaefpJyt+YhdVqwwD
	7UKBKY1cxhcjnvXgU2wXiS8Kk=; b=QUbWkmOE1fmd3K30LZ45y9ut5brFxtc3R1
	kIk5DW2vtiqALgZ7Gd1S3mfknX3ib41p+ZDQfx9N8hCfR1KRsmUefxXjctramy6m
	WPn6PUHtO5ttm8gOfPnBI+NKTxXomeDC+Oysyv1RXP6vfmA+QUgfGEmOOg6AEg2t
	ktEnlrEXbFpWQI1yTk0C4v3f7TNFJq0OEIFauJ5MaIY8lXPVn5dS8jvfrEl/KpS/
	MN1Di1L1nnoAi4ii6A0cNEgwzzhxw2jE+JEaS0/VXSia/OKtntU4WcazTv5ebwPs
	hSPI9LrKzOQghJwiJrrowJH744vzfE2wxyUF9mMC+Ny/uTREK8RA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020087.outbound.protection.outlook.com [52.101.46.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjjdbr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:18:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dccyPn6XMCifiBPj0VJhiXcc1/RSSiNdA9q6fNVCTm/DUl8yxDWYInCXeEOcZB5VeLeLGzsIQD+EpwzVA/ftlhcxYARhyzNWIZ3PL+5qaICivjLJMZs614eFE3hPNZrZc4fw3POpfSIwoA7gzCPneKH+glWmLN2zD8sjwphQ8FhlaqmyByuxnK9HgSMozy9lK7GYtoK0JBxWuNeKi833WqGfl33fKTgQ+Z+m4QB1ApMA4GBzNGpdeCD5ZQiBa08qCDKohwBOQMjY6JarhHijOW84OGT1ZIrafcwmP/OBQQ1xw/aB8yRSbWfZKjciSqCZRV4wRleuklFvig0/T3vhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbaefpJyt+YhdVqwwD7UKBKY1cxhcjnvXgU2wXiS8Kk=;
 b=N8hw6DQppM7Z3kciOyEgmYhyTixNL8RFlr+e9Xjwbdv3GqBK6Wv77MFxCuW5RbR+DWDBBX3nZLpY5dpk4fIOFMIDqxPPzOTZEtUfV7HGwx5cAebw2IzHB3G2NPSYS9+GHDuRm5l4mRtMJWQAYrSw9yUWEzmy7cjgBycRmKE8W+RzCG/2yUcUue7cw38OUHxuw3UHhFW+e1c+qqb2uZTyVxhTYKQb+1T4x8QbyNpAvzbeVj1hiptMpeJjnD1g39/AxMyk91WChFdqNtuDypcSpHFcsbsaqWQjCWPjTGcd3QZLro7WXwIspAubwD9Fqgrt8KfzmOPfYz0hh0IM94o4Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbaefpJyt+YhdVqwwD7UKBKY1cxhcjnvXgU2wXiS8Kk=;
 b=tVAq1V1NgBl6hJRpuBphPQCz8HB7h0Cyl9rxDjnt+cKNn5Q0Cmy5Z6qP4f5kAG7QhuqRgRNu5pF7iN8zqNgXuUjflbv40IDcFIF+wRzEygQDlaVmAEifVdWzxpuxqiAgaizd0iiZQXkXcu4YcQHiHVKSl2K2lZR/T+9/3zt9nHE=
Received: from BN9PR03CA0573.namprd03.prod.outlook.com (2603:10b6:408:10d::8)
 by CO1PR19MB4885.namprd19.prod.outlook.com (2603:10b6:303:f5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 13:18:03 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::5e) by BN9PR03CA0573.outlook.office365.com
 (2603:10b6:408:10d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 13:18:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 13:18:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 608E4406541;
	Mon,  6 Jul 2026 13:18:01 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4503F820244;
	Mon,  6 Jul 2026 13:18:01 +0000 (UTC)
Date: Mon, 6 Jul 2026 14:18:00 +0100
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
        u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com,
        christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thorsten Blum <thorsten.blum@linux.dev>,
        Chris Morgan <macromorgan@hotmail.com>,
        Dan Carpenter <error27@gmail.com>,
        Marco Crivellari <marco.crivellari@suse.com>,
        Rosen Penev <rosenp@gmail.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>,
        Luca Weiss <luca.weiss@fairphone.com>,
        wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        chrome-platform@lists.linux.dev, asahi@lists.linux.dev
Subject: Re: [PATCH v2 15/24] ASoC: codecs: cs42l43: Use guard() and PM
 runtime scope helpers
Message-ID: <akurCIxgAE8DIaX1@opensource.cirrus.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-16-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703055355.244898-16-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|CO1PR19MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c06091-8110-4861-9aa6-08dedb610267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|32650700020|36860700016|82310400026|23010399003|7416014|376014|61400799027|22082099003|16102099003|4143699003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	gB/qMNmNEPeHuuF7JK6KFZfo1QXNmxwlsmDavoUBdveZKLheNBaF5tXJah/TJZkAzOctaJCdYSWmAnLPQhLyCJpKeMZsfhHc/cF3oNLRJPzKBfDvO5GwzKrewKp65P3424pkUih5CjSIHRBID0ZISVIydBDMgnv5c7GXVyASGO2HpFBNxwq3jbBA3LMEJ2SDoDlT9PNY+dYO0s22l1AijOws8A3FrZ47xRhDMH2TcGsxDlwfx6oo+BiNV05qAUAvOOOgAj/DCVkk5LObc8huzABnlQx47yp3F3g/REUrP0gLP1TdeLTbqtddkR5jRUkgU0XN3jqoR/67y8J2ZHojW7qPzQvYVy4jnrJtqaz9qLpqz0DypCtYf5Kc034rnSvhNt4Z76tjeWuX3vuV6h6/dUSO3I586eyQMGdqnZtYZa2m7B/NTKGRmDCuioBk8GjxN5+SNVQOSCRZrAg82mJCmsXLOj9k8ItQWwRFFHYmqn64uM/toLDIbbd1U2RtWWHhe+doBlIi9uQCoSfKYin1/8g+8rVQ0Nlij5/iRJ00cbGodPXHSQB/uz5isogy2YPTJnTOemLMvqUuoH0wUoghmrjwzP5bL+/2gZHzIIsdoWOJZsbCtmcxMkImiLAVozeSxRF7p+9yBYMQeURBv1Rycr5z8eC6ROykitMroFKsbSqrwEe/+XFr4ekABd9d9rYnXoskggNWmmshCoGpcMjWpw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(32650700020)(36860700016)(82310400026)(23010399003)(7416014)(376014)(61400799027)(22082099003)(16102099003)(4143699003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IUQrQgpfQJlOq4+6sSw7aeWHfcnDB1w/03k26a7arp1VBBbSsk9HJdEqZ25IvbmsrtOUsV2oVogOaW0zK4eCXBWAQnl1DxbgMAyAcLY3hdmOCSIoaqbnFuSZfZtv6OIPEALBYQl/8Nr6V9fIgsn7JOGB0MLNp+rikMQzfzt88O8+P5GkjAQCEVUviC6+wUR2+6BDBnMIT5PZAKgcR3bP3OWowF4SK8ahNKT4TuQYjQun/+jq8ciKAYrPRx6t7JmMgJvDhIXcIHFwclXc7VREnZOwDPF/H1LV+glvqmJAVVa+WSUthNYw0AQ2tvZYO3cIb7QYvsCdBtc9L31z6Zlu2Ue9PKy1ULNTtO6d31XhU+yujqWpSulRmsvLNASNRm/+2l9Ajw135khbJ6AfBl37BRIp0DSQS/oGwuElgIuCmn1f08IZEz8cVhTUdsfvlHC4
X-Exchange-RoutingPolicyChecked:
	kOpRYGGuOt8tZ/Am5v2Xol+MQWKKO2E+Xls9/1aebi9pnUEI5HeY/aQ43+lIszYov30kdy4uIzZm9WJD1WRwRvi3y87Bd87lO3Acquhs2TcvXONkClKZfBthdnVyNR50P3dsGJQbDSbMaztq1PyppB/Qhk7rPn9cG7G3BOGnULgl+vUCir4OAvcCle4guqS/v4cSD62+JB2X51zxdNt3gK82E3sejLNcmIxBIz/UK6K+69TRK8BeAxl/YHIyB7jDW2/dmM6vZNcUSoAqow8Zt+3y2tAoKVi7zUWv++mSD0cIPZyFqynRvAwXe2h7fgdavZZukLex9+bePGe4QAeMRQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 13:18:02.9969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c06091-8110-4861-9aa6-08dedb610267
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4885
X-Proofpoint-ORIG-GUID: QgCrGsvAc-kxF06CPXr58sX8WhmjVIvY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfX2qESOmxtYvcQ
 p0DN5QxrnShYozhSO15/qiPHJzMKcch7lGUgMH1T9Nh9brxEbr9RPdFPdQc9JScB1Ljy7/yaJLL
 AmqQgpqQkQbqFl765lwK3u78eXLhMVU=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4bab11 cx=c_pps
 a=JhSJYUolln7UJVv2rG4jYw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=WvJO9nj28SAkLI2DAI0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfXxlZZ/75LiHbc
 BZi+YwN8f0DCKE6QzRYZ8uCduvv2M+0BChJSU2UqiASSy8pH/LPpvQJCJ2ojoB5AoJ9tqVTpxCt
 2/77KbZoEjXvC4ESZq9wg+y1GbDXFlwb1GucquU36gG7fyjCbXO2GmFPvT6AMx+jrkEVsV9eQ5J
 LKnBG7sv90GItdHM4CqKm78rWjypOBjVEkuRaGNrXTdjnLTJPudLNf/1XgDqY6aCIkZBFQo5KLS
 XBZBdeWb/ASoNsDsFP5sjzo+E5NJVGTLJX0GzCqA1SwMlpAhVwhI1aiYVVcGKuv9nJYnsDzYrwb
 baVBe0xW0JSVT9nYkylok+whCVJcuXDg07ykIwTy4esEyxjPkOylVXn9/fQD7qCYjL9IQm/nnXX
 1dUn4HhsPYOqkbC/1zuOi8BR1czfCwehfUIxx029jz1dk1OWdnkPkNr/uVBQFaCrySmRG6MALbo
 TjyWHQwrzyY5ig5bO6w==
X-Proofpoint-GUID: QgCrGsvAc-kxF06CPXr58sX8WhmjVIvY
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 03, 2026 at 12:53:46PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Convert mutex locking to guard(mutex) and replace explicit runtime
> PM handling with runtime PM scope helpers.
> This simplifies the control flow by removing explicit cleanup paths
> and unnecessary 'goto' labels.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> @@ -374,17 +379,18 @@ irqreturn_t cs42l43_button_press(int irq, void *data)
>  	unsigned int val = 0;
>  	int i, ret;
>  
> -	ret = pm_runtime_resume_and_get(priv->dev);
> +	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(priv->dev, pm);
> +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
>  	if (ret) {
>  		dev_err(priv->dev, "Failed to resume for button press: %d\n", ret);
>  		return iret;

iret only really made sense with the goto, might as well drop
the variable and return IRQ_NONE directly.

>  	}
>  
> -	mutex_lock(&priv->jack_lock);
> +	guard(mutex)(&priv->jack_lock);
>  
>  	if (!priv->button_detect_running) {
>  		dev_dbg(priv->dev, "Spurious button press IRQ\n");
> -		goto error;
> +		return iret;
>  	}

>  irqreturn_t cs42l43_button_release(int irq, void *data)
> @@ -439,13 +438,14 @@ irqreturn_t cs42l43_button_release(int irq, void *data)
>  	irqreturn_t iret = IRQ_NONE;
>  	int ret;
>  
> -	ret = pm_runtime_resume_and_get(priv->dev);
> +	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(priv->dev, pm);
> +	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
>  	if (ret) {
>  		dev_err(priv->dev, "Failed to resume for button release: %d\n", ret);
>  		return iret;

Same in cs42l43_button_release().

Thanks,
Charles
