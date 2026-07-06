Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1F7420894;
	Mon,  6 Jul 2026 12:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342760; cv=fail; b=PI52oX3bY4ZCVJdvIiOuoba2SW891bVEGa3OPGHfIEawN3KYrBTcHHytUiFNQYUh7tRgGMpfTvijmpako82eDERuQyxkUlrkD0OlZw9bfE08hnlhHOSZ/S99TnL5Ps/fSykDjW2bG1ipXWra/5UM2fjHDchGKFlkGJ8wsObA0q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342760; c=relaxed/simple;
	bh=UEVB8GcFgp5db2OsNiw2YJ2nlrsbAO4JVbWumKJmT0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKW9pC972Awm0bIL+GsdMs4/zluKjAsRrqhvsnugOtPRrgJ5GpD/rKIQPd2vpeAAm139UTDm4A1RF/qPakY0lPi1IwqVVSW/JS+mGIW14peg3Qwl1sMFdiVYBivpKSgSkfHqyeFvb2kQu4CUPh/TERwjsvsBuF/GEzg7FjZYIok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fAq9VngS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=E/OtgDD1; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fAq9VngS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="E/OtgDD1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6664orfD154747;
	Mon, 6 Jul 2026 07:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Jag0HBzWwBJIikCd1m
	NmysJJlN0KQe3KuxxnscH8lPY=; b=fAq9VngSfr3PO0jWfFFuDwLsHFNrpNpU9Y
	Pqkvx43HCi19vNLv4pzdXBB1gFcK/fSBA7A82r14PvqGHmExkc52cUmKta5c57Mi
	H6lEVCcT1ywf5msGTNCD1N7iYxmRxFsW+CjwycysTiuBtiac7l8roGZ0vApf1jFf
	wjgi/PV909V/SAdKeRgNDNjZXzdOJyFDilSswaJ6FO3vkzf4oMMUVy57kCyw2Pec
	mpu6H9+GzZIo7NmIgEPFFCcIXRxeqQ35EY/1E/CN9iPbnBflOiWzkuBRc3Ab6WtB
	CKDOjTX36jQ++at8RO15aaFcUB4UwIo4vKGZCuO/+feEiMPVSBmQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021092.outbound.protection.outlook.com [52.101.52.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxjay5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 07:58:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qm+ofvn2JXnvhaJrl13MDXHJTfSJ2VQJxC6BIvDw1sumijEEU7wWYKOfhbdg7kgvFd4Ncq13R0AeEwiBs6wQ3uZPh47k1VqnPBWgaUkBui81hsd5xLDJiNw9Ql+3G5dedLooG9v7FoE05TeXAY0YWDGoRZIzIu9zNgVC+gR5BBoCLR6h178juKuKlZV+9h/XePevtfphudQ4vJokqtKbYqQrrmwT+BaBwQmSSH/6zxQ7c9eVLDFJk80U/LNWNThR8RyU2EriBk0KyZRhkSaIoEYAPdEth5U13yFuURTC3KAYPgkCWgZHVbD3d5t5zvyZ46FYFokqza9Bzj46k8tsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jag0HBzWwBJIikCd1mNmysJJlN0KQe3KuxxnscH8lPY=;
 b=R+OWibo/EIo9iCPOONBUCotKnObcy5dIB1dbie/r62keCroCELkJ1ku8T7ueSaIYCkG8SaJfZe7NelOfLJXISFxL0O4b1Bk6UT3E7VHHCbNiT9b1Pl9ULCgmxPP8ywytmAkJgp4/mh7YDbWbZXZB0kYs0NUKS8ZpK4s8uApLRjCAB/aZrfVZ3U586a9h9rNnzGJeSxGK0AVsoC43Y3WrobH+2YJnddK61SzBndka4vEi7EgOAXu+Uk8o9Adk3WSo4St44S5+1fduPE5H4jvKExCAFLmC/LY2Xo1Gg1JU0YkGfiEdB2RTB4HPEC6nHDeZKoxbCzrSPFemsZsSkWDAkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jag0HBzWwBJIikCd1mNmysJJlN0KQe3KuxxnscH8lPY=;
 b=E/OtgDD1V8g7vf1jvRhpP+M7taMcQ3VZzpOHOpTWn1Yd1mBILnKOvx0Qhia+n2CKGPSghO1w9+OgiZCHTdgDK7OkCULbkmqxSuYJpP6wbFvguszu3qc9jMreZRgG2jM+M2Iw7M6nDXqEwHDLMPpff283jruovNPquLZjt9b2f5w=
Received: from BL1PR13CA0413.namprd13.prod.outlook.com (2603:10b6:208:2c2::28)
 by EAYPR19MB559184.namprd19.prod.outlook.com (2603:10b6:303:2e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 12:58:43 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::1b) by BL1PR13CA0413.outlook.office365.com
 (2603:10b6:208:2c2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Mon, 6
 Jul 2026 12:58:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 12:58:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 35559406541;
	Mon,  6 Jul 2026 12:58:41 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1AEDC820244;
	Mon,  6 Jul 2026 12:58:41 +0000 (UTC)
Date: Mon, 6 Jul 2026 13:58:40 +0100
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
Subject: Re: [PATCH v2 03/24] ASoC: codecs: arizona-jack: Use guard() cleanup
 helpers
Message-ID: <akumgOIMYes2CXS3@opensource.cirrus.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-4-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703055355.244898-4-phucduc.bui@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|EAYPR19MB559184:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed4d1d1-b05d-4de7-e4ea-08dedb5e4e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|61400799027|32650700020|82310400026|22082099003|4143699003|16102099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	4ttHzugg4bVvR5lQP/VkCJ57f1TdloyN372QpG7JLEc3RNPPLiaZZCOLcX/kuP8FVhzlcKGfQO7vBOdY+Lve5ry2rmQKBgmYBPm95RoDEwjcLw4xncN4ZpA8VX7adAAyIAD+WpCT5Ug/smGNnZUvcmRvy5blB+ZvTZQws6RIbqXzHJ/LO28BxNXCbSaU+ENB8ucphpkN3cKsHCbfh7s7tU8VqQXtO5niqEcn89OXzCXgNSem2UZz9FHcpb52OmaUc2mC6BxfqHJc9HZMR8P7JEee5lHtocErFkX+9Y8wQzbTiTOl5WKLQ/bFKVmhwF4t+b9N9Q7Y+2n9XgTr6c+izMDhjnqukhL7eYZeeMQp0Pqm3nRZei4E0IjyhaVbHR9hcizW8gQwWuaTdXI590oG5UWo4AWxBziuC0IpC65/xZJ9XXRae5TlUQa35VbgiRDPn84xoGDCxouLsyqiIaE4eIBiQUiA7iLp+U0qDEKKXIQWPIO8WRgDsP05NsOSV5TfBKmgTb6C++GV1rZsAvpUH7Jkx36KajBwC00mymeHJAPaJxe7UdkjpRFAp8Ml6BgEBlwuqhOJnDl5W0SealzWNZhKLMyt8YI66j0xXL8c73pTgDd5olIBxNJy47xdmBf/Gsdsjvz5GX2SGuhnTjJe9Euo8n8IFSox2zGs0NxAXRGfVJfpA2mCtM/k6ht+ANBd1kdLm5BiHXgtE0vwMJsamg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(61400799027)(32650700020)(82310400026)(22082099003)(4143699003)(16102099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KtUKM9ImIja1wTzgYTNJ2+Flm/GYnURQlFeppDHfo9CzYcXxylO+P+4Fu7fP7gsdxXjOMhJRz9sXlatXJBon8Q/ihv/4vD1r/T4qh7MO1Bg7IbtzIez3orUSrpOiwQtuJCyGSh5iGHE+RiA9wIXsJWnX2A1fn3awxyQFzcHJuUfQ1WwcR5QXkf6bwLPtKkAOvUZvcdHDi7vXTsm4o4WB02ONISXZx4JZjz1AyU1u/+8y8TgZ/bxMJyYr/NpHESG4zrnIYoLoWQc4rKFxxPdz6UzhePzH/+u8bH/1Tb3B+9mIhNyJ3FLfKTr4jzH0DD6EKrJ7edar37aDfOEL6JlPf4tgxlU93LZnTyVhTyGfNNd+UcIJwfW0onpQo/9y21kDhAvdlrbXVyPM3AKEHTpR2SymSO899AlnFUkL0BqDncwoq1nHQWKWuszzvuj7D5Uq
X-Exchange-RoutingPolicyChecked:
	I5z4dJnHNnYIcNOukhIrD2ute61vnkWfcqEjc3qA6iL/4EeSqW/JFKBSgP3my72wJBzpQxLbzLrqDgOKXLaVntR0fxTeonPUR4M2sNd1YmbAlVvVDV8k7NzkoUwA4r7c7MOtPyd2IHeXw+/0Rmbij++5lGZeAWSwf6tHqHBLSBrg1LUMzEjxhEMdcE8a4ypERLCYVZsgXQRf3r5afvTSqapWHusihTLYPKQUTmtyrkPtBkNjdXbA+RpESGrbyFMkbUVloXEEDxDiKPx7h/Yq8fNHUUlhcE+XhC+WeDKpKuKjpvHlIxLvwH/T9qywnMBaz20YzLMlI7Xy/wjoieZcYQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:58:42.0559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed4d1d1-b05d-4de7-e4ea-08dedb5e4e6c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR19MB559184
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4ba688 cx=c_pps
 a=LITHeb8NCZqLQJh3dVn19Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=-Hup2pbrS1z5opi-qBQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX8kC7zbCkW2Ke
 Y+im4zwWk164aUv+5gikalos779fW+pGpflh+Iwy1JKx514VLwo8fHuCP17ej4u7PCuPb/beJv4
 OiCIbmH+eauPPrq+Yl8CoEyBKQIwhSI=
X-Proofpoint-GUID: yTHuIZ0a_6XrVMUtL33EtNK1RPtEasw3
X-Proofpoint-ORIG-GUID: yTHuIZ0a_6XrVMUtL33EtNK1RPtEasw3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfXyvwadLLX2W7T
 tFzwwfglsw/19UXcxDHMxFtp+EKfPwYmFZn6v4Zj4UYAeqkAMQ3K1pIUMWfIhivIb+Vej0vFpbJ
 DsmSQbUTRh6OpU7EoKghfbhcjaGQsHgJxkuctNdy/2t2GR6eMngMbv26EBO6FD2x/jcwhfwNnWL
 cePXi6czQUo+xLrYwua11Zsk+Aa9LuBZOo1HrfGlRjgeoYAo/KDrLvRWn+03HjdpbJE056RrVb+
 2/VOujG1wltLqDpFgem7wPX/iT8pd1ln7ptjJ6A54Us92i8bTpBs2a/llVTAR7DDzxO1wcRtaKC
 N/rItWZW1KMrfd6saAeQ1NO0pF18k2bhD6VJOJLdOX6GPgismBqPd6VQN2D3yqosoTXBqBD6mZZ
 weaB+RdvIf6KIPQ9GfRCAtgn7dpJUWKCvNTBiVdkVLUPzRq7BRtNBqaYw1fybYK4bm3HR7vD2kN
 cULMlbsnZImp+UxSuBw==
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 03, 2026 at 12:53:34PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() helpers for mutex locking
> and PM runtime management.
> No functional change intended.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> @@ -1119,9 +1112,6 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
>  		     ARIZONA_JD1_FALL_TRIG_STS |
>  		     ARIZONA_JD1_RISE_TRIG_STS);
>  
> -	mutex_unlock(&info->lock);
> -
> -	pm_runtime_put_autosuspend(arizona->dev);
>  
>  	return IRQ_HANDLED;

Minor nit, this leaves a double blank line here.

Otherwise looks good to me:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
