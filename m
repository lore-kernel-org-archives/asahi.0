Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F387EA
	for <asahi@lists.linux.dev>; Mon, 27 Mar 2023 05:49:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/40ewTNbauUtINsLmvuHVz2cz/VbYx85ZPPLAQuDrMTELQZIrCgbOg1vUn4V6xu24J3psh5mjqn6WbvvoKdsR710rKb0KIkGjr8rmADYlw0xnqilI8SAGhmm25HCkUuYVHTRBHbS9AniJs8canGaZplx3Ap/kievQLhMGZ8wHJZ2eLCignWe9D0auxGTxbkRP75r9OAQklkKvXh73YmeeWmGHKeqzuFkpqES1yECcTsmJltEtkg500KhU5I+YUs0CafpZeAKXqPAV+b8AD+1IxiduXKtPvN+5y3BSFQfIvvaop6XZjFFFTTWkEk5tuqhhr7GLQRAo4aNbUjWQcZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQ+4FaqagUku7Ih6iKXSnGqio/33UT64IuV0s7aQyNw=;
 b=mjZncek2UFUozfkwFc1y8Xiv5b5fu8xfVe6sCHz52T9U5A/4oo5QcS337QT22GAP4Aj4jbNMY2IAOQEJ2Y2vgsPU2hO5n5CeRkuDYFBXd2V4j30bajiOOEfZwGS1qX1B0a4UUpKwgXJXhTnRpyUtPWu67qGnPSOlhsF26+Yn8peJHcSyrRJHfpN2M6+RWzZbGLnJjDhrVHBcIxfTYLNOJdzfMhZGGt7NcXQQBVOotgPoDaOpvtNYTb/+Sp32WCyLnzAwrMCd3pb1Y69id1ROhrUt9w9Z4GTC8Eu26oOPHI/83kpfqBNaruv6iEyimbXXv+3m52x5nNatnH3TD5nbNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=marcan.st smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQ+4FaqagUku7Ih6iKXSnGqio/33UT64IuV0s7aQyNw=;
 b=JC5rTkdxQp5HMFYRp6F98q+XtxsxiC0rtGMyJjlPeYq+5Ipgd7doN3bdojTtw533rnVxCu8We+ISj3OZqUjwBIINJ/lHBkX5eeLn1etdVbafB+ZXbVFlLQlFOjQJsPQOR4okPIdtHpNuMSzy/aKrYVPdOWiLvu9C2YZIdwknATF+ao9cDp2tiYqUrOjvJMbjZFhz/tEWnsBVhjfyHf4YI9hl929jCS1J6L4T0g8BLD4p/d6NI8s0+N0I8PK0JLc0fwRj+FS0kQGE8nL99v2jENdfD6uOvouJbzMTuqTYZmOJcC89lHOiyE1cjfWjT7vNnOfeov3StIqDiWxM/Aq8LA==
Received: from BN0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:408:e6::24)
 by SA3PR12MB7999.namprd12.prod.outlook.com (2603:10b6:806:312::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 05:49:13 +0000
Received: from BL02EPF000108EA.namprd05.prod.outlook.com
 (2603:10b6:408:e6:cafe::ab) by BN0PR03CA0019.outlook.office365.com
 (2603:10b6:408:e6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 05:49:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF000108EA.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 05:49:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Sun, 26 Mar 2023
 22:49:00 -0700
Received: from dev.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Sun, 26 Mar
 2023 22:48:59 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <marcan@marcan.st>, <sven@svenpeter.dev>, <alyssa@rosenzweig.io>
CC: <kbusch@kernel.org>, <hch@lst.de>, <sagi@grimberg.me>,
	<asahi@lists.linux.dev>, <linux-nvme@lists.infradead.org>, Chaitanya Kulkarni
	<kch@nvidia.com>
Subject: [PATCH 2/2] nvme-apple: return directly instead of else
Date: Sun, 26 Mar 2023 22:48:38 -0700
Message-ID: <20230327054838.67353-2-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20230327054838.67353-1-kch@nvidia.com>
References: <20230327054838.67353-1-kch@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108EA:EE_|SA3PR12MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: 935c2354-2ac2-40ab-1fb8-08db2e86fe5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZCMdCK7yomIL0R6sUXv2Zz9boK0z54pDlOUSa335yRZd5LvKB5Z1izXDUpt9LVBX8KM+ae/PIrkm91Xjh0YxPFrQkkoQwKnGNWZJ6G3YSuXpLTSznpLjSnDxACADeWQHnDzAm9oXvgXfdOXtSSuk/T6PIaJHVAUpzz/B4RPJRo3JTJcAgRYpJVPahnwsi0SkPW835LVE+nrQgjuS7luPvRUZbDr4kEzTs42qXaazc8ClHYiah75oh0E+bEceMhHU+gF4gRubiy/strkTrz7ojq5k8lF8kJw2VaKOnwsmDjuL4wZDGSwTPJutSHvhwjvDtZQ/Cy2N8tGwAfi75FiF2QseM48WkuMd9j0vWVhIkrnb6ByGFSrd5r8F237h3gXrMt/y4Gwk+pOygZCcEUdwybSt17dsPfJq+FFn6BhNKRNlEmOUfKPVBDMVtJ8UkNvBY37hV08rMzQfiAXgw/odiWSNRJLFLurALyKmhYK3wztUcFtFiZ+ZBj6Pgxg4IesvUVTkhMF++iFB9ku/DIy5eXEayk9A2nT64HWCGVOIpwOP/amuqzIvWSU+zDvIQ1VM8ZvRw8NMXDqCZthZVevqSm1TmpydCjZYfHIeWrT9QYN8+UG+xucyrK/L7SuZYvv5VLJUQj+Qs1DVeVHkShOS7DrzWVhQ2j5n7Q+UXlKyOiETdmRvJyKioXCHZmwuPvGEKqgD5JfPEJn1ByXqzW2qg5awSSwqKkGNlsIan5b6U4uTGYHtY2BkopVr4iE/lVnV1y4xqJli08iFsIZluucEkg19SIsIQLrmYSXh6W8UChg=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(47660400002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(7696005)(7636003)(4326008)(41300700001)(82740400003)(36756003)(8676002)(36860700001)(8936002)(356005)(2906002)(70586007)(70206006)(4744005)(40480700001)(82310400005)(478600001)(5660300002)(316002)(6666004)(110136005)(54906003)(107886003)(186003)(16526019)(47076005)(83380400001)(426003)(26005)(1076003)(336012)(2616005)(46800400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 05:49:12.8905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 935c2354-2ac2-40ab-1fb8-08db2e86fe5b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000108EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7999

There is no need for the else when direct return is used at the end of
the function.

Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
---
 drivers/nvme/host/apple.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index 942a3b71a6d5..33601494ae50 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -217,8 +217,8 @@ static unsigned int apple_nvme_queue_depth(struct apple_nvme_queue *q)
 {
 	if (q->is_adminq)
 		return APPLE_NVME_AQ_DEPTH;
-	else
-		return APPLE_ANS_MAX_QUEUE_DEPTH;
+
+	return APPLE_ANS_MAX_QUEUE_DEPTH;
 }
 
 static void apple_nvme_rtkit_crashed(void *cookie)
-- 
2.29.0

