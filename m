Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E8A3546FD
	for <asahi@lists.linux.dev>; Fri, 19 Jun 2026 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857251; cv=pass; b=doVC2QPFU5KbRyx2zdTmjKcwob/q3pDWZurB2vJ1biFcNMFygxU+Ts/DWKeIivvF3IIvO4cMoAQE9aHjZfOxczSMUG/T7Gx8C2rAPIR+YpvnPVqjpHhLP2meuYbRQjWvaSgcCZA7kRxIEGexN0vX3IEcapKU/2Vy5PfseorKdzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857251; c=relaxed/simple;
	bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqM/kgA36CYWTr/QWIKACYkuGTl+TBNe6ocmFdNAEAWTYx/j7c0xM0tC3gvSQEDbLNkiYv6I9AjH/2hFWUuV7mtNgKV2+vM+nLXHbi6OoPRl7H6pxOgaJDQHfL97px9QkBC6PKrWw0E/SJOME2o7RHCpoIdhQoc5ij2du4rI9II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T59s5yp0; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T59s5yp0"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84231305a80so1071651b3a.0
        for <asahi@lists.linux.dev>; Fri, 19 Jun 2026 01:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857249; cv=none;
        d=google.com; s=arc-20240605;
        b=QGy/x4GJ0ynjIavq4EvELrAe0QLFo4tOgMLNrXiGK/RZJ0SFYwuRC/KOg7md4qJoud
         JkdAI85EvTtcYXd6ZkTZCnq7XvknB8xpNS7SfMlm/oZ9j9o/9z1XPhNdwe7LERLfVPmN
         N7So6aP5G+zxa0zzS/RSFhBALHpLSuHozkHY2SKClfQGZ4Inp26loOAoVqlwVcPbPRnS
         Sr4G294fTdqPrpDSbhvR35ntkgGsxNy5DFke8qSQvcTOKq+6Z5hjLSh57lFs4YHJfMy9
         2S+I4+PTVNw6HY22UpW6Z82/uRYzHdH2J8qfmO6QUxOZY0G1asHsKlmDjfVI2joHjtsk
         oZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        fh=RPK+u2oOPLMuAOXLWR88so/rmHDBTvZcpppx5+FV+JU=;
        b=c3noohyjEhSzOQEVIUd0fPC/9PTydt0CGy+B43SACcnTQjzXImyRKoZORVjVg/DxOs
         SV+domVUg5G7LHRkF0h1iaq6KhO1mBU2x58hhZb4Ql7PEE39l3WgJK7obCKWwlKeTAOp
         qqstkAs0o1x8f1zV50UdTjGP+gejUXaB47t7ZIkRtPdmbNQgr2qC+S9AjxyOAiZW2hua
         3dsela/KLEMWqflZIR0O339KIMoUoE8GzBKxd3onYnrV8AFa4FjVAQZvqVRFcb6v3Xur
         INq3Brxz9wehxNcrLRPNCz/MzcvH1i/rHa7Nt39feC9Dfj+cKoVZbs1yEweLNtj2mSss
         H/nQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857249; x=1782462049; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        b=T59s5yp0dcVrKaQ8iSu8k8hxOuC9H5mzrmDWAXIlVD8OUxP0y8hs1DTcTneIvoGFGj
         PBrm+AQnoDEY7tt4PxVW0ZuFDTnOY1jocwN3px8SKQxxfaln8PUzoLg5GT3Zikp9FgCR
         fCDjl2FcwwtqzWkzBMdouLkprdkQQee75MTO2cDulftWeCvMl8/Kvs7kAmntMeDdACup
         l1oBT41CNtyBGgDb7rnswcopLJqT7BjbRQGbhx2NmLsbAyjKidFOyolOOnKKJN+asche
         1+HcVVyV0z3Roonjni2CYD40X+c1CHVUDDEH+H29143g30BVGTKpKmTycSW9aGyDZzLX
         OHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857249; x=1782462049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        b=oinxzvjDAidFLSjMcTPyJOtLLA4V9/MzbpMgYOUIXfxy5BO6pe8RTiwowQlPeb8sn7
         5tWPbl8L66aKw4ZP2LIguNx1TyUvzaIDs4Z6ZXOFSSjAFy86o81U4LDna5wPTnPFW8VP
         UmkbnpDnvyuNnvux449+dLQQYWTpRB2uoF0N6cTVeh4RF+agHKQvPnvn4GTGoGqRMeul
         JPdfi8tMl4GMC8Za9Ti/z076WTalwbKoHnv4rvn1rfX4VdrPfROlWKOEbJsuGOErN4Jw
         3oJwK20mpZZa+f1E3WXuuNkgylDCsdN8sZfyGG+VNGCr2N2618Ngdza6cOafZKxg1ew0
         h74A==
X-Forwarded-Encrypted: i=1; AFNElJ+SM2Lx9vnJj1fgfvrF+8DhvHXXAgPBb/IKMBUhfoG7PHYgNEDjmU8Zzpy1G3PERRuYiNADrw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFoEaHE9cirJLbvizL1rueEMlpvveZsRymyyBuHlOBbYvsbrJF
	AmtfrLzMRE+bEIywQXLE+Wpm3H/4ueGPleLiK6fFKM9jBpHhjdT9SHj6ZTU7vpe+roCIEjdUPHO
	JCyPVYfNG/NkogARzZJONPLQL6OTOuvo=
X-Gm-Gg: AfdE7clznkdEbN57n3IOEcuy/L80655s0fEsgV3txsP1RxkclpyW9zipuLgin8gGHzx
	JisQkPjV0+7hoi5ojAby5dulrUU7yx3I+MpRGwCAwOlhqtZ3yZYZZutmChF9evRNiUSCM90gaow
	7nKhU9UuYkaBb86M5kahC4HYWYPpDNLbhtG1vLYpsTh6VJb2+ROkHqZoYIGnt8pkF+5lWuOqmW6
	gcttTDki26En7AYccDu8ZvxF/xW+cqWlqZnkMn1iTqzoamIR1Vcq7tWhq9/wWHSqEMYsizwvLDe
	X//8k0sJJgTpTjUROam7uVf2PBAla1Ro66hYcQ==
X-Received: by 2002:a05:6a00:3cc7:b0:842:6a97:52fb with SMTP id
 d2e1a72fcca58-845507cb50emr2639722b3a.18.1781857248942; Fri, 19 Jun 2026
 01:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin>
In-Reply-To: <20260617140209.3f89706c@pumpkin>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 15:20:37 +0700
X-Gm-Features: AVVi8Ce6D0PT5nT0JZlv3l3sVJ8JLAPJbKAWX5-seLq2FMr-NiEk00n-taoSGeE
Message-ID: <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: David Laight <david.laight.linux@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>, 
	Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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

Hi Charles, David,

Thanks for the review.

> >
> > I believe you have to use scoped_guard here, as there is a return
> > from the function above, if memory serves it attempts to release
> > the mutex on that path despite it being above the guard.
>
> Indeed.
> I believe clang will complain.
> That makes these mechanical conversions of existing code dangerous churn.
>
> While using guard() (etc) can make it easier to ensure the lock is released
> when functions have multiple error exits, I'm not convinced it makes the
> code any easier to read (other people may disagree).
>

I built the code with both GCC and Clang and didn't see any warnings.

My understanding was that the early return exits the function before
the guard is instantiated, so it should not affect the guard's cleanup
handling.

Could you explain what issue you are referring to? I may be missing
something.

Best regards,
Phuc
