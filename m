Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B39547CA63
	for <asahi@lists.linux.dev>; Fri,  2 Oct 2026 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934599; cv=none; b=VdZ9umfH63+is0/NmhmpHKpcR11yZhAg7MMSnCS67n3ST2TL2hpqRYmjCcBEBx1zAq3PaVpeK78QGLD7murXrjw68uf+Hw+m6n2cQRpHbqF9/E55Yr8ib1XBW7G70K2K2ON4q4C8EiEYlDDaLlXNOPZ/g+CY78PEgjopeDUSgcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934599; c=relaxed/simple;
	bh=7XIis/SaxCP7BZheKEH5EfAiCshL6qRfSl6dsIbmL4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmjR9Y3seo69Brrs1kpwhNNqk5oLIf01o8JiHwOIcuo3NeXzxbhVCmkzFRvK8qO+WCPr22jmjEC+z8FvkrmTAv0ZT7TUdeYbMfvq8RxtZXCfNSEacGgNxc3E6GDRoTgnhnvPfNaeKEd0mBDemp7YNBh8YgCv7kfJbsbHgHLDLfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Mc8PZP/Z; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Mc8PZP/Z"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso76775965e9.1
        for <asahi@lists.linux.dev>; Fri, 02 Oct 2026 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934589; x=1791539389; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VreqSPw0umlS9eUbJ8pFSQ6XltorV3sROnQHfTXwnds=;
        b=Mc8PZP/ZOtVjTjzoYEn0gf6Kp6ZFYaDOHi1kuP1SLaRyf2GF+IkFpOL9oankauGo1k
         EAiWEcEBENqJew4+zo5aY+icKgppjadB/qqU9Z7IIJutrZGMH93uyIue+Gz4wje7UF//
         1vLnpZmq33xDr8JNM3IrKyYtDz7/KMmyktCyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934589; x=1791539389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VreqSPw0umlS9eUbJ8pFSQ6XltorV3sROnQHfTXwnds=;
        b=BsSyQqY42NO5Dl5kanc3WaeItdWCnMMTBWIiPIJwA8PnbIRIWwE9M5A97yJoGTsIPi
         e1wp03mdm8JO64dtA3M6eHRC1DRVI9DBS8OLQeHSfLv7Qms/WBg/Tm5ZJE3Zkr+enb4h
         EyK9fj0uePlKon64RFdBkF+ZTD6mVpj1Cfh+uECAfVHGK1vR2H1FnoYlwwUmnYK/QaZb
         CyVtU16RMTCrVNnpBMW3tcp4G6m2R+4k/YJtzX/sIjWSVbkWRvePe3uS/FsbGQjYB2JX
         CnWpDrlpAYa5CO9yDFglOlifAxRffCSac9UzMEEh2f1VywimP18DUOJT61i8O6/pwdD0
         uc0w==
X-Forwarded-Encrypted: i=1; AKwUvBw0830S64jSGOZXkdk9QoFGMuIQGecb6ciPn1nCTywcbFAxVxSwOfs9gsFG9mEmQdGY5u+/IQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lPW1dwWJTL4qKKC4Afia17pTOH1C5LrdQFEVbZ1JOTeX0/Sie7
	NhVD36jmI4DSERHUfvLCjMnDp+CTVdbd1TW5z19Pzrr3/F59A3RZVQUKHqMjADmn8Wc=
X-Gm-Gg: AYBFou34jWcpT52bE6bpXJ/YdcfhojX5IzC5C/SrTl36fQN98UCITQmfFNc8/r7rX8K
	+QBgiqDa8rfCJGtG2cTBI3pPtcviLHmLe1hun94EKyU9yqMeE6dzX11Lt4meONlKzbthyCmD6mT
	Wu90J7whTU832YnWMx7andvOxDywXAFxnhSja2NTGYp504XEt4DIcmBlM8NFIcARSN4drdhMVg9
	iOUR2i7g0bJYS1XZ82YrgchWh9eo3d+HKQDmMON2/wP22LpE97wGvC1ksAvc5FovZBWuCPLa+H5
	gq7VZQnvy9w7R9WZ4RNG3pSUnojm05V2nsz2hEA5LHXkDDWh3BKZK/H0/ZZDxSbKVaKXB3MBi+O
	SRbJ+qyNaBPvPa63ipevU4fohY4Z+uG4BicoZ8DIWMN51cbUCKrUFVLnj0aF85nfSdZLaINLECy
	xYudBBVVCH4lFW5JQRLy4q+8dTMMRxkm/Zzm3edVxZ5Y/eXTZ+kHOx8la7scEovNp0R5csiK02Z
	5M=
X-Received: by 2002:a05:600c:c3ce:10b0:4a0:317:1996 with SMTP id 5b1f17b1804b1-4a02769f2a5mr27989155e9.27.1790934589559;
        Fri, 02 Oct 2026 02:49:49 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm4572200f8f.41.2026.10.02.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:49 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:33 +0200
Subject: [PATCH 4/5] ASoC: pcm179x: Add pcm1796 as compatible with pcm1792a
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-4-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com
X-Mailer: b4 0.15.2

The PCM1796 is fully compatible with the PCM1792A.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x-i2c.c | 1 +
 sound/soc/codecs/pcm179x-spi.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm179x-i2c.c b/sound/soc/codecs/pcm179x-i2c.c
index 5337bcc7c62c..e81e20fadadf 100644
--- a/sound/soc/codecs/pcm179x-i2c.c
+++ b/sound/soc/codecs/pcm179x-i2c.c
@@ -32,6 +32,7 @@ static int pcm179x_i2c_probe(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id pcm179x_of_match[] = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-spi.c
index 192fee90c971..e5e4b942acfc 100644
--- a/sound/soc/codecs/pcm179x-spi.c
+++ b/sound/soc/codecs/pcm179x-spi.c
@@ -31,6 +31,7 @@ static int pcm179x_spi_probe(struct spi_device *spi)
 
 static const struct of_device_id pcm179x_of_match[] __maybe_unused = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);

-- 
2.55.0

