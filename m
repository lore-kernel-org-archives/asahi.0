Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1887F274667;
	Tue, 12 Aug 2025 08:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754985980; cv=fail; b=COa0fFpWXNBXR2e+F4IPwfnQjA6QiZnLdmvpxW0iswHDt1e0Skz2UT1AY+SJJ9AwOJ6/1XXC9N6TZqL40xUi1gTxlIVcASdGPaVEBmndOOAZbQHXJVz2ehaHim1rPr5J61Lg8uSqUhISEsA6uEEqTEVdIzo98v87qb65aZqTmqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754985980; c=relaxed/simple;
	bh=KT45Xcnrz8UiECf93YSBaI+1tRRU1hhMZM8tUcbuBcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kmCbq81a74OS48+o5cbvrK/5Lu2AGsImSKxwgbge1J3v84mRTaV43xYMxy77P2prcVfpKYN3WyIuboR7+V6JP/MoFU7JGG2TQ2b346tEZwwItdNURq1z1HD8tWDsLBisOF0PXOOsKmvY8CLz/yHr2TzPprf/D5ORUupIBKQ4HZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FlbbCrma; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=u5N7fCrZ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FlbbCrma";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="u5N7fCrZ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5SBQN013134;
	Tue, 12 Aug 2025 03:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=lA98HjD6qm54fyl3rXalK+w2c06IYLIDdmk7+leXTD0=; b=
	FlbbCrmasbSsV6mrrncPAKdDIVJ/4mIfnGMp2n/gZVjee0f1wZeZlOZpgcTYZ4wq
	LhxaEHee+gYHDDuSmyNWIwB/UMDyapooaKK/z211ARscBPqJYhIhhOE6UUA4u40t
	2YhNjmMllQ0dkPS7NXOUyX17tGeead3alK6DsGiPdWfRwilWKOxazy3+XDcjDhMK
	p5geF9in8OlPaNeM7g5BYgv7Iw6cxUuHPCGkiTmfJYCGrM4owyH1xzvA+v/MZSTt
	uwCS1Yh1A2KjT82dSRI8UC+vbNbn79n5bV8VS+7MsZJ9lzNQwWfR7cEQrEeXE43m
	waa07dr0mEqhN3haFy5A6A==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2125.outbound.protection.outlook.com [40.107.243.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 48fj9ss0uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 03:05:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8Z54TMTtPZlzzXXT7GLmowvSCYF9Ulx2I7Gq96BeXAhkmKy9/DFAa4/d+SgwNKqsY1pDrP8HPMRaJlvbpUJnWyhaqUXYf6n1H9QD40Jobver3qP1ix+7kr7iR8eJe9tkWNR5XMjs5kZoS7+LaOJmIDHJMHNTBoGQgy5WXf9O+iiJmR6R8VRR76EI0droFC3vLoe3cKwLdR0eb/TMvunmYN3JgYBQuFNI+g0O5M4lOaje9QaUO6jl9OsoBuBp45lTzpifb09lYUQYhHaNGI9YrQ03cCooK877GZz23rMR+iCqH4zdaco8DL2uAo/2d2chJDwHslqz5e1l8MWrO7Kug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lA98HjD6qm54fyl3rXalK+w2c06IYLIDdmk7+leXTD0=;
 b=r8SlvZOiE+61P4DahAxyVtpgX+/EvScMKAzpv965DGN+6Rp+YUrIBkLDRme170rfOk6BkMoSWd7jAnmTO+HNLYHpOURSd3IhQVuvhS6QvI+4nihs2xzvuFS2cpSC8qCXYdDCaz1p3Pk+07kaOmWthkNrEcYeVcm/e8cyiAodTrMYWhBZVdNh1UE5I8XR3egSEhOu9ncBK+0RF0gaWFBe1du1YSquRWSPrDlhXkk8CCVnyBZC21TczAMMh51hxcLF6x20xA0a+4qfDzuT5k0cCxdmhf4a+sfWlA8koRhaF19URYynnXMRG4LeiwLHuKGv2/dsJxceEPrsQSKkn4lIcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA98HjD6qm54fyl3rXalK+w2c06IYLIDdmk7+leXTD0=;
 b=u5N7fCrZDKTH0c4Ctob2honrufyWLkSXgjOAH7PzWiET6sRXndUJPgyqDWYsVrX6pq/zbJ6F0QH8by8Fp/8/Nb8c5AWBRXizwftRBsiiau8GEblHTb3Dkc81dFF2ZS1toLd7ktPQBYZXpsMCHPeDHz/9IhL7f7tOqsncFsGkmcU=
Received: from MW4PR04CA0086.namprd04.prod.outlook.com (2603:10b6:303:6b::31)
 by LV8PR19MB8654.namprd19.prod.outlook.com (2603:10b6:408:25c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 08:04:57 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::20) by MW4PR04CA0086.outlook.office365.com
 (2603:10b6:303:6b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.14 via Frontend Transport; Tue,
 12 Aug 2025 08:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.11
 via Frontend Transport; Tue, 12 Aug 2025 08:04:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DB17F406565;
	Tue, 12 Aug 2025 08:04:54 +0000 (UTC)
Received: from [198.61.68.186] (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EF6E682024A;
	Tue, 12 Aug 2025 08:04:50 +0000 (UTC)
Message-ID: <72b77442-b33c-4559-913c-c5ecc8a822a4@opensource.cirrus.com>
Date: Tue, 12 Aug 2025 09:04:41 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 063/114] clk: wm831x: convert from round_rate() to
 determine_rate()
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Paul Cercueil <paul@crapouillou.net>,
        Keguang Zhang
 <keguang.zhang@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Yixun Lan <dlan@gentoo.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrea della Porta
 <andrea.porta@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-63-b3bf97b038dc@redhat.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-63-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|LV8PR19MB8654:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bfa916d-f97f-49d6-b440-08ddd976ed4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0R4dlREcTB1WWZXeDVLQ21EU0JrZHJZcWZoZXh3OWVqUE9wN0RnV0tIOWlK?=
 =?utf-8?B?Z2pUTEVNZXZiNkRWYUlKN295Q0hqUHdoTmJDUHR3bWtwUTZybXJUZFpyNTdz?=
 =?utf-8?B?WVRFdE9LWmQzMWt1SVYwQjhPQ01vRWx5aXR4dkYvTEtVazJXR0dPYmE5RXdz?=
 =?utf-8?B?MVM1TWZDSUlHbFNLSlNlWmtCQWNHbTB4NmtKdy9Fdm1IN3FhL0RQZk5rNGZP?=
 =?utf-8?B?U2ZNVmdoREIzWi9NejdkMmczU2RxMVE4QSsvR0JzMTlzcjhkZ2YrL1FmNUkv?=
 =?utf-8?B?ZUFXcnc1SUFGRElVUVN0TWFtMStYSnd5ZmtLTFBBakxHRlJXT3NHVEs0TXNr?=
 =?utf-8?B?QklZeG1kUnEwSExtc0dScm15WFJkbHVvWmVVb0toNW1zTGR1SWFVTGh1bE9r?=
 =?utf-8?B?cC9oYnNCVTVyRGw5Tm1HcTVZeDlwdTRHRHNjQTlObExBZmJJSUdyNkFlam9T?=
 =?utf-8?B?ZG85d1NObmF2ZDVMZzYyRUw1d2pZdnlmYzdGdDZTbG5LMjdqUVI2S09kc2lI?=
 =?utf-8?B?RHM4L0hZMXlUaGJHRXMzWmhzKzZPeHlqaEJCU09WOTZaSHBuSFNBTWd0M05C?=
 =?utf-8?B?cWF3NmxMSVZLcjRVOG1Jc1NNb1l1aTlVVzZ2KzVqRE02Q1pxWnVMclY4REZO?=
 =?utf-8?B?andJanFENEF1UGlUdk5xZTFBTFBoY0JYMEpiSGJ4RXJVMTNJbUJtQnpzVWls?=
 =?utf-8?B?UHp0a1NrUGt3NTMwVWtMamhwWEV3bHVDMERBR0w2anNvRmpYNURIOTlmN0RC?=
 =?utf-8?B?K0I1LzNUUUdueEFocWgvSU9tdUdFZWZwdDRFZXJxVlYzZ2g3d2VkODV4MzE4?=
 =?utf-8?B?MVZJNmJqNU5MS3EyZlVLcWJZZDIzTVp0WEFENy9QY0ZNUjl2aDN5U0c0YWYy?=
 =?utf-8?B?bGhKdDdKaHdYcWF5aTR2Ty9oa3BlV1RnbjU2bmQzK1lLMk1pUU4vOUt4V0RZ?=
 =?utf-8?B?UGhyeHAxNkNUNVd0NUQrVGxodE5wTys2a0FWVUI2SlpQeTcxanlqTW5wWGVM?=
 =?utf-8?B?RG54c3czZm9jVW4wRFhXVEUxNDBQaWRpcjU2d0lvdldQS1JDV2tNK3R5YzlF?=
 =?utf-8?B?YUZnaGhWdkVKZzI2YVhJbDlSS3pDeGt2ZWNaMUU3R1pmcGtjRFFvaElBcFUx?=
 =?utf-8?B?U1dkbEVkc0VXbDFYYXdPeWdkQ29wdDZmWmdRUUI3VE5ETGRYcGgyL0VPcUky?=
 =?utf-8?B?bnN2RC9wSzNlMklTTGIrUGtoR2VGZytlT3FLT0lIZlV2L0VGSGtSN2tja0NJ?=
 =?utf-8?B?NVhsWW1JZ1hsVTR2MHd3SWVCNFdtZ21JdDBiSFBJdlVFamZTYi9Sd3VUWEQ5?=
 =?utf-8?B?MVU0a1diclN6ZmNma1E3M0syZWQrSTMwOHJIV05KOWpKeVdHN1p6MmxYTjla?=
 =?utf-8?B?YWc3cnZhaGh4bzBKaVBnL0p6U0FpekF3WGlaenNodTJRSmNtd0tWUnVieWow?=
 =?utf-8?B?ZHNmRUp6Ri9xUGc1aE0zUzRIZU11anU1WW5oTEw2UHRGam5UeWs1NlVjU1kr?=
 =?utf-8?B?b0NkOXRxdU12bkduczlmckpGY2NjQ3VZVm5aQkFrd2dMSkkrU08yd3FUK2R6?=
 =?utf-8?B?S0sxajNkdkxmMGNGVlluWXBrZ0Q3dlNuTlRLL05ERHQvR3hTeHZaaTByL3BS?=
 =?utf-8?B?T1BET2QwczlLREQyMDRQNXhZVVMrQVVZbldRUWZCV0ZBWUxjRkZyakcxVXpu?=
 =?utf-8?B?b0MxUU5DQUZYT2p2bjVYVm9LVlYzNlcrQnRBZndVaUE2ZDdNeFdkdFExYVNK?=
 =?utf-8?B?c3pNMEI5KzBDWStiSG5NQ05OVHR0c3kwT3ZhOHRJT3Z0aEQ4SW1EMEdpZ1h5?=
 =?utf-8?B?M2pTeDBEcjlURVRQRy9HbXphbXhSeU1kci9nb29ZK3prRjRMSjM1eHhHdnRu?=
 =?utf-8?B?YmFka2JoL1NGcWl1QlpWbGwvMlRZVmZXbmQ5TlVyckcvbHdJclAyMlIyb3pZ?=
 =?utf-8?B?aUZMRmduVCs4MGplQm1WYjB1Z2VnbWI2YkFJY2xEbDlYaVlOU0ZscXVtb0dJ?=
 =?utf-8?B?emhMc3lyTmlEZVE1U3VzbGJNNXJjSHVXcGNGUDNPZGR5U3IyTWJmYk5ZVGpx?=
 =?utf-8?B?QVUrdjVlRFdQeTFYZlFZQ25WczRJVUNJNWYzUT09?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 08:04:56.4491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfa916d-f97f-49d6-b440-08ddd976ed4d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8654
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5MiBTYWx0ZWRfXyKOPTQ7VGH7/ AjSY5QniZhJyuFSG5KvSbgJsGgjlPJYmCGxDFAWzqwUHk0dwqrHulor8Kw5vBuzlRr9V4lBSDXX 7yTuMSGEmniwRT9sgcW5dXxiOidkJwcbSRqLz6lzy9klIEPNxQ/LoTTHrDNsvt1gIXQM+V6+O+y
 GPbxLIkO6DK7YShGzd1XXdh57clfggoVvDuH+zRzmy+z3hz/yx3E6V8oOpo9NiRwKuoYIWAEUAC i+iMb7op8bEE7639z2C9k5Mt9MkWP8+cMfLJF718fBpYoyWw/0wiEciYdnZo2YSeWaq+YB8WCj/ lHTmyS+GEdoPS2pJnZxreOCiCjnjN7L5tDeaxZtErOylRr+PB3n3Ppl5KW2R9FbbRUiOuULkwP0 FCnXyR0X
X-Proofpoint-GUID: IOI9ond1I8GkSNqWuyvx2-I4wad86tDf
X-Authority-Analysis: v=2.4 cv=DLuP4zNb c=1 sm=1 tr=0 ts=689af5ac cx=c_pps a=6mxpIC5auN2WNi9UCfUMZg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=20KFwNOVAAAA:8 a=w1d2syhTAAAA:8 a=omrlzGe4tN78mTyd88QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: IOI9ond1I8GkSNqWuyvx2-I4wad86tDf
X-Proofpoint-Spam-Reason: safe

On 11/8/25 16:18, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>   drivers/clk/clk-wm831x.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
