Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013058.outbound.protection.outlook.com [52.101.83.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE2125A2DD
	for <asahi@lists.linux.dev>; Tue,  5 Aug 2025 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754386509; cv=fail; b=YabCkVjCer91LdrSTyGJ5go+9We9PIRwJ6kQtvIZm4uBfaMzAC3nXyDM1pah3LQAA0ta6wfseHa9MWKftg81yb94hSKRrpV301g7/5YWlo5EixQWO9QAn2m1L282hbFueuMETg1+VDHXJ5WYeZ/nhbD2YiutXZVudLiTbgRbmOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754386509; c=relaxed/simple;
	bh=eMRzHPvbQr/0q02t6S/rqw5JAdw0Q+IAAyvCfpg2G44=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ALoPX7nZn034PKEjmRn/E5aNtZqt3m4uwjp+aUy4fVruaN801eRhM+ZYsOvh6uVe+9t/y9YfcW+Q+/McBSRs2Ojn6kzLsw5IFHKneH46mrKqnbT7EuUo4ne8+5fDN6lZABuHEaXCkbJq1G2ITZtZw1CvUcRpwGUKwMblcPyJfDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=qvwVxrGc; arc=fail smtp.client-ip=52.101.83.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="qvwVxrGc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKoB8bvCynzyfivRK6AMonWm+p2P/B2/ge7UtYqISH+1EWB0gCQ5GkiBY9amyxLraLEKO7HXzqDc5RN6QiPJRfr59dgFKMder1kzXPUANY8io8mNCmjhUkcuft9+gYaxMWFhLsRqERx3rErYY6kxBNcLeiCpVrUGx8/mEWSFbnBocDUJ4AsRlk/xm0c0CocEpHyegzCgemZxoXtpFOIST3uHNUsdHLsUn6dHgOGNxepqcnjXdlr8yZ/SViAwzkaguwuIeJQPhl2pl8XkPqhb6lw2Q2GmKJu/Dkcg/hnstMhEOXqYd7SmYRA3NSOzdwrAeHPry7rdOwkWwpMyfvWTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwuCEFDePWI/qo2gdtVC6qqE+xwIBpf3ljHPDjdxUDw=;
 b=bvl9LWuIVCE5bZRQC2p9SvJjaKUBElOYzhNykY1/8lTljnN+csCAFoi2/zAPbSseGwh1x7w+sxrEyR2zhoCtjJNNu66KVc5UQAHiNKjy0qrT4iloSdnvaKgmM2LeCtUhYo3pcjfeDIB3jyuVMEBpTDmlr013C4dYnCQRvt3nUPDA8LHwS5GKhPoZF62HKg8VyogEB4KhiWv2ANc0zgSlKrTqPIFNQTMljnsr0kCFuz9xDWSk9EE9zDQ8auPsUUIsHXxiIGYjOJATT1rBv/MWLViFxZsgpyZ4El5MoL0RkPC/PpxRoTbRFRUuJaCdH4ix8WvyUVu6arEdeRBScSL6zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwuCEFDePWI/qo2gdtVC6qqE+xwIBpf3ljHPDjdxUDw=;
 b=qvwVxrGcedmJh4k2us16Rb+JHnndr7jGwerDoaNY7XK/YHpL1i332s9C8/NU4ScPLc8JJKSC4uY5F6zP/r1QWR6bE52NBOsC+mUaQFibzyV2AuEmmozl5Qc91T6VedEVLtXvHFQwMSZHG2oqZGEkml9vr2f5a9PKWvHOecBIOwk=
Received: from CWLP123CA0021.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::33)
 by PAVPR02MB9229.eurprd02.prod.outlook.com (2603:10a6:102:326::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 09:33:40 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:401:56:cafe::40) by CWLP123CA0021.outlook.office365.com
 (2603:10a6:401:56::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 09:33:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 09:33:40 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 5 Aug
 2025 11:33:34 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, "Alyssa
 Rosenzweig" <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Lee Jones
	<lee@kernel.org>
CC: <kernel@axis.com>, <asahi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] mfd: macsmc: Remove error prints for
 devm_add_action_or_reset()
User-Agent: a.out
Date: Tue, 5 Aug 2025 11:33:34 +0200
Message-ID: <pnd8qjym7td.a.out@axis.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A790:EE_|PAVPR02MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d89aa18-197e-4d18-d979-08ddd40329ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+3qYrt2u1gCYBAWjL2aFRNHAFG2n5JC6iT/SpKb+U4RLeMLEcUziQMyZVu06?=
 =?us-ascii?Q?kvc+C8VKl5vEqxaUz6YbzEJnX+uq1T70/8MbvlOaA/D1twokiTh72XHqky/B?=
 =?us-ascii?Q?hjHK3VS8Dvlp48COUu45MV4wyRpTzu/JOyeNyl3fV7edv30UpFbmt6rKgt9W?=
 =?us-ascii?Q?4PJZV1uKdiEpQGxuXKWSlr7rtYWQ861VQQNO1DfL2pwhhgMwKsI1dT16U5W8?=
 =?us-ascii?Q?60ubElcJWeVvOlfSNM8x20pzdiDbZubNEa2Q5vjmr7jnKRPAxSj30ZDHPlg9?=
 =?us-ascii?Q?d+es3+eqN4oYmYtybE4iP/a8W55ctONx01M6tDH4w+jf+GIZAmPPpMW7vHLf?=
 =?us-ascii?Q?jEY6PpIUMMn0ZRrPwkcVn8fCU3mclZEVNZGgc2RfnBh9luKbCO/LirRYiGSx?=
 =?us-ascii?Q?VP1c/lxFlslUUtnBssaCOdKonE420bhSc6KzSuWLrwktK7BI5Lim+zcvsMge?=
 =?us-ascii?Q?mZ1nzA6Q6koKdydipWpaI1uzWtC5xioeiJybmg8WB2aHfLW8jy1mVJg4sIS1?=
 =?us-ascii?Q?KP4A8aORvAZm7ydxOjREZmX+AFvbLmQ93tAXh05qPm++vSPGCMj5wAHbr7u0?=
 =?us-ascii?Q?VU+NBEMPLp+Y4GzO5HziJsUZ6kYci6CKzGaQS4j1KXJYpXpUNAh98wkq34no?=
 =?us-ascii?Q?njHuipP06hDcv5sBfClPQHnGSDWuBzkcw8tMKh4dtpNLs5QIYPWN0STQ/JUg?=
 =?us-ascii?Q?4d8VSC5/73ejystYggr9+Pf7HxFTYyX+Lu0+OaE5w3FBZCaJ3gaP4uAXkBLU?=
 =?us-ascii?Q?8/YF1NqaffKIyOHhi/bpCSqFYk/y37oe5nr+38pIp+RF09WzRNUnX9CgScRD?=
 =?us-ascii?Q?wcWsLvA9PDt0rs1NQi1wkG6mK2qC+tmExoJmDD2ticit7Qb2bzN0kj4KAVRD?=
 =?us-ascii?Q?KHIFxVzmRKCbYAZuaWkRBgLwra8cDim2sduecZx1qRIYVQGNF55b6rVcvgY3?=
 =?us-ascii?Q?Z1q63IYyyZvRnjoSLaq0cNUBZpzOy3bAyF9k+5x0J3yHdy2WwkaOz5qZJByt?=
 =?us-ascii?Q?yGAoG+hUb1+bOJ2Fd42zyXR/pqEkceAqRcLT20RvZsslGxkiCUeo7TAwGe3O?=
 =?us-ascii?Q?UZ8SyQl38s0n20MRYpJRTG516lLFye3WWUnWwM+zHNF1pm5W/oWPM5NXhl0V?=
 =?us-ascii?Q?aVl4gBHXqSwGL8V1zeKGjWosrTzFXweB/fWbx1oGitCcxmJ29WuqNq0FPltY?=
 =?us-ascii?Q?wvS96rMfijTe8dJ3sk1jN+EUhzX8rFDsYbk2wtl29SpkYOe3PyhNCw51aWDj?=
 =?us-ascii?Q?mKGbgrEDplPgrKXsI7PUxQtDl/xNXUinlWAIpne+Hh/ha6yqGvtYWnxTDVJ1?=
 =?us-ascii?Q?5TsMAsrHGycKNHDuGkRWchNt9UUln9i4INEeX51prVpERf0rsDwu8ldNenP+?=
 =?us-ascii?Q?PVXqM4wAJ8VYn1AO7DQWQbWE2pUXI+8qmYs/qIfz/vkkyC1r7JXI+ytraCOi?=
 =?us-ascii?Q?nSOaU/oAEeoKX+eMHETqe1RrT7ruaXBqZBEEklelAU2pAFhM67iZt9Jatlq0?=
 =?us-ascii?Q?VbywsSZMzAiA+NYcN63NxYaTA3SRol6bRroc?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 09:33:40.5168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d89aa18-197e-4d18-d979-08ddd40329ab
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9229

When `devm_add_action_or_reset()` fails, it is due to a failed memory
allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
anything when error is `-ENOMEM`. Therefore, remove the useless call to
`dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
return the value instead.

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
Changes in v2:

* Split the patch to one seperate patch for each sub-system.

Link to v1: https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/

 drivers/mfd/macsmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 870c8b2028a8..c8575c9c9f4b 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -429,7 +429,7 @@ static int apple_smc_probe(struct platform_device *pdev)
 
 	ret = devm_add_action_or_reset(dev, apple_smc_rtkit_shutdown, smc);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to register rtkit shutdown action");
+		return ret;
 
 	ret = apple_rtkit_start_ep(smc->rtk, SMC_ENDPOINT);
 	if (ret)
@@ -465,7 +465,7 @@ static int apple_smc_probe(struct platform_device *pdev)
 	apple_smc_write_flag(smc, SMC_KEY(NTAP), true);
 	ret = devm_add_action_or_reset(dev, apple_smc_disable_notifications, smc);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to register notification disable action");
+		return ret;
 
 	ret = devm_mfd_add_devices(smc->dev, PLATFORM_DEVID_NONE,
 				   apple_smc_devs, ARRAY_SIZE(apple_smc_devs),

base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
-- 
2.39.5

