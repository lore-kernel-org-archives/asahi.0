Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A0A334681
	for <asahi@lists.linux.dev>; Sun, 28 Jun 2026 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782646979; cv=none; b=TAi6VtdEJs9PWfuCPmCoiqIMefP3JxkIJjMoVkBNgpS6AszPW3kqw1PLMOXP/A1hhbuXYegSUEHnEZPFsDJkTiidWUp38SMu91s6ZcWKCBL3lHfRMx5UzKGVRGjZS15c9/uJPFRrZ2Gaa87uNcqjdJ/IYnHc+E6JeqE3bd8J490=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782646979; c=relaxed/simple;
	bh=nvJ+UiJkWWRyGy3f7wALOFyXqoMW/uxTv/G1syn/h+A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NsJs1iG1gq9OjWSKUTVSq1H714x+MpXRZmykgcoxVzg6CAx0TRhhmxRf+f3zOFvvw8fm1WNbltqA5xrX61+auqV6l6+A1xC5pmJpt7Tw5wlQznXgMk6p1E6BtjSeLxuO2PxOzpdBiH9njbdGQmihO0i8D7vBHEqqBsu/NoD8tPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BejUkSHB; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BejUkSHB"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so5060342eec.0
        for <asahi@lists.linux.dev>; Sun, 28 Jun 2026 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782646977; x=1783251777; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAk8442Avxsgq6imq9OT/N27lrTKWAYKzGpnqp44Y+A=;
        b=BejUkSHBoNJdwKcMevfx7HtQOgrYTOfpYRagqiiPUTr+l3vySYv8dlyqOfH1V196ta
         yzXKUORJVhJsKJ2wQgSH25j4thPTuzXRe7TczXraeZYxOkGnEKfcb+AVut3O59lY9snw
         y2iHAoe1oaFkwMlfNSiGseDAozlRO9TeFByjSAk5drX064v8mMqp5aixEIXbH421W8aG
         R30973onHy19xmg31fVzwa0FVfHqmQ3tdAIoWAEIWCcUmkvYV8vPSs8e6IjqV8QtNk4q
         Pn7rGAQ3PfyPGfShYJEz9vceBudxs0SPYbb3LQAGIhzIfFK7YiDsRp5Fu6gLFOk+7Yfn
         ANTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782646977; x=1783251777;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAk8442Avxsgq6imq9OT/N27lrTKWAYKzGpnqp44Y+A=;
        b=kFYcdYW0bKE1PhuEMCTtxJkUOwQTT3fZ7NEx9QD7jSgvUyt1rYawSJB7hEuH+2KvAB
         NCIB382g/lzF7JQ2NNYrP93G4EUP4FmaWxBZ/QSaMdL0VQK3FZ9Pak8QsBWIAyeWKejW
         ecfcqzVFWB9JK/JFKM62TT/lB4Uq/V5eXA/AQsDc/hXwvL0vaDUoa7bgsZtkcdp6xVt9
         fd239hQOIYa64azRwiSn2LjsdLDPjohXJVdWDpYWJ/3ZGVYIhZ5lFwtzp4pBR1ZuUsSI
         +CTLO+q5T5iA1bVsRuUVjXoMpQRZG5t3yzJwCAlUv0uXRhlBUvHdehOcz1SXZ6dcSaqZ
         3s0A==
X-Gm-Message-State: AOJu0Yw7Uaxr9Cknc8NW5POdJgUh2rWEO5+GEJJPVAVabHYwpg28mEfX
	/TX0NzLSJXBwhbaRENWIjNbZft6H9mSzRzJIXxWFK6N7rWk/58xD8Ecr
X-Gm-Gg: AfdE7cnpJrsaBihV5mxi23K3LseO+IVHRHjUxAnwFefakZTC2jeC4TEw035on2r77yU
	vsD35BkmYPmZy4D8JdQXFEAjr43fqjJdpvkI6+Lt/G3H04xKRqK0zTxP5+PnCmXrNqfPE+n6yZH
	97vSt8WRDavZpwU7wHdiWunRPUgvLPHmS3/9/eLZDpVC5eciw7KeEZAsQtrVHaLGjG02mBeyks6
	jniDQGa5kUdIsioKDjn7T4NzSOjn1fL0c08El8tnAvyj/Ghl/Fokk4JeFxhWF81Fz9w9pSXsOu2
	Zy7AaRVvATFyNYmZaQ7hImJfzNX47QIoHzcGIq0JAZEFl2fHVC1AnJaCxUZrpoM4xQXehETgDmc
	n3GiW/N9LEza6sTxD8oPrPQnp8uGLvWh2sl5qvoHqa4u/9ZpzdevliB5l2TArsghO47n8pAkU0d
	+21HFBFa2JafuDRhcq3x02pMgmhu9CAD1YuZdoINAGraLeSiFrXWDzFm1JqGi//8uKXSiTizHp/
	S7hOwNGCW0sLbBLEJ5oKzbCzJLIAHHl/oYoqxAEmWWVMIUd0XsZufXDbxpUqOe7Uw==
X-Received: by 2002:a05:7300:fb96:b0:2ef:9961:27fa with SMTP id 5a478bee46e88-30cab22afa3mr6894818eec.18.1782646976615;
        Sun, 28 Jun 2026 04:42:56 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm34520756eec.18.2026.06.28.04.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 04:42:55 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 0/7] ASoC: apple: mca: support simultaneous I2S capture
 on the frontend
Date: Sun, 28 Jun 2026 21:41:58 +1000
Message-Id: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqEMAxA4atI1gZKFAe9irjoTxwjoqW1Ioh3t
 +Msv8V7F0QOwhG64oLAh0TZ1gwqC7CTXr+M4rKBFDWqoQq19wujTk42DOzSieZj6sq1VpEeIXc
 +8Cjn++yHv2MyM9v9N4L7fgCilGRWdQAAAA==
X-Change-ID: 20260623-apple-audio-redux-b7b43d9c02af
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2468;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nvJ+UiJkWWRyGy3f7wALOFyXqoMW/uxTv/G1syn/h+A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmOHMu0Q0wlmhdlRxYo5oZtW/1gmvuK9oW3qo7wHN7u0
 m+96v65joksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRnCTH8z3cOYzqkx550r0TqZeONfJ6Hy7lcT16vuZfP8kDh899VpxkZVn1zrxZ
 9EzP/1KaN15Lidzc6fHtz/0mr245XRhNVH1cn8AIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

This is technically version 2 of a patchset that was supposed to have
been applied quite some time ago, but seemingly never was. The original
cover letter is as follows:

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
It is not so bad that these patches did not end up applied, as some changes
ended up being necessary:

---
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

 sound/soc/apple/mca.c | 301 +++++++++++++++++--------
 1 file changed, 208 insertions(+), 93 deletions(-)
---
base-commit: e67251245f42eb4479636d4c082cdbe60b23f5b3
change-id: 20260623-apple-audio-redux-b7b43d9c02af

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

