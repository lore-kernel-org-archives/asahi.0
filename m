Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686B631282F
	for <asahi@lists.linux.dev>; Sun, 28 Jun 2026 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782646982; cv=none; b=ZgzTiZIiOf+t7wORc3Hl62HucHNMx17t0QtUf0ECOGI8EXon/NjG7vPv0oQUm8zyRlzv/6iMlV807Kroy7wGf/xjEiDPZ56dWx4Cfbd/Z8ceoroGN+EncibysGnhYqZGTVxmxv/xmxb3uniLDpiuGKvoisYwM74VGaaKhOtK7Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782646982; c=relaxed/simple;
	bh=t9+lcbAdwDvq6j9GMcBzxDd6Ri1EgHg8YLlczJXhS1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YN9eAMnOuEdRD1S7ARyf1BXeROCZ7bzTmXFbh8xDCTnEsazq8DltNrRZ7oUUZjWav0x5pQqM+ZvanJPdnHqywtMBbVYWJNgTQy8vK0YAC69hNyAWERHBBcsrytOIaOqkDpJ30Pl9uRqFbpLg+nbaX4jxrfJNlRJ1ijY9NoVD+b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rIu3WC1D; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rIu3WC1D"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30b9e755555so3665291eec.1
        for <asahi@lists.linux.dev>; Sun, 28 Jun 2026 04:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782646981; x=1783251781; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkrl4ZHeVcLevSofgvxJDnh/ABWj9Hg5VAZmH82+HzA=;
        b=rIu3WC1D4FYhg4gw2gH0JCO2gXyChVcxdc10YezSi9KclHSoY1092P6wzwEVf+7xH6
         PSrNoQQHarUBkG9hEyio84LmI6M8eQCDyz/YnIQYDeEzhJa1pUwdJhpkQg1OA6BaRlJ5
         zSowEGAODFsoqitsBMxmvVid4brzli+98O5wmqj8zOojAOS0DHGWQJO3EHwbPanhO9/3
         9hg9zKzpfXMQOTEiwMhEbIA435ho4n/wZLkqJejpMELg6190BbUx3iDMVAd7H74Seuyf
         nH8NBmAE5qpJzYYsyrBIEWpaRGABLTJsDIGnp/hVWh46r20mVuNHBglIrCkM6yjCJlMV
         mvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782646981; x=1783251781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lkrl4ZHeVcLevSofgvxJDnh/ABWj9Hg5VAZmH82+HzA=;
        b=roV9C46DQ6vOr0mFv7BLmowhu+8U9iEw0BJYtcGkELS9dtfooJfjRjkvW5+J02I/Jz
         31lZfi8OfBZB2h4oOYYS6EbqEyL61oI1Qlf1CERnmfNYOY5iTiNyejkYb2DODhPTSqcS
         bi2pW1VVy8pBk6hIioeduEAAOwSeLYR0R+gdPX52nRauPEu9t2qW3uMBCnGUS5hWCivM
         QodZEHg4+FwkGnzyyziLkfoiRJIDYa3hmZcUy5rgOyDvp+312E8MMAdCnI6j7S9GadEn
         FYWjz/dY3Qu/bdd94mH8emhBmvuSbLPwAeB7hkYNOz0/9YsswXXeudf7ZnIAiUuRZsOD
         xPOw==
X-Gm-Message-State: AOJu0Yy4ix/MdrLtZS+sfS86pgoCr1BUlNXf8PI6DKQZSotz1npFfeMQ
	yjtSGOTHV871R9pzgaKjGMoxC6fb1QbxmF80f5hIUnGevNM4JT9hPKPx
X-Gm-Gg: AfdE7cllCEZTLY5I3jEbIVrzGc1pbSIl2DU8Jxl7/y2OUuBfylRLMLUBJvxIzjY154g
	Wl6f3onzDRxERgR9mavm52t2GK0M1C5H2tKv+3KTviTQSQ9wzDljrJp6rgr6qOH5+YncRAJSjJ6
	wKPBHkv9NOY66ICiIl5NZNM9iYkwBMwD/kvFNGjyyoiETE0ji7RqGl4g+3PDIDqM4k2Pf1sk5Jw
	6m9Hoz3mRZ+iJ6CynnajR7FZEyNvlKlMgi88CSW4NprxHiA11xRylLTobri6Ko5VoecHZMd+7p6
	ilgVD7jf8vqoj70dD92uAU4Auf/hrwURQaxfvks0A1CwwKdcIP7cltXp/lAGTSJQn0WVirZuAYG
	+/tOtYyxQ+SpFCrIZug9ukPBvgdVkdmkeRIjDIWXV5OlzjvRxI016Gwubc8kbej5KXoNLzt9trD
	LmfDjO5Rg5ZCICi/49N1iCBbpRVE8vSRfIImEbdSPERfS1jHaL/FThRHFxJZAOhBYgBt5fn2ClJ
	/j00Y7QKHWG/PSnDgX3l+2onk4pYMTuhQ1wyMJ0zyXFYUhR7c7TXVPzu6vCm9CNNVmzSQVwkbRg
X-Received: by 2002:a05:7300:547:b0:30c:38ed:46b5 with SMTP id 5a478bee46e88-30c84c0506amr13805935eec.12.1782646980547;
        Sun, 28 Jun 2026 04:43:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm34520756eec.18.2026.06.28.04.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 04:43:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 28 Jun 2026 21:41:59 +1000
Subject: [PATCH v2 1/7] ASoC: apple: mca: increase SERDES reset delay
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-apple-audio-redux-v2-1-6328269c9652@gmail.com>
References: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
In-Reply-To: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=t9+lcbAdwDvq6j9GMcBzxDd6Ri1EgHg8YLlczJXhS1k=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmOHLt3L43hvCb7UXOaWot5/nKxK/z9vd1dr4WWfKpLX
 BK+Ylt8x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKobHjL8s0hnOjHDYHFJ5LsYb5sfCfsTDrFO9RVX7VqQK1W7sZ/lISPDY0Gfh+Z
 +pkGGej1M3rs7v1yNOWIl29bDNW3aN02Tl4sYAQ==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The SERDES clusters in this peripheral take a long time to warm up.
We tried polling the reset bit until cleared, however this is not
a reliable signal of readiness to be configured. Only waiting
~25 us to give the cluster a chance to settle makes it work
reliably.

Increase the 2 us delay to 25 us and hope we never have to do this
again.

Fixes: d8b3e396088d ("ASoC: apple: mca: Fix SERDES reset sequence")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 492165c0e1ea..ebe116f32661 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -210,10 +210,10 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   SERDES_STATUS_EN | SERDES_STATUS_RST,
 			   SERDES_STATUS_RST);
 		/*
-		 * Experiments suggest that it takes at most ~1 us
-		 * for the bit to clear, so wait 2 us for good measure.
+		 * The SERDES cluster needs a bit of time to reset itself
+		 * and settle before we start poking it. This is... slow...
 		 */
-		udelay(2);
+		udelay(25);
 		WARN_ON(readl_relaxed(cl->base + serdes_unit + REG_SERDES_STATUS) &
 			SERDES_STATUS_RST);
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,

-- 
2.54.0

