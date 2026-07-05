Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF1F1E1C11
	for <asahi@lists.linux.dev>; Sun,  5 Jul 2026 03:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222716; cv=none; b=VzB6L13KKnuxJvtEONA9I+bpzzr64dIpX10cMI7VNFvSgvm7zzm4kAgcZS+xBsOMNgZb5s0gQw2uYwn5Lgn9bL5TC1J4UtWHXxkg2SuUMVIe+Pg+ioQL+qFcfIu6ONLllGA7nOYXHzkwOzEUyWnNvxhbzYhGNld+rqBOPbCkyzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222716; c=relaxed/simple;
	bh=+2zfy9xq1aeQoP0qTkCTVoXz/akpPRJUOmi4fBQNTvw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tjfvcJPQy48/c3jEXa2UCaKEpbHVY5k0YLQxOXlGShsOwM9ZT38SzRGUhrnBUf3DtqQLznGNhe2J8vR5FyFS4UN58mOB8uUZgEyaihwn46gl3hLmn4GWlykJhcFYeFF+faWSRQ1OYoVpS4J8AMh9srtQp3UU1hqGqJZlS9lih18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sKtl/v4X; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKtl/v4X"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84794e800f4so952798b3a.0
        for <asahi@lists.linux.dev>; Sat, 04 Jul 2026 20:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222713; x=1783827513; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bSaAgXz2vnEVHwr4g3ugEAGdhW+11p6q+FhFBdwcqQ=;
        b=sKtl/v4XjQy9NDVOFHWnZ8MCcP6HTfZ1Ghc7O0T+i1MdmbJsmLUe4SXchfJaNFNrdn
         UWWTp+EqoSrbj1G1WzQlM4RT24pVnpT/jBZ9W6Kv9jzM3N6FJrq5nThkxGZTqFYjAYLW
         EtTPlZqFSZ0lpRHtyVu779tgK0Ad8ukaD31TBhlSDFEaxMY1XGI5EAHxgAR8eeY1/2Xx
         CG44l12wUewMXQWvOaPlGKRvYwBiFcuR1ccN1YFW6xyNaWyWP0Cw+/tGZY/eXVIzHEzX
         vyqYM7HFcBkGMYCPiDeUgtUJYNuAzBwGGjGMVpfRtwpcQQrhIctxsmc0CKewxZZ32X3l
         Mu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222713; x=1783827513;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bSaAgXz2vnEVHwr4g3ugEAGdhW+11p6q+FhFBdwcqQ=;
        b=mRw4d/Yomqu6MKy+rpcVo7UQfTBh15BKVMmfXEMxHx1HytdQDIWEIdkxHUojy1dIIn
         FuXA7bH3b1v0sMtJouB/7p/5yN75yf4fRoRKR+DCgCsEj5bKVI2wDatbo2B/o+HruT/6
         JwKq6+00bbMKm1kSlJGJEfW8avg1H+WssWwajSV6eXLfYzod5nEOgylSFJGQLzYXsUDg
         mcgMJt68gXbqwtKzzHn/1LSYiIrfeLXufAOywy/WTH7wi8JZ+mriPE5g9tgwcSaNY2RW
         yP6lSp5vDjcuGnNtYTgFY836ObrbF67C6lwnQE38BYAkFoBS7KU4R/BAbxwJQGJkoxfS
         qQ+A==
X-Gm-Message-State: AOJu0YzmMjQ4Da5V8rDzyV6entVB0+fmROi19UBvP7GMv0Ov/wc7opud
	ZM7t9f/3A0CxrK9bEwdWAK2EPZgvUKxfh4qknRjuOJhqD7T14cfK9/Sd
X-Gm-Gg: AfdE7cmmQQVNCjrrXeKc9NiEzZfifXacET1YuZoaKrilHv7qHCTjxK8VCXW5j38IIvA
	6VI48L2doEKhuePCpqRKD2V6vUVq5CqGrjMZpRppMQL8QKheNTnv2gZJ/bJiusNpltI00vr0zOg
	blnCrkjkNzZjY0DrwHYfuMCgJYaXg15zE99m6BZ5219adEvUpNzY3gzwUa1u+JUHNnyOtpCvSUH
	wVYz3hu2ajuafZV7uROHaqrzv6xzyUUWqro8Rjlpnr8VeOIRzw7UzE3pOE1c93MkYFSvaUzKUNM
	ZSdHXVvz9f2OFO9NhzrAyKeo5w7HvhH7uuM/zRxkqK66MVVNEjrQPHQGgyzesqYcTNz7LLL3+dg
	oBKPdCwOMo9d91/txHCK0BCGaqHB8UZBouZzjSvDgOT/RRftOzCOFCcNdPlssTXV045KR4pOfzy
	4KyfngU2315t1kER13svNhlmn+OiywOm1ZC4CfNaXUimnCR7bF5Rc7BHqmkViQgHvWiB/QtXUpR
	25fwd2490odt0Ice7+V1GuC2Yhm2Z2pX51ehfrO6Epsw+kF63t76Dj0AQ0Vumzp
X-Received: by 2002:a05:6a21:6f12:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3c03e1eeabdmr5540287637.12.1783222713528;
        Sat, 04 Jul 2026 20:38:33 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm35463845c88.14.2026.07.04.20.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:38:33 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v3 0/7] ASoC: apple: mca: support simultaneous I2S capture
 on the frontend
Date: Sun, 05 Jul 2026 13:37:49 +1000
Message-Id: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0K6dkwz1QquvIdhUdoBxgAlLRAM4
 e4Cxp3Ll7z//iIiBaYo7skiAk0c2XcbqFMibG26ioDdxgIlaqlRgen7hsCMjj0EcuMMxa24KJd
 ZiaYU264PVPJ8NJ/5l+NYvMgOe2g3ao6DD+/jdMLd+/XTP/0JQYJWmKLObKav+Khaw83Z+lbk6
 7p+AJTXFNjEAAAA
X-Change-ID: 20260623-apple-audio-redux-b7b43d9c02af
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+2zfy9xq1aeQoP0qTkCTVoXz/akpPRJUOmi4fBQNTvw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmeF7d0fvlgtS9byPC5R998Dv6Vz15dWyfkVHhAp6N5l
 /Xsv0yiHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKkueM3wV+jfghf+u9b3PT85c1pLUm2f99dS743fA7Nef9PdML/wexIjw3K2qtm
 rbC4UvX/1pPdm44SuNHe96nlXvuc0bzufrnPiIjsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

This series introduces a number of changes to the ASoC driver
for the Apple MCA peripheral to enable support for bidirectional
I2S. This is achieved by allowing frontends to act as clock consumers
and logically ORing data input lines when multiple backends are linked
to a frontend.

This allows the Texas Instruments speaker amps used on Apple Silicon Macs
(Apple-specific revisions of TAS2764 and TAS2770) to send their IVSENSE
data back to the SoC. Since these amps do not have any sort of integrated
speaker protection logic, we must use the IVSENSE data and the Thiele/Small
Parameters of the attached speaker(s) to implement our own in software.

---
Changes in v3:
- Changed magic number write in fe prepare to BIT(port)
- Link to v2: https://patch.msgid.link/20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com

Changes in v2:
- Drop readx_poll_timeout use. It ended up being unreliable. Fall back
  to just bumping up the delay on SERDES reset :/
- Rebase on asoc/for-next
- Drop the one patch that was applied
- Drop clock shutdown relocation patch. This was not actually required
  and the incorrect thing to do anyway.
---

Link to v1: https://lore.kernel.org/asahi/20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com/

Regards,
James

To: Martin Povišer <povik+lin@cutebit.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Hector Martin (2):
      ASoC: apple: mca: Do not mark clocks in use for non-providers
      ASoC: apple: mca: Add delay after configuring clock

James Calligeros (1):
      ASoC: apple: mca: increase SERDES reset delay

Martin Povišer (4):
      ASoC: apple: mca: Separate data & clock port setup
      ASoC: apple: mca: Factor out mca_be_get_fe
      ASoC: apple: mca: Support FEs being clock consumers
      ASoC: apple: mca: Support capture on multiples BEs

 sound/soc/apple/mca.c | 300 +++++++++++++++++--------
 1 file changed, 207 insertions(+), 93 deletions(-)
---
base-commit: e67251245f42eb4479636d4c082cdbe60b23f5b3
change-id: 20260623-apple-audio-redux-b7b43d9c02af

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

