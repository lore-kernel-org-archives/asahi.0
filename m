Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD54D381AF1
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 02:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600526; cv=none; b=go76HqCcA5lNmItWSyuho3PAOOLzksxBlSnXp20we6B9vqJxzANU94dbqmNPG2qd+8SdZvZADF3dnSGqnAZwl4hFVqurL+mWIkENgMoBVle4Yo0YKQK6bH75QaoDOmO4FsjuFN2SvF/vwuZi3uwR+xna9wf86BTPoMFhKegHp6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600526; c=relaxed/simple;
	bh=PR8UKdZZVI65hHMoanhVFfK2UYdeJJzvlhtOcX9oidg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3H0vO2vY7Z+fpyfEB9EG5EscPD6U0PhzjeXhN9Qf/EwKw4kmXPfuVXhfZm+W4OGIf3K56n1efJPFNn3lrPBAwO8ciwp298igxZyn+yMZufAxYzQtLB8zOxa8HRKdUYyjQP8pwXuM6pXrEzNsOWOkqhbb1zRxHUfpHJrTtk7E6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibGxJg6M; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibGxJg6M"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so194876a91.2
        for <asahi@lists.linux.dev>; Fri, 09 Oct 2026 19:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791600525; x=1792205325; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ol+wvlr2CdZCdXa+I/bU7xRVzRqJragTtCzufPOHHa8=;
        b=ibGxJg6MjfaQ2A/lgbCyaajITe79NaWOp8wajduBcm5zJXuIQLDHZd2JrqMYIuy6oW
         Q8VutGPHtrpzk3m5o/5zLUpxeg7ZxfWHJ9jBexhLTAiJyH3g61DIxJ3uUNX3tU3TJXTF
         P7HaGKxW1HAW8am6l8vgJMgz/vWX34fTCPMLIFZh2FDPW68iRD2S/VMT+8t22a1YF+8s
         6HeG8r/Ouqjz6rJ6mA/I94E3wyShGMbBnpMRP3xBGeQMlnamI/JX0nkQDbkFamyaDtVl
         V23mTVjwh4+rvCDaMgYVI/Vr7fxr7XN751CxjADIpz3nQ6u7TyJIXi5yvWOddcXVn3xu
         mYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600525; x=1792205325;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ol+wvlr2CdZCdXa+I/bU7xRVzRqJragTtCzufPOHHa8=;
        b=NTl662LyMzAPvW1DJaVaDI5hRZE0emAtKQy71s9mfq7E5c05k4dYLcVfZ0/ehGNXYy
         Q7VRKXgUpgYg0LUKzuLxE8sKrk7T/qZAvExjlyFFcLvDsSbW47Oyvf18nTj3sOg1wA2O
         QHe6h5Gt3Lg0rLN/en9oas6H1xP/xjMnK4q76YUtoiL8tAJ8b4zfW9X0FR4zPt43PevV
         UkM2s/ZEw4g7zWrN0q80ZseKb7/nlJ2W3FE1jLRFzeTWLgC5hIzGNCjK5dZKwIx/wKJc
         cJ7uU0wRLSvtpk6I2VF4ysO9dsJCnV+cOSRDFGHg8UEG3/sVaLnTP3be82I6SVZEeWQF
         8r2w==
X-Forwarded-Encrypted: i=1; AKwUvBzWsrMiOknuXbvoYQaTmHtYb9Ouzs7MDkBmeJ16PCVbvhGS+LB0ImsuKRuxUsw74IWDRUQcRA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLwAgLVsM67OfU66NNtnHz9n3XkHjW536oRzKfWUXgGhFZaxQgS
	IzrJ/LZH7I8kPE6N4y2pGzJ14YanbCCk2WsPJ11qP352IU8ErIH2r+EA
X-Gm-Gg: AYBFou05T6ChQDPzeA/Wht3Zln08wuU+zTfz1tw9snLtyygjCAtq72DiYJkDzckVcce
	BiB91OOPqbhSWqLHRasdPqjt3uxOpdYW95jKYIMcSDSoYY6d4WkEGI8eibzW/mkqRNoJSzrwpeX
	+44jhbcxwoH3EEiWCRHY7PEpaL5VU6gAqp//OyR98M/LHoMRrHa3Qd+uuuz7WXgFZO767e8FB72
	Ohp0y+cpk2Sh/a78I7k9LdaLrnfSfO/krr/NZnk9sHA/Ji108+l4wKEqRr7in76jZiHBeHMpe4z
	nstDqnQHfEQhIIEXcsrq9m9/QjpZPOGgpXc6qF+T95fg817FOxNT1pGW3GOIduO4E4cxeM7jM5m
	GA10XiP1pJgXm0CDhLl5PodqsOQv7cMNHTbn6h8/wVaFyLJ7Zunqy5h5CSAZzMmPjk2/knkG4/M
	1bOggFlT9esRVk5uJkABQnFn4zwI8mjYESYPFfEGAb1svfnHvkRfD4g+f5PCrlM07cW3MNjQMY5
	PVbK/gyEbvLfMPeNjq/CQvZTDYuNwBomt2p9xgwvkyDa08GESyd1SLZtHiwc4dq1mexXL8j+LoU
	KHkq72uzQu/Vng4YhKXX4VH9XwCer0x/v4VK3UF2WFw2R3KK9sM=
X-Received: by 2002:a17:90b:5887:b0:3ab:364a:9532 with SMTP id 98e67ed59e1d1-3ab3acc548fmr3728946a91.44.1791600525144;
        Fri, 09 Oct 2026 19:48:45 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed040dsm7675161a91.6.2026.10.09.19.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:48:44 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple Silicon Mac
 audio
Date: Sat, 10 Oct 2026 12:48:34 +1000
Message-ID: <m3VYUqb-SXeeNuWXNMFX0A@gmail.com>
In-Reply-To: <20261009-daring-objective-flounder-c0b66d@quoll>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
 <20261009-daring-objective-flounder-c0b66d@quoll>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 9 October 2026 5:17:53=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:32PM +1000, James Calligeros wrote:
> > +    patternProperties:
> > +      "^dai-tdm-idle-mode-[0-9]$":
> > +        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode
>=20
> This looks like you put several slots into one. TDM slot is for one
> slot, no?

The codec bus keepers (which these properties exist to support) only
need to be configured on one codec for the left and one codec for the
right. We use the "main" L and R woofer codecs for this purpose, so
the extension of the properties like this allows us to specify which
codec's bus keeper should be set up, as we need to support machines
with 6, 4, 2 and 1 speaker(s).


