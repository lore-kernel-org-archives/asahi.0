Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691699;
	b=ShIKFY/ymfKXtdAjqcAhP0ncc1CpNUoW+y1PDUZl2WBuoRRQgZ5cDqR3HTTtUn20hYfD
	 xV1Twm9MZY+kNdqUURlFoFHgsjg/DYx96tzUEVG7cuvfQwo3fQkzmf8BxUAY1Aphb//aW
	 oXq2E1WMy7W1WFaDwSlolI8b2kYbhFEVBvZAOB6EKdWUYBD8N10oqncbyc8cANlzssiW0
	 FSvWPlqaOjw3AP1A96iXFiRMM9L3kIHKA7/HFfzgYRdk7Dz0wimKOw/EGXlOSMz9d0rEI
	 MKN5x/TnNjbqBOeXprWVrSQEvkU1kPE17jY3Hn25Y4WblG1TKty2dsZIvX28lI5uPhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
	b=ShMXoJpTMmYhRdmRqOfjZI4rCvn0Scl4j2iFM1XzpS831fpIYuUKaUx4uZpDyBa4gWDe
	 I8IM1kutEBc0dZ/J7VJ8pcEGCZjvhN3u2cvpqz0ldWTBrl24GPGH5hOiNXwqE9c93f3nM
	 R3Z4NzlydTkt0LKW1T3D3OhIIkJHkl9JEQpScgr+Rslx8Fcr3JBGGlvy5cVc/uPeAHJpg
	 YHcaic435O1Yz8IScRz1cXYhgK/WV9BEAnKTupWzS6ufwOy8OMkuqy/hswzFUAIEU42Rh
	 vj7+SpVuDzem9qXuyelRLtStkNnxvXUyltaSNmanM1eYWczGP6L59P7V/njLKnshNaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CNPFoj2T;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA618606A32D
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA618606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CNPFoj2T
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso1623289a91.2
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691698; x=1794296498; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
        b=CNPFoj2TijH/XmytE4xMa1OZEGTNtapNzrKlAaBnFFJKT18Gel4VrFyP35iAq85AxD
         rzKiX159CxWl6MI2V0RPeTrMYbsJruDXKKHxTZsnEJZNoDwXgAO0sgYZoZWiVrlbW+gn
         ukH1uolZre43DY+H+nxq6q9//k7BUd7HUsbIQ3AW1W7cJuV2WzgGANO+OVNBtm5uewnO
         AmSkJDdwKfaYtzxb9ckoUTJJbzBRF43mIWIkjdh2xm6Y3SlA6qQeiFGCBF/UyPA4xZ9T
         GRGksHfXwJFxtnszIm5SVI6Pz4GCrdc2wpXjc09EijfwrXwAfKScC+T952S81RYmgfj8
         3UEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691698; x=1794296498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
        b=O3wa5vwRUtHgZN63CgWPg31rsr2NbpUUOgLrAUYFS+bw0Kg2WvAHwq/ijbCiqTSYNY
         pfFau1H6Gf5WXGWZbq5Fj/TlxOY1iV+ikIkEmb9vZVCQA5gZSUYVq69D0tpClWp4PoFV
         +YKV13Ay1T7mHeBPKRY36jpUcOdSLqHqL+aEqlkDZslSRJh2m7cA1+Atw9qEhRtorbES
         Ayukdtyov4GhNOpRrdrMCY0+hQvI1PjHIcJqeOTZK4H36bMqDorktmb9Ujf5YRd0bxmZ
         bGqOfj2YRxhU+4jstJRACf4S7er1GYmLitV83z/O4rpGEU+PVKnsbvGtrffjnggydPj4
         L1yg==
X-Gm-Message-State: APuU4Z88KhaGwos1Cx1cg5ICdt/UacEsoFQ5W1+izdPM1/KFIp4dHYRF
	3zosEFSIqFn+HozJ4NEG7s1l/KAO6GvuD+DaVhXrD1HFzWbY8tMe9avi
X-Gm-Gg: AYBFou1N5/TNIyum4l72ri7A/LdqfGGcAIT9b7dCTs+X8+HWrY57jPQ1l51hYCRqRsk
	TMnln2dIGGPDIIa3KZkbzhynWuMVKVxttONysAnOyxBSJTG1CvpF2KwQ2enAUik0vi6A/WlFEnX
	x8CDD597kJuQdpqPvaOmOWwNA4N5uWKkkzl5A7+4pRT4ZgmCUIKm8BzyXuSCsz60AsdhVHe2xvt
	ZAxbIuS0P8B/Yzlv0SIzBkd3SiG9SoYNxfs0LrEKDP/kGQ6YKRcLew1oPpL5SyCQOVx5DboWIk+
	Ng7vjmUVs9kp+Rzccxk8NYxM/1AqmuX/o9IftpvOgN39UwhliM5eMjUu98NbYPJXF4z7YA7zuvg
	56IIhWALJGleEeyy1ThtR4zNuU2OUE8tW09usSboSbkNjKe8SrI+nwNK+LUIjLMSWnlacc4qF4R
	fOlIvarJlsmdVomObnlkfrL7l8P2PtyI8TbwUvxB9tb6WYQoeRUzc0foHI2B8Pq/bcjFfzUpHj6
	Jo/tCb/FHBWMr/SRgQ2tO2lL4BL+YqfaOiBD4as8oUa/KdFCd/L8H3zzuJ4H8YSqi416DRZtsY+
	tkqyaLCXfe+FGPSSwis3y69WXMndzVT/9BXThFYNxeoSgQaeFWBrhp/pfL6Nq2oYm8JzynpY/qf
	XidTNFu9yMgPzJxNVrBaO1BqPoop/BBjDzFn1OcjolBuVjBXaAlcDWBpkf7B4S3Y0Ddbi6SvMbW
	7rKC4=
X-Received: by 2002:a17:90b:2ccf:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3ae897a8b33mr10316524a91.54.1793691697979;
        Mon, 02 Nov 2026 23:41:37 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:58 +1000
Subject: [PATCH v4 10/22] arm64: dts: apple: t8103-jxxx: Add regulators for
 CS42L83 power supply
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-10-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=91sg/4nKfvF74lrnGKYqCKgThTSUHsOM+GGCNFkYSqs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88JbPI72Su8M+7Bbd0Zf+xbV7Nr6FclxD/dnnT9V
 n7MU+kXHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKmOesbwz/IYh5nksXNOV/8cU2vXil8j0SZjyleck+IU2sYVW3tenuG/yxuJtQf
 /2BkYBE01uGa7Zk4Hl963N2flDnT7cRpfC9jBAAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The CS42L83 codec found on M1 series Apple Silicon Macs gets its voltages
from fixed regulators managed by the platform. Add these to the template
Devicetree so that they can be referenced on the relevant devices.

We do not (officially) know how the power is delivered to the chip
(voltage rail names, commoned pins, physical regulators, etc.) so
the regulators expressed here are just stand-ins.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..34694902c945 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -38,6 +38,38 @@ memory@800000000 {
 		device_type = "memory";
 		reg = <0x8 0 0x2 0>; /* To be filled by loader */
 	};
+
+	/*
+	 * The CS42L83 found on all T8103 boards requires VA, VCP, VCP_FILT,
+	 * VL, VD and VP regulators. We don't (officially) know how power
+	 * gets to the codec, so these fixed regulators are stand-ins.
+	 */
+	jack_va_reg: regulator-codec-va {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-va";
+	};
+
+	/* CS42L83 VCP and VCP_FILT */
+	jack_vcp_reg: regulator-codec-vcp {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vcp";
+	};
+
+	jack_vl_reg: regulator-codec-vl {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vl";
+	};
+
+	/* VD_FILT */
+	jack_vd_reg: regulator-codec-vd {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vd";
+	};
+
+	jack_vp_reg: regulator-codec-vp {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vp";
+	};
 };
 
 &serial0 {

-- 
2.56.0

