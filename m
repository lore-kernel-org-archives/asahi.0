Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE99C32E692
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 02:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783391365; cv=pass; b=PRorKyJd1AlHoN8QplaxL1xjRcI3iHqHJzOed2Rxj8YY2i+pAVjaLjNDdPFPv68Hpe0c586Nruiio7YPmrHyoHiqMGz1xIJOZoYo5RBVZfZDs1/g64HyAw1rzI7fetoBQ8G+G9TrLeON5uwKuJO2EFkGq9MDhIHXfjcOtV2/BNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783391365; c=relaxed/simple;
	bh=3dNBHgNVh2HFT7sUMNibXO7U8TMSoA4bKWJ6b0uoTv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zo5Xizo27h45XL0OP5CTxN5YKyQ/1MKLC0AKl43C4xfZPC5y5jSow1/I3+Z8sS+e2zWaDRKCzUA/hCaNxdVaAB82K2jQoAA9UDNh1kD8uC0GuohzGJAS6AX03a3nupVzANjLlnQa1iaOSZmIUlKqDY7FGbzyQLfMz8p6Tb7JkZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUeYpHP6; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUeYpHP6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cace91f112so31121225ad.0
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 19:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783391361; cv=none;
        d=google.com; s=arc-20260327;
        b=UmBVnRNvqimdI5A+J+xkFVX8ZqNMTP67O2bdtrIqGkbo9hPXqplUZaDPBvWHdwu/q1
         aUtzMrOTRcwbmzRb27bZBJ4FuDVJxU06YP/KdR+S/M1b8chThNph9MyvfpJocV8uLjdq
         AEgHviSkr0gYOvYSeuiLnNToePDnF07jHHRnwS8Hbx9pP7EY84/8SfCf2liCiQHOk4I+
         W5qsNykeNc1QTqLxUm65LvLYuxgM4mzI8G40nwdEiSXhO5NAmYHIwDJsHjLNyGUOtS3H
         yYsNEvooBPP7BULgTEa6oWbx4A/2eHkugepHv04NGeLe4KkxQFfKe7sW1955Ai5d2uaj
         tuIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3dNBHgNVh2HFT7sUMNibXO7U8TMSoA4bKWJ6b0uoTv8=;
        fh=Fmqqm8Ma609JWK9+fac8FaxXLVt6Sz4AMO7a7RXiQdo=;
        b=r7d58e0YlSga4mtZWmb1CjSn6JQWA5ag0dToV0d68hXzNp1FNOW1OvmCXWWwPsg+55
         SsxND5x1M2ibj3wdPaeg7YBpqV0MdAi2fNVJgxPVNhGFXayzuSPyNYGCKXp/D5B/4QaW
         EE4dTJ6LqyEjo51JxQchgoKHBgW22GXOUc19hSXNAr0Rjn+NCUfvsP1Nwn0YQU/T28Um
         XPItrnnTl47KQhD8MA0FbHHuNqB5gB7iChcwzjCuGQwEK6CxsosDYuoysJG8SRndzYt+
         /Ut7Ne1BOs7afL3tv1jDpMEFLkWtp6Dg1zu0kKtvbboyWep+yRd5fdOJJrdZMXaa16A8
         xOsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783391361; x=1783996161; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3dNBHgNVh2HFT7sUMNibXO7U8TMSoA4bKWJ6b0uoTv8=;
        b=LUeYpHP6OGD4VVQYviRinu1deL6cXgFphEyBvdEPFK11PGY1QKrMPIO7AXB6RsFPbC
         JsnVWIXnuMHFVhnjmwu/QXKdU6wdHxVgXqQtP8uZQFYnpj6ugh18LUv0JMr5ypfcOIXO
         kG+RHSfF0aW9tgoFxvhaGFAnZSNyhQfFYXnwWWjkF31xcqhRmkqKN2a8DwcFoJiiUghh
         1SVfxQxAPQb2UTL8/eMvXTVyhNMb8FqOkXFRI9vwh//KPtzkcKLAN1k2lEchAgN3aLgs
         qlq0SlWuVA2RVy/vbCzeN0Gj2dmBgx74QdmDp7PTudPV5ymLsnQtCykM2erqGXNLrIzb
         Nb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783391361; x=1783996161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dNBHgNVh2HFT7sUMNibXO7U8TMSoA4bKWJ6b0uoTv8=;
        b=krq5/qlTXzuH7GZXTbg2871Je74+TZPNNp/z8QRcd+ddqkqTK1Rhy9RbMEeTFTzIHS
         M0dwLXs0yVEFZH43FnKdFxLfHZJID/iCFkp4EHdSNb29vnI455w2Za9bxb1YCVtJZnoY
         Jh/kmAarS9Xdwe0VpvbTmrWboFLzuSMNzd0YZUmBhftdNnWGNIAMnvybN9NkaTl/5dq+
         gA9kx1ZxAOOvlFiWxVF7n7Vv/ihEjQRxzcHqN93R+3wCPC9E1WKvtjWWKV2YTesbroxn
         yJ/9rls37lXrhK1NN8J9O5hUq4MnstwZBh/vVB1f0m7Kz2Ec2pWh0koC3mbbK91V6YsQ
         YQhA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/iOYDdOAes7z0BLE829dxnvi0ltao3/XSExbvhdUaR+xlHi2G9JbdwM2qSwKu5Vmc6sSNew==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRB1TsQFZH5Fro8H1FSOUKPslbp8rSlIymbg9MD1o2+mN48bki
	Wj9CmDXpEMOiXMy3MXx5WYdiTZB2t8LGJqkM5OtNm50vFnVcFbqGgItdjI0pfeQAMK6uoWAc/wU
	stHCzK+HVd2wJjwoClRu/wSrxwRvtzSE=
X-Gm-Gg: AfdE7cntLYIkd1XeK+jb99swyeGRcdd0gSIWxK8JiySdGvXrzCibGMVMn71OFVXox9N
	+qdq+S598IGeqkh+Fa2VjzNwyNLeid2JthZFDT78yntdUWxl3M0bgtsOOj5YBBD9BmIVXgHAwI/
	G0Jh8TzYbOq/+bGADO/WW7Ec5xHD/OMFkSZv8t5s9WvPLk+JLngoE1RPXRcS/BeX82xYesWV4sB
	Q4L3gWoFF32HDqOSNVfpmE9XT/xOHXWS+APImJplnthPkx3H92oTQnbxh3EQanLSS1M7enAe/WF
	e6U9wtkXooAKw4DohUkf4MOBQrI=
X-Received: by 2002:a17:903:234d:b0:2c9:e86e:a9f3 with SMTP id
 d9443c01a7336-2ccbe3fc503mr35838785ad.10.1783391361490; Mon, 06 Jul 2026
 19:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-4-phucduc.bui@gmail.com> <akumgOIMYes2CXS3@opensource.cirrus.com>
In-Reply-To: <akumgOIMYes2CXS3@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Jul 2026 09:29:10 +0700
X-Gm-Features: AVVi8CfGeOLkdRsN-huCp4z6pOuTIEw2V-qPsop-BpnMow1W_rEArqC8_fPlfDM
Message-ID: <CAABR9nGwZHMrMer2e0zL78DQ7Kt=O2CWcQUKmht6ZEkUQej3Eg@mail.gmail.com>
Subject: Re: [PATCH v2 03/24] ASoC: codecs: arizona-jack: Use guard() cleanup helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com, 
	christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan <macromorgan@hotmail.com>, 
	Dan Carpenter <error27@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Rosen Penev <rosenp@gmail.com>, Weidong Wang <wangweidong.a@awinic.com>, 
	Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Charles,

Thank you for your review !

> Minor nit, this leaves a double blank line here.
>
> Otherwise looks good to me:
>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

I will fix that minor issue and add your Reviewed-by tag in v3.

Best regards,
Phuc
