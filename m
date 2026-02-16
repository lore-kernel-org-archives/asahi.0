Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D870524A047
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 11:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239867; cv=none; b=p8yNzfvNLjRS+8DfS55dHVQaUF1uFxheMBzH6sd19y3SJNpqdtnQ3TG1+TnZGWcJ2CcaCvedIRqjcjvECb3mmJ5av7Jh/pzbFOZDcKlSyve3B3qflMO3aU4DYorX9fuZFSGjCk3W6VNnq5cGTpYVgyM7/dQJTPrz7DuFNembFFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239867; c=relaxed/simple;
	bh=5x7EKhBU5ewPua8ICjoklEgJzewBTCgQsGAMmItM3TY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UpPu9FQidIHZkGQBF4oDeq2z2NklcAAksxrzek+EbPsraZBPkQ8AEtlKw3QD8NKG9LfM+uL17Jr3i7gKNEtuHHnVhLsejL0B4wuM2MNAWvQ0Edkd1Kcfr2WkEu+IOCuiNQRLTW9Kn1OmflvclDEmzPD0tR7ZeMdBrVh9eME5yxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hjcr/oW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nx7OI4l+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hjcr/oW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nx7OI4l+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G96WCp1371898
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 11:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F01WUNnfmnb
	R0yYPB7Kz02Ieycgpy7j4Qjt4QDWos+A=; b=Hjcr/oW07ut7NbClc0omdQp/L9M
	wkcrxXS4KA1jfTn7aDyR8+ZvemvjvRWppcZN767DfNyIDpN2bWzk2zlBhe05fArT
	pKICy9l09DPeiGncJBsvECtauhYLojMGsSh6rfxrtIKP3dqz1dsBGke509mNO3Cs
	XVzJJN16vR1ThcXbbH9EmpHsRW6STCQWxszl1AEBr4NlUnMOyz1YFxUHui9IzlsC
	hnl6YRr0ArVfxfcRcgeIoo91YJANHB8C4RCEsOK5TKozVXC0qDbzFkX14ni7BDF2
	E/uSGcJvVeV0LkJ5ZFTwkrYtI935CcOVt5UKEeg+bTp503ltAcm3NPCwFWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6bujj7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 11:04:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a129cd2so2129337285a.0
        for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 03:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239864; x=1771844664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F01WUNnfmnbR0yYPB7Kz02Ieycgpy7j4Qjt4QDWos+A=;
        b=Nx7OI4l+UlykQblouHn3h1tb8Fa9Q/hXaJ3RBqOiOE5jT2fqfVaY4AreeV3CPHyQJc
         9tsknTPufNnceSPnx7aH5bMTu8tgl4Z3BwsR9/9pSndlBGu+jU1udNQyJpnK+zWjbYXz
         oW7s9BtkMGCSRH1l1xnfi3J8I4NS4YUiYhNpJ+F2gbRlBqV5lGBoAk6ooyBlJvdwfODs
         oz9urfFbV1IFBK3/LbmxFwyzb6z2qJZskcTv5/1lohdedr762Y6jriHvQ3hy0Cc02Jjd
         khhZztYXcaD8P7W7x2f1SbXtpfcjPGU4mIkPft5yDDmcMS2+IGhI1GEPq61aMmarM6cX
         JZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239864; x=1771844664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F01WUNnfmnbR0yYPB7Kz02Ieycgpy7j4Qjt4QDWos+A=;
        b=AlYMrO1QWC5lbIPv6xNlI3tyk5zSngdj3MsAvj8Wq4bX6CKtRbnV69cXwkTp9eZxz6
         H7I9PcmHFkAEmxNtNNCvZYwSWpM13i1Uhyj1Inh3jy97c+N6RdCA5dr4NZb6izw+hfbI
         8ogWn2Z0NMgQAWpVv2wlEXnmSrgzDZDVbsaiU3G3sL55eE2iUTDgdBTn0ipPsP6A+6w/
         W0USIinQprU2FtY2PVJeeo7QO3SULcw180bBrI446ckIOMk/XtVwyvgFE1UdH2TIqjdH
         uYVBcj/c3tpzYxEX+7ZLTr1n3wereDzA19FvCGjMf67kJNeOXBN9iXYQ/fjwnmVujoqw
         W3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCU8t8ouGNoIsNrqJQDc7kDX1iYFXlaUS2oLaYBR6oQfzEOi8JwGRYZev4kd9YNWGejZl2hlig==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpsREHlFNv//i6bUJIn6Lxg//XspzCFkZgxLUqRPw+zx6PxSAD
	UdlK8R93n+OZVP8V/QoaMzLfDAv16IXRqpfDw81Z9CRemu28XblrnQM7PUyARDBOsYE4A+EVndk
	N8CRCVp64+XaGEJpR9dcdfGOKNd1aNIPG80cDdUFQSrhPAj6Dg256dUlGaA==
X-Gm-Gg: AZuq6aJA6L55GwugIjv8nZLZydMvK/BkcrLvmh2dxZ9xEjL4WRfz9vcoDsV3jHYY64X
	10PebCyKbWBBGTqyK3sTFRJ1OjacAHXJipKoS8bq7v5EEitGdhsqytvaXDyouT94dcGf7NySYIC
	w9CkLd7Sm7OMPKFx3SxnrCq+5kncNI7vWWIuRxbImiHcym/uLIOPtGBP5bC7DGmuMxIMSEp7VLD
	h0PNiivW1O82ainDth/LoFu9iGPnH67d6plwwCf+zNjxg8lm+vSGlgD9C2e1/2cdRldOEOghkx8
	WDd/X9y5m2bfa0f8xOJuAnevAJCnBfU3uxilEYAuHUYIhbFn6s5ERXTq0gQ/SB2xFAirl9N6wPV
	lwRzS7GazBhuQEQWn3+pwGKS/NI2Tg/N7n7pEVw==
X-Received: by 2002:a05:620a:7014:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb4ac01da8mr888184485a.15.1771239864143;
        Mon, 16 Feb 2026 03:04:24 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb4ac01da8mr888181985a.15.1771239863711;
        Mon, 16 Feb 2026 03:04:23 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm589572745e9.6.2026.02.16.03.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:04:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] phy: marvell: mmp3-hsic: Avoid re-casting __iomem
Date: Mon, 16 Feb 2026 12:04:15 +0100
Message-ID: <20260216110413.159994-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2660; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=5x7EKhBU5ewPua8ICjoklEgJzewBTCgQsGAMmItM3TY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkvmuGumLqCgJtNAvdAK3FxSfjsCCVupiMB6DO
 aRRH/Dds5yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZL5rgAKCRDBN2bmhouD
 1xyPD/0doaU541CGXdyo+TDlx4q5IRHmoaKkM/nJvV55NxJGn9KWOqxb2jB4u1YpsFd/XOEh4vM
 EiQ1f5MP8+ovGUSJ8B7Gl9BUvMNfLKKjhLYGGMUYAnhsPY8dM9d/ru6RLrYFaWQFhR5Goqvo/jq
 Pd6vn+deb8KAswMtnQA4NMGggINzxnr560ONASrJReEYPcaKDxs0WHJj0IWaClC258cRFtCNXgr
 sheBqKuiTpsPGhqXhvL4Eq6Xm62PpCb7FYcBNlD2P7U93R+Idbllc7uetzQbpi/qgipDWRvJd5i
 eEptl9HfzgHd4lQpleW1Y8G6i24pm0xvCARUgZ8oNimjEjKrnLHBOqr6kmpPY8MeuQQHLjNYgPM
 3r0bfai9ZsT74ygiraFpBz9/7uY8MCJ5863aMTfGaVOBJcyyR35IIoK2k147wjv/tNyz4mYieKs
 LMK9NB6FG0U0hn3kQ3iktoZCgwvwOBmX6WD6PmMdbaKsOREUlcfLLDDaBE7fISuRFpG9UXTB/Dy
 swSzMRK95Lxq0t1E3a4ZScx/5Px3CquXsdvJI8ezpzYrrSE2VZNyeBc9tpzUjNRtsr5OASc1Y+2
 xhd1UGwAgsB8tnlVWXFpCYKHi0zqKtR8JEhicIg/aHZDe6UYjiqLfCPNxF7UT2ZZg6kakhCQT4F pOuqDl66BwCcHsA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1P-G3bLK6h8ElKBF55UMyxU6rLC6YfQM
X-Proofpoint-ORIG-GUID: 1P-G3bLK6h8ElKBF55UMyxU6rLC6YfQM
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=6992f9b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=SkZ1eIaMs6HdBQsGQEkA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfX6xlBNh6y/wKc
 JpAnKnl/dmKK0odEtDhlptVqXXBGe2uYMqw5vGH7tnlUJxJ+YAY5FqJlFa7VmgIDEkWie3EPJnZ
 r2uCtmz1W19HDmFTJRKMGuKiwNkNHm1d9BBmFw7Kng/8TOTQqzX2Azh7cft1TUud2uBgWcxrH00
 JIK1IpVJ6I7sCt0bvL+F/Zu2HO2DO8z8Ay7iTKJz8DuWiC3iYtT5kbYsBR3Dan6IBXgyqXBcKHP
 MbXYhbD9bITMWzbM9YVX6DNH+FW0nrrWnyssoUY24GoKQ1B45zy/xjJ4gEkcTukYEXrqKwYSMKv
 XTkqEEP1kQ1mppwyWjMagvmIC6x9di9FoeD9Gj2z2FC8CmEnMfWVy2y1ePYDYda3vsHMA5es5hx
 fuqJnNSZupW5ZYHmTfhCwg4D1J2KEpeRpa6UE3YfKnBqMqDXLZpXMOz3XCQLKDP/+3Taof+eyrT
 B05M7xhWlT2bWX6UnPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160093

__iomem annotated memory must be accessed via dedicated accessors, even
if actual code is correct (accessing the driver data in
mmp3_hsic_phy_init() brings back the __iomem cast), but dropping its
cast (with or without __force) when storing as driver data seems like
less readable code for any future changes.  Instead, add a dedicated
wrapping structure just to hold the pointer without changing the __iomem
cast.  This makes the code explicit, obvious and solves the sparse
warning:

  phy-mmp3-hsic.c:58:31: warning: cast removes address space '__iomem' of expression

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/marvell/phy-mmp3-hsic.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/marvell/phy-mmp3-hsic.c b/drivers/phy/marvell/phy-mmp3-hsic.c
index 271f1a2258ef..72ab6da0ebc3 100644
--- a/drivers/phy/marvell/phy-mmp3-hsic.c
+++ b/drivers/phy/marvell/phy-mmp3-hsic.c
@@ -14,15 +14,19 @@
 #define HSIC_ENABLE	BIT(7)
 #define PLL_BYPASS	BIT(4)
 
+struct mmp3_hsic_data {
+	void __iomem *base;
+};
+
 static int mmp3_hsic_phy_init(struct phy *phy)
 {
-	void __iomem *base = (void __iomem *)phy_get_drvdata(phy);
+	struct mmp3_hsic_data *mmp3 = phy_get_drvdata(phy);
 	u32 hsic_ctrl;
 
-	hsic_ctrl = readl_relaxed(base + HSIC_CTRL);
+	hsic_ctrl = readl_relaxed(mmp3->base + HSIC_CTRL);
 	hsic_ctrl |= HSIC_ENABLE;
 	hsic_ctrl |= PLL_BYPASS;
-	writel_relaxed(hsic_ctrl, base + HSIC_CTRL);
+	writel_relaxed(hsic_ctrl, mmp3->base + HSIC_CTRL);
 
 	return 0;
 }
@@ -41,13 +45,17 @@ MODULE_DEVICE_TABLE(of, mmp3_hsic_phy_of_match);
 static int mmp3_hsic_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct mmp3_hsic_data *mmp3;
 	struct phy_provider *provider;
-	void __iomem *base;
 	struct phy *phy;
 
-	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	mmp3 = devm_kzalloc(dev, sizeof(*mmp3), GFP_KERNEL);
+	if (!mmp3)
+		return -ENOMEM;
+
+	mmp3->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(mmp3->base))
+		return PTR_ERR(mmp3->base);
 
 	phy = devm_phy_create(dev, NULL, &mmp3_hsic_phy_ops);
 	if (IS_ERR(phy)) {
@@ -55,7 +63,7 @@ static int mmp3_hsic_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(phy);
 	}
 
-	phy_set_drvdata(phy, (void *)base);
+	phy_set_drvdata(phy, mmp3);
 	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (IS_ERR(provider)) {
 		dev_err(dev, "failed to register PHY provider\n");
-- 
2.51.0

