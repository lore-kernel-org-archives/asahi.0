Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6885F31F996
	for <asahi@lists.linux.dev>; Fri, 19 Jun 2026 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857588; cv=pass; b=pJp3b51msW8VXQj+MAm93PpJOjfQEdDCsT1ss6b7mk9sShn1PLYgGjxy0b2HZAvXiaXhz89KVne9ULe/zodLcAIIa8TXBSI74C2dQAbtOGU5K/8I7NaZFHBw5Z5+mwHkgMxJZhla0SOY8OcPyljzYk2cw+k86UWaYZR8QMNOqZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857588; c=relaxed/simple;
	bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t80KNRWC0jGK8v3tAdJREokoiSot841V6YJ4NZU8oGZT6gOQ/ZKqxFQ5VZ/xuJXxJsSX4cAxnfumLmR7UaL7z2yBhOAw/Pell8Jh92baqEBHIuy4u0oFf+qUFYoYwbGbczF7tdWAyh+T2kxaMRPKvK2Tj5Ubu5yIEcjfNSCdBlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWHbdNA+; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWHbdNA+"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36baeec21dcso1053207a91.3
        for <asahi@lists.linux.dev>; Fri, 19 Jun 2026 01:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857586; cv=none;
        d=google.com; s=arc-20240605;
        b=Le1Ea2slIGjoYTyCUQ8CD0+j54JWBPm0pWD2T6cf5Otj9FFbzXSl89h9UTKQhPPHCN
         W1zPvoYb2zlmf5qF88ETjy1BrzrHXQeQH6VvJdCutG6tUEUXReBLVi8d9vqLt24XT5hC
         QTM2GG2t8rfn+PhmDDiiKHwxLTv/48XryTDYmAE2ovoDOy1i6wDGdUF4OpiOd6q8Ikjr
         H2OemL3daxxXTwKEVNhdmknGY5CoyyViL+Y4/OEsDxFcIaG71zHNQ4VHTzzhot+KfYfg
         uAklwOXCC+02Za8E/CTTrpbiUhFrIdxJJt2z4TiNWhWCRG3vrYylAbeIsRj/ZFvsWZXK
         baeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        fh=YSoDLlDqc3bXJOEz6XRZtdUVldDijTiYxVR46mpWpBE=;
        b=cKSj8jaT8sN5V+1R9v4w/jfuVxcrWM/Z5shkhLMIC3BeMFQW5LYv02P26VAM+pTZWO
         adBURJrRpg90EAiofbwgWL80DpJunLhewDuqC5DskYo/c8rYAy2XuuGonZTLFs6SoXcm
         TwFZr63ni8ja8cl2DsPPwKCdyXuJrAu+mqHKweXcbZP6D1g1QvnSAeDjf9hdWg0IWVAZ
         a6qkeKJxlNogkbf2Hnwqlu3Ck7sM/BpmPYD2TajslxFrVKogv9cTIZhYWmnII0grtRsN
         7xrAIuB/ZTLpWPsH52lfl1tl39HCASh9uiNEyTnRFLRmoNIxeN+KpDtakzTQEz4ibRji
         WAOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857586; x=1782462386; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        b=mWHbdNA+bnPAqTyUInTrbiF3MPjls5CMktbE/xjaVcYA7dIeXp/r/OF3JqfkpNK23a
         JqSEasf8jOVMimTO9KytbvMdBRvpqxesMTyAfBe3apubeWV0KoxMVSJaKK4QWp6gX+Nd
         OXxuLUuuRan3Q0Ce8DONNRlIKX4ZMhvtuz0p0TtRmOk6jVC03J9zeuQBcwfc20pzumJt
         XlozdSIet/15VMaWlc57FEkacYlRxIVttqzCvoEYg/I5c4KD7SwXYzAi7/0VzqY5u9Jy
         eiwrZDc2fe3LikhwYPjkubL5KFIWHiMztfJvuF+7CvasHODtCMRW4smMjnZAgurODStV
         sZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857586; x=1782462386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        b=rBt0yHOIEFlmXfApzUSiSjyhpgmWJh32KHCYrrvudrZXisi4jo4Dx0HigeHpqr3qXK
         ZHXtmilBEA7PY77PHQFs08TGloq0fyAlhCbYE9l3r3Kzl473DK8OLfh9cM0QcFpMgZfw
         GoRpbPyPq5QhXq3RNWJuF6RRTneJxSQA7e7LNTYx1+tHm8Ur4A3YYlLzO8AYE42WTJiB
         Utip7JksTvLM5QaTUYp1ZH1vZJ2mvzAVKhRYvPeUomlmIa3x6QB8YUfzrXELe9fQYNv1
         83BLh+IdZkwlE3s2cwziO7ofXnY3J/yTNCl7GyhMMQjTpNqjny5vdpMj4BtiqMqHa3T9
         HPlA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZJzYPzIDRL6S7zNx2tI2vJ9iMoFMbKvf02nrrqnQ3FmMBnHEyLD/+Nxe7pZclt4Y90sKGGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCGVZVzfVhI6Pl2mgiFH87+7LFJIBnrNqwhuKNnDwBZ254nQAL
	LvmVKiAHAiBuA0xJu8RhNkSwhFl723gcWFclaRsDhqzKcBdivfF/XaYydD9Ez/5HlmxCQRWpsle
	RSAtQDrObgbdAC0bgfVzMMCUMj0uKoAM=
X-Gm-Gg: AfdE7ckrq8U9bJlY2v98MbbD7w1Zpm1ubszGExu/hlydfAZ25YtvqvY4ee/6v7eRpfa
	PRUnGDMOQrhYKxC8DuYeyqujKnbIj7UKhBZ9EH32qp2AVstmtIpE+ED7ndRjusDxuLHn3TngZrI
	j72mj8lgDCFU7qJ3Qbepb4ObA0LkE9WJq9TNaPBGWs1pxRaUpXw2Hk7FqL+5LgJWYoUhLckeW3I
	NB4yI2IU0ySDJRfCxZWlJbgXjtCqSv736s+q4tt4GWwbOTskUwf6JwhHBwQQoWzxLKX443PhjlH
	KH81yEUaX1ZzL2fnK1Hk1aXB9zM=
X-Received: by 2002:a17:90b:35c4:b0:36d:cc9b:2f67 with SMTP id
 98e67ed59e1d1-37d1e8d2625mr1979109a91.19.1781857585816; Fri, 19 Jun 2026
 01:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-12-phucduc.bui@gmail.com> <ajNud7QkwF369lBY@google.com>
In-Reply-To: <ajNud7QkwF369lBY@google.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 15:26:14 +0700
X-Gm-Features: AVVi8CddXW5ZNLmY1o-M3ykiX-yfQTjv2vw19gnq_6wH9bwOdl1r4oKcoEQ6Mfw
Message-ID: <CAABR9nGVAiUpnmnoszLiNDC9ooXx8e9YFmMhv5aWLfaik8tjHg@mail.gmail.com>
Subject: Re: [PATCH 11/78] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Tzung-Bi,

> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>


Thanks for reviewing the patch.

Best regards,
Phuc
