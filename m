Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07AA39E6CD
	for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849479; cv=none; b=XzVLyYXKN85A2NP6PCATyUJP6DeeUS3Xz4Nks+4xP4XRxA+ouk7ZUVqjxlbHO8jSWklsRAavN3RDpdQH7UNtjS9MG3RJOR6ZF7McBCYn0dy+nG9LRZLRS/kBI4Rfy35itRP0P2gsyFWo43SBJI6UnZuWm/1j2Cp67yW/1a/nL0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849479; c=relaxed/simple;
	bh=7u1MxAF7Cm+8Fvpmgb0ZciAKGCBJ6Tnc1FxGjq6e2jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eO74Tlq7iwp56df7PLwOn0bIIbrdZwnaohh5GYZmDHcdVGhPwM88H2Y8zvzj4n53BhCKskXo7PqpZ8jXINAANSmyp9WXmREZSPHSlIHVQTe3ee40Y+0laShrWBQMHKpfWU/Huwyd3sVlsEWvgI17qQoJFZBZssj+VPGy5/ICHeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmLNOI/H; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmLNOI/H"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8487214ad2bso2899461b3a.1
        for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 02:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849477; x=1784454277; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=;
        b=OmLNOI/HnXfWqxnEd0plMTYK2k72BjOSKIeMvrF9CrQrEzGmIt/wwCTBIf1c18dkzf
         TMXQ2dQQD9AnAYLL52EilTueIK3zvCaMrTuETq/0vL4qTI0lfdGeCjznRdzn/by/qHLV
         YelVpRRuh8j6XzjiHpkRfESa5tkbaljsNQ941G1B51hznUQ2taeoi6s3WTAMdHBKqYXz
         t1PmhotYqDDdUHHdfzOlTiK3BsgxyvJxcJ755Y1NkZ/ByxMz6kqHgRdCwoNx5xIF/45H
         tHR+S+zCz+oJCpQs2TCXDmUC1pbk/JbKTXkevu2L0MPK8+3xbu3v+Kvq8schIimde7Og
         E5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849477; x=1784454277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=;
        b=Oz8qJFohKysnC8zStyMYiePOZsUvjIE72Lav9SZF0h9ERs1XoPJn5Gue2FQDH58j/M
         D4s2YFUM+H1Vi02s9ciKOKtVC7F3ynUKE2PJY/CkcixGPlUrQxgPqu+L9nKkNN2IfDk1
         V53BLXiOYJvxkZY1kvwQqgITS5tVHX6ML1JoWnKHbOuw3nSekPxbi2fO+IELZQhY2aLz
         l6kUxumGxneggufwB9aKKljr3uJKe4BW/aoVpI78hhVRcdHAPagYMCzUF80L99Bp6s4c
         qvtr0oOmKjWe1o9UIvxN9qFKAWJCPj0bhKaB2OpfBIi49EQXAnz8lhliGD1tcmyNckIq
         zAIw==
X-Gm-Message-State: AOJu0Yz4FWgFJnla02i2j/toNZPsfmkpRYTULw095VqiylAxBUhN47wQ
	b6UuNlQ6IX0OcqWOKiAxTAfSVybz83pVmrIEmdx8taMdmgq+gUK14gUS
X-Gm-Gg: AfdE7clfPVLtB/fmfsCjpGdWPLZW0IQ2AvzcSgZEwE1gQd7Yn7ji+TXqqXBBjJctl39
	qJIL5/FWLlbWer9MQhVNA+5xkWJ0sTEcq2fiLAPLMfINOq7abOOFLfbei7iBs11lXjYdzaH086W
	KH19sDrVp/5qBQOO+aG9eG6HRc7uL3PNH33PU1OZ+PAs52RG39Almmsbbxz0vttfYlLyHvu/un5
	T7+klOR+5StqBK3pCTzvJabe2ee0eQeJCZQq85fUDZIrFAR/K1ruhHW/qUGozfqFYrDpq7tFQ5W
	B5jJA8eqZe3MfX8oPUXjF8y8gIrcV96AIFy9kmnmuZNx9kSD7DlHO1dhs6SaCkHq/7jbFX2/0oA
	UQVEMtGdB1DavjsJRRlorOxgm7kDSbUPSWJswLiltSoOZXMl6ECU5LaQTvcQlgXne12JaXBHlcF
	lc9Wrfl7ABZ/Dx5tg4zvolJV2UcZrluGz3EYEez9WbuBtaRlm8UryRPaq0md51dOan6y90GJbyS
	6cXAgg2FdNjK5PLGLQtkosntKRC3Lx72vr1zsPrt4+MGZRCpGj16it9gPehSALZ
X-Received: by 2002:a05:6a21:3991:b0:3bf:6363:11ec with SMTP id adf61e73a8af0-3c1103cf75amr5286669637.34.1783849476910;
        Sun, 12 Jul 2026 02:44:36 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:36 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:25 +1000
Subject: [PATCH 06/12] arm64: dts: apple: t8103: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-6-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7u1MxAF7Cm+8Fvpmgb0ZciAKGCBJ6Tnc1FxGjq6e2jU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU9ucqn7PBXrmNx968SE4F87GWuiFKomiFjozJK/0
 nV/ZsPOjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRHHWb4Kzfrg2/M32lJtzr3Scty7dX5f63uzFltiROa8y5u2Z5zXY3hn5lN3Z6
 vaX2H1wvwJX7p2tvj++X7loumW6u3nNrzXn3qNG4A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 4d6a0411f086..5b68bf0df4e6 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -1250,3 +1250,4 @@ port02: pci@2,0 {
 };
 
 #include "t8103-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.55.0

