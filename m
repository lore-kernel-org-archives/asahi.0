Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303343DEFE3
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466628; cv=pass; b=bpIAs6odwVjNp/SBSbLwoOiRmyIs+UyaZ35TN5MJpLFIlvfzDqrzb11j3tQcUsbQBhT9HlnAyyOCCxV3Zw1/vGfmkAK6MkKltU3PnY/0iWWntKc3XvjXlfk/HuvF3/DyhZ+dBBAdZ8pqwHD75k0bLABC8yJ3lqBM/VYO/OmzodM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466628; c=relaxed/simple;
	bh=iXrS8XyD7+E51Xx718NVbOMH9auYGubjj5hM2VNlCUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Axxq9R4pQek1jd60x+5rabkWoio7CBh8FgazD3FGn60EP1Nx/bvjv8am/xoBai+zSyfeEBZ00ixlwB0mErHTH2udLH6lc+27/G/s0GsZ4pv/dBzgil3AiAoFPGnkheqxy06hg+y8wHa5n257B5LgmHMzaUszsdkM0a4vpM4qcwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRwd9ILc; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRwd9ILc"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37ce68a54f8so513859a91.0
        for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 02:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782466624; cv=none;
        d=google.com; s=arc-20260327;
        b=seAYeLTIPDGmfQ4RN5G9c6HBO5JvnycAi8lYpI3gFpUSfg0J1zU41pg7CDxJusIHWr
         wEs2MWvqLiH0I/YvNoi5IKs6cpcILPgQOkBWyNSeqcFGDkArRRZsmseBWOng7BXSYgXX
         rhAqCghWtdh6acDzei79FbXm+KUxatEbCc9CbXscQFT2N/xTsW6iGj1tQqOX3URir4Pp
         X9CbiSM5SfsPQ6eLkNRB8lrOAabkHtMENQdniyPmgmwkSQGlTgKq9SAJ6rheRvHPeyzP
         pRIcdqlOTT8fLIFmeVxxA7EazrhQGnZaq2mf/OKoHE0dXGmAAY73xGZsRN5Bz0XE57W+
         V5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iXrS8XyD7+E51Xx718NVbOMH9auYGubjj5hM2VNlCUo=;
        fh=Gz0gVxmQzarVgRWqC0K4lMwnM2wM+WCuEvfQ9tm1TUg=;
        b=WZj5+cpRLEZ1IPoznlF5SBxxirMZxn7M3x+sHUUPBZ/pGwNWyiR4uxTuehKHLDO1p/
         FBGa9XGMsay3cR40+u6FPvC2mkENoEfM2Ns0OTR7CY3lhxtm9ZyexfasDDs0iPkqAHh2
         PEo+FXQvS6szRi7JZRhxynF86YabzWsgjHybvIJURXBcdU9MD6K42I10zPPFT8pqxtMx
         vZF4z0QoFAJwjMPq77TXPjqt9SEprUeiXGo5jMBDmQxfrM6a3FoM+A7MmGxLCcNGTd+4
         LG6J6QbMFe2Fmi3fAGh0k+WiLEkh3nsa4etlhqf40yElAZt3uml9oDIpVFZYGbicFHtB
         Zpkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782466624; x=1783071424; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iXrS8XyD7+E51Xx718NVbOMH9auYGubjj5hM2VNlCUo=;
        b=hRwd9ILc9t6/2SZqZSBGsRulKuJolc+BSl9O9fp9/WHJw7XTl5qBKsIRR/W33NQWbu
         Vn1VnJlD7j9B2dPbhjadDqO6n4HDPKtUse7WaWSkJLQZrdpSYb2r4Aeg4QV4bSZectu1
         osNahlstdKGcii1hXCZOuGkeNFrEMdbZ2W9rZYyNrOIgVZEiPTHpDiJ07F45yO170S3m
         TIY15wPl9WgNjQVtIXnnLqg2ptDPqDYIuLoxWnZRe7a1wUSqgqdMcQNdglzbksHVRpx0
         iMqesjhoJFbyTy+YvkmNDcUE3gENwtP0XIJHzvqCfamT+bitMgv9ZlHe3UwIq8/RT+6R
         YxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466624; x=1783071424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXrS8XyD7+E51Xx718NVbOMH9auYGubjj5hM2VNlCUo=;
        b=REdQXEYR2EZbxQC8gNd2w4qamSuKNGvluFCV+1Rz/65GgU8huXQzxjLlOxjfENXQC7
         iOL1RhpOXADuiN4n01c5G9vpwb6YaBkFuck8mbAZxa86WsDjlFj4fNv/uj3BgsrXMGi2
         4nSzvsGahPwJfamQgkFMJ/9pHE5NPY6Fuc/s5KtE7VdjpniFP7clNJm9J09sac9nMvUY
         hsKW1K9OHDF8mNDeXvggVIywMUblIA4oV4OsoQSlY87ERqaWwV5rZf+6Dqey5O66US0p
         G3AuMLlvgQQYehjF/WcaogQl6ywa2EQzRzKnYVBbmk1XnE4rcukipP+D15XQujMbjSAg
         y6fA==
X-Forwarded-Encrypted: i=1; AHgh+Rpc629g0bGTJqbdXl724gwv4G7Qf537diMTLCLVCr6cQSZMTmNJClxuaOoXzRydloUJlTz4Yg==@lists.linux.dev
X-Gm-Message-State: AOJu0YziFTHZs9wdcbceEGwNn5vXVCBoQrpnwNHSdisvNLxq1Sjhe3hz
	fk3cjChv0DDhzupZM0BIxzg23OLonTL5VLBLdmZ492aMc6KfFBEMjywdhSkykJ65J+m9TXszEzl
	JpZIv61OMXszEqeIya5OjvnaEj3Bc1lI=
X-Gm-Gg: AfdE7ckwV4jsBsi8ZnCVjQjITILc/6RUSfNadbihYzVj+TnB6u1trnJgZvmoD0f3iNA
	8quKc6x8yZ9F/msOQ0PqyxkUkccNrkmd4lqSWWvFZYtGmFL+U8Bovoysn4ihgbLcsZNZFk5DbtZ
	znff4mqgSU6merfivGmp1LKsgsfmr3PkRpfDEPPdH3s2hTrFa9fhE9BvXY4auvGhZGM1wN/NiGY
	3IIjloEUxF6QdLnv6b6BwqiBsK3XbT5mrmNfZL9inkUTUL7x2QyLVIh58U+fd1wCPMdxbMk6Z6q
	c1V0b6Kb16Erl3oTQ2JOiowmLWQ=
X-Received: by 2002:a17:90b:3d81:b0:35f:b647:d98a with SMTP id
 98e67ed59e1d1-37dfa1d3fdemr5625529a91.5.1782466624154; Fri, 26 Jun 2026
 02:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-13-phucduc.bui@gmail.com>
 <9a31d81e-5656-4525-b5c0-89b02f179cc8@opensource.cirrus.com>
In-Reply-To: <9a31d81e-5656-4525-b5c0-89b02f179cc8@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 26 Jun 2026 16:36:52 +0700
X-Gm-Features: AVVi8CcOicQMwfYGu0k3_RwjtDGGSW54p-K768oBHJj-nyjVSxC7BUEKxDmUHf0
Message-ID: <CAABR9nHxu4_BkSKC+9qAobgSw4x7XkFz9nVHLKWVi-i+6_Xg2A@mail.gmail.com>
Subject: Re: [PATCH 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, povik+lin@cutebit.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>
> It doesn't look cleaner.
> But anyway,
> Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>

Thanks for the review.

Guards are particularly nice when they can eliminate goto labels and
make the code easier to follow.
In this file, as you pointed out, they don't make much difference.
Even so, I wanted to keep the style consistent across the driver,
so I tried to convert as many suitable cases as possible.

Best regards,
Phuc
