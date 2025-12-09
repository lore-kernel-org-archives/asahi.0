Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144BB272E63
	for <asahi@lists.linux.dev>; Tue,  9 Dec 2025 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272693; cv=none; b=V0Tn2t7x9h69s/UDScVY2QoL2ADhvfot4GA0NctbQj8ZGlYMc5MSxRlTkAfaRSNkGcw+6icuUsG0baToZItCNXuWuTW5isksHjkd8lLdJI9TkP2fOKw+qRU94taSjOvMtaxtk1P/OnXB/5nUeBU3jSI/dndk7OuPcAYNqBr2+iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272693; c=relaxed/simple;
	bh=L2NXhYYRLt8OIp+LSK83T3wVNVp3FYPqt22R7zQ43L0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E0l1fJtVupgm0OEnzSGEHB6ILc38uYFvu1tB3qG4K6hvSgnwZMqsr0xNfsqvEjsP3fUcX7fHAiTz++gco1z3S3yAn6UHDUmneBDFMefKHzMVj26wPn2GSG/ZEdlCE9ELzAq7d4WSYGuISo2Q3xfewu4CIfLScU2aP74QmGqgU0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSy7fvdQ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSy7fvdQ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso2473452a12.1
        for <asahi@lists.linux.dev>; Tue, 09 Dec 2025 01:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272691; x=1765877491; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRxNXZW5HGKhav3cQeIpm16SYzyMsJXYbVPLK0TzqeI=;
        b=HSy7fvdQOi/WB+OCLACOtUzXKIWHoF79Prw5+9zSJm6eL+mOgrJ0KRQ/if1edyNStR
         mPIhQQnxGqOiAz8I+EsTjPd4IxHks/1fug+1ZUFq0FmpekCwW/aT6iCLThibOoa+H9qZ
         EVBT2fFZoZmP3PYS20Vy8KXwac0rbLPwJK/PqL2malz+U8RZQY3bVGgHVc8ZG8yt32wQ
         zj/2ovnbCikhmAah9JT74PolnVnoH1EfEPAQTrFmIUMrY8FZqy5wcFhHkxXZOG54inyu
         p9bXYX0vU7DjaBHtl5m7m5cvXAeU1xNv6FhFKWrv/mm1/etoo2Pwzu8DVIAj9ClXpBi4
         oTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272691; x=1765877491;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRxNXZW5HGKhav3cQeIpm16SYzyMsJXYbVPLK0TzqeI=;
        b=eLYUNtZsy4lj7Bfgv53bEHw969LQwcmC/Qz9P122YtSxu0ZsCYw13nw+T1oEnvBDM+
         hMPq3GfeQkC8F0QSiubGe/fScSy+LaLwAe4n6nWCGWHb6xdNWpN36oMTsLP0+XNC7R/2
         6f2wKgulOPBVgsJbsvW9PHQuWQzuPe27SvNHhvF/vGxJ19zqw9zCMwtxJ7x5EqFUq7we
         qcDfnLwq63UDj9+6ZWKVM3W5CbN4cVJmStVK9FEbKyA7itNqIq/ObxtjnAcb8sXPTlA+
         lAX1u8Pj9aUSVIOKO17bnko6nPqjDRddDilJuTo946gqqoT+qP1tUjUxHMPb+hp9oLAT
         AUIA==
X-Forwarded-Encrypted: i=1; AJvYcCVbm0e7gpfDVm4UJB2DXX/cVXtd8TnxZDvMQhJSxdojjSQ53Jni+u1HbKM+eRMFaeZiX1mH+g==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr29LZg/P9AAGh6qXrdZtNnmynWSUP+Qku1rzc6FvKHmt28qyE
	TTYk70gb2n0+SvVnJOvDq3OljdsSym00qbsENiKUIJk0XuR9cCx/s9DS
X-Gm-Gg: AY/fxX5yKqwhH6VSbV/bEWcf2911/a5bBJNYRbzUQKHjofuW8eayl7mxC4mktI5xGeJ
	3DCqK2OjVmvXvJG5ku8EeQ5oKKYCecOxW238roSBvPmanCxxGzr+y6QKANo0LExrmTKXcZbIO7S
	nR9/sn81UAVEXKEotvI+t/LenyuHGQ5AxEDU/mU3IPRN0m/eFzZXOz186jvOCg+XJ0bcykmXeqG
	oh8YopMHM/liZMlkrknDHKkjJsJshwQBYCloodfDXecpz3kcew6tgmEcuhd9cuPyZUdGkaOxpGJ
	LxqMSkW+pxlHvry/od6OkIgf2UP0thWYLcWzGJSgjqgdXwgRE9FZ1TsviboP4Zd/ONaRR7z5y7g
	eARsaAKDWut3bvPIGmcehTPUB1y42U1u8i7e98AD1F/IBUUQOlTSDAJaUNvVm8Pbn8qtIguljCM
	cTrhF/UU3Ypj4F1B/MdG0ecEigQOU5l6viRsOXetG5Wf8Ox1RbveLWMyK/ivVl82nXlW8GuNY0f
	jlwj3QHVIR6b0erZWqZONVRwgQv5DveSRAB+Y4P946x2iOfhvAPPC3Cn5Wm6b22z4e4t5PzSjPb
	wK9zgWAbYjPnxGEsdgSlc+Ad5aWJDXlTTCeG37amwE+C73RPBbE=
X-Google-Smtp-Source: AGHT+IFL+1r/PaRqVVNGXNwojrxl0XaiTGaLLglD0VKcZyQgQAl1LXB5j5aWz2pOa2uC61OCwPtJew==
X-Received: by 2002:a17:90b:3fcc:b0:343:72d5:2c18 with SMTP id 98e67ed59e1d1-34a4f89b3d4mr722746a91.12.1765272691298;
        Tue, 09 Dec 2025 01:31:31 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:31:30 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/7] ASoC: basic support for configuring bus keepers
Date: Tue, 09 Dec 2025 19:31:13 +1000
Message-Id: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGHsN2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwND3ZKUXKBQTqpucU5+SbGuoUFSoiVQyiwl0UQJqKmgKDUtswJsYHR
 sbS0AIqk2u2AAAAA=
X-Change-ID: 20251201-tdm-idle-slots-10ba92516da4
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3561;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=L2NXhYYRLt8OIp+LSK83T3wVNVp3FYPqt22R7zQ43L0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7Lqeleti/sfK8JcZtv+e7XCRM0YuTVffT1bNnhu3
 WXgcK2gYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNUJpxkZTjp4J+y6LttmvjF4Za7M3z0nFh2bcb7x6n3jb5a5zd3vfBn+Z2utDpe
 3nlC34vKxrdN+SP6WfPOB9UO38/QY/t3v+3lfsAAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This series introduces some infrastructure to allow platform drivers
to specify what a DAI should be doing when it is not active on the
bus. The primary use case for this is configuring bus keepers which
may be integrated into various codecs.

Consider a device with two codecs that report voice coil voltage and
current data back to the host via I2S. Codec A is configured to transmit
its V/ISENSE data on TDM slots 1 and 3, while Codec B is configured to
do so on slots 2 and 4. The receiving end sums the two together.
If Codec A transmits anything on slots 2 or 4 (and vice versa), the
result is a bus conflict.

Some codecs include configurable bus keepers to ameliorate this issue.
Notable examples are the TI TAS2764 and TAS2770. By default, these
codecs keep their SDOUT pin floating during unconfigured TDM slots,
however this can result in garbage data on the bus. TAS2764 can be
set up to fill specific TDM slots with zeroes, TAS2770 can hold its
SDOUT pin to ground.

This feature is necessary to properly drive the speaker systems found
on most Apple Silicon laptops. All but three models include six codecs
in two groups of three driving two woofers and a tweeter on both the left
and right channels. Each codec group has a single line for SDOUT, to
which all codecs are connected. The two groups are then summed on to
one I2S port. Each group must ensure that it is silent on the bus while
the other is supposed to be active.

In the downstream Asahi Linux kernel[1], we set up one codec in each
group to zero-fill or pull down its group's side of the bus for the
opposite group's transmit slots. This is done entirely in the codec
driver, however this approach is perhaps over-fit for our use case.
Following previous mailing list discussions[2], I have tried to
expose the functionality in a more configurable and generic way.

I have integrated this approach into our downstream platform driver
and select Devicetrees as an example of how this mechanism is intended
to be used[3].

Regards,
James

[1] https://github.com/AsahiLinux/linux/tree/bits/070-audio
[2] https://lore.kernel.org/asahi/20250227-apple-codec-changes-v3-17-cbb130030acf@gmail.com/
[3] https://github.com/chadmed/tree/tdm-revised2

---
James Calligeros (7):
      ASoC: dt-bindings: convert tdm-slot to YAML
      ASoC: dt-bindings: update tdm-slot.txt references to tdm-slot.yaml
      ASoC: dt-bindings: add TDM slot idle mode properties
      ASoC: soc-dai: define TDM idle behaviour modes
      ASoC: soc-dai: add common operation to set TDM idle mode
      ASoC: tas2764: expose SDOUT bus keeper via set_tdm_idle operation
      ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle

 .../bindings/sound/imx-audio-card.yaml   |  4 +-
 .../bindings/sound/simple-card.yaml      |  4 +-
 .../bindings/sound/tdm-slot.txt          | 29 --------
 .../bindings/sound/tdm-slot.yaml         | 66 +++++++++++++++++
 include/sound/soc-dai.h                  | 20 ++++++
 sound/soc/codecs/tas2764.c               | 95 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h               | 11 +++
 sound/soc/codecs/tas2770.c               | 75 +++++++++++++++++++
 sound/soc/codecs/tas2770.h               | 12 ++++
 sound/soc/soc-dai.c                      | 40 +++++++++++
 10 files changed, 323 insertions(+), 33 deletions(-)
---
base-commit: e4deadb3e562aadf2825f28be3dcbbf01cf2ef17
change-id: 20251201-tdm-idle-slots-10ba92516da4

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

