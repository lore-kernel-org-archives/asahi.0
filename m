Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F36528CF5F
	for <asahi@lists.linux.dev>; Sat,  1 Aug 2026 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618143; cv=none; b=g7c+dksOSSdEWE8cJHoy+gssTysqdl9WaKmSSp/LQUjSjcHEHv7t69TiJjG7CbvL75gA8cl4mKhVLRyuv5A1ay3GJdE02g35KfsmvmoUPEAyv9CNLfSiyedrO870vh3NSoRLCxgbx5PC8bK0zRcKhK7z77kkCGjl9NAB+S90YXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618143; c=relaxed/simple;
	bh=dv0IIlCsP38vrPIecmLJafEpOPtBJNmDRJ5sixEKHZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZaYYC6hgzQlwZF+hSKDMqjUFmoM0hH6bpDXO61oMLaivxdMDEZO9uv3y7tqbMSv1TNqQGLBoGCpM+3mpmmHSqyLjcx/PUBJID3h6Z5aXzdlbD+rlkSHPqThkYtHlyZx0qovsDcwEAUbCJKugZTx7L0yMLtptMdWAPDEx08Sjjns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FNv61k5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSmsrPxh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FNv61k5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSmsrPxh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J04M13716865
	for <asahi@lists.linux.dev>; Sat, 1 Aug 2026 21:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uME0EjnuiD1KZlegyiL2xSJMHwGRLyLgdjy
	pPXTk6so=; b=FNv61k5Dt0fi7BrLLopELhBNls8n8ibtZ7FknEnoxSorXNSxWR4
	6bqEyghP6cCpbXjRFZRHn5LtCSXFQwp1waAS3d/ypO2rIZXDNCkNd+XQM9x/R9Ia
	nXNv3zeNkSeYWGZRDheI3zcR2gZM+FL7gVcS3y9APZ5STfDyqeq/GoQhhfCUncgX
	2tyFIiDb0BWWBq9m0TB1fHU2a6e3qz7G+ZAerQ87iNfnAFKpJqdMSUdA9Le3ULVL
	t6boK5pAVWU1hRWvONJB9DDLMw+gMy4uPXPdySLvUvwMUqfcuAGAY+MKvfqdmyOW
	11D9B08xaEWjs1CH92j0nOIgOxAi2YCdlUQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8r6hqr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Sat, 01 Aug 2026 21:02:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so21977451cf.2
        for <asahi@lists.linux.dev>; Sat, 01 Aug 2026 14:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618140; x=1786222940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uME0EjnuiD1KZlegyiL2xSJMHwGRLyLgdjypPXTk6so=;
        b=fSmsrPxhgwS0HDQ619XeB0JnMWLf09fnDx0+BQ957ITCe9YscShCGgnTURk1sf3hlv
         vWj5FUAMQKk282QJZbJmoDVv5hTScmeyAiWNmxMReMLHtpL+lbpRlgRWsjegqA+m8KX+
         GhBAjXAFXjvy+wpOdUm/glB7XGD2TyOkbmpS4VPgmf6EwWoCqjqzY+sF6nI8mGd2+u9c
         hKwRtO5oPr8vNLOQAq0O99/cWKeL/Kg3auI1pSFr2DiHn71y6R92sQGGTHvNzCKzZdiU
         FL7MOmhkw0SNWl29JepFrvzKSKv4qr9dsM3xdyGqnXBSyJQ5FIU/uNzfLWqELR7kpZIE
         Myqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618140; x=1786222940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uME0EjnuiD1KZlegyiL2xSJMHwGRLyLgdjypPXTk6so=;
        b=NfsnLuW23JDzvTTe2Egnv4+gkrdKvPOe0XeUZQHBvV3E6QlC6oyuvHbf5OhhtBw+r+
         fZ8yK6aJhspgbvalp81i9YlEvSKrwMPKX275pIz2RFIx2eSMvY+Holqt07Jkw4uThA1h
         x/h48q/tc6b6pctI9km/2M89OLetHbb4BcOAi8hd+WRVXkhvz+5Gk5eDLCfDM4HLLniw
         RF3oBDBr8bkcjqZuIDNPMLliuMG414gZR5FsPLrlN1lkPYLkuDAikbT89NgNcOxNlZJQ
         namHIw3m5pDoQj6ck9bWXoGZpCwb/OBsOTwhRRgwazjt4fN+9I/iXxFaTkWxincqoTVk
         fAWw==
X-Forwarded-Encrypted: i=1; AHgh+RoS2m+9O+WVFDqiDzv5sVLpUK1o/im9Zdh/Rh5GE3UFkAC8L11Y9swB38KVmnmaScxmveZmeA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeqTeoBMe6l7mNMLWEzXrmDy/ghELUYRNYI76gh4rtAqHdqIlo
	EXk66f1dfl913O4jN88Pm/EsgSzBwdT96HRzXm2KszUrbdi3BgNYpX9aCW/BWftcgeg/Mu6iV2I
	WJxKnbevcvuHXUGwaXYRL1SBzAHpp2tmPAoI/7i45A82ZEI8hu7db9/n5Hw==
X-Gm-Gg: AR+sD12FigqYpdBz5WWg3pupQuHf5OOjibGB2+vQ0ySauLsqiZSaOMPLVpUL+ZE9huU
	wp49uMyme6Tcdy28U7CXJ4+3j3NuQjGUHbpy0E7IyhZwU5CFDebxO8kor823mv1iKqYFnBOXmqM
	aYdRuavTDgvExqGShIDE4q5xepMnjQ5uBp1Kd8q91HI8AJPDo4QVJziX3Vtkiipx9B7Pz6J0ka7
	fWpCR15EtF2ZtsTurGTxHwFvQ1AfCslxR4BcnuRwSHNIk40FlQTBGSZIwr7CWwnk4PQWFJoZrgV
	CmQZrH3/gznSVKBh9HFUHxEl+fUnP4+g87xsEaJp6Hla9jtckxEwtWO6OHQSJUyLUIh+BTF8FNe
	pGHOWDlO3Z+ltDXj+
X-Received: by 2002:ac8:7e82:0:b0:51c:19af:6341 with SMTP id d75a77b69052e-52b56796771mr91233221cf.36.1785618139834;
        Sat, 01 Aug 2026 14:02:19 -0700 (PDT)
X-Received: by 2002:ac8:7e82:0:b0:51c:19af:6341 with SMTP id d75a77b69052e-52b56796771mr91232291cf.36.1785618139228;
        Sat, 01 Aug 2026 14:02:19 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm17775127f8f.34.2026.08.01.14.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:02:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Dinh Nguyen <dinguyen@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: Correct white-space style
Date: Sat,  1 Aug 2026 23:02:11 +0200
Message-ID: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6498; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dv0IIlCsP38vrPIecmLJafEpOPtBJNmDRJ5sixEKHZg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl7SsRxgMMk94Xc+rsy7znxzWW5ysdX87dpQb
 nFQFBr+RKKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5e0gAKCRDBN2bmhouD
 18kqEACF+c3RDPAnQEScb34eL8+0jQrH6tktw9P6Y8y+kcrVv8yqLoucGYos86e8vBzU5eSRai0
 Y587bJwjIRV4BWweCeATMc+i3muqTiLYWMGB4uSdfSSdYGRrnMZqK3TLtqsgqq+Vcuc8odVSx52
 mJJ4IqY5CnVkLr5Huvvm6g6/7OP/VaxBjHCVpjfK858kf5WKIRx89KbafiTl/LCqt7S1fGPmCOH
 ujW8j9GZzrm0ndk28zNRBmNjF6/aQDBMGWbArv6rGybceysUKatJ1w3vPguVzkRlDja7dRP6ImU
 wRkvws73lWIe53aHya8BQH9NZ0GAWd9hFjIlCCxiOjHQYAYwpIBbFHgOIB+4XNS3eC6Gi/Q6+PL
 I5hvZixbTC1ozQBlPK+PqmIoT9VVs8B8kZg0W4BmKoUbTxD6xY6YpM0Jk6q6MnvVOuHJPoIHd5F
 jb9tIYWBLHBWGNDcApVpMfqWh4W7dnKyXoUObmZrayyRmMR2reJ85HGzcGLa5z+WP1zKgZtlFmy
 +cziKE7NT4FYzUHhpeuqddFPzR8Fk0yaaodB8RE6C4DaLoFA2pjCFWv/rM1YW1GeHqWlL0+hEo0
 Yf0Xs1ZYIR2j0eWLVslPrArnMjNg0XCdYMGYi5BCIAQ1nAhnV06kVqIG2YFmyD22PuIKuOr4zv1 mVSVdXzbmhPbIkQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXwCnb7NxpBV2u
 /klzB16Nej2qVNaJdD+/h+HBUYz2z+WRvxZ+Wx435GNkvKUYG07b4YMD26X5KsUwCf0D4GvE2/S
 n6ZLRP4qIH6VU/YmpPGhKK6lmEAIRVY=
X-Proofpoint-GUID: gkn0JS0gg78F5z7owMCFmL_S5mVQB843
X-Proofpoint-ORIG-GUID: gkn0JS0gg78F5z7owMCFmL_S5mVQB843
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX7NQaYmNLBPQC
 lhlKcVCFc0wiGZtWcRj3gocD8pfFvlp8LHe2fqrSlxdRwWnyH1esP9sPX2E21T1O1fxMZ9xblkz
 0UB4oT/oZ6yWwxmgDzUfqSPVMbgmFzU5uw5+VqliAcIvhAAIcWGLZq4k09j4PnNuI44vvgCi387
 Kl5/WU15B26/qiduSqbp141tP1Joz0CCzTwXRLAdsgA3FAMtmWIPiY1D2pR0kwZhZXJTZhjHEpk
 BS7xc9tF9/vj4q59kOMuKj1H8SIrCd5xY6INf0aueXR/5v//lLQgpdDnVb7Eh6xRWM/Fe9doHt3
 iouLvylIKv/vYdVfbWptnb78qNAWFPnd5q6Pjm7gGRXV8lmGNmUY7bI0e+q2yUCmluhzPRRIO+6
 FZDsQLKKpmYdNrO24gx8beUJw4aiv6cZI6vlxHZDB/Ai8rM3hQ74UltCBsVpvNdVj3NeLBdcnHh
 Hl1FqQLTG9KAmR5Bn4g==
X-Authority-Analysis: v=2.4 cv=Q5ziJY2a c=1 sm=1 tr=0 ts=6a6e5edc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ED_MHW6qaQPFTTync5wA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010169

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I'll take this directly via soc@.
---
 arch/arm/boot/dts/armv7-m.dtsi                           | 2 +-
 arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa320.dts            | 4 ++--
 arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts          | 8 ++++----
 arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi     | 2 +-
 arch/arm/boot/dts/microchip/at91rm9200ek.dts             | 2 +-
 arch/arm/boot/dts/microchip/lan966x-pcb8291.dts          | 2 +-
 arch/arm/boot/dts/st/stih407-family.dtsi                 | 2 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts                  | 2 +-
 arch/arm/boot/dts/xilinx/zynq-cc108.dts                  | 4 ++--
 10 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/armv7-m.dtsi b/arch/arm/boot/dts/armv7-m.dtsi
index 26f5443d85e1..6ee18d6a93ef 100644
--- a/arch/arm/boot/dts/armv7-m.dtsi
+++ b/arch/arm/boot/dts/armv7-m.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 / {
-	nvic: interrupt-controller@e000e100  {
+	nvic: interrupt-controller@e000e100 {
 		compatible = "arm,armv7m-nvic";
 		interrupt-controller;
 		#interrupt-cells = <1>;
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
index 74161b76008a..6c4131b846c1 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
@@ -141,7 +141,7 @@ mdio@200 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			switch@0  {
+			switch@0 {
 				compatible = "brcm,bcm53125";
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts b/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
index dd5c8ffc8781..56334b71152d 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
@@ -30,12 +30,12 @@ pinctrl: pin-controller@10000 {
 
 			/* SATA Activity and Present pins are not connected */
 			pmx_sata0: pmx-sata0 {
-				marvell,pins ;
+				marvell,pins;
 				marvell,function = "sata0";
 			};
 
 			pmx_sata1: pmx-sata1 {
-				marvell,pins ;
+				marvell,pins;
 				marvell,function = "sata1";
 			};
 
diff --git a/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts b/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
index fec7269088d1..19a286dcc8a5 100644
--- a/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
+++ b/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
@@ -35,7 +35,7 @@ led-4 {
 		};
 	};
 
-	led-controller-2  {
+	led-controller-2 {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_led_red
@@ -58,7 +58,7 @@ led-6 {
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default" , "default", "default",
-				"default", "default" ;
+				"default", "default";
 		pinctrl-0 = <&pinctrl_key_gpio_default>;
 		pinctrl-1 = <&pinctrl_pio_rf &pinctrl_pio_wifi>;
 		pinctrl-2 = <&pinctrl_pio_io_boot
@@ -170,7 +170,7 @@ verbose_bootloader {
 			input;
 		};
 
-		 nail_bed_detection  {
+		 nail_bed_detection {
 			label = "nail bed detection";
 			gpio = <&pioA PIN_PB12 GPIO_ACTIVE_HIGH>;
 			input;
@@ -276,7 +276,7 @@ &uart4 {
 &flx0 {
 	status = "okay";
 
-	uart5: serial@200  {
+	uart5: serial@200 {
 			status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi b/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi
index 465664628419..75d2e748a3db 100644
--- a/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi
@@ -298,7 +298,7 @@ &flx0 {
 	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
 	status = "disabled";
 
-	uart5: serial@200  {
+	uart5: serial@200 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_flx0_default>;
 		atmel,use-dma-rx;
diff --git a/arch/arm/boot/dts/microchip/at91rm9200ek.dts b/arch/arm/boot/dts/microchip/at91rm9200ek.dts
index ce691c4692b9..b849bc7049d6 100644
--- a/arch/arm/boot/dts/microchip/at91rm9200ek.dts
+++ b/arch/arm/boot/dts/microchip/at91rm9200ek.dts
@@ -117,7 +117,7 @@ kernel@50000 {
 				reg = <0x50000 0x300000>;
 			};
 
-			root@350000  {
+			root@350000 {
 				label = "root";
 				reg = <0x350000 0x4B0000>;
 			};
diff --git a/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts b/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts
index 3a3d76af8612..1f0b0b647aa9 100644
--- a/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts
+++ b/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts
@@ -64,7 +64,7 @@ fc3_b_pins: fc3-b-pins {
 		function = "fc3_b";
 	};
 
-	can0_b_pins:  can0-b-pins {
+	can0_b_pins: can0-b-pins {
 		/* RX, TX */
 		pins = "GPIO_35", "GPIO_36";
 		function = "can0_b";
diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
index 08acba209c56..436fafd30317 100644
--- a/arch/arm/boot/dts/st/stih407-family.dtsi
+++ b/arch/arm/boot/dts/st/stih407-family.dtsi
@@ -812,7 +812,7 @@ ethernet0: dwmac@9630000 {
 				 <&clk_s_c0_flexgen CLK_ETH_PHY>;
 		};
 
-		mailbox0: mailbox@8f00000  {
+		mailbox0: mailbox@8f00000 {
 			compatible = "st,stih407-mailbox";
 			reg = <0x8f00000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 6022e73f58af..1d6435c59096 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -382,7 +382,7 @@ goodix: goodix-ts@5d {
 		VDDIO-supply = <&scmi_v3v3_sw>;
 		touchscreen-size-x = <480>;
 		touchscreen-size-y = <272>;
-		status = "okay" ;
+		status = "okay";
 	};
 };
 
diff --git a/arch/arm/boot/dts/xilinx/zynq-cc108.dts b/arch/arm/boot/dts/xilinx/zynq-cc108.dts
index f5525c048426..e7cb82c7b8e6 100644
--- a/arch/arm/boot/dts/xilinx/zynq-cc108.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-cc108.dts
@@ -92,8 +92,8 @@ partition@f00000 {
 
 &sdhci1 {
 	status = "okay";
-	broken-cd ;
-	wp-inverted ;
+	broken-cd;
+	wp-inverted;
 };
 
 &uart0 {
-- 
2.53.0

