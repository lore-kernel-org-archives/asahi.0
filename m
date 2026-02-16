Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3422BD031
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239869; cv=none; b=rPxVILcuTYbsNMWEi55WSCrPOdhIoern3/9whBWHkUEA9X1enU4sO6DSByZlb8kUOqkI95k/swQkxHKB1RuQLpXhUwuLQa93MFaqUNqURK9fKQHYPp/rRwJ9h2X/XQO/3ICzUCBehy9r3EgAVS9CErCXKnxt0iiHVTPagi053qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239869; c=relaxed/simple;
	bh=PuKi//RWjSJoYL/Th2Gud7CekjaZAZonzL+Z2LBjfj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fz7bdBNYq4v0R2752+1D42QoJh8W5h/Ttmn+BIHmI6yMqKoX3e5WIcI+wVz0Wn2B6g/a+dKkQojfdjOi+bAOprnC2deEgh5Jkv6NNg8Au01Xdp/V5tILvwmCOAVgfJn4eTA9oH0x0sBnBSzNn6Uib5MwMwjDE4aSlIo/ylh67bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmxjZIKm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q57tXJJJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmxjZIKm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q57tXJJJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G96WCq1371898
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 11:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+4UOtGqik+Q
	vwJz2/TB0+lT+eV9naglo3mkbHB9AkQc=; b=cmxjZIKmo5SdpDShUOOsFDSR6fr
	TUYz2J13IMDwq3zI7dsLgcYWmcmym3kTYr4CvzAIC4xXQd0zhlJG6h/YZeMJE0El
	DvkLNSf3I9TpEyL81oz/TdNtZh5q1nBOanEy1YZ+QCpueYkf42gv4s30q/Z14JNV
	/XKMVFgAwdSZwdhwARVG4UetRhbTYTeiJSzmSJFTodBEFGm9OSFaKoPtfT7PLyPM
	/+cA1o9zVKYr1SPObSwHcAIdj0kAW/fiCeb1iOagBeTvowndnviMyuUpmaFs3wnB
	vPR+HOY/9v9cTH+cBzGH27Y2YUOAmta7mzdXKYanzXpnFJcZpEDJnnFsUgA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6bujj7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 11:04:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3a129cd2so2129355185a.0
        for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 03:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239866; x=1771844666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4UOtGqik+QvwJz2/TB0+lT+eV9naglo3mkbHB9AkQc=;
        b=Q57tXJJJQ6Icc8dQBFj7zC/ZevEHGFqaQRAdNvLuG44LTzlFJxoXzSZdx9HBFZsxws
         Yv0h6WGWZi17RPvJhzvr6oEXA46QKpo5Q+9imkG6PaY98ZLT2W9NeV3lIb5mm4rpxzrU
         2T/01G+sbe5/NdGirV+RAy7P/dZwuXpmlcmTV/5CZqqzLMHRP47ae1c5uzM6fE6RP8Bd
         xxQRxqsp6gLn8QBg/uhWi2xq1cKbAPi37Qo6r4N3Xl8G5d+nOrc6mEHyqctthqsAh8lY
         RO82X/2mxRxOrcbysOS0qr7zZBFZcgi2KQmTf0w+nWnY8wKjAWE3yA9aGUBqfjWuY8OV
         kCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239866; x=1771844666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+4UOtGqik+QvwJz2/TB0+lT+eV9naglo3mkbHB9AkQc=;
        b=h4b0vl54MjSRAvH45XUEzXEJn2nLfaYRwFQRZUgl0QPkEhHUdhKT5mLi6oaLR/VqE0
         6mH/Xn90iF8CHPb6kAeHQCCPMlRBg3+3RlsKXGyabRVqUNHAz0KzmlC9bAyjFkIYAVX0
         pngKHK3VK0y1z3JDiljSwM3XnqdOiHZS6hywgejB3Hb4gsM5OsazEC0lBYbvxFcUnmCb
         r3r5GQYJoHqlyR/vtidFQzR+RIPMTP6hjcjAuE612VXYRqIe5piaXCsqw7YVz2C+xtBO
         He6cH2d5H4taEhCtCZCuthNgtjuBz8rOlJwINPc8WP6qLYeoKsc3EEcPngYwSHM2JkxL
         GM6A==
X-Forwarded-Encrypted: i=1; AJvYcCVxhwgGms+y1YUhMFjDoQKIjBgOPbWV44bzuScfI4kC3v9Qx0NaPYeB9j20/whzYteAP8Gx3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEdGuEvMjlsH9L/La2j8BXsJ2GYRKldx1arr/Ssa1KAeO2EPPJ
	6gmf9+ImFo0CGzByJoTLNqt+Df5mtM2hyxPA4/JTODBijE31ad54SLZZAgNUdRzUhIyYlLgPiqB
	pG0K09vJknpR0S6XNmCrvT1xb8HGsESddKt/AzrbWueZ6ZF5iYKpwzRcxqQ==
X-Gm-Gg: AZuq6aKwR+peqcdNlRtzHdVdqICSE0gmc+fCI4f4UORh2zTlhXDiYV+jI3pVErKy66h
	c0yASLlxFINS12PFtEofCzMNMkZK/XL7jHFUoIiuVYoSH0GzRE8NkqcgJVjZ/NHN1l+OA40rLjp
	fmI+GTLap2xHFpHgtimmtESmiSBfe9qtIZIqolsLQV84AipKTesahuCUeb+6fjdyNEeU6gWTkBV
	ZY6W/cmcNJd1RakN36oV0Dl21iJMlYukTcnaF6C2SIa6qrge6ckX2QUvITxlqERY8YPLVqRAXlL
	niE+/GGH+oBAY9SHRVhs9AtrQQjPvLTb/eMGwtYjGYY81JD7ppBOEKnhehgVuw8EX1C88VYk/Qw
	28D4/06G449lT1ioLJrmmwV2L8o1H7eQqvYyZJw==
X-Received: by 2002:a05:620a:46a8:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8cb4ac7d40bmr980230185a.29.1771239865778;
        Mon, 16 Feb 2026 03:04:25 -0800 (PST)
X-Received: by 2002:a05:620a:46a8:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8cb4ac7d40bmr980227885a.29.1771239865393;
        Mon, 16 Feb 2026 03:04:25 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm589572745e9.6.2026.02.16.03.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:04:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] phy: qcom: qmp-usbc: Simplify check for non-NULL pointer
Date: Mon, 16 Feb 2026 12:04:16 +0100
Message-ID: <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=PuKi//RWjSJoYL/Th2Gud7CekjaZAZonzL+Z2LBjfj4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkvmvJCfKJ0aoPYfKrLswzpxol6BGDAX4YsmZO
 Bl4p9IrvUyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZL5rwAKCRDBN2bmhouD
 15cAEACRnZMiu1htoX9cxB1Vwj+aBvwUSP7uhENSAuxz8GHr6mSXXOdQgpL68JJbK6ezXC2Bw3Q
 eNAW2+4p4Hb8KznZpMYdQMLp9ojUjnYWOiPwGhn4aY9Ql+a5pgyy829zOmRFLRmvzgZGVpV/85s
 RpKdcLEPNMQqJKWtxG60h2QehNJ/G98WeKyYv6wLxdLiDtPOzLIkGcMzGHzZq2Mo0vDGY7zLfvq
 NLM36XwkuC72+xoSD+ZXu2ThHwNlQPnd0Y2LgQxeVJjQifxGpWl57sjCjDJELia4kONzGcD12Un
 0kOGlJ+M2IBJud1IZsh8tvXCbrW5xgUSw4TaUtcoh2aQEuZvYngOp1zz9scq7neibqfkjB9v6dq
 4AHVDf+JMyxSu8M82ni+fqzZhe/sfQFxHgeVDU2bmRq+mGG0gjUDbTHJLopusUvR+D+MzZBS0yr
 rmgRl2wv5GmV2+rI/c9Uy5PCC2Ru+3ulCJlgUXP1n3potgdWQaq4lDJpsdH+BXbRAX6hN1rROwq
 ZBewIiYOb5xvlrCU1fxeNxus8gtpAGFQK5fS+686iQFzKeccogPVZql9U6nDmvMpP3FMwY3PSlD
 vbdyXChRug25nxLQLErXNk0wwmsFJd2Tn/Myi3k39XKAXm5ylBjNQR3YhFP2AAZJoLD3ikvaX1F vpaEdpXC8IZvJGQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0OuDdsRyFaztMfkM3_YuFe9uVwhM7BQc
X-Proofpoint-ORIG-GUID: 0OuDdsRyFaztMfkM3_YuFe9uVwhM7BQc
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=6992f9ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=RGc8Xe-UuCxs7xLLDosA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfX0LaTEPpHZ0xO
 TXUl/WaeOhQWCE9vteT+naJgNgVFonGKme5Yj+cG7ol4PXZbpBVorz0ZPQPo5vquxkJyY1kNPYW
 jFiR8qpjXXU220Hupolu/04ZNPFBKPgeU0zsoE+OaTwboRDZ/PpC2t6BspglSg0FcTYFdZXWy5H
 byC50mOwkSnHiFDF7aqr6msBag4eKE5Z+lAurgk/LYlZ+0MjMwPVrG284z7YFaaKRhrmpXABno5
 t2Rd0lcYlJXpsou7GtTRo2v51zzDX3B2d0maS3UF5FX9vFT0d+YSaqd2jnKgc0e8uF5PRzFL7OE
 EOWNDc6Rnre9LneT3RfLoou+BJ5wrUzdNqD7uuMDF+KV15bYCHylkQmtHKhSe+VpiU+uuV9hFFm
 3qNP40DURKNcVChtISOGRHdClj0t4CqgIqN2kag1FMx40iDV2vXkU/T1CeweoZxcHV3qJ3yI6AQ
 FAYJMfIywJtgsY7QD3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160093

Pointers should not use explicit '0' comparison, so just use standard
evaluation as non-NULL:

  phy-qcom-qmp-usbc.c:1682:31: warning: Using plain integer as NULL pointer

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 14feb77789b3..c342479a3798 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1679,7 +1679,7 @@ static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np
 	if (ret)
 		return ret;
 
-	if (qmp->dp_serdes != 0) {
+	if (qmp->dp_serdes) {
 		ret = phy_dp_clks_register(qmp, np);
 		if (ret)
 			return ret;
@@ -1833,7 +1833,7 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	if (offs->dp_serdes != 0) {
+	if (offs->dp_serdes) {
 		qmp->dp_serdes = base + offs->dp_serdes;
 		qmp->dp_tx = base + offs->dp_txa;
 		qmp->dp_tx2 = base + offs->dp_txb;
@@ -1982,7 +1982,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(qmp->usb_phy, qmp);
 
-	if (qmp->dp_serdes != 0) {
+	if (qmp->dp_serdes) {
 		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
 		if (IS_ERR(qmp->dp_phy)) {
 			ret = PTR_ERR(qmp->dp_phy);
-- 
2.51.0

