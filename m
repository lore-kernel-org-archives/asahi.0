Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691686;
	b=V7YxOTBgmlS9D+z2es40bNM++zOtgt9MC36Ydh5PX225jYkak8E4M1hRZ0jj8D5TRJxZ
	 DHExZtJTtnhvNqnXvRgYbTuQY4c9kuN7VkD/7qor92T4dlf69TjX1r8l/0fSwFLQOQU55
	 AjaonH2BX/QqEqqk32AVQjzoFO6tUeX24IWuSYKwCCb592cMfnpZOxkEqv/BA7JAA0EJO
	 N6MTrM1GN6VKfqS05ustBC08Tgm3rwSSXHmzVsD48CJbjhImr9verqHsnUCIvqMFA/LGf
	 UBZZ2Vi7KK3/QjwCY8W2J6Wi9zgPXOvf25jj0cQ9iWq+l7rPjYVmbjhLQ7/rcQMC05A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
	b=4776uXuvmQduSzcuNZy2PpeYc/VusIHxJzY8+lpyk8xiOsRGeHSOPxWuZJ68gR4EiNRl
	 KUN5tCjB5wokhggYBLDnwXqMVKDuC6/VvrKdgnjFAdhmiGqmPdOeZt4Qdu8wgi8QnO5t8
	 Hz3XUFnb4tKDUEXvkE3eMdcKMTO2tlvVcAS8zfRyamdcW/cNK+YF/pbTyvtuvVgjLDNO4
	 VIfA1sVu3u59VYy61Cm9LMOrx7FCSDYAozjW7eIB0ZP0xbiVq0yVIwJUSPIaDLRmCn2jI
	 DRKaO8RTWlAiANrqXkA1MUuvnFd5ZOEXMUMvvwoVnemI+zTOgT/oundmUx8FEtuXWCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZUNlBHJt;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26923606D807
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26923606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZUNlBHJt
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2435429a91.1
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691679; x=1794296479; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
        b=ZUNlBHJtfiXm1IW0/PAyJYZQScRg3PqlJcpkdZwDZVZWdtaLXsAzoEWyXUmLRfnp3Y
         +HtBydXNUZo74xmsWbCMkbs1Qh4yhxgnVEDfktgOGvWmYGKOBp53bCXqOcWq0Tf0eK8d
         RS9y7w7g43/VNwMe/D1CNQ01yx+mO4ihyqB4wrqQ5sl4mlBXAAB4i27/5UIDh9lWusID
         M6N4RdzdVgqYbX5F5FdMW5zSndcJKkjpq+a8VwzAq+vNcNF7K530BSZlbBGdSA+PWO3b
         jGox/0RGAcWOqj7uX+PZqyfrUcr2bt4boA+NBdDZIEMfLEUGJS5/viZVgPe/ngTKKqNT
         rZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691679; x=1794296479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
        b=YE4GqpCoEpMkqebSQqR4P0l2k4fJ60ieOdhEnDEd1vL+x8/XH0PORoh2KjV48HzHJI
         Ij7rDAJeLeoQKyydpml9iouN79V0JOpc7wIOesXzti2kBS/znvZoYkYR7XkbhN7qyFQn
         gn+iv4ViqHZ+MB/sFiA3yWForSer4jn1F9fcKHTRoIgtOPUTNMGZ6iStbQZ2eI4jb5sL
         qvlbPH3/1AKeLNLuDauVB90i/ivE6zALTr7pIPlzgCe0DQ7RrevYJEMrSBFpTuBFNW9O
         x3ngeUybicftpW55JQx7+k4Hm97KFqwmv5XOxXaERw9XGz1VdasVHQPpQVEttTUip5pS
         YEZQ==
X-Gm-Message-State: APuU4Z/vE77VJoTrRga/HA/Hx1ynoBewPH5iJUuvNOwJajzp4N6VTQ32
	/gg2omYbl03LSM0EWp0seBuSIkB1U9Pfmfh7VrqLsIBdu54hEfEYh8BC
X-Gm-Gg: AYBFou0YFnZdyg+rjYKJVR26Z4plwy1asIkVImOFNLniTHrFndLc/BLj9x0ZhoQ7oG2
	et2Rp3Qvk3INEl/yh/HgEJJ7eV88RaTyZKjPpULx2FFrQ0V6Soc32iacSUcCiIRcuUYHBx2USZL
	ZW/XHnbZooUP9alsbWljss3is0UHsMCRoRpwDlmyl9yXE5/JfHESCNC+cwdI42GF54iAQ8Abad2
	fmyDYe2IA+W8pQlNwRESrgueu0AwDGvFwInTqi715gDFUbDhYcsaB8TXxdWGxRnKH60ddPA48ZW
	6na/jVG5yh9L69YqUhkifMGgGzOoT8fkjzGu8BYvLrfkceesNC+Ssc1FR0d4u4aiFX1OWTRHnnN
	MCZQpXY1m7VTPXQLUrq5vcFMwYofcCC2s4MD6S+c1hsxq6Ej6lLnuhGZrA44l5y3xlFVsBSWdtx
	e8mq++xRov7AoY3lPVY+99Cv9tgJ1nVO1G4zpAuNnZ5byt3o35YfpIaHzETF/sGE8f8SVj+u7DJ
	JftNsgBsF//LUEVLC/DOwBtCoT1btrzyZMcywyBtnkvCvU8xuPbH6lJ8chpE3viHdMM8xHyIk88
	iPPYJtu2WHpzXcJdy1aWEzxItZ6dFJ5lv3I6Xrb576X5K8pLdFkNx82ybNnLyBMIQ9YRJsXbhz1
	oQM+8G9Fh6VBNs+I9P5GF2jzCGNU8j1MVl64xzdiSgQp8/oqHvlsexQh99s7CZtSIBHz3aAuU1k
	ZA+gg=
X-Received: by 2002:a17:90b:1d0a:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3ae897f6e87mr9311929a91.44.1793691679407;
        Mon, 02 Nov 2026 23:41:19 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:19 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:56 +1000
Subject: [PATCH v4 08/22] ASoC: tas2770: Add compatible for TAS5770L
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
Message-Id: <20261103-macaudio-v4-8-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=69WolvDz8NBwzZIcSNN8FfeWXOxg6F1Zc88rX6gr6IA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/JT/yQMm+dq82UlFMPTp/2dY06tJip9pvC6e8Tp
 nCaxhnc75jIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1TQbDf5dT0nnf72fPOLBj079/H7k1rpdmX7u6dl1j6XIjR4djR6oYGXqmvg1
 +8eCK2cYJOaER62doThWo8+3ycjEK+na7YN3RfVwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS5770L is an Apple-specific variant of TAS2770 found in a number
of first-generation Apple Silicon Macs. Add a compatible for it.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 67ff2dd949be..57de75115450 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -987,6 +987,7 @@ MODULE_DEVICE_TABLE(i2c, tas2770_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id tas2770_of_match[] = {
 	{ .compatible = "ti,tas2770" },
+	{ .compatible = "ti,tas5770l" }, /* Apple variant */
 	{},
 };
 MODULE_DEVICE_TABLE(of, tas2770_of_match);

-- 
2.56.0

