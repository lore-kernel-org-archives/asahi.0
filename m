Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436862652B7
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239866; cv=none; b=jMcLNFYP2p9IVw1Tr42D/KaPixAxts9qkONlh7p+sVZm++Lwix1+mj3DXlcy7VKJYZeSn29zIz7VpfRZ+gO0hfXSS0M5VzhCLVHa95UEcF6mt+2IcpIdF6wOPefBRewak1B8HRSfCB80+hcUhzoYk8gc4mMgLtW3j1+XJU+MFlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239866; c=relaxed/simple;
	bh=UIwNr/KY2E+0ecUw9P2/kbSYuPp+7DKAt1dGLTzex10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V3H8t4lz9jMjodCafCOu0SmI/zxfAlMsd9x2XM6OkBZDlB07yEOG5F2QBAdm6Izplk2WPO6ffR9iHqEgPwY+WpQhjm6/ZU4qbhn0HEc26Fwnk/E247o5e5G+9Tlx6tPzUBhv0x25T6DcvlED8u4uq9dxnzHIE4iljK0m3joRTHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pUzxK5pp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SreHMv6d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pUzxK5pp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SreHMv6d"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FLkgVR3372227
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 11:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YsaC29hc1Q/uN7FPMQZFz9kToVmMSvZKatd
	HYOoHKnU=; b=pUzxK5ppqodJ+kBBatU0/ZZj0hN56jH0XF3u43GpXPGxKdPVcqI
	nHR84PfFEDVP1BSYvddsECVpz3ZfK0mbD7SQiR8TLvuheIYJh56KDVm2JWuLhrm1
	W2D6kDQZ9QEsonkmKlzW7nTYuZnCmb0XGg8WTHoA3XPlT7xx9sShbgivUK7a8gxX
	RkdpFu6jYS1kTmbdZ217RmTsP4wWJdWHxe6Myk0MRib7e+Uq9sqwTWxt/3ltAKyY
	DBALlm0z8S88lV9qeHTp6aajLr56UlNIJFPDkBlpSFybKeQvHATieZ2l8GV+A2Ld
	9ynsbHSPckhZ0Xed1BXUHj0pcrjcg/7vbCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caj7jc4t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 11:04:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4b8e9112so157517985a.2
        for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 03:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239862; x=1771844662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YsaC29hc1Q/uN7FPMQZFz9kToVmMSvZKatdHYOoHKnU=;
        b=SreHMv6dLWADehvlMapMRUCLtWhnJXjLa9Sbge37+lE7DW09LkCgYadKcEn82KNfHN
         tgS7vave7v2WtFA+Af9c4cgrE195mcjQxMl0Hzo70hgBLjCZtYYTW6hS6Y8HaI1mX21p
         CeKu8/rh6infgr7z9DuTUbLLAO6zW9hAxn3i0JP4/b/inba8BwCI4cyYuSKW/213AQ4z
         97Lstqq/J8lgJsPzH209uAldyEqe02Qu4rWRbtOhN0m0V7oFw/82d8+fi0V4LjgSshL2
         vU9eTgUmtzn/25u2pHzt23qrbLlIqUwPo1a+6+HEuDGGm1wksJqbS5jRDQJef5tJ+Plg
         P1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239862; x=1771844662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsaC29hc1Q/uN7FPMQZFz9kToVmMSvZKatdHYOoHKnU=;
        b=Jgvxsh/7hujIEHs7GHxS3hO9PiwluXnpkARk28tu4scpuGBR3gLY0weJ9I2u2xlYCq
         2aI9f14lkO0ZC+XGa8PjIhlJwf0tapY9+gc1xOi9I14ZgLvpXvpaWccDo6fHJ1ty81W/
         /et7QW2IEXtxp4zdnnvFVLth+Zjae91g7bKBXoQ7K62oaSMTyEnvaQbXYIWxRO8fY94n
         atGqDsguoJiDWge+drIwudLHO1ftFxc//MmBXCW/idvYjPs1DG3yxKCFXMyQFnr8L6pL
         x/R0lXTk3/j6B3H/xT1um3KLqhgUgZIKvzGNykz6AROcjkSef/NTpPO5qdcOxvfgGth6
         Eo2g==
X-Forwarded-Encrypted: i=1; AJvYcCVIfMRZn4F56eZbGB08WySJpKDM6V56gnrbVNDEGdvOUjQwYrPt+9CC9ea4kEIgPgvnoI00QA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGXK92D67UE+rW0XpZ2ebSCmIID3oxTZXfdWhHwn7Tl9syYK+j
	327z4dj90my7dR985GZoKPE3HxY2v4F0+Bom8hbzFXXTn7KDN6efJfM+HcIr58Q+oHObd9K4UUu
	sgJT+2/jc6AsUIwXCSxkmh+BNONl9bMJTFnif2IZARQm0R02XDRZTnI2foA==
X-Gm-Gg: AZuq6aIwM6JgXA00iymzimiEMNl9Yyfyc6l08oivRViWt+PGCN9XFk8V0w5hlMt3haw
	6kIJ3foAL000RHJgiV5Hauu01I8cZ930/jb6j/qLJuolk8hlyY4ZFVIMTOtkI5pvIQ5fKzif7Av
	PXCBVSfJh11+XSE54eYMI4mTGlLI26swyGldt7+UgcfhF3+Xaxn9cFzyfoYjt3PDyYG1wDA/AWF
	f47FU+pBnVEW/9grIqkZN+zG+keC/H4lBdpNKRa21SjyMozzCeuQi5zNHY/xLHi28ZM5KZQyPzM
	eeGM5De10QuAn5AE9wMvZXxvNre/1ahoef1qJyvsfmZhSaHgKN94zBjmnsl25mko73aXLjsZv5W
	0hJ8/OzxIUhcOfxo6K9bNGRRHhbufX+29YFnuww==
X-Received: by 2002:a05:620a:458f:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8cb422b2fa6mr1150430685a.30.1771239862530;
        Mon, 16 Feb 2026 03:04:22 -0800 (PST)
X-Received: by 2002:a05:620a:458f:b0:8a2:e1db:f442 with SMTP id af79cd13be357-8cb422b2fa6mr1150427885a.30.1771239862105;
        Mon, 16 Feb 2026 03:04:22 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm589572745e9.6.2026.02.16.03.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:04:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] phy: apple: atc: Make atcphy_dwc3_reset_ops variable static
Date: Mon, 16 Feb 2026 12:04:14 +0100
Message-ID: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=896; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=UIwNr/KY2E+0ecUw9P2/kbSYuPp+7DKAt1dGLTzex10=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkvmuzb0vB7oi4pn/35nXpGsWObsKmVUpTChgV
 lEXrNPSfJqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZL5rgAKCRDBN2bmhouD
 15lBD/9b781t2vSYMqy9NeIzD45ooVBI2AP+j3b68mE6MAzdwlE6C5SfFYOsu3FEwnFziEKY3Ot
 xIRRsy2mpvb10akE0ks+pptxAP9eYmh6U+XHUSWMR6oFYwIo78sDYt6IyFh7qoRN++jOCGn48vt
 zRPJDrj2Diq8Hw7/hDrmxzUHE6gPZfMZtx7oFh+bTkC6NqhkILSlE5nQ0QYnfko41bPtvPYvKz2
 kh0mIc8OiM9XH2OnMR0IYl40IXiOOG1gfaMymm1NU7XBU1k9yRns+CizJEf/KvQj//8ZNYfwUhp
 N7IpPE6T5IlmXt/E4LHw/HGU4ACBp6sNbJKcqovAmujuiFYH0e8Gw4QKEskOHBEjnvyJ4Zai4EM
 UCUvxXBG9Qzi0xIJoQ/jJa2dzzvEEJ8Udrwf7Dni8RVAGrcnv/LI2qxlk4KLu4pMF9xj23QXWqX
 8/NrynqeLalAte5MR7suZp5nveZdoTYrmt3cVwV7HvPT4bsjpbM0wDLqcwR1N0Mme3dqT3V3KM+
 ehQomFxZedoDQIIKC6E6VOvJPbi1e0Zoje91GCZ/XnNu9Kmn/zeUHlKIP4V2TjiVXXAvolgeQf2
 HFw95Z5fg6pUxYfEYttaKMAFqip4JgTbdGFcmBfhIPPLvVJbx9WL06wFnePz1n+LlVNrt0oMOH9 11DeE6vi6MJa5kQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIurWeZb c=1 sm=1 tr=0 ts=6992f9b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=V4RP2X7TQvdl7F27wUAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfX12VawP94NM/3
 xlXdWVjxC93fEbd4zrJLDG9vTMcaU55U+ORDxhze8YS5JcQLQO7S2oFZ3tfZnXmhtAMGZPYQYVd
 8bGp3ii6OvJX7WRNUbxIfN2wUYxYo+s7S/Dc5ovGLBsUaSTv6DWP16HeHPLpVHiR7Ux/PNTlKxE
 5TmYrceOuyjjWl8rQdO2EZiGrB8vNYY4qvke2yV5uJdqZK6bbUgSAvdTj7lel25jngnEMDeBu+d
 3wx45UFjybVNH8BhjZinWNHeEnMLPL5kbsx99Z4tSGvgWkLaL3xKCjLfM/+v6kXT7RjkiIJjgd2
 CF6OZKxlFHD3a52+g6jRQrYFsqurSG1hylI8sMPpeXriB0xawXerEwDGyY4lRyh3N4bj6mjiCBA
 ogHg0ovMm/idr0C6AeWD5+FhaZWn2y/Z20okCoTwuuomfAFonnIP3rWwKKG4jN5Ob0YS+EE6dj+
 uEhJK04+XS3VBSkkieQ==
X-Proofpoint-GUID: IePjae3hAeHCHyF6Np4DiPz21037817S
X-Proofpoint-ORIG-GUID: IePjae3hAeHCHyF6Np4DiPz21037817S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160093

File-scope 'atcphy_dwc3_reset_ops' is not used outside of this unit, so
make it static to silence sparse warning:

  atc.c:2026:32: warning: symbol 'atcphy_dwc3_reset_ops' was not declared. Should it be static?

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/apple/atc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index dc867f368b68..32d97226e926 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -2023,7 +2023,7 @@ static int atcphy_dwc3_reset_deassert(struct reset_controller_dev *rcdev, unsign
 	return 0;
 }
 
-const struct reset_control_ops atcphy_dwc3_reset_ops = {
+static const struct reset_control_ops atcphy_dwc3_reset_ops = {
 	.assert = atcphy_dwc3_reset_assert,
 	.deassert = atcphy_dwc3_reset_deassert,
 };
-- 
2.51.0

