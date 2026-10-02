Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21C2476CC3
	for <asahi@lists.linux.dev>; Fri,  2 Oct 2026 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934598; cv=none; b=FPhCyI0ltzpycLgOXnOoDQNCBuJDhkwuWQB2MGxjjH3P9LyMlHVpOpY05va22BYVgY1Jr9eK7oaOrMSKmMUEpqj5ALEv7XNSwV06eX/gTtr0YUcOVfZKgKs1Y0Y5faIDm8iYyjaGQYEsrXaTbjN/gC1mukUZf3hR1bypIyMEPFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934598; c=relaxed/simple;
	bh=3lOlktFAqnyOdTTnxV1RDi3COlBrsI3NZw3sXEpqQYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b4VaFogEnVMxqxom2H3hIeOzfuYEMTYPF1T0oqMSFz0u8XzarGthxEVfbyj+x/mr5m1Kkn3h9ql9ak8QYIMNQJLj+yQ+RG3nK12NcQtU+SOfwjdRXcf6FWNe4DckGbIsbUNOO/3oDFLfSKNujEVAGSaDLrdbO4S2BQT7dw2lJN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=PzcG6pMa; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="PzcG6pMa"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b059eae96so1730469f8f.0
        for <asahi@lists.linux.dev>; Fri, 02 Oct 2026 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934588; x=1791539388; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwpDabsocINC12W3N5eBh0bHuZzo2UoIUzRt8IiGg6Q=;
        b=PzcG6pMaLlmqrbqE+KEwcy6BJjSlNviLfwE6qhrIsZQ/Y+A/mqa0/rivhfP/+VCZco
         2B799dxfoHuOA96Hl+FbjDyr9u963gr0wRzpcAutsJ9KtUxTcrOa4O5JvrM/RFQPytad
         dZqPL29CddIU1K5OoXqbaA3AVzJvrby8usWwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934588; x=1791539388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwpDabsocINC12W3N5eBh0bHuZzo2UoIUzRt8IiGg6Q=;
        b=Umv7AqfzQHlrTSm5tGirEpvKihcqP3HZCRxvL1VLbPdKUiQeaGhu+dQpigDKL+JySF
         jCpyFA4nXcTUdkBbdV+MtHabQK8N/V2X++RtaA+eLza84M6tnXWbCbXwPfuvgzFHa4tq
         TXD+Dsy2gqrLStilhwPQ/iitRwA6LZ33CJ8nQVNwvQXimkD5Ql2Qaz+n4dL8YznKL2X+
         TuxZ6n0WwIYzn9CwnS/WaP6u2GA0OXRNyi7e+gM/qvlUuuObsby2L1cFVM5gWVtRrK+0
         JZBLVPxM7UQnQ3vsiGC/Z1gkMbTHthY0lOAj5WwWcDrM0b+i4JwKIbCSuIyiYKxY6e4i
         JrxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMnnuWwc5wukoJ9xETTujb98EScrMHZ9LE3HJMftUHyWhJkMBukbliiJxSNDWA/mp0Z3H/wQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIwm5j52S1+LP0ZNjxwM23Rr4RBvmtWDCKCIJhJfCsBI1oBSrzn
	w+phj8xJBRIdztPw7YAVVVvYrkrru8la0LQyWS5vDFqP/3+s0FDfmyJc1mI/fZkasSE=
X-Gm-Gg: AYBFou3E1FBcb38ba/cCFTZhn3xMYe/QkTagsj7eeVLE9Q4uXEDQrkLDOkABdS9F628
	eYjfp3aTpflPgQpYZN3mPs0es29+JMaEcifxwZH90q5s1Zr5/BwIpwlIf4TtbEWoCeZMZnZK4Mr
	pwXSHIV6YtOSmG7bV6sRukKIVSKztbQx+Nin5wSnsTdae515Q4lbmWOKi/yC0aNjc42iHJaGp2w
	i6IXmUN15NDwRb3NNu6qZHk0JdmILtRgOTtkd/Vcd0lcEYDHdvZZ5qL/hneJCm85QFcA7ZKsJ7d
	lLyanshUyY7SxT3f+RNUKSifQxgAh0Ulsia0LJiqXapI6p9KHAY/sg7pFJN2qw7erkrGRiv7ijf
	SbPSL0MjvVA/BbXEIkQTJ90nmxpXmS71i7AD52DUU2iByDC/Rek1prDtJwTiU7dpXHDZHyEYeGw
	JJWp+OId3Fr9MGbzivCx/TCL+ZuJtjwx6/92WXrZb6tNU46Pxv6RtkmXM/CETu6rjeWMIIgyXVO
	CwoXY9jEaITjQ==
X-Received: by 2002:a5d:5f8e:0:b0:487:bcc:2c08 with SMTP id ffacd0b85a97d-48b1271cd1dmr3972478f8f.14.1790934588564;
        Fri, 02 Oct 2026 02:49:48 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f89c3sm4149829f8f.34.2026.10.02.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:48 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:32 +0200
Subject: [PATCH 3/5] ASoC: pcm179x: Add left-justified formats for pcm1792a
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-3-f0e53bc7331f@amarulasolutions.com>
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

The left-justified format is supported per the datasheet, but was
missing in the table.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index 61b87dab3266..c059e410cbbe 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -75,6 +75,8 @@ static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
 	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 32, 2 },
+	{ SND_SOC_DAIFMT_LEFT_J,  24, 3 },
+	{ SND_SOC_DAIFMT_LEFT_J,  32, 3 },
 	{ SND_SOC_DAIFMT_I2S,     16, 4 },
 	{ SND_SOC_DAIFMT_I2S,     24, 5 },
 	{ SND_SOC_DAIFMT_I2S,     32, 5 },

-- 
2.55.0

