Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CE342CB19
	for <asahi@lists.linux.dev>; Mon,  6 Jul 2026 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330128; cv=pass; b=KvdTX1EwiigHFzh9SKUFbxXh8fVEmxlvlE2zZLqIqSXwvgwl7PZhUr4cmdtZa522NJEhze1wCO8VOXPmCtzimICNNe83I3qluKptfu1iIX/0nPoygQtlFjWVVwBRkzS890JIG5Dyn7w9e1qk+QhlJ56fyk/hNZbFHMimIOsIWIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330128; c=relaxed/simple;
	bh=IQzc55iWD+GfH4NDdltIOwoKYgU+hvNlrIoMepag4/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=quUdZzSEmgEKk/KWOjWkuqS1Q52FcN2pKSNm8P3PVxoDyTyfajcey5w38IejAi5GlaiLkSmsiywCLx95gHeAtbMmb0UOtjD4LD7aVsE1jrDDlWjLTKqHhSu47b63RNEdr9qGoZJVCvqUn7+j+rGhw2+mYKwKHgxYBUbyIMR6VkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeLaGSeJ; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeLaGSeJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cacb8416a1so21559465ad.1
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 02:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783330121; cv=none;
        d=google.com; s=arc-20260327;
        b=BWw8FqG3LJhLLYWcjlfbp+yXK1gCgQyQFPdtLnTrZvJ23b4i7yTvSqML6gBmdtAEfz
         OLDJ6E4ZNgXNwb+UgMBm5tLkXhuoT5yvx97P9qdYGRO6eYoBgjTHGDVlnt2qpXmaTpBh
         pHrgPH69gGya/4VEM4TsBdw9UxXjVmZ1Yi9aT9NWN6z/ujwIs5RAD1byFMPQbt6gwMto
         L7HwfyBAWz+NS3Fqa+y1zsKNAi0uhDT1rAq6veQPgQh/oqGB+zPciIJ8+WxOrwlnJLcp
         jqlTr3PBgiTElnWUR8DCbExSnSnGMD64Sc2BzaodjZikYsVrFLY1Ow5zMZPVi8kfdj1y
         mI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IQzc55iWD+GfH4NDdltIOwoKYgU+hvNlrIoMepag4/k=;
        fh=gk0wQgGNWklLUYaPnRsc2z2T+6biSquvPyP/TVdj9zU=;
        b=PtEJF3UdHEqcCB7xsPVP8yMIKNYFSKoHHBDYt+KF098mwYlnUnJh+0YlLY0JbIvT94
         V45Y+axYdL2SuB9yDtW3eCi2+i3ahiD4UjPuSUNCWBnRQJe6MvkMf1hVuJ/wYIQCESF4
         lrnVwg6fZ3Yn976M3B5+KIxMaLDlJeXibveWvghC/hPWCSbRSWOdaZbD+Ify0hrfbw28
         mV4AZmQBh4+nUSb0WTCM4pVklvy1tBQVq/LFCJHmv9z4PQLdENZYAmalzVLYm+vtYWhI
         1D9/sVg/4Fc1wwsWfFdbYol+bCf+1YCfDrpyLrY6Ci6YzxvAZCf1jSir0fx0DGNm6CtQ
         +WNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330121; x=1783934921; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IQzc55iWD+GfH4NDdltIOwoKYgU+hvNlrIoMepag4/k=;
        b=OeLaGSeJ6rrJ9imBoisvBqCO7DPrhUHlr3DE81+W585SfNlK6uVBAjeLjiwwcf1Gzf
         1ub/FQ8iHYuKofSX8Cz0BO3Y0YjPCctCfFaPicXI5XYJFivArR5uFMBKtbqjq5ukC7VS
         jZLxwDwJ2XNYFmBN1qsUtlyoIPNlGQ/vLgUZ0PXbE3nUXPNh/2Tx1mxCV5tye+ghOJfH
         7gjix4nxTpheIbQU4H6dLvTeFAcUnYSzT/ykPz7gfSoOZXwLwCLGMHu39prlM4in/s/b
         uxzXXdcxSjlNS17wkxgCmw5jZ8Nkv9mfNnze5uaCGRmbH0MZT045waHqnRXh0KLl+fVB
         E7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330121; x=1783934921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQzc55iWD+GfH4NDdltIOwoKYgU+hvNlrIoMepag4/k=;
        b=i/RH07nYKPE4hqhriE0tC5BWUPcURTjvdZJ6ZhpwCjVaOWI0oESFX7XplyzW97NZJT
         AJv9aIZxWfTI+lpQXcrfOGWlDV3tbTDJLP+mpbHcf2Rf0aYFHdpkxAeYdp/vzBefN9TY
         dSd8E+rrFU/XVIsg33WzfHEFlFwpX0etKJAqf1ceDcBU7+X90euk07gqK5AanABNfGLP
         CnsRWmv3ioaWy70m8XewX1wJcqWMnjs532GOsf7hwsET1bs/mz7lqDVEIsU3MfsuZpBM
         UXWEPnjYLypLX5ZQveIRRegtyECtgLrF5welJ4P5WgqkgRai4txKHiMpY0naEScXmzbR
         XVhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8K7GHTtEzIEq5AcBD1D8XVzVLcKnzYTj8doNvSk3YyUkWdUKIIU0e+RPAugX8xAY18xJeTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgjZs8amd0JDpdONFbUlx6jpPlVF1Q9M1yPH2dUOrn78ns1tR7
	Kj/dsrHT/BhfCGQ//sZbf9nbiGIBvFD6po3eJJTUf/YZJ2D3U8sh8cVpuQ9NcTovAtPQwwZS+K8
	PoOrf95rstaz+0NIchdGmSzq/FHhorQ4=
X-Gm-Gg: AfdE7ckgBqNkUWMSREc1MNODy+k0kWrbBroivY/Ho79FZwD/Xro4shznf2iM4CVYsZE
	wisGYjgBMDVaEz+JPtVVrFhVW733WGnKROAZyOFoZ7Io9T9yxMYt7m68A807zJ8xeAHq92bA9K0
	o5m8iVwjWaVFvFYCuw3xWzdqMeBdqiDOgQd4ThrCRl+2pUY2BDLt5PtOsq3ujNXoR7YSyzQgg8n
	YEFJD3ZxBPdqCIA4iZ1xnMhuWxzLlcH/fbmC95fceu51NHCFB3d7Jdq2QLnA0h0D6CPS++FSffC
	41QHjqOTiEya6WtuI8+4QJdrKd4=
X-Received: by 2002:a17:903:19c5:b0:2ca:2079:91cc with SMTP id
 d9443c01a7336-2cb97e575e6mr99029625ad.5.1783330120552; Mon, 06 Jul 2026
 02:28:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-16-phucduc.bui@gmail.com>
 <aj5a7pgaDoN30Gs5@opensource.cirrus.com> <CAABR9nG9jDfK_wqS4Akfz5GL6HvZ-RkpPuYx4Q=vMn5jH_0foA@mail.gmail.com>
 <CAABR9nE1GAPaOF8jx1C925POe9AbgkPs-ZRSn9hiTEz-_mvwTA@mail.gmail.com> <aktttSJJchwnslLR@opensource.cirrus.com>
In-Reply-To: <aktttSJJchwnslLR@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 16:28:29 +0700
X-Gm-Features: AVVi8CfzuDybHjqh88A3SxPfhvjmQM4SZYjfBEL0kh9FR0VnJRusuMBj2OSCXJ0
Message-ID: <CAABR9nFpYu8db-FvOB9KZ9XEygYW+Hq=DVLk_LkA8qrcxHyMBw@mail.gmail.com>
Subject: Re: [PATCH 15/24] ASoC: codecs: cs42l43: Use guard() and PM runtime
 scope helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Charles,

Thank you for your review.

>
> Yeah I guess that is probably the best way to go.
>

I've sent a v2 addressing the comments.
https://lore.kernel.org/all/20260703055355.244898-1-phucduc.bui@gmail.com/
Could you please take a look and review it as well?
If there are any remaining issues, I'll address them and send a v3.

Best regards,
Phuc
