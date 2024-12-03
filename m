Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193BD17E016
	for <asahi@lists.linux.dev>; Tue,  3 Dec 2024 05:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733202442; cv=none; b=BD5ldDVjJvfoAB7HGjcsEBIe+g8+7A43q8WvxRJO4ZVGrFAYFMse9QFeaHc6ypBE/mrqt4BYHgKr+a+VC6bzQn5uIFBnNZXKH4EfQ0EqdY0C60LxJwx0qQbcrVV6rvbHiU9ejV7I0GoT0SsCi0ySCrVpimA4T5qcKYcUVA67u8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733202442; c=relaxed/simple;
	bh=6pZiuvJaNtb/CqZdgPcO1kRdrv9vQuk8hv7BwCYOsp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FMHqKbaIcxMy3+b3s5ZN1O58dn0aXqm7jbc9YxjvDphi9Ldro8VAEW8Q6MM/kBgba75iQ8C9P1+uv9A5u+zy6fhWC03dg/XKS1QpUznTrIMxS+MjbO4Yh+2VIGbQtVQW7XLf4+EO9FDaYa3gD2JRqlkvORMNOvnmwGhMH30xz74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEvYOpvo; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEvYOpvo"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2155312884fso33718505ad.0
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 21:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733202440; x=1733807240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=;
        b=kEvYOpvohtYyxLEUjGacdqu56AqsH2E80+hHrgoW0XT8Si7VW9UrRPEPPV+SQpjn+7
         n4YI46Qjc/4VGOqE3YAgyDAGOAM5UurQ1ftUbo7QQYIDLZ1WQeC/XsL2S1FqTEGXSkSv
         AwuYy8YM9F+JFI6Nr3tm9ui27WVbcAyWePlHTH7w14QO6Ds2BrVRVF0vXKrv/vMoNBqW
         0aq66i0igmEnn3gO4ZM0B6g5UPVLQx4kcIJO0oTo691D0mfNNRRMwP8Leb81ypkN48r3
         YAYwcBXtlrRLChPjMziq164znhOnT76fTnp9OTiU8/sHBnAdC/AVaQJa1rWfzmH5qChv
         2h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733202440; x=1733807240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=;
        b=PM5kJyM98079KuD1FDSrrgfPY/5nUSg/1bHtCRfuUNq2o8brioX+nVLyAEf6Cf4K5Q
         3WxaVicBFEWPjF1vWLK//E39CL4ugDkIhatg86mna65SopPyPdfQemiSDR47TieryGhw
         etvhvTLO/1elMqvzdFAuliFSgW8qEPTBku7d+a2y5rvSUNQ/Qe1R2uPHsKUvhOGThyVv
         RXC58/BaZnwZIvb3w5g468kqeQYhLINe/VfG2+J9aBek93iIJA6/17e8noCeEaialh7G
         ox4m9wB9wgAeHt08O3SQf7z/hAK27xkHuQM+qj7MoMX2YpgZFxAsBj+wrhcmzEwsiDJd
         a2BA==
X-Forwarded-Encrypted: i=1; AJvYcCXWd1I4ivScGmQcMnZAQWldz1iYEe0yLK8zCScuGmqixyGAHzk5mBSErFdTsHoPXb75SHLMFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdVj+mu6S8ZCg90dip2qgBO9fgyBz0u1c4EA6tlHSToyxVo5CU
	1LQFOhBbAMtfTelEFbU8DnAWV3pmQz6rLAb9APqdt+iKjLH+8t2p
X-Gm-Gg: ASbGncv7UkQnr6N0TssnwRIaSrRw69ftT4Wx5Uqb5Uweit8LL9v69JG+UnDjzeMGbOu
	LTZ0BAfOmEjidgqnZsABRol1ygmekRfLRkqJb0b/eU6Dyvgo9ka2MPZmQupm/thipjPO4YF6gjl
	2pvLCjNdMsbpovXGkcuRJEmTP3dVv9Ox3dEPnkJ5zQ0MvBOamhiZAz/Yucx2yONPgfmoqqlnZI2
	4KVnQViPoUiX/vSPNm4hPDtTWE119pN8NRroWnNwoj6KWKhh+FMAxlxFc+Do/iiVg==
X-Google-Smtp-Source: AGHT+IE+mF4zZQlFW9cTU/rjqk1T1d7ncMfeh7ab/M52pAyOy802erj5Ky8I4VG6C2ix3C05Hk+qkQ==
X-Received: by 2002:a17:903:2344:b0:215:a3fd:61f5 with SMTP id d9443c01a7336-215bd1b450amr12903395ad.5.1733202440414;
        Mon, 02 Dec 2024 21:07:20 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21586d40afasm33242385ad.270.2024.12.02.21.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 21:07:20 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v5 02/10] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
Date: Tue,  3 Dec 2024 13:05:32 +0800
Message-ID: <20241203050640.109378-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203050640.109378-1-towinchenmi@gmail.com>
References: <20241203050640.109378-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.47.1

