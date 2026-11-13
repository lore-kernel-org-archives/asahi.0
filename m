Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596065;
	b=uzfikx18BA+1rwbGGrI40DlLPCXddhWUDaxF3KShqnvOzd/Puw0u27ZXNKFzfd3TmIBx
	 2T2/Y3pg6ItpaqTXQtFvTxHw+kKxpfudaGgRl7vOBRdJ2KRZPQZ6Z+S8tdleB6G+YaIGg
	 ADslO+fhPnU4Y4vS0bwBo1IQdrttY+wBfreEMfYDe7G+xcunlLSQasff7D6cBwrMOhaQl
	 q/V2weiT82a/hnBpb5afZk5Tmt3kxv2c7Uerp6/DMepplKQLk8cd0e7kxWJCxzENZZWlg
	 5FfhpVFNkywK6iJWPiIL+LYkHNsOu5dtVVu9UUAAKKg1+77zmlZaVkB2/BFwR7qD3yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596065;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bFSR30B2bkPRCbYz2BJZupFxQPy9Yao/0YJYDzUTyEA=;
	b=lyd38ojCqEwhZiCkrrjp6AW/i5Yri8sDV6XE7j5OF1F2D3dfZeq07PulrwZCVZzq7dU5
	 n4LljmsfhJFozERDayegEUDMSSP8GsMFJQqYsbkyLFhewFQJ3eA7f/miBd7WwRYayFB7G
	 DuOqveN9BkZJgf3YKMkFjxb0vOrD7zJlrxbunrTg3D5kqlPvwgU69dO20dwnex59JYOQ1
	 GqZDbr2f2BhvWlcRsyES8ZP0+WE2giFzHiQFfviU3uqt/1qWSJMjBQ2KVY4/t2ZaZYCFq
	 U7MsRLN3XiR9E03ucDBftAm34QI8l2TpuCT+vlNKvRU7qyig0uawblUtMcKlVJrgQkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ld4ElCrg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K2g4pykj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F0C60A5BE5
	for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 18:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F0C60A5BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ld4ElCrg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K2g4pykj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRAoE552194
	for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 18:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bFSR30B2bkPRCbYz2BJZupFxQPy9Yao/0YJ
	YDzUTyEA=; b=ld4ElCrgHBrdb1bK89sUY9Y0VWW1yeEnLrRGJh0xN03W1dlcvBd
	tJViTlVgW3oSS1XyQDJmFsss4tKNjC6hhy/IcDCDHOsV/9hOpEwvlaX4WDUYh7wV
	q8Aq+qMC41ViyWiJEvbNLOW1TBiNeHQnKxu9HKAzpYIO3C57TpfHdsnnpMkUr8WZ
	f2g5WfDOrzelbjUianOxb2mh2g1r3e0W6h4V6oGFtepWASZ/scemh3fpLKHP3Oa/
	6WZHWh1SRktSHBuORlNyz9rTZvuXdS12aPFUKfCul3gOlzUHoq0t8JtP5RyvnZpG
	GmILK/ps5VBd5Dp/vwblu0eKSs23ifdiqrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcc6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 18:54:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495876f8beso109410985a.1
        for <asahi@lists.linux.dev>; Fri, 13 Nov 2026 10:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596063; x=1795200863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFSR30B2bkPRCbYz2BJZupFxQPy9Yao/0YJYDzUTyEA=;
        b=K2g4pykjDDvKjdUz1IbBlNKsKMvMVnn4IuB6TW0BypiTb5szfcpkz2GnOUC5s8DGkz
         EY90oSxnY96PBFTkVglXLEzZ8igL5aKuAAwjerGlCUAWEg/a+qklAsCAbKqbPN3bMYAg
         rYPG1Su5V10xNKyOC6WTzWtHFwTvE55UMhoVNwk9aQLjRBs9uUWUZ0C42IO40xRpY3Ps
         BfRAbyMgE5azyXV6Mxu7tBplALDlvqKnmDj50o4I+RC731wYaw6YKyRG0vcfEvZCjUTe
         SvjD/v9gRivCawhYqE50qwfZ+u9o0+BbVxBtJolM1uRu80qxUwPVoQx+IJfYA9JPutKG
         dJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596063; x=1795200863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFSR30B2bkPRCbYz2BJZupFxQPy9Yao/0YJYDzUTyEA=;
        b=beYg1BaLEk24RP3qmVCPbZhVaJssaL8Ll+w3OVE9Ew+wA9fo4mZwlRRGs+oeSMHZ9S
         p7fOfNuvmtxXK622/bnaQsmHQyYB1q2e6D0rgl/kD/Oq5eNU9yQZduztvJ0D5OV6D+TP
         PKnjy7I3tKOK7Tj7+1/Wcd/Tx5biXnCK2/ELNNphaN4sEZfOp0VHwWimcRvAdW0r//Tb
         DAXhHDH8GJhn/K/pwtRVc/tA3Ly3HkBIvpXkXdI2cet11ADlBxif3XHxgGgvplQU9lTR
         STztXPtQyDpkm67/v1lW0ihoiXNe2/8OigosH7L+zgUhltZN1yh2vRtZZ2mihEjduWBV
         ZV7A==
X-Forwarded-Encrypted: i=1; AL+hErFEyEPbtEsoD8KfY3er9PgpqPixnNwIm5yfLzomKm4w3Bdi3pRX5BD1j+EhXFj+bB+jfh7s4g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+lSvaVvjcqIDj1++SXJc+cR5Lq8X7EgRbslEZjkjxVehdVLzff
	I7ZzaR0r8O78OzB2wAxJ99qB/n70ZqcX7BOmiGdrmhcOvAKVAGtzCG4NcZhKbVLVFLlMXsUFcTN
	tY4IG0yUXRFLzcwdNK/1pj5RzydRPVOL2ifSgyl4nxP/4xPgy4zOd9Cg7YA==
X-Gm-Gg: AYBFou0Od2UeRE55h3pgjk6v+5D+nt5UYVLVpnJg7KIo4xbUbtESeVNnl4cQ9I3QCKG
	6x8Kl3VXsGYPY+6YZLC9+XUfNJKtIQ/4IKy5Ft7hF4mIpaKyqrNC3I6cHMJoQ6T2OGEFJYOV8sF
	JLpNvtn4cruOOYhnZqT2jUkQH4/CbQolx41JADW2XtMphskeGiK//YClmx/WJrLy3FK4wJYh1xd
	XAeek7cIUXHDOMTibR2otf18EtT1WV+mn8joFW+ESwFPDIon10riZDyImdB15N/VQO3jVrDkgNv
	0yJZCWdKSrMlC4QBkkVpjUvLPN5X/GJ6SKvUI0dhcNTfd7jdUfw+qwy5wMF7wKANKUNE/A+UNL5
	1YItrYO7EvaiuwZ3oJRl6V0aEKvp9vYMoqQzk9Iy6on8gJvYq6uiJdhJLfoTwfA==
X-Received: by 2002:a05:620a:2a04:b0:93b:cb6d:6d73 with SMTP id af79cd13be357-9494bbc9e5bmr584301285a.32.1794596062287;
        Fri, 13 Nov 2026 10:54:22 -0800 (PST)
X-Received: by 2002:a05:620a:2a04:b0:93b:cb6d:6d73 with SMTP id af79cd13be357-9494bbc9e5bmr584296285a.32.1794596061777;
        Fri, 13 Nov 2026 10:54:21 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608c5debsm6433223f8f.42.2026.11.13.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: apple: Correct white-space style
Date: Fri, 13 Nov 2026 19:54:15 +0100
Message-ID: <20261113185414.183418-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18307; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=iKBmoS6Lts9jzpkYWP5HI79d7lCKZGtVNYeu24QXbfA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91zWiN+SmeMj4z6T7lHHQabnZ/fC9Ynt8/olK
 1cd/eV0YiaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdc1gAKCRDBN2bmhouD
 1xmRD/0cJBeOKCQCMEg1r8dF3/paVx/k7n/15SVWjx/D/XdpNGLdHGfJQKwO+G+UuGQ+jcFN68S
 /5RBt/2Pigcb0Zdu6aj0zdRxnOE0qR5IOPBFBzPx5X6/b8YAapjlixVvB+PLXw737zn4hLNTSTh
 Wr/TTSC/GCpld/J1JZw7G9MuVZmqfBCBnDwGmXE1+U4E+JYE13fxnCR46MDhOR5SgvOUmK4I2mN
 KV4KyuBy5lJTlDpa1YhKCKAn7UnNq1yPQguCI9Ogjc7v1pKN3f5LNP8cSl9cwG87Wmv/BPiLRVq
 Dc5dDuOE7FxNaIY1idEuGw8znyKX81WypZ2FAb0NFHGUNC+DYvoMLcoQSCmSx9m1M7bxGkKPjaM
 zvncuYY1CaXmppt5BMTFYNQauPSTgNAdizCU7nQg3oJsMasLpRo9vT7fpqFKh06Lt2yfyi1G74d
 g3Z5+/5MPuCtdmCAJfYe45izfTYeCWtLsF8DYFHpJULHf9FaCWxLNb+LlRPjxdwne+GsDLWxtNI
 lHSorJqP6DmJt5gJGF16sj80mhqtUc2C9XHSbwz5MkLE9MdmyJ6cYlw/02CIzqgFkLEEG02jZMr
 VZdP6o4q34zbxJqe8ID0gD8sPk9rYoshmMOgEIRvOtx12PlvwjnvDrudS4wc9VfqhT55g1GXV63 rsUZaX1U2FdxCSA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75cdf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=dE7Qyx03IvCetochvIgA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: eVeZS_Cu0zFZpstxtkFIDtLnHAmB2jq2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX+eBSBIxSrqKI
 KBWT0czAQRKWeQnK5xvXXQFBtXQQIrsUB3NICxVcQvLIMoiICBlQLdnyiBngex+LMVUntC9VZAV
 Mjfk0juAQLTcarcQCOdfOdv6mHHboFGXGYBbSUa3oL7h8TIBCti9zQZP10bl6AzdigHrUqkTTvw
 yPRRqKmXm2mDGlStcWz2cZ5lj6oN76roE+SneYKhxmbj4DjuDON6vWepauHPEYmq5NayTUow4jI
 lys+mIwkokI+zcomgriTdOE/FAs8TKIRietGjacbJDPrORicj3IHlmZgvhPNlw+hRIMJAy+IMVQ
 PMNqInrzLIGlAUugbeDO50usBGI9pxD/X8NKVV7u60ywVw2ke25BxPnxlkIOj+dVMRK7Z26yBXk
 BSxuh8D1hOgxbHMbStmeXm3KrtEK/rv20nqtCzEaFnZFM6uSpx9evaVhg/Cjhm4tttivU/VoSD2
 TnwF32NqvOv3pWJMVog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXz5Uuo/raCOgn
 HjdAodIVAVmJZL2FtL4hL+sztP8dA+EvJaPtX+CR9V+wu6PMhAYNqRXVrkOee7XS+7wT6Q9btsk
 x/ABJEd5T5xr3q06dltXHaEIPNXgGEs=
X-Proofpoint-GUID: eVeZS_Cu0zFZpstxtkFIDtLnHAmB2jq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

Correct minor style issues around white-spaces (e.g. double space before
'=', missing space before bracket, spaces used for indentation) to fix
dt-style-check warnings like:

  t604x-j575-j773.dtsi:27: [mixed-indent-chars] too many space characters in indent (more than 7)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/apple/t6022.dtsi          |  8 +-
 arch/arm64/boot/dts/apple/t6032.dtsi          |  2 +-
 arch/arm64/boot/dts/apple/t6041.dtsi          | 96 +++++++++----------
 .../arm64/boot/dts/apple/t604x-j575-j773.dtsi |  2 +-
 .../arm64/boot/dts/apple/t604x-j614-j616.dtsi |  2 +-
 arch/arm64/boot/dts/apple/t8140-j700.dts      |  2 +-
 arch/arm64/boot/dts/apple/t8140.dtsi          | 74 +++++++-------
 7 files changed, 93 insertions(+), 93 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6022.dtsi b/arch/arm64/boot/dts/apple/t6022.dtsi
index 0feda70568ee..56e3b3f0b6fd 100644
--- a/arch/arm64/boot/dts/apple/t6022.dtsi
+++ b/arch/arm64/boot/dts/apple/t6022.dtsi
@@ -79,7 +79,7 @@ cpu_e10: cpu@800 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			next-level-cache = <&l2_cache_3>;
-			i-cache-size  = <0x20000>;
+			i-cache-size = <0x20000>;
 			d-cache-size = <0x10000>;
 			operating-points-v2 = <&blizzard_opp>;
 			capacity-dmips-mhz = <756>;
@@ -93,7 +93,7 @@ cpu_e11: cpu@801 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			next-level-cache = <&l2_cache_3>;
-			i-cache-size  = <0x20000>;
+			i-cache-size = <0x20000>;
 			d-cache-size = <0x10000>;
 			operating-points-v2 = <&blizzard_opp>;
 			capacity-dmips-mhz = <756>;
@@ -107,7 +107,7 @@ cpu_e12: cpu@802 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			next-level-cache = <&l2_cache_3>;
-			i-cache-size  = <0x20000>;
+			i-cache-size = <0x20000>;
 			d-cache-size = <0x10000>;
 			operating-points-v2 = <&blizzard_opp>;
 			capacity-dmips-mhz = <756>;
@@ -121,7 +121,7 @@ cpu_e13: cpu@803 {
 			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
 			next-level-cache = <&l2_cache_3>;
-			i-cache-size  = <0x20000>;
+			i-cache-size = <0x20000>;
 			d-cache-size = <0x10000>;
 			operating-points-v2 = <&blizzard_opp>;
 			capacity-dmips-mhz = <756>;
diff --git a/arch/arm64/boot/dts/apple/t6032.dtsi b/arch/arm64/boot/dts/apple/t6032.dtsi
index 2a3a1fed59df..6115ab8db5ef 100644
--- a/arch/arm64/boot/dts/apple/t6032.dtsi
+++ b/arch/arm64/boot/dts/apple/t6032.dtsi
@@ -415,7 +415,7 @@ &ps_afc_d2d_0 {
 	status = "okay";
 };
 
-&ps_afc_d2d_0_die1{
+&ps_afc_d2d_0_die1 {
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/apple/t6041.dtsi b/arch/arm64/boot/dts/apple/t6041.dtsi
index 9110d05c896d..319035493a77 100644
--- a/arch/arm64/boot/dts/apple/t6041.dtsi
+++ b/arch/arm64/boot/dts/apple/t6041.dtsi
@@ -323,7 +323,7 @@ soc {
 
 		pmgr_gfx: power-management@288e80000 {
 			compatible = "apple,t6041-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x2 0x88e80000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -503,7 +503,7 @@ serial0: serial@429200000 {
 
 		pmgr: power-management@502280000 {
 			compatible = "apple,t6041-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x5 0x2280000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -521,15 +521,15 @@ aic: interrupt-controller@502400000 {
 			affinities {
 				e-core-pmu-affinity {
 					cpus = <&cpu_e0 &cpu_e1
-					        &cpu_e2 &cpu_e3>;
+						&cpu_e2 &cpu_e3>;
 					apple,fiq-index = <AIC_CPU_PMU_E>;
 				};
 
 				p-core-pmu-affinity {
 					cpus = <&cpu_p00 &cpu_p01 &cpu_p02
-					        &cpu_p03 &cpu_p04 &cpu_p05
-					        &cpu_p10 &cpu_p11 &cpu_p12
-					        &cpu_p13 &cpu_p14 &cpu_p15>;
+						&cpu_p03 &cpu_p04 &cpu_p05
+						&cpu_p10 &cpu_p11 &cpu_p12
+						&cpu_p13 &cpu_p14 &cpu_p15>;
 					apple,fiq-index = <AIC_CPU_PMU_P>;
 				};
 			};
@@ -537,7 +537,7 @@ &cpu_p10 &cpu_p11 &cpu_p12
 
 		pmgr1: power-management@502800000 {
 			compatible = "apple,t6041-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x5 0x2800000 0 0xc000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -545,7 +545,7 @@ pmgr1: power-management@502800000 {
 
 		pinctrl_nub: pinctrl@5081e4000 {
 			compatible = "apple,t6041-pinctrl",
-			             "apple,t8103-pinctrl";
+				     "apple,t8103-pinctrl";
 			reg = <0x5 0x081e4000 0x0 0x4000>;
 			power-domains = <&ps_nub_gpio>;
 
@@ -557,19 +557,19 @@ pinctrl_nub: pinctrl@5081e4000 {
 			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 819 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 820 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 821 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 822 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 823 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 824 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 825 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 820 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 821 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 822 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 823 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 824 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 825 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <61>;
 		};
 
 		pmgr_mini: power-management@508300000 {
 			compatible = "apple,t6041-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x5 0x8300000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -585,7 +585,7 @@ wdt: watchdog@50836c000 {
 
 		pinctrl_smc: pinctrl@50c824000 {
 			compatible = "apple,t6041-pinctrl",
-			             "apple,t8103-pinctrl";
+				     "apple,t8103-pinctrl";
 			reg = <0x5 0x0c824000 0x0 0x4000>;
 
 			#gpio-cells = <2>;
@@ -596,19 +596,19 @@ pinctrl_smc: pinctrl@50c824000 {
 			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 985 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 986 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 987 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 988 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 989 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 990 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 991 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 986 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 987 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 988 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 989 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 990 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 991 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <24>;
 		};
 
 		pinctrl_aop: pinctrl@510824000 {
 			compatible = "apple,t6041-pinctrl",
-			             "apple,t8103-pinctrl";
+				     "apple,t8103-pinctrl";
 			reg = <0x5 0x10824000 0x0 0x4000>;
 
 			#gpio-cells = <2>;
@@ -619,19 +619,19 @@ pinctrl_aop: pinctrl@510824000 {
 			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 700 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 701 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 703 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 704 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 705 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 706 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 701 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 703 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 704 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 705 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 706 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <85>;
 		};
 
 		pinctrl_ap: pinctrl@51c000000 {
 			compatible = "apple,t6041-pinctrl",
-			             "apple,t8103-pinctrl";
+				     "apple,t8103-pinctrl";
 			reg = <0x5 0x1c000000 0x0 0x100000>;
 			power-domains = <&ps_gpio>;
 
@@ -643,58 +643,58 @@ pinctrl_ap: pinctrl@51c000000 {
 			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 478 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 480 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 481 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 482 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 483 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 484 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 480 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 481 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 482 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 483 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 484 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <200>;
 
 			i2c0_pins: i2c0-pins {
 				pinmux = <APPLE_PINMUX(56, 1)>,
-				         <APPLE_PINMUX(57, 1)>;
+					 <APPLE_PINMUX(57, 1)>;
 			};
 
 			i2c1_pins: i2c1-pins {
 				pinmux = <APPLE_PINMUX(58, 1)>,
-				         <APPLE_PINMUX(59, 1)>;
+					 <APPLE_PINMUX(59, 1)>;
 			};
 
 			i2c2_pins: i2c2-pins {
 				pinmux = <APPLE_PINMUX(60, 1)>,
-				         <APPLE_PINMUX(61, 1)>;
+					 <APPLE_PINMUX(61, 1)>;
 			};
 
 			i2c3_pins: i2c3-pins {
 				pinmux = <APPLE_PINMUX(62, 1)>,
-				         <APPLE_PINMUX(63, 1)>;
+					 <APPLE_PINMUX(63, 1)>;
 			};
 
 			i2c4_pins: i2c4-pins {
 				pinmux = <APPLE_PINMUX(64, 1)>,
-				         <APPLE_PINMUX(65, 1)>;
+					 <APPLE_PINMUX(65, 1)>;
 			};
 
 			i2c5_pins: i2c5-pins {
 				pinmux = <APPLE_PINMUX(66, 1)>,
-				         <APPLE_PINMUX(67, 1)>;
+					 <APPLE_PINMUX(67, 1)>;
 			};
 
 			i2c6_pins: i2c6-pins {
 				pinmux = <APPLE_PINMUX(68, 1)>,
-				         <APPLE_PINMUX(69, 1)>;
+					 <APPLE_PINMUX(69, 1)>;
 			};
 
 			i2c7_pins: i2c7-pins {
 				pinmux = <APPLE_PINMUX(70, 1)>,
-				         <APPLE_PINMUX(71, 1)>;
+					 <APPLE_PINMUX(71, 1)>;
 			};
 
 			i2c8_pins: i2c8-pins {
 				pinmux = <APPLE_PINMUX(72, 1)>,
-				         <APPLE_PINMUX(73, 1)>;
+					 <APPLE_PINMUX(73, 1)>;
 			};
 		};
 	};
@@ -703,9 +703,9 @@ timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 	};
 };
diff --git a/arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi b/arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi
index 57573550cfbb..85690720d213 100644
--- a/arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi
+++ b/arch/arm64/boot/dts/apple/t604x-j575-j773.dtsi
@@ -24,7 +24,7 @@ chosen {
 
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer",
-			             "simple-framebuffer";
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
 
diff --git a/arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi b/arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi
index a64797518eae..d8238b40d143 100644
--- a/arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi
+++ b/arch/arm64/boot/dts/apple/t604x-j614-j616.dtsi
@@ -28,7 +28,7 @@ chosen {
 
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer",
-			             "simple-framebuffer";
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			power-domains = <&ps_disp_fe>;
 			/* Format properties will be added by loader */
diff --git a/arch/arm64/boot/dts/apple/t8140-j700.dts b/arch/arm64/boot/dts/apple/t8140-j700.dts
index 15c21c9e3f2b..cdcd44e72bbb 100644
--- a/arch/arm64/boot/dts/apple/t8140-j700.dts
+++ b/arch/arm64/boot/dts/apple/t8140-j700.dts
@@ -28,7 +28,7 @@ chosen {
 
 		framebuffer@0 {
 			compatible = "apple,simple-framebuffer",
-			             "simple-framebuffer";
+				     "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */
 
diff --git a/arch/arm64/boot/dts/apple/t8140.dtsi b/arch/arm64/boot/dts/apple/t8140.dtsi
index 3b4f7695552b..676f6a19f69a 100644
--- a/arch/arm64/boot/dts/apple/t8140.dtsi
+++ b/arch/arm64/boot/dts/apple/t8140.dtsi
@@ -152,7 +152,7 @@ soc: soc {
 
 		pmgr: power-management@300700000 {
 			compatible = "apple,t8140-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x3 0x700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -182,19 +182,19 @@ pinctrl_nub: pinctrl@3081f0000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 473 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 474 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 475 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 476 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 477 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 478 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 474 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 475 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 477 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 478 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <30>;
 		};
 
 		pmgr_mini: power-management@308280000 {
 			compatible = "apple,t8140-pmgr", "apple,t8103-pmgr",
-			             "syscon", "simple-mfd";
+				     "syscon", "simple-mfd";
 			reg = <0x3 0x8280000 0 0xc000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -221,12 +221,12 @@ pinctrl_smc: pinctrl@30c820000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 572 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 573 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 574 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 575 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 576 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 577 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 573 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <6>;
 		};
@@ -243,12 +243,12 @@ pinctrl_aop: pinctrl@310824000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 380 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 381 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 382 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 383 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 384 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 385 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 386 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 381 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 382 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 383 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 384 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 385 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 386 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <57>;
 		};
@@ -265,12 +265,12 @@ pinctrl_mtp: pinctrl@314838000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 1128 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1129 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1130 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1131 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1132 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1133 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 1134 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 1129 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1130 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1131 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1132 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1133 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 1134 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <10>;
 		};
@@ -289,23 +289,23 @@ pinctrl_ap: pinctrl@31a000000 {
 			#interrupt-cells = <2>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 263 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 264 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 265 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 266 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 267 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
-			             <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>;
+				     <AIC_IRQ 264 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 265 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 267 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <216>;
 
 			i2c0_pins: i2c0-pins {
 				pinmux = <APPLE_PINMUX(171, 1)>,
-				         <APPLE_PINMUX(170, 1)>;
+					 <APPLE_PINMUX(170, 1)>;
 			};
 
 			i2c2_pins: i2c2-pins {
 				pinmux = <APPLE_PINMUX(165, 1)>,
-				         <APPLE_PINMUX(164, 1)>;
+					 <APPLE_PINMUX(164, 1)>;
 			};
 		};
 
@@ -357,9 +357,9 @@ timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&aic>;
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
-		             <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 	};
 };
-- 
2.53.0

