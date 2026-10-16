Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C2D46D2DE
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 10:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146859; cv=none; b=ZeaxKFmBjpKCyHW0fa/EjXmIRc992Ub8u8OUY2YrLFqw5LxdQo9bHui9L2kxsbN20PG6JFRCMiGVX9dKc5Ef1tbRVDqZNWG5G/hCgYSHC5Ds3/p6bxZywDxl/2sRg2A7PAvv1xGXpK8pj1fvE4vbvAhcNg9miSvhCod++sQjEvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146859; c=relaxed/simple;
	bh=sprRzO+Who/LqrpWB7LZgsBNOyJQMqU8u8RnDFPAWYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+y6WtaJhBJVunwS4RhtJwRkpXSNOgc84p3DjF3T2ssnpWg6SVxxqtQ+WVP/vOCj4H0BdQZVq7uzg/37pbtQ4N1QVtx1tHEOp3axEU5ALPPXUcJpNoxB7POjILKJrjFB/RmuqtH+n6euvpeSvRj/9gp1G9rw88axej/m4ARIaoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YiZ8t0bI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YiZ8t0bI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1312016f8f.0
        for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 03:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146856; x=1792751656; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOtyDYq/+clIKHUqG6DwQpgOOBIrRWoQi8mCvLhnFfY=;
        b=YiZ8t0bILlcKopS08YEvFf/xUDr9e4yEncqJgG9/bxWxR7sNNRk/T7RPTqqU68yjFZ
         ppI64texctMBQAyP4417MQ2A1Bphc9qx7R4KqzzDKQurW4L98c3bVk2vu4I+v56BaWhs
         IN7JchGmfpTKvbwNHTr3Pf90pBEacvLSfSRXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146856; x=1792751656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOtyDYq/+clIKHUqG6DwQpgOOBIrRWoQi8mCvLhnFfY=;
        b=A86qkfKY+S3uMBiEOmGXdJMyKBehA2y7rirY3HoYFSXm5pYJ9TKd5SA9KogronBjup
         UYZ2xKkOZZvR94t3TMg5dSc0LQRbAyjXUSaj2cw4TwV9mpfQdVfbYP/B6JMG/zCkJiu7
         LljMYAfJOumgUobYp245CxP9jrnkYvq87TlyjRZrT2IOBSEp4kwZt77i/wZyQRieTTIN
         a/0JDENoZPJzClVTX3TVrTFnEnX8STyoJnb9cR87VzRuLluWoxFlSSDspzvk5YiZ0Wn1
         HXMd/w20rONwM6TMAW7YAhBmz2f+P+ABqXKqzHfmyhrL6tZlpBbu7M00ptwBs7jOTvzB
         z4jQ==
X-Gm-Message-State: AFq9FYKBc1gn0xg5b8P1slOuYz1I4uKyk4ZLF/DRbMzTk0EWqPf+HV12
	7cjiDe9q6CWckqjlIek2Cs7nJpvlgHa8m05+Y9ewwSLq2Xe/IClY8q61sNvC2j5ErxY=
X-Gm-Gg: AYBFou2qLUQEoYhtnNufa5TzXINirMWREVDS+suVMkjygpvLH2ZvOR0zhhNpVjojk8r
	znfTBbErYUg7jJaGlXNQUos47JgHs4BSHDJijnJzUvpZjREp80GBki93gure/sjpZiHFzj+MIjI
	03cdQ2Ei8ig0Sk5tNpMYII+ceAgJFxHZhG3ZtwWKRMi9HkY2k/RY72r/FF32CSzojjCV9eeUFSt
	/Kc3UDdYBXH3KmRnmVqx2mZpIXieer1QVCywtOnX1y/gc9SCB/G8c+APlimo+H00yfikIkIdaKQ
	zKKsjophJ5Uf53K+a+qAc6ZgGNb7ZAWZbBfjSw8kHWhe3dse9JMH8FE0ae31c8miWpoM+tLNgeR
	9isojUSYprA9EAkAzfEAeC41Yu0WQrktHRFKxevqQGbhsKwPjQUsMqASmdv+rpxrwGlC6YeYQtM
	zwcssKuPXNugtLfmAXR+NYQ809ZIB1m2BVq0NNAvfGswbjh5OEt47TLxGhpTMUw4jCc4d7fT+ul
	JOytR3j5XF2awq5vrVmb3n1MenHyzmvYeLLm7z9RUFgNCz/PSrxnEM=
X-Received: by 2002:a05:6000:25fd:b0:487:f37:7ec4 with SMTP id ffacd0b85a97d-48dbaae5ba3mr44319272f8f.24.1792146855274;
        Fri, 16 Oct 2026 03:34:15 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5035bbsm4219327f8f.44.2026.10.16.03.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:14 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 16 Oct 2026 12:33:54 +0200
Subject: [PATCH v2 1/5] ASoC: dt-bindings: Add ti,pcm1795 and ti,pcm1796
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-work-v2-1-9340b9555fbb@amarulasolutions.com>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
In-Reply-To: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
To: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
X-Mailer: b4 0.16.0

From: Michael Trimarchi <michael@amarulasolutions.com>

The PCM1795 and PCM1796 are cost/power-reduced variants of PCM1792A.
Both are register compatible with the PCM1792A, so they belong in the
trivial codec schema.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Roman Smrž <roman@amarulasolutions.com>

---
Changes in v2:
- Updated description.
---
 Documentation/devicetree/bindings/sound/trivial-codec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/trivial-codec.yaml b/Documentation/devicetree/bindings/sound/trivial-codec.yaml
index 9a35dfb17349..a24a21c855e1 100644
--- a/Documentation/devicetree/bindings/sound/trivial-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/trivial-codec.yaml
@@ -36,6 +36,8 @@ properties:
       - sdw3019f836300
       - ti,pcm1789
       - ti,pcm1792a
+      - ti,pcm1795
+      - ti,pcm1796
       - ti,pcm5102a
       - wlf,wm8510
       - wlf,wm8523

-- 
2.55.0

