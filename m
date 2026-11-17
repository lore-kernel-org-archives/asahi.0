Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920784;
	b=mwKNfwLRIpi1LO5V89bww7FzcRr3e+hXV0OoNl54tVET+me00q2Q2KDEqpcZWB3dZLCm
	 uYDMrSnfCqUPu76gMGCD9ZqxWajk2LbCRRdbyIh0fxC8TuaYvfYz0gVp9c3ZofOnA3TQ4
	 L/g1+dKLdpFA07Ve+sR6K4AznNa6Fx7AgOzAbv2RJgpGeqazCtCYy62VKD/OG2DPQ6Fkl
	 3Z3jGvRW/7IozbHMM+JTHjNDK1CFDzPMYTdFfUtqW8BY7//R8VMgokagK1sfShJv6q3g0
	 41NzWgtCNwfFzrR2to32JQwj5cFeyGPEOrzqyWSZ1s7nwc8V9vGNDfJXAb+3xse35zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920784;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7KZKnHLwk=;
	b=G1XoltuPRpFkSK0uzo3strd+N2JAPzLfJJoENqwfja5oSW2/hzHEU/TWcyq9tiux4rAB
	 v2LarVxR69JDHYQmSel0zkkPqundIuXlUmxPpqmSL5S8ja0ILKMX5jTUM+fbhZIp/6BFB
	 N9Gc9B/9qnzGmDRlBL3Y+mQsCNXF4u4q2dpPefOg03Ypq6UsUpRTO5Tba64hCAR6oE5ZT
	 sRoxpRTFWUK/z061ClZeaYN7pjo0JbNaSHvxv5iu7Zf4MtNaILdB+BQeysihFMm1G6OaE
	 DisBHX7ynANc66nZtuJv0e/XqQeCNzv5MtXkKkNpG9MDLG4WFj8j1dbXuYszr+jJq/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GubjcS3W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDzNnaAp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D37C606A32A
	for <asahi@lists.linux.dev>; Tue, 17 Nov 2026 13:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D37C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GubjcS3W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDzNnaAp
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1LI8466618
	for <asahi@lists.linux.dev>; Tue, 17 Nov 2026 13:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7
	KZKnHLwk=; b=GubjcS3WWE//GTAtNVooXD6Dfo7xWxMD0xQSB3+z4b/XkFtE2Vf
	E5oEAbrcgvPs6Hg2rFUlGD60XPEVEPezlRL5Go1CnsIKU1IQu1oBqb9gbtRWB26y
	/rmZOsQew60thQTNvoPXehcYgbmq2Ufxh7M1hs9LjHvrkRT21sVSdmBLv6YSLAIY
	w4JgPgVwvDwSkZXL/g75UBPuJDh5mbUl2jKnxBpHXpRoUsPE3JuSVsVR0XL552vf
	UEnIg2N7dWfx/FyMMkZauIDFsAjANGjP87iNJM4+M2RPvNmiREP5hvoKZv6G6fAl
	C3l5emmzK/xAYe4hSaQelPUoxAceqpcUfYg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09htk7p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Tue, 17 Nov 2026 13:06:22 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-990c957f129so584582241.1
        for <asahi@lists.linux.dev>; Tue, 17 Nov 2026 05:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920782; x=1795525582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7KZKnHLwk=;
        b=GDzNnaApSPBU+QcZfFwfOYdWyxQJQwV2bJIxrKS4Rc/YTZXbIkIcyIGbiOvibWmZFF
         zmGlxIr+8xOU6cHR12bg4xQ/BPfAQgFwCs7Mg1eYrVz8XISymQe9/RpzwBzwiGq4BBPz
         QEH/uoyv7ESWuCvOzUcKdXDCKke+Rejm0XMXwOfUsJNKVrxc3yH5oJY157aJOKG3dGc1
         yT2Au4ssyHnUUWsFMC6wpvt/rc1sc/583xzsTk5CgX7qrK9r17bnV2BssBSKtTY9Qx4S
         fsn5kTiGt3PeMarG9L8SMjNhPgy+NWrGL9ivFsLT/BPhqlRsktFuIGu7uT/EYY+q00yi
         4U3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920782; x=1795525582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQNCc886Hmd2ERLzq4jw1PUvCGY+4w5fk+7KZKnHLwk=;
        b=iPyuN7vztwXB1GWqYr6wBPToDjii97vOcWoiZ/1x81QvL7LmGg+ECfORUtzqC1oial
         hZOQ6r74muEGpPc5dVcOeV0z78MX2arfA46lKS1YFEjEfsG+x5WdOE9fDk5egt20fgZI
         CveIMow6CXWg9q1df3RDDyLFUnIE2q9NibAvCrmEYAQZhDPrN9ARx4Z8S77eCge/6OIW
         +ELcYDS9yQTOMFLxy7POcuaNwHPVsorCr3itF7Z2mQMhIVxljKxI1yuXMpktV9Idqc4y
         YSJMwP7PeriDgqhqS1ul8MNCkG0c3UUcgnbUCgQvUT343VEyPT1jVCrdX+5NUWayWNxD
         72qg==
X-Forwarded-Encrypted: i=1; AL+hErET0bfwclOSc3RStuvhjRffLH0QiEpRoWkwhmjWw+vLFfZaB4a+ak1syueBD/0mB6TgQCDhjQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+i/kiEOcJtOUAJYRKncZIFj4Z8YWLXWgVzcwCeC3Ok03P5jgyM
	TNA2DaLEYNF/uEqCIybW0mGoJdZiS/tb1111w8tdqFz4V6uhXikc4iR4EJiJstuffYRjOmesGGB
	3Z1LXZCH5j8S8gOIF5pOHn5/yGv0vLmpeniRU9ZJKCizb9wvtQj4FQDHuGA==
X-Gm-Gg: AYBFou35e03j0299XfUW2A4rTwGB4YkoaWLphGEchLa1RyTUw3rHiMFR/NeuDvQQMlm
	KA9uJ9cGs5K/HRSZ38zCgibajeOhJ5GVOcRq9KF2deZJdRrGm1rXxKTqUJOtSA0HbLAOB2PIGBH
	qzX1evK9Ea5u4/ABI9/qV+j/nq++kQnUNZ/6cXduXUNeyu9v4WStjMb7O4qiOb+g4q8xwDN6MTk
	sd+hfQrO2eNNEyreR6Pwp17EqztasQSMqpfBJ136NHUGFBJ6oicz5H0tKcpuSZ5T2Mo3rQci1pn
	o4MDrzb/VFscca1yV14CjsUeplJfKtOTGX+1MXgHD/2KzXgeJfUZMT5/tWRaQDYf1wquik640UF
	vx6itkLlQbDL6oUiWY2liASj2YkMfV+YcAjPtg1Kf4Aknv50s2H1yvO7mDXkN4w==
X-Received: by 2002:a05:6102:2920:b0:7d2:fdb9:b189 with SMTP id ada2fe7eead31-7d69f850c5emr659930137.34.1794920781840;
        Tue, 17 Nov 2026 05:06:21 -0800 (PST)
X-Received: by 2002:a05:6102:2920:b0:7d2:fdb9:b189 with SMTP id ada2fe7eead31-7d69f850c5emr659906137.34.1794920781161;
        Tue, 17 Nov 2026 05:06:21 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5835117a12.9.2026.11.17.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:06:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: apple: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:06:17 +0100
Message-ID: <20261117130616.234953-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5232; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=clfI8+19pJhAA+hV4S1Z6XrUeG5urAAHKTU1TXEfHlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FFJYgi+OqbMxgoQ89jlVKosb2EARn5KZIaER
 f9mvb0IWpyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxRSQAKCRDBN2bmhouD
 15HhD/9oH1BS9LqVZQUmtukQ4pBKCTUnveLA8banunKm54eECmroM6X+THHC/UIfkgTIp9t3WUn
 FSAhCkt01Vr+dQbCnSu8lY0JPjnuMK2wOaKZZZPHzbmUchlIfqpOjq4pwoom4AkX4Es+RmEXl+j
 3LJQNF3/DGw6d+YsEHxGCl0WNBqqCrIdTR5USi8kFXSbmIh8uFOo8iSvTcpZEXHhsw4o/m29O6g
 5fyalqopdTAJslaGkcPPy9E3NeMmGWWz52a+CAvcw+p111gRGN1W+j9JWpsEiJ09ukzCofT+zQ+
 5b4BmJXEOPUs2GkA1d5TTbF6w96/IsN0DNRdqHHOTj8EztnF+k2+Jvx4GFFruuDI9nCvIh0snBD
 x9PQTybp61IT07uCgumlUt4Hjfsl86eagESaE5Jo6xdDPPG38hvO4f60NY2r/sbayH6VETvYHD9
 Iz+2mdtArDeIRmNrl3G7LtqmzAj8T9IZ1yJq8r9zPsHiD5zemQ5gPtSBOK+k/7Z3qtjpmJiMJC3
 IGSdHVCHvrBRzXMFBS+bmH3TXODB+w588WrxwZ0Nr+3RMdUyb8lkWdsnwm6swZutHZsdrHl1+0A
 OtNrIpUmuNoRSr0v7+QrE+J+kaaXEV01l7HPe+6ltJVVgj/OfTs2Tfw1F3DcQNEtxEbl8i9dG/k 34eoEYM979TDAuw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX0dnGEq5Qj1rx
 wT9F3Zj30i11T+Ks0oXgyYlemqRbIZU5wYe6AEp7xe1N2XgGKSG6/bbXf4S65e4jJWtA3wk99HM
 cor8IXboiwLu5WASrTaz0Rt3ds98d7o=
X-Proofpoint-ORIG-GUID: Vk8EflOTkj86ooX3piYzIac8vH9GfTqj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfX0S8xMu4HsOIq
 Gyc8zEuQ4jFtTXtbpSIMQ82FClE1BkpvcFsfQHlz7mnw8SawOjt/MH2HXfEpGEib7Qb99dJBtBm
 7bMsJePQfpfpqvJHgLdjsiJ23AOPxD5Vtl3mHfeFC0kYXgJvoEHbny8YMByqOx6Ktdnu6rA2bKX
 zjcK/4vpuneBjlxZe8jtJZlny+H4b9SJ7rJCnlPmjTuowgOuNUYU6mVB8zVoISOcENXESbOVGOq
 FFWDVZahpXw/Epk/BALkTWTJn5cWDlDNQ/zClDg6WoOnkxBsrmIY0gZ8WYvyjlqOiz8CIqCf3gI
 s9IbZplTyn4IBlPmxB0HU/OLgIJ2ok+zqBWrPNROnK3RkmXTm70HUno7p2ZomzkkXZi3cOvpYvT
 Jjr2u2kn36HP4ODMogZjIzKB5Hedlb1tuePN8jNm5Dkbx1h/ubzPxJRWzvHubKCvNTGiIHuctXg
 AN1iVzMLfx1KkzaJtHw==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc514e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Zz3YpKYli0cBJYq3SAkA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: Vk8EflOTkj86ooX3piYzIac8vH9GfTqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170052

The atcphy and touchbar aliases were never approved by Devicetree
maintainers, because they were never documented as actual ABI.  Drop
them, because no new custom aliases are allowed for years now.

This might break users of this undocumented ABI, so these should be
updated to use only documented and approved ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 4 ----
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 4 ----
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 4 ----
 arch/arm64/boot/dts/apple/t6022-j180d.dts      | 8 --------
 arch/arm64/boot/dts/apple/t6022-j475d.dts      | 4 ----
 arch/arm64/boot/dts/apple/t8103-j293.dts       | 8 --------
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi      | 2 --
 arch/arm64/boot/dts/apple/t8112-j493.dts       | 1 -
 arch/arm64/boot/dts/apple/t8112-jxxx.dtsi      | 2 --
 9 files changed, 37 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..9f0476e1ae2f 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -15,10 +15,6 @@
 / {
 	compatible = "apple,j375d", "apple,t6002", "apple,arm-platform";
 	model = "Apple Mac Studio (M1 Ultra, 2022)";
-	aliases {
-		atcphy4 = &atcphy0_die1;
-		atcphy5 = &atcphy1_die1;
-	};
 };
 
 /* USB Type C */
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index caded1636f3d..1a745c6593fa 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -15,10 +15,6 @@ / {
 	chassis-type = "laptop";
 
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
-		atcphy2 = &atcphy2;
-		atcphy3 = &atcphy3;
 		bluetooth0 = &bluetooth0;
 		serial0 = &serial0;
 		wifi0 = &wifi0;
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..3540edc56b0d 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -13,10 +13,6 @@ / {
 	chassis-type = "desktop";
 
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
-		atcphy2 = &atcphy2;
-		atcphy3 = &atcphy3;
 		bluetooth0 = &bluetooth0;
 		ethernet0 = &ethernet0;
 		serial0 = &serial0;
diff --git a/arch/arm64/boot/dts/apple/t6022-j180d.dts b/arch/arm64/boot/dts/apple/t6022-j180d.dts
index f76b887429dd..0b1f1bc46270 100644
--- a/arch/arm64/boot/dts/apple/t6022-j180d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j180d.dts
@@ -18,14 +18,6 @@ / {
 	chassis-type = "server";
 
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
-		atcphy2 = &atcphy2;
-		atcphy3 = &atcphy3;
-		atcphy4 = &atcphy0_die1;
-		atcphy5 = &atcphy1_die1;
-		atcphy6 = &atcphy2_die1;
-		atcphy7 = &atcphy3_die1;
 		nvram = &nvram;
 		serial0 = &serial0;
 	};
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..4fc9a42160ea 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -17,10 +17,6 @@ / {
 	compatible = "apple,j475d", "apple,t6022", "apple,arm-platform";
 	model = "Apple Mac Studio (M2 Ultra, 2023)";
 
-	aliases {
-		atcphy4 = &atcphy0_die1;
-		atcphy5 = &atcphy1_die1;
-	};
 };
 
 &framebuffer0 {
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..779da65a66e3 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -18,14 +18,6 @@ / {
 	model = "Apple MacBook Pro (13-inch, M1, 2020)";
 	chassis-type = "laptop";
 
-	/*
-	 * All of those are used by the bootloader to pass calibration
-	 * blobs and other device-specific properties
-	 */
-	aliases {
-		touchbar0 = &touchbar0;
-	};
-
 	led-controller {
 		compatible = "pwm-leds";
 		led-0 {
diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..5304a5591984 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -15,8 +15,6 @@ aliases {
 		serial0 = &serial0;
 		serial2 = &serial2;
 		wifi0 = &wifi0;
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..b0c93788c72a 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -24,7 +24,6 @@ / {
 	 */
 	aliases {
 		bluetooth0 = &bluetooth0;
-		touchbar0 = &touchbar0;
 		wifi0 = &wifi0;
 	};
 
diff --git a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
index 562e7a25a1e8..31d8d2aaf30b 100644
--- a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
@@ -11,8 +11,6 @@
 
 / {
 	aliases {
-		atcphy0 = &atcphy0;
-		atcphy1 = &atcphy1;
 		serial0 = &serial0;
 		serial2 = &serial2;
 	};
-- 
2.53.0

